
#include <stdio.h>
#include <stdarg.h>

#include "kernel.h"

#include <linux/winkvm.h>

#define MAX_PRINT_BUFFER 1024

#define  PAU64(x)      \
	((__u64)((x)->u.HighPart) << 32) | ((x)->u.LowPart)

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

hpa_t get_phys(PHYSICAL_ADDRESS *addr)
{
	return (unsigned long)(PAU64(addr));
}

void* _cdecl __va(unsigned long addr)
{	
	return (void*)addr;
}

unsigned long _cdecl __pa(hva_t virt)
{
	PHYSICAL_ADDRESS paddr;
	paddr = MmGetPhysicalAddress((PVOID)virt);
	return PAU64(&paddr);
}

int _cdecl pfn_valid(unsigned long pfn)
{
	SAFE_ASSERT(0);
	return 1;
}

void _cdecl fput(struct file *file)
{
	SAFE_ASSERT(0);		
}

int _cdecl cpu_to_node(int cpu)
{
	return cpu;
}

ULONG KeQueryActiveProcessorCountCompatible(OUT PKAFFINITY ActiveProcessors)
{	
#if (NTDDI_VERSION >= NTDDI_VISTA)
	/* return KeQueryActiveProcessorCount(ActiveProcessors); */
	return KeNumberProcessors;
#else
	ULONG NumberOfProcessors = 0;
	KAFFINITY Affinity = KeQueryActiveProcessors();

	if (ActiveProcessors) {
		*ActiveProcessors = Affinity;
	}

	for (; Affinity; Affinity >>= 1){
		if (Affinity & 1) {
			NumberOfProcessors++;
		}
	}
	return NumberOfProcessors;
#endif
}
