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
set_map_bit(unsigned long address, struct membitmap *tbl)
{
	unsigned long val = 1 << (PAGE_PTE(address) % sizeof(unsigned long));	
	tbl->address_mask[PAGE_PTE(address) / sizeof(unsigned long)] |= val;
}

static void 
clear_map_bit(unsigned long address, struct membitmap *tbl)
{
	unsigned long val = 1 << (PAGE_PTE(address) % sizeof(unsigned long));	
	tbl->address_mask[PAGE_PTE(address) / sizeof(unsigned long)] &= ~val;	
}

static int 
check_map_bit(unsigned long address, struct membitmap *tbl)	
{
	unsigned long val = 1 << (PAGE_PTE(address) % sizeof(unsigned long));	
	return tbl->address_mask[PAGE_PTE(address) / sizeof(unsigned long)] & val;	
}

void 
init_slab_emulater(PWINKVM_DEVICE_EXTENSION extn)
{
	int i;
	struct page_root *pgr;
	unsigned long addr;
	unsigned long cache_size = 0;

	/* initialize normal page allocater */
	extn->MemAlloc.page_slot_num = 
		sizeof(extn->MemAlloc.page_slot_root) / sizeof(struct page_root*);

	for (i = 0 ; i < extn->MemAlloc.page_slot_num ; i++)
		extn->MemAlloc.page_slot_root[i] = NULL;


	/* initialize winkvm shared page allocater */
	extn->MapmemInfo.MemAlloc.page_slot_num = 
		sizeof(extn->MapmemInfo.MemAlloc.page_slot_root) / sizeof(struct page_root*);

	for (i = 0 ; i < extn->MapmemInfo.MemAlloc.page_slot_num ; i++)
		extn->MapmemInfo.MemAlloc.page_slot_root[i] = NULL;


	/* allocate cache slot */
	/* cache_size = 1024 * 1024 * 1; */
	cache_size = 0;
	for (addr = 0 ; addr < cache_size ; addr += PAGE_SIZE) {
		pgr = extn->MemAlloc.page_slot_root[PAGE_PDE(addr)];
		if (!pgr) {
			pgr = (struct page_root*)ExAllocatePoolWithTag(
				                 NonPagedPool, 
								 sizeof(struct page_root), 
								 MEM_TAG);
			SAFE_ASSERT(pgr);
			extn->MemAlloc.page_slot_root[PAGE_PDE(addr)] = pgr;
		}

		/* FIX ME: immediate number!  */
		for (i = 0 ; i < 1024 ; i++) {
			pgr->page[i].__wpfn = PAGE_NOT_USED;
			pgr->page[i].__nt_mem = NULL;
			pgr->page[i].__nt_memsize = 0;
			pgr->page[i].__ppfn = 0;
		}
	}

	ExInitializeFastMutex(&extn->MemAlloc.page_emulater_mutex);

	extension = extn;	
}

void 
release_slab_emulater(PWINKVM_DEVICE_EXTENSION extn)
{
	int i, k;
	struct page *pd;
	
	for (i = 0 ; i < extn->MemAlloc.page_slot_num ; i++) {
		if (extn->MemAlloc.page_slot_root[i]) {
			pd = extn->MemAlloc.page_slot_root[i]->page;
			/* bug!! */
			for (k = 0 ; k < 1024 ; k++) {
				if (pd[k].__wpfn != PAGE_NOT_USED && 
					pd[k].__wpfn != PAGE_NOTNEED_FREE)
					KeFreePageMemory(pd[k].__nt_mem, pd[k].__nt_memsize);
			}
			ExFreePoolWithTag(extn->MemAlloc.page_slot_root[i], MEM_TAG);
			extn->MemAlloc.page_slot_root[i] = NULL;
		}
	}

	for (i = 0 ; i < extn->MemAlloc.page_slot_num ; i++) {
		if (extn->MapmemInfo.MemAlloc.page_slot_root[i]) {
			ExFreePoolWithTag(extn->MapmemInfo.MemAlloc.page_slot_root[i], MEM_TAG);
			extn->MapmemInfo.MemAlloc.page_slot_root[i] = NULL;
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

	if (page->mem_type == 1) {
		printk(KERN_ALERT 
			"You are trying to free shared page area using free_pages\n");
		return;
	}

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

static struct page_root *get_page_rootslot(hva_t pageaddr)
{
	return extension->MemAlloc.page_slot_root[PAGE_PDE(pageaddr)];
}

static struct page *get_page_slot(hva_t pageaddr)
{
	struct page_root *pgr;
	struct page *page;
	unsigned long addr = (unsigned long)pageaddr;
	int i;

	SAFE_ASSERT(extension != NULL);

//	ExAcquireFastMutex(&page_emulater_mutex);

	pgr = extension->MemAlloc.page_slot_root[PAGE_PDE(addr)];

	if (!pgr) {
		pgr = (struct page_root*)ExAllocatePoolWithTag(NonPagedPool, sizeof(struct page_root), MEM_TAG);		
		extension->MemAlloc.page_slot_root[PAGE_PDE(addr)] = pgr;

		/* FIX ME: immediate number!  */
		for (i = 0 ; i < 1024 ; i++) {
			pgr->page[i].__wpfn = PAGE_NOT_USED;
			pgr->page[i].__nt_mem = NULL;
			pgr->page[i].__nt_memsize = 0;
			pgr->page[i].__ppfn = 0;
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
struct page* _cdecl wk_alloc_page(unsigned long gpfn, unsigned int flags)
{
	struct page_root *root;	
	struct page *entry;	
	unsigned long gpa = gpfn << PAGE_SHIFT;	
	
	int rindex = PAGE_PDE(gpa);
	int eindex = PAGE_PTE(gpa);	

	SAFE_ASSERT(extension != NULL);

	if (extension->MapmemInfo.shared_size <= 0) {
		printk(KERN_ALERT "There are no allocated shared memory region\n");
		return NULL;
	}

	root = extension->MapmemInfo.MemAlloc.page_slot_root[rindex];
	if (!root) {		
		root = (struct page_root*)KeGetPageMemory(sizeof(struct page_root));
		if (!root) {
			/* error */
			printk(KERN_ALERT "%s: KeGetPageMemory\n", __FUNCTION__);
			return NULL;			
		}
		RtlZeroMemory(root, sizeof(struct page_root));
		extension->MapmemInfo.MemAlloc.page_slot_root[rindex] = root;
	}	
	
	entry = &root->page[eindex];	
	if (check_map_bit(gpa, &root->bitmap)) {
		printk(KERN_ALERT "%s: memory map is odd.", __FUNCTION__);
		return NULL;
	} else {
		set_map_bit(gpa, &root->bitmap);
		RtlZeroMemory(entry, sizeof(struct page));
		entry->__nt_mem     = (char*)extension->MapmemInfo.mappointer + gpa;
		entry->__nt_memsize = PAGE_SIZE;
		entry->mem_type     = 1; /* 1: memorymap area */
		return entry;		
	}

	return NULL;	
}

void _cdecl wk_free_page(unsigned long gpfn, struct page *page)	
{
	struct page_root *root;	
	struct page *entry;	
	unsigned long gpa = gpfn << PAGE_SHIFT;
	int rindex = PAGE_PDE(gpa);
	int eindex = PAGE_PTE(gpa);

	root = extension->MapmemInfo.MemAlloc.page_slot_root[rindex];
	if (!root) {
		printk(KERN_ALERT 
			   "%s: memory slot is odd. page_slot_root[%d] is not existence\n", 
			   __FUNCTION__, rindex);
		return;		
	}   
	
	entry = &root->page[eindex];	

	if (entry->mem_type == 0) {
		printk(KERN_ALERT 
			"You are trying to free normal page area using wk_free_page\n");
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
		KeFreePageMemory(root, sizeof(struct page_root));
		extension->MapmemInfo.MemAlloc.page_slot_root[rindex] = NULL;
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
