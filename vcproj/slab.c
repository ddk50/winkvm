
#include "slab.h"
#include "kernel.h"

#define PAGE_MASK (~(PAGE_SIZE-1))

#define PAGE_NOT_USED ((unsigned long)-1)

#define PAGE_PDE(x)         ((x) >> 22)
#define PAGE_PTE(x)         (((x) >> 12) & 0x3ff)
#define PAGE_NUM(pde, pte)  (((pde) << 22) | ((pte) << 12))

struct page_root {
	struct page page[1024];
};

static struct page_root *page_slot_root[1024];
static FAST_MUTEX page_emulater_mutex;
const int page_slot_num = sizeof(page_slot_root) / sizeof(struct page_root*);

static struct page_root *get_page_rootslot(hva_t pageaddr);
static struct page *get_page_slot(hva_t pageaddr);

static void* KeGetPageMemory(SIZE_T size);
static void KeFreePageMemory(void *ptr, SIZE_T size);

void init_slab_emulater(void)
{
	int i;

	for (i = 0 ; i < page_slot_num ; i++) {
		page_slot_root[i] = NULL;
	}

	ExInitializeFastMutex(&page_emulater_mutex);
}

void release_slab_emulater(void)
{
	int i, j;
	struct page *pd;
	
	for (i = 0 ; i < page_slot_num ; i++) {
		if (page_slot_root[i]) {
			for (j = 0 ; j < 1024 ; j++) {
				pd = page_slot_root[j]->page;
				if (pd->__nt_mem)
					KeFreePageMemory(pd->__nt_mem, pd->__nt_memsize);
			}
			ExFreePoolWithTag(page_slot_root[i], MEM_TAG);
		}
		page_slot_root[i] = NULL;
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
 *  Allocate a page from the kernel page pool.  When not in
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
	printk(KERN_ALERT "allocater order size: %d\n", actual_size);

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
		RtlZeroMemory(page, sizeof(struct page));

		page->__nt_mem     = (void*)addr;
		page->__nt_memsize = actual_size;
		page->__wpfn   = addr >> PAGE_SHIFT;

		SAFE_ASSERT((addr & PAGE_MASK) == addr);
	}

	return head_page;
}

struct page* _cdecl alloc_page(unsigned int flags)
{
	return alloc_pages(flags, 1);
}

struct page* _cdecl alloc_pages_node(int nid, unsigned int gfp_mask, 
	                                 unsigned int order)
{
	return alloc_pages(gfp_mask, order);
}

void _cdecl __free_pages(struct page *page, unsigned int order)
{	
//	struct page_root *pd = get_page_rootslot
	SAFE_ASSERT(page->__wpfn != PAGE_NOT_USED);
}

void _cdecl __free_page(struct page *page)
{
	hva_t addr;
	SAFE_ASSERT(page->__wpfn != PAGE_NOT_USED);
	addr = page->__wpfn << PAGE_SHIFT;
	free_pages(addr, 1);
}

void _cdecl free_page(hva_t addr)
{
	free_pages(addr, 1);
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

		/* ExFreePoolWithTag(page->__nt_mem, MEM_TAG); */
		KeFreePageMemory(page->__nt_mem, page->__nt_memsize);
		RtlZeroMemory(page, sizeof(struct page));
	}
}

static struct page_root *get_page_rootslot(hva_t pageaddr)
{
	return page_slot_root[PAGE_PDE(pageaddr)];
}

static struct page *get_page_slot(hva_t pageaddr)
{
	struct page_root *pgr;
	struct page *page;
	unsigned long addr = (unsigned long)pageaddr;
	int i;

	ExAcquireFastMutex(&page_emulater_mutex);

	pgr = page_slot_root[PAGE_PDE(addr)];

	if (!pgr) {
		pgr = (struct page_root*)ExAllocatePoolWithTag(NonPagedPool, sizeof(struct page_root), MEM_TAG);		
		RtlZeroMemory(pgr, sizeof(struct page_root));
		page_slot_root[PAGE_PDE(addr)] = pgr;

		/* FIX ME: immediate number!  */
		for (i = 0 ; i < 1024 ; i++) {
			pgr->page[i].__wpfn = PAGE_NOT_USED;
		}
	}

	page = &pgr->page[PAGE_PTE(addr)];
	if (!page)
		SAFE_ASSERT(0);

	ExReleaseFastMutex(&page_emulater_mutex);

	return page;
}

struct page* _cdecl pfn_to_page(hfn_t pfn)
{
	return get_page_slot(pfn << PAGE_SHIFT);
}

hfn_t _cdecl page_to_pfn(struct page *page)
{
	return ((hfn_t)page->__nt_mem) >> PAGE_SHIFT;
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

static void* KeGetPageMemory(SIZE_T size)
{
	return MmAllocateNonCachedMemory(size);
}

static void KeFreePageMemory(void *ptr, SIZE_T size)
{
	MmFreeNonCachedMemory(ptr, size);
}
