
#ifndef _SMP_H_
#define _SMP_H_

#include "type.h"

int _cdecl on_each_cpu(void (*func)(void *info), void *info, int retry, int wait);
int _cdecl smp_call_function(void (*func)(void *info), void *info, int retry, int wait);
int _cdecl smp_call_function_single(int cpuid, void (*func)(void *info), void *info, int retry, int wait);
int _cdecl raw_smp_processor_id(void);

void _cdecl smp_wmb(void);
void _cdecl smp_mb(void);

#endif
