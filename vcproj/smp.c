
#include "init.h"
#include "smp.h"

int _cdecl on_each_cpu(void (*func)(void *info), void *info, int retry, int wait)
{
	return 1;
}

int _cdecl raw_smp_processor_id(void)
{
	return 1;
}

int _cdecl smp_call_function(void (*func)(void *info), void *info, int retry, int wait)
{
	return 1;
}

int _cdecl smp_call_function_single(int cpuid, void (*func)(void *info), void *info,
									int retry, int wait)
{
	return 1;
}

void _cdecl smp_wmb(void)
{
	KeMemoryBarrier();
	return;
}

void _cdecl smp_mb(void)
{
	KeMemoryBarrier();
	return;
}
