
#ifndef _SLAB_H_
#define _SLAB_H_

#include "init.h"
#include "kernel.h"

#include <linux/winkvm.h>

#include "extension.h"

struct page_root {
	struct page page[1024];
};

void _cdecl kfree(void *objp);
void* _cdecl kmalloc(size_t size, int flags);
void* _cdecl kzalloc(size_t size, int flags);

void* _cdecl vmalloc(unsigned long size);
void _cdecl vfree(void *addr);

unsigned long _cdecl copy_to_user(void *to, const void *from, unsigned long n);
int _cdecl copy_from_user(void *to, const void *from, int n);
void _cdecl dump_stack(void);

void* _cdecl kmap_atomic(struct page *page, enum km_type type);
void _cdecl kunmap_atomic(void *kvaddr, enum km_type type);

void _cdecl free_pages(hva_t addr, unsigned long order);
void _cdecl get_page(struct page *page);

struct page* _cdecl alloc_pages(unsigned int flags, unsigned int order);
struct page* _cdecl alloc_page(unsigned int flags);
struct page* _cdecl alloc_pages_node(int nid, unsigned int gfp_mask, 
	                                 unsigned int order);

void _cdecl __free_pages(struct page *page, unsigned int order);
void _cdecl __free_page(struct page *page);
void _cdecl free_page(hva_t addr);
void _cdecl free_pages(hva_t addr, unsigned long order);

struct page* _cdecl pfn_to_page(hfn_t pfn);
hfn_t _cdecl page_to_pfn(struct page *page);
int _cdecl get_order(unsigned long size);

void* KeGetPageMemory(unsigned long size);
void KeFreePageMemory(void *ptr, unsigned long size);

/* winkvm special function */
struct page* _cdecl wk_alloc_page(unsigned long gfn, unsigned int flags);
void _cdecl wk_free_page(unsigned long gfn, struct page *page);

/* initailizer */
void init_slab_emulater(WINKVM_DEVICE_EXTENSION *extn);
void release_slab_emulater(WINKVM_DEVICE_EXTENSION *extn);

#endif
