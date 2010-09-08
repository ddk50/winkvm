/*
 * slab.c
 * This file has the main routines of WinKVM
 *
 * Copyright (C) Kazushi Takahashi <kazushi@rvm.jp>, 2009
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#include "slab.h"
#include "kernel.h"
#include "extension.h"
#include "MapMem.h"

#define PAGE_NOT_USED        0x0
#define PAGE_NEED_FREE       0x1
#define PAGE_NOTNEED_FREE    0x2
#define PAGE_MEMMAPPED       0x3

#define PAGE_PDE(x)         ((x) >> 22)
#define PAGE_PTE(x)         (((x) >> 12) & 0x3ff)
#define PAGE_NUM(pde, pte)  (((pde) << 22) | ((pte) << 12))

static struct page_root *get_page_rootslot(hva_t pageaddr);
static struct page *get_page_slot(hpa_t pageaddr);

/* ToDo: use extern value */
static PWINKVM_DEVICE_EXTENSION extension = NULL;

static MAPMEM*
get_mapmem_slot(unsigned long gfn)
{
	int i;
	unsigned long base_gfn, npages;

	SAFE_ASSERT(extension != NULL);

	for (i = 0 ; i < MAX_MEMMAP_SLOT ; i++) {
		base_gfn = extension->mapMemInfo[i].base_gfn;
		npages   = extension->mapMemInfo[i].npages;

		if (base_gfn <= gfn && (base_gfn + npages) > gfn)
			return &extension->mapMemInfo[i];
	}

	return NULL;
}

static dump_page(struct page *page)
{
	static char *page_type[] = {
		"PAGE_NOT_USED",
		"PAGE_NEED_FREE",
		"PAGE_NOTNEED_FREE",
		"PAGE_MEMMAPPED",
	};

	switch (page->page_type) {
		case PAGE_NEED_FREE:
		case PAGE_NOTNEED_FREE: 
			printk(KERN_ALERT 
				"pagetype: %s\n"
				" size:     %d [bytes]\n"
				" systemVA: 0x%08x\n"
				" h_pfn:    0x%08x\n"
				" head_page: 0x%08x\n",
				page_type[page->page_type],
				page->independed.size,
				(hva_t)page->independed.systemVA,
				page->independed.h_pfn,
				page->independed.head_page);
			break;
		case PAGE_MEMMAPPED:
			printk(KERN_ALERT 
				"pagetype: %s\n"
				" size:     %d [bytes]\n"
				" systemVA: 0x%08x\n"
				" h_pfn:    0x%08x\n"
				" g_pfn:    0x%08x\n"
				" pMdl:     0x%08x\n"
				" userVA:   0x%08x\n",
				page_type[page->page_type],
				page->mapped.size,
				(hva_t)page->independed.systemVA,
				page->mapped.h_pfn,
				page->mapped.g_pfn,
				page->mapped.pMdl,
				page->mapped.userVA);
			break;
		default:
			printk(KERN_ALERT "%s: odd page: (type: %d)\n",
			   __FUNCTION__,
			   page->page_type);
	}
}

void 
__INIT(init_slab_emulater(PWINKVM_DEVICE_EXTENSION extn))
{
	int i;
	struct page_root *pgr;
	unsigned long addr;
	unsigned long cache_size = 0;	

	/* initialize global page allocater */
	RtlZeroMemory(&extn->globalMemTbl, sizeof(extn->globalMemTbl));

	extn->globalMemTbl.page_slot_num = 
		sizeof(extn->globalMemTbl.page_slot_root) / sizeof(struct page_root*);

	ExInitializeFastMutex(&extn->globalMemTbl.page_emulater_mutex);

	for (i = 0 ; i < extn->globalMemTbl.page_slot_num ; i++)
		extn->globalMemTbl.page_slot_root[i] = NULL;
	/* end */

	/* initialize winkvm shared page allocater */
	for (i = 0 ; i < MAX_MEMMAP_SLOT ; i++)
		RtlZeroMemory(&extn->mapMemInfo[i], sizeof(MAPMEM));
	/* end */


	/* allocate global pageallocater cache slot */
	/* cache_size = 1024 * 1024 * 1; */
	cache_size = 0;
	for (addr = 0 ; addr < cache_size ; addr += PAGE_SIZE) {
		pgr = extn->globalMemTbl.page_slot_root[PAGE_PDE(addr)];
		if (!pgr) {
			pgr = (struct page_root*)ExAllocatePoolWithTag(
				                 NonPagedPool, 
								 sizeof(struct page_root), 
								 MEM_TAG);
			SAFE_ASSERT(pgr);
			extn->globalMemTbl.page_slot_root[PAGE_PDE(addr)] = pgr;
		}
		RtlZeroMemory(pgr, sizeof(struct page_root));
	}

	ExInitializeFastMutex(&extn->globalMemTbl.page_emulater_mutex);
	extension = extn;
}

void 
__RELEASE(release_slab_emulater(PWINKVM_DEVICE_EXTENSION extn))
{
	int i, j;
	struct page *pd;
	
	/* free all global page allocater  */
	for (i = 0 ; i < extn->globalMemTbl.page_slot_num ; i++) {
		if (extn->globalMemTbl.page_slot_root[i]) {
			pd = extn->globalMemTbl.page_slot_root[i]->page;
			/* bug!! */
			for (j = 0 ; j < 1024 ; j++)  {
				if (pd[j].page_type == PAGE_NEED_FREE)
					KeFreePageMemory(pd[j].independed.systemVA, pd[j].independed.size);
			}
			ExFreePoolWithTag(extn->globalMemTbl.page_slot_root[i], MEM_TAG);
			extn->globalMemTbl.page_slot_root[i] = NULL;
		}
	}

	for (i = 0 ; i < MAX_MEMMAP_SLOT ; i++) {
		CloseUserMapping(extn->mapMemInfo[i].npages, i, &extn->mapMemInfo[i]);
		RtlZeroMemory(&extn->mapMemInfo[i], sizeof(MAPMEM));
	}

	extension = NULL;
}

void flush_memtable(void)
{
	int i, j;
	struct page *pd;
	PWINKVM_DEVICE_EXTENSION extn = extension;

	for (i = 0 ; i < extn->globalMemTbl.page_slot_num ; i++) {
		if (extn->globalMemTbl.page_slot_root[i]) {
			pd = extn->globalMemTbl.page_slot_root[i]->page;
			/* bug!! */
			for (j = 0 ; j < 1024 ; j++)  {
				if (pd[j].page_type == PAGE_NEED_FREE)
					KeFreePageMemory(pd[j].independed.systemVA, pd[j].independed.size);
			}
			RtlZeroMemory(pd, sizeof(struct page));
		}
	}
}

int _cdecl check_page_compatible(unsigned long page_size,
								 unsigned long page_shift,
								 unsigned long page_mask)
{
	if (page_size != PAGE_SIZE)
		goto err;

	if (page_shift != PAGE_SHIFT)
		goto err;

	if (page_mask != PAGE_MASK)
		goto err;

	return 1;
err:
	SAFE_ASSERT(0);
	return 0;
}

void _cdecl kfree(void *objp)
{
	if (objp == NULL) {
		return;
	} else {
		ExFreePoolWithTag(objp, MEM_TAG);
	}
}

/**
 * kmalloc - allocate memory
 * @size: how many bytes of memory are required.
 * @flags: the type of memory to allocate (see kcalloc).
 *
 * kmalloc is the normal method of allocating memory
 * in the kernel.
 */
void* _cdecl kmalloc(size_t size, int flags)
{
	void *ret = NULL;
	switch (flags) {
		default:
			ret = ExAllocatePoolWithTag(NonPagedPool, size, MEM_TAG);
			break;
	}
	return ret;
}

void* _cdecl kzalloc(size_t size, int flags)
{
	void *ret = kmalloc(size, flags);

	if (ret) {
		RtlZeroMemory(ret, size);
		return ret;
	}

	return NULL;
}

/**
 *  vmalloc  -  allocate virtually contiguous memory
 *  @size:      allocation size
 *  Allocate enough pages to cover @size from the page level
 *  allocator and map them into contiguous kernel virtual space.
 *
 *  For tight control over page level allocator and protection flags
 *  use __vmalloc() instead.
 */
void* _cdecl vmalloc(unsigned long size)
{
	void *ret = ExAllocatePoolWithTag(PagedPool, size, MEM_TAG);
	SAFE_ASSERT(ret != NULL);
	return ret;
} 

void _cdecl vfree(void *addr)
{
	/* when addr == null, critical error occur */
	if (addr)
		ExFreePoolWithTag(addr, MEM_TAG);
}

unsigned long _cdecl copy_to_user(void *to, const void *from, unsigned long n)
{
	SAFE_ASSERT(0);
	return 0;
}

int _cdecl copy_from_user(void *to, const void *from, int n)
{
	SAFE_ASSERT(0);
	return 1;
}

void _cdecl dump_stack(void)
{
	SAFE_ASSERT(0);
}

void* _cdecl kmap_atomic(struct page *page, enum km_type type)
{
	void *ret;

	SAFE_ASSERT(page->page_type != PAGE_NOT_USED);

	switch (page->page_type) {
		case PAGE_NEED_FREE:
			ret = page->independed.systemVA;
			break;
		case PAGE_NOTNEED_FREE: 
			{
				struct page *head_page = page->independed.head_page;
				SAFE_ASSERT(head_page->page_type != PAGE_NOT_USED && 
					head_page->page_type != PAGE_NOTNEED_FREE);
				ret = page->independed.systemVA;
				break;								
			}
		case PAGE_MEMMAPPED:
			ret = page->mapped.systemVA;
			break;
		default:
			printk(KERN_ALERT "%s: you are trying to kmap odd page: (type: %d)\n",
			   __FUNCTION__,
			   page->page_type);
	}

	SAFE_ASSERT(ret != NULL);

	return ret;
}

void _cdecl kunmap_atomic(void *kvaddr, enum km_type type)
{
	return;
}

void* _cdecl page_address(struct page *page)
{
	void *ret = NULL;

	SAFE_ASSERT(page->page_type != PAGE_NOT_USED);

	switch (page->page_type) {
		case PAGE_NEED_FREE:			
			ret = page->independed.systemVA;
			break;
		case PAGE_NOTNEED_FREE:
			{
				struct page *head_page = page->independed.head_page;
				SAFE_ASSERT(head_page->page_type != PAGE_NOT_USED && 
					head_page->page_type != PAGE_NOTNEED_FREE);
				ret = page->independed.systemVA;				
				break;
			}
		case PAGE_MEMMAPPED:
			ret = page->mapped.systemVA;
			break;
		default:
			printk(KERN_ALERT "%s: you are trying to kmap odd page: (type: %d)\n",
			   __FUNCTION__,
			   page->page_type);
	}
	
	SAFE_ASSERT(ret != NULL);

	return ret;
}

void _cdecl get_page(struct page *page)
{
	return;
}

/**
 *  alloc_pages_current - Allocate pages.
 *
 *  @gfp:
 *      %GFP_USER   user allocation,
 *          %GFP_KERNEL kernel allocation,
 *          %GFP_HIGHMEM highmem allocation,
 *          %GFP_FS     don't call back into a file system.
 *          %GFP_ATOMIC don't sleep.
 *  @order: Power of two of allocation size in pages. 0 is a single page.
 *
 *  Allocate a page from the kernel 0page pool.  When not in
 *  interrupt context and apply the current process NUMA policy.
 *  Returns NULL when no page can be allocated.
 *
 *  Don't call cpuset_update_task_memory_state() unless
 *  1) it's ok to take cpuset_sem (can WAIT), and
 *  2) allocating for current task (not interrupt).
 */
struct page* _cdecl alloc_pages(unsigned int flags, unsigned int order)
{
	unsigned actual_size = (order + 1) * PAGE_SIZE;
	struct page *head_page = NULL;
	struct page *page = NULL;
	hva_t sysAddr;
	hpa_t paAddr;
	hva_t i;
	int first_itr = 1;

	SAFE_ASSERT((order + 1) > 0);

	sysAddr = (hva_t)KeGetPageMemory(actual_size);
	if (!sysAddr) {
		SAFE_ASSERT(0);
		return NULL;
	}	

	for (i = sysAddr ; i < (sysAddr + actual_size) ; i += PAGE_SIZE) {
		paAddr = (hpa_t)__pa(i);
		page = get_page_slot(paAddr);
		SAFE_ASSERT(page);		
		SAFE_ASSERT(page->page_type == PAGE_NOT_USED);

		if (first_itr) {
			page->page_type            = PAGE_NEED_FREE;
			page->independed.size      = actual_size;
			page->independed.systemVA  = (PVOID)sysAddr;
			page->independed.h_pfn     = (unsigned long)paAddr >> PAGE_SHIFT;
			page->independed.head_page = page;
			head_page = page;
		} else {
			page->page_type             = PAGE_NOTNEED_FREE;
			page->independed.size       = 0;
			page->independed.systemVA   = (PVOID)i;
			page->independed.h_pfn      = (unsigned long)paAddr >> PAGE_SHIFT;
			page->independed.head_page  = head_page;
		};

		first_itr = 0;
	}
	return head_page;
}

struct page* _cdecl alloc_page(unsigned int flags)
{
	return alloc_pages(flags, 0);
}

struct page* _cdecl alloc_pages_node(int nid, unsigned int gfp_mask, 
	                                 unsigned int order)
{
	return alloc_pages(gfp_mask, order);
}

/* FIXME */
void _cdecl __free_pages(struct page *page, unsigned int order)
{
	switch (page->page_type)  {
       case PAGE_NEED_FREE:		   
		   KeFreePageMemory(page->independed.systemVA, page->independed.size);
		   RtlZeroMemory(page, sizeof(struct page));
		   break;
	   case PAGE_MEMMAPPED:
		   RtlZeroMemory(page, sizeof(struct page));
		   break;
	   default:
		   printk(KERN_ALERT "%s: you are trying to free odd page: (type: %d)\n",
			   __FUNCTION__,
			   page->page_type);
	}
}

void _cdecl __free_page(struct page *page)
{
	__free_pages(page, 0);
}

void _cdecl free_page(hva_t addr)
{
	free_pages(addr, 0);
}

void _cdecl free_pages(hva_t addr, unsigned long order)
{
	unsigned actual_size = (order + 1) * PAGE_SIZE;
	struct page *page = NULL;
	hpa_t  phys = __pa(addr);
	SAFE_ASSERT(phys != 0ull);

	page = get_page_slot(phys);
	SAFE_ASSERT(page != NULL);
	SAFE_ASSERT(page->page_type != PAGE_NOT_USED);

	__free_pages(page, order);
}

/* 
 * for global page allocater table
 */
static struct page_root *get_page_rootslot(hva_t pageaddr)
{
	return extension->globalMemTbl.page_slot_root[PAGE_PDE(pageaddr)];
}

static struct page *get_page_slot(hpa_t pageaddr)
{
	struct page_root *pgr;
	struct page *page;
	hpa_t  addr = pageaddr;

	SAFE_ASSERT(extension != NULL);

	pgr = extension->globalMemTbl.page_slot_root[PAGE_PDE(addr)];
	if (!pgr) {
		pgr = (struct page_root*)ExAllocatePoolWithTag(
			                NonPagedPool, 
							sizeof(struct page_root), 
							MEM_TAG);
		extension->globalMemTbl.page_slot_root[PAGE_PDE(addr)] = pgr;
		RtlZeroMemory(pgr, sizeof(struct page_root));
	}

	page = &pgr->page[PAGE_PTE(addr)];
	if (!page)
		SAFE_ASSERT(0);

	return page;
}

struct page* _cdecl pfn_to_page(hfn_t pfn)
{
	struct page *ret = get_page_slot(pfn << PAGE_SHIFT);
	SAFE_ASSERT(ret != NULL);
	if (ret->page_type == PAGE_NOT_USED) {
		printk(KERN_ALERT 
			"%s WARNING You are trying to get a non allocated-page area. "
			"Possibly a bug. check your code\n",
			__FUNCTION__);
	}
	return ret;
}

hfn_t _cdecl page_to_pfn(struct page *page)
{
	hfn_t pfn = 0;

	SAFE_ASSERT(page->page_type != PAGE_NOT_USED);
	switch (page->page_type) {
       case PAGE_NEED_FREE:
	   case PAGE_NOTNEED_FREE:
		   pfn = page->independed.h_pfn;
		   break;
	   case PAGE_MEMMAPPED:
		   pfn = page->mapped.h_pfn;
		   break;
	   default:
		   printk(KERN_ALERT "%s: you are trying to get odd page pfn: (type: %d)\n",
			   __FUNCTION__,
			   page->page_type);
	}
	SAFE_ASSERT(pfn != 0);
	return pfn;
}

int _cdecl get_order(unsigned long size)
{
	int order;

    size = (size - 1) >> (PAGE_SHIFT - 1);
    order = -1;
    do {
        size >>= 1;
        order++;
    } while (size);
    return order;
}

/**
 *  alloc_pages_current - Allocate pages.
 *
 *  @gfp:
 *      %GFP_USER   user allocation,
 *          %GFP_KERNEL kernel allocation,
 *          %GFP_HIGHMEM highmem allocation,
 *          %GFP_FS     don't call back into a file system.
 *          %GFP_ATOMIC don't sleep.
 *  @order: Power of two of allocation size in pages. 0 is a single page.
 *
 *  Allocate a page from the kernel 0page pool.  When not in
 *  interrupt context and apply the current process NUMA policy.
 *  Returns NULL when no page can be allocated.
 *
 *  Don't call cpuset_update_task_memory_state() unless
 *  1) it's ok to take cpuset_sem (can WAIT), and
 *  2) allocating for current task (not interrupt).
 */
struct page* _cdecl wk_alloc_page(unsigned long g_basefn, unsigned long pnum, unsigned int flags)
{
	struct page    *entry;
	hva_t          sysBase;
	hva_t          sysAddr;
	hpa_t          sysPhys;
    unsigned long  offset;
	unsigned long  gfn = g_basefn + pnum;

	MAPMEM *mapMemInfo = get_mapmem_slot(gfn);
	SAFE_ASSERT(mapMemInfo != NULL);

	if (mapMemInfo == NULL || 
		mapMemInfo->npages <= 0) {
			printk(KERN_ALERT 
				"%s There are no the allocated shared memory region "
				"that should assign to 0x%08x gfn area\n",
				__FUNCTION__, gfn);
			return NULL;
	}

	if (!mapMemInfo->kernelVAaddress)
		mapMemInfo->kernelVAaddress = MmGetSystemAddressForMdlSafe(
			                             mapMemInfo->apMdl[0], 
										 HighPagePriority);

	sysBase = (hva_t)mapMemInfo->kernelVAaddress;
	SAFE_ASSERT(sysBase != 0x0);

	offset = ((g_basefn - mapMemInfo->base_gfn) + pnum) << PAGE_SHIFT;

	sysAddr = sysBase + offset;
	sysPhys = __pa(sysAddr); 

	entry = get_page_slot(sysPhys);
	SAFE_ASSERT(entry);
	SAFE_ASSERT(entry->page_type == PAGE_NOT_USED);

	RtlZeroMemory(entry, sizeof(struct page));
	entry->page_type       = PAGE_MEMMAPPED;
	entry->mapped.size     = PAGE_SIZE;
	entry->mapped.systemVA = (PVOID)sysAddr;
	entry->mapped.h_pfn    = (unsigned long)(sysPhys >> PAGE_SHIFT);
	entry->mapped.g_pfn    = gfn;
	entry->mapped.pMdl     = &mapMemInfo->apMdl[0];
	entry->mapped.userVA   = (__u8*)mapMemInfo->userVAaddress + offset;

	return entry;
}

void* KeGetPageMemory(unsigned long size)
{
	return ExAllocatePoolWithTag(NonPagedPool, size, MEM_TAG);
//	return MmAllocateNonCachedMemory(size);
}

void KeFreePageMemory(void *ptr, unsigned long size)
{
	ExFreePoolWithTag(ptr, MEM_TAG);
	//MmFreeNonCachedMemory(ptr, size);
}
