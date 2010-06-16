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

#define PAGE_NOT_USED        0xfffffffful
#define PAGE_NOTNEED_FREE    0xfffffffeul

#define PAGE_PDE(x)         ((x) >> 22)
#define PAGE_PTE(x)         (((x) >> 12) & 0x3ff)
#define PAGE_NUM(pde, pte)  (((pde) << 22) | ((pte) << 12))

static struct page_root *get_page_rootslot(hva_t pageaddr);
static struct page *get_page_slot(hva_t pageaddr);

static PWINKVM_DEVICE_EXTENSION extension = NULL;

static void 
set_map_bit(unsigned long address, struct membitmap *bm)
{
	unsigned long val = 1 << (PAGE_PTE(address) % sizeof(unsigned long));	
	bm->address_mask[PAGE_PTE(address) / sizeof(unsigned long)] |= val;
}

static void 
clear_map_bit(unsigned long address, struct membitmap *bm)
{
	unsigned long val = 1 << (PAGE_PTE(address) % sizeof(unsigned long));	
	bm->address_mask[PAGE_PTE(address) / sizeof(unsigned long)] &= ~val;	
}

static int 
check_map_bit(unsigned long address, struct membitmap *bm)	
{
	unsigned long val = 1 << (PAGE_PTE(address) % sizeof(unsigned long));	   
	return bm->address_mask[PAGE_PTE(address) / sizeof(unsigned long)] & val;
}

static MAPMEM*
get_mapmem_slot(unsigned long gfn)
{
	int i;
	unsigned long base_gfn, npages;

	SAFE_ASSERT(extension != NULL);

	for (i = 0 ; i < MAX_MEMMAP_SLOT ; i++) {
		base_gfn = extension->mapMemInfo[i].base_gfn;
		npages   = extension->mapMemInfo[i].npages;

		if (base_gfn <= gfn && (base_gfn + npages) > gfn) {
			return &extension->mapMemInfo[i];
		}
	}

	return NULL;
}

void 
init_slab_emulater(PWINKVM_DEVICE_EXTENSION extn)
{
	int i;
	struct page_root *pgr;
	unsigned long addr;
	unsigned long cache_size = 0;

	/* initialize global page allocater */
	RtlZeroMemory(&extn->globalMemTbl, sizeof(MEMALLOCMANTBL));
	extn->globalMemTbl.page_slot_num = 
		sizeof(extn->globalMemTbl.page_slot_root) / sizeof(struct page_root*);


	/* initialize winkvm shared page allocater */
	for (i = 0 ; i < MAX_MEMMAP_SLOT ; i++) {
		MEMALLOCMANTBL *tbl = &extn->mapMemInfo[i].memTbl;
		RtlZeroMemory(tbl, sizeof(MEMALLOCMANTBL));
	}

	for (i = 0 ; i < MAX_MEMMAP_SLOT ; i++)
		extn->mapMemInfo[i].memTbl.page_slot_num = 
			sizeof(extn->mapMemInfo[i].memTbl.page_slot_root) / sizeof(struct page_root*);	


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

		/* FIX ME: immediate number!  */
		for (i = 0 ; i < 1024 ; i++) {
			pgr->page[i].__wpfn = PAGE_NOT_USED;
			pgr->page[i].__nt_mem = NULL;
			pgr->page[i].__nt_memsize = 0;
			pgr->page[i].__ppfn = 0;
		}
	}

	ExInitializeFastMutex(&extn->globalMemTbl.page_emulater_mutex);
	extension = extn;
}

void 
release_slab_emulater(PWINKVM_DEVICE_EXTENSION extn)
{
	int i, j;
	struct page *pd;
	
	/* free all global page allocater  */
	for (i = 0 ; i < extn->globalMemTbl.page_slot_num ; i++) {
		if (extn->globalMemTbl.page_slot_root[i]) {
			pd = extn->globalMemTbl.page_slot_root[i]->page;
			/* bug!! */
			for (j = 0 ; j < 1024 ; j++) {
				if (pd[j].__wpfn != PAGE_NOT_USED && 
					pd[j].__wpfn != PAGE_NOTNEED_FREE && 
					pd[j].__nt_mem != NULL && 
					pd[j].__nt_memsize > 0)
					KeFreePageMemory(pd[j].__nt_mem, pd[j].__nt_memsize);
			}
			ExFreePoolWithTag(extn->globalMemTbl.page_slot_root[i], MEM_TAG);
			extn->globalMemTbl.page_slot_root[i] = NULL;
		}
	}

	/* free winkvm shared page allocater */
	for (i = 0 ; i < MAX_MEMMAP_SLOT ; i++) {
		MAPMEM *mem = &extn->mapMemInfo[i];		
		for (j = 0 ; j < mem->memTbl.page_slot_num ; j++) {
			if (mem->memTbl.page_slot_root[j]) {
				ExFreePoolWithTag(mem->memTbl.page_slot_root[j], MEM_TAG);
				mem->memTbl.page_slot_root[j] = NULL;
			}
		}
	}

	extension = NULL;
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
	return ExAllocatePoolWithTag(NonPagedPool, size, MEM_TAG);
} 

void _cdecl vfree(void *addr)
{
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
	return page->__nt_mem;
}

void _cdecl kunmap_atomic(void *kvaddr, enum km_type type)
{
	return;
}

void* _cdecl page_address(struct page *page)
{
	SAFE_ASSERT(page->__wpfn != PAGE_NOT_USED);
	return page->__nt_mem;
}

void _cdecl get_page(struct page *page)
{   
	SAFE_ASSERT(page->__wpfn != PAGE_NOT_USED);
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
	void *__nt_mem = NULL;
	struct page *page = NULL;
	struct page *head_page = NULL;
	hva_t addr;

	SAFE_ASSERT((order + 1) > 0);
/*	printk(KERN_ALERT "allocater order size: %d\n", actual_size); */

/*	__nt_mem = (void*)ExAllocatePoolWithTag(NonPagedPool, actual_size, MEM_TAG); */
	__nt_mem = (void*)KeGetPageMemory(actual_size);
	if (!__nt_mem) {
		SAFE_ASSERT(0);
		return NULL;
	}

	SAFE_ASSERT(((unsigned long)__nt_mem & PAGE_MASK) == (unsigned long)__nt_mem);

	head_page = get_page_slot((hva_t)__nt_mem);

	addr = (hva_t)__nt_mem;
	for (; addr < addr + actual_size ; addr += PAGE_SIZE) {
		page = get_page_slot(addr);
		SAFE_ASSERT(page);

		page->__nt_mem     = (void*)addr;
		page->__nt_memsize = actual_size;
		page->__wpfn = ((hva_t)__nt_mem == addr) ? addr >> PAGE_SHIFT : PAGE_NOTNEED_FREE;
		page->__ppfn = (unsigned long)__pa(addr) >> PAGE_SHIFT;

		SAFE_ASSERT((addr & PAGE_MASK) == addr);
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

void _cdecl __free_pages(struct page *page, unsigned int order)
{	
	hva_t addr;
	SAFE_ASSERT(page->__wpfn != PAGE_NOT_USED && page->__wpfn != PAGE_NOTNEED_FREE);
	addr = page->__wpfn << PAGE_SHIFT;
	free_pages(addr, order);
}

void _cdecl __free_page(struct page *page)
{
	hva_t addr;
	SAFE_ASSERT(page->__wpfn != PAGE_NOT_USED && page->__wpfn != PAGE_NOTNEED_FREE);
	addr = page->__wpfn << PAGE_SHIFT;
	free_pages(addr, 0);
}

void _cdecl free_page(hva_t addr)
{
	free_pages(addr, 0);
}

void _cdecl free_pages(hva_t addr, unsigned long order)
{
	unsigned actual_size = (order + 1) * PAGE_SIZE;
	struct page *page = NULL;
	hva_t r;

	for (r = addr ; r < addr + actual_size ; r += PAGE_SIZE) {
		page = get_page_slot(r);

		SAFE_ASSERT(page);
		SAFE_ASSERT(page->__wpfn != PAGE_NOT_USED);

		if (page->__wpfn != PAGE_NOTNEED_FREE)
			KeFreePageMemory(page->__nt_mem, page->__nt_memsize);

		page->__nt_mem = NULL;
		page->__nt_memsize = 0;
		page->__ppfn = 0;
		page->__wpfn = PAGE_NOT_USED;
	}
}

/* 
 * for global page allocater table
 */
static struct page_root *get_page_rootslot(hva_t pageaddr)
{
	return extension->globalMemTbl.page_slot_root[PAGE_PDE(pageaddr)];
}

static struct page *get_page_slot(hva_t pageaddr)
{
	struct page_root *pgr;
	struct page *page;
	unsigned long addr = (unsigned long)pageaddr;
	int i;

	SAFE_ASSERT(extension != NULL);

//	ExAcquireFastMutex(&page_emulater_mutex);

	pgr = extension->globalMemTbl.page_slot_root[PAGE_PDE(addr)];

	if (!pgr) {
		pgr = (struct page_root*)ExAllocatePoolWithTag(
			                NonPagedPool, 
							sizeof(struct page_root), 
							MEM_TAG);
		extension->globalMemTbl.page_slot_root[PAGE_PDE(addr)] = pgr;

		/* FIX ME: immediate number!  */
		for (i = 0 ; i < 1024 ; i++) {
			pgr->page[i].__wpfn       = PAGE_NOT_USED;
			pgr->page[i].__nt_mem     = NULL;
			pgr->page[i].__nt_memsize = 0;
			pgr->page[i].__ppfn       = 0;
		}
	}

	page = &pgr->page[PAGE_PTE(addr)];
	if (!page)
		SAFE_ASSERT(0);

//	ExReleaseFastMutex(&page_emulater_mutex);

	return page;
}

struct page* _cdecl pfn_to_page(hfn_t pfn)
{
	return get_page_slot((hva_t)__va(pfn << PAGE_SHIFT));
}

hfn_t _cdecl page_to_pfn(struct page *page)
{	
	return (hfn_t)page->__ppfn;
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
struct page* _cdecl wk_alloc_page(unsigned long gfn, unsigned int flags)
{
	struct page_root *root;	
	struct page *entry;	
	unsigned long gpa = gfn << PAGE_SHIFT;	
	
	int rindex = PAGE_PDE(gpa);
	int eindex = PAGE_PTE(gpa);

	MAPMEM *mapMemInfo = get_mapmem_slot(gfn);

	SAFE_ASSERT(extension != NULL);
	SAFE_ASSERT(mapMemInfo != NULL);

	if (mapMemInfo->npages <= 0) {
		printk(KERN_ALERT 
			"There are no the allocated shared memory region "
			"that should assign to 0x%08x gfn area\n",
			gfn);
		return NULL;
	}

	root = mapMemInfo->memTbl.page_slot_root[rindex];
	if (!root) {
		root = (struct page_root*)ExAllocatePoolWithTag(
			                         NonPagedPool, 
									 sizeof(struct page_root), 
									 MEM_TAG);
		if (!root) {
			/* error */
			printk(KERN_ALERT "%s: ExAllocatePoolWithTag\n", __FUNCTION__);
			return NULL;
		}
		RtlZeroMemory(root, sizeof(struct page_root));
		mapMemInfo->memTbl.page_slot_root[rindex] = root;
	}
	
	entry = &root->page[eindex];
	if (check_map_bit(gpa, &root->bitmap)) {
		printk(KERN_ALERT "%s: memory map is odd.", __FUNCTION__);
		return NULL;
	} else {
		set_map_bit(gpa, &root->bitmap);
		RtlZeroMemory(entry, sizeof(struct page));
		entry->__nt_mem     = (__u8*)mapMemInfo->userVAaddress + gpa;
		entry->__nt_memsize = PAGE_SIZE;
		entry->__wpfn       = PAGE_NOTNEED_FREE;
		entry->__ppfn       = (unsigned long)__pa((hva_t)entry->__nt_mem) >> PAGE_SHIFT;
		SAFE_ASSERT(entry->__ppfn != 0x0);
		return entry;		
	}

	return NULL;	
}

void _cdecl wk_free_page(unsigned long gfn, struct page *page)	
{
	struct page_root *root;	
	struct page *entry;	
	unsigned long gpa = gfn << PAGE_SHIFT;
	int rindex = PAGE_PDE(gpa);
	int eindex = PAGE_PTE(gpa);

	MAPMEM *mapMemInfo = get_mapmem_slot(gfn);

	SAFE_ASSERT(mapMemInfo != NULL);

	root = mapMemInfo->memTbl.page_slot_root[rindex];
	if (!root) {
		printk(KERN_ALERT 
			   "%s: memory slot is odd. page_slot_root[%d] is not existence\n", 
			   __FUNCTION__, rindex);
		return;		
	}   
	
	entry = &root->page[eindex];	

	if (entry->__wpfn != PAGE_NOTNEED_FREE) {
		printk(KERN_ALERT 
			"WARNING: You are trying to free normal page area using %s\n",
			__FUNCTION__);
		return;
	}

	if (!check_map_bit(gpa, &root->bitmap)) {		
		printk(KERN_ALERT 
			"%s: memory bitmap is odd\n", 
			__FUNCTION__);
		return;		
	}

	clear_map_bit(gpa, &root->bitmap);
	RtlZeroMemory(entry, sizeof(struct page));

	if (root->bitmap.address_mask == 0) {
		ExFreePoolWithTag(root, sizeof(struct page_root));
		mapMemInfo->memTbl.page_slot_root[rindex] = NULL;
	}   
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
