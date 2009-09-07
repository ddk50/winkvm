
#include "slab.h"
#include "kernel.h"

#define MEM_TAG   'HmmV'
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
				if (pd[j].__nt_mem)
					ExFreePoolWithTag(pd[j].__nt_mem, MEM_TAG);
			}
			ExFreePoolWithTag(page_slot_root[i], MEM_TAG);
		}
		page_slot_root[i] = NULL;
	}
}

void _cdecl kfree(void *objp)
{
	if (objp == NULL) {
		return;
	} else {
		ExFreePoolWithTag(objp, MEM_TAG);
	}
}

//_cdecl‚ð‚Â‚¯‚Ä’¼‚Á‚½‚©‚È???
void* _cdecl kmalloc(size_t size, int flags)
{
	void *ret = NULL;
	switch (flags) {
		default:
			ret = ExAllocatePoolWithTag(PagedPool, size, MEM_TAG);
			break;
	}
	ASSERT(!ret);
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

void* _cdecl vmalloc(unsigned long size)
{
	return ExAllocatePoolWithTag(PagedPool, size, MEM_TAG);
} 

void _cdecl vfree(void *addr)
{
	ExFreePoolWithTag(addr, MEM_TAG);
}

unsigned long _cdecl copy_to_user(void *to, const void *from, unsigned long n)
{
	ASSERT(0);
	return 0;
}

int _cdecl copy_from_user(void *to, const void *from, int n)
{
	ASSERT(0);
	return 1;
}

void _cdecl dump_stack(void)
{
	ASSERT(0);
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
	ASSERT(page->__wpfn != PAGE_NOT_USED);
	return page->__nt_mem;
}

void _cdecl get_page(struct page *page)
{   
	ASSERT(page->__wpfn != PAGE_NOT_USED);
	return;
}

/* alloc_pages */
struct page* _cdecl alloc_pages(unsigned int flags, unsigned int order)
{
	unsigned actual_size = order * PAGE_SIZE;
	void *__nt_mem = NULL;
	struct page *page = NULL;
	struct page *head_page = NULL;
	hva_t addr;

	ASSERT(order > 0);

	/* Does it really need? */
	ExAcquireFastMutex(&page_emulater_mutex);

	__nt_mem = (void*)ExAllocatePoolWithTag(NonPagedPool, actual_size, MEM_TAG);
	if (!__nt_mem) {
		ASSERT(0);
		head_page = NULL;
		goto release;
	}

	ASSERT(((unsigned long)__nt_mem & PAGE_MASK) == (unsigned long)__nt_mem);

	head_page = get_page_slot((hva_t)__nt_mem);

	addr = (hva_t)__nt_mem;
	for (; addr < addr + actual_size ; addr += PAGE_SIZE) {
		page = get_page_slot(addr);
		ASSERT(page);
		RtlZeroMemory(page, sizeof(struct page));

		page->__nt_mem = (void*)addr;
		page->__wpfn   = addr >> PAGE_SHIFT;

		ASSERT((addr & PAGE_MASK) == addr);
	}

release:
	/* Does it really need? */
	ExReleaseFastMutex(&page_emulater_mutex);

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
	ASSERT(page->__wpfn != PAGE_NOT_USED);
}

void _cdecl __free_page(struct page *page)
{
	hva_t addr;
	ASSERT(page->__wpfn != PAGE_NOT_USED);
	addr = page->__wpfn << PAGE_SHIFT;
	free_pages(addr, 1);
}

void _cdecl free_page(hva_t addr)
{
	free_pages(addr, 1);
}

void _cdecl free_pages(hva_t addr, unsigned long order)
{
	unsigned actual_size = order * PAGE_SIZE;
	struct page *page = NULL;
	hva_t r;

	ExAcquireFastMutex(&page_emulater_mutex);	

	for (r = addr ; r < addr + actual_size ; r += PAGE_SIZE) {
		page = get_page_slot(r);

		ASSERT(page);
		ASSERT(page->__wpfn != PAGE_NOT_USED);

		ExFreePoolWithTag(page->__nt_mem, MEM_TAG);
		RtlZeroMemory(page, sizeof(struct page));
	}

	ExReleaseFastMutex(&page_emulater_mutex);
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
		pgr = (struct page_root*)ExAllocatePoolWithTag(PagedPool, sizeof(struct page_root), MEM_TAG);
		RtlZeroMemory(pgr, sizeof(struct page_root));
		page_slot_root[PAGE_PDE(addr)] = pgr;

		for (i = 0 ; i < 1024 ; i++) {
			pgr->page[i].__wpfn = PAGE_NOT_USED;
		}
	}

	page = &pgr->page[PAGE_PTE(addr)];
	if (!page)
		ASSERT(0);

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
	return size / PAGE_SIZE;
}

