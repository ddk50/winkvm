
#include <stdio.h>
#include <stdarg.h>

#include "init.h"
#include "kernel.h"

#define MAX_PRINT_BUFFER 1024

int _cdecl printk(const char *s, ...)
{
	va_list argList;
	char szMsg[MAX_PRINT_BUFFER];

	va_start(argList, s);
	vsprintf(szMsg, s, argList);

	va_end(argList);
	DbgPrint(szMsg);

	return 1;
}

void _cdecl test_call(int a, int b, int c)
{
	printk("---%d, %d, %d---\n", a, b, c);
	printk("---%d, %d, %d---\n", 1, 2, 3);

	return;
}

void _cdecl get_page(struct page *page)
{
	return;
}

void* _cdecl __va(unsigned long addr)
{
	return NULL;
}

unsigned long _cdecl __pa(unsigned long virt)
{
	return 0;
}

void* _cdecl virt_to_page(void *phys)
{
	return NULL;
}

int _cdecl pfn_valid(unsigned long pfn)
{
	return 1;
}

struct page* _cdecl pfn_to_page(unsigned long pfn)
{
	return NULL;
}

unsigned long _cdecl page_to_pfn(struct page *page)
{
	return 0;
}

int _cdecl remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
						   unsigned long pfn, unsigned long size, pgprot_t prot)
{
	return 0;
}