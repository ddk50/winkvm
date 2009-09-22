
#ifndef _SMP_H_
#define _SMP_H_

#include <linux/winkvm.h>
#include <linux/winkvmint.h>
#include <linux/winkvmgfp.h>

void init_smp_emulater(void);
void release_smp_emulater(void);

void _cdecl mutex_init(struct mutex *lock);
void _cdecl mutex_lock(struct mutex *lock);
void _cdecl mutex_unlock(struct mutex *lock);
int _cdecl mutex_trylock(struct mutex *lock);

void _cdecl spin_lock_init(spinlock_t *lock);
void _cdecl spin_lock(spinlock_t *lock);
void _cdecl spin_unlock(spinlock_t *lock);

/* there functions are implemented as macro */
int _cdecl on_each_cpu(void (_cdecl *func)(void *info), void *info, int retry, int wait);
int _cdecl smp_call_function(void (_cdecl *func)(void *info), void *info, int retry, int wait);
int _cdecl smp_call_function_single(int cpu, void (_cdecl *func)(void *info), void *info,
									int nonatomic, int wait);

int _cdecl raw_smp_processor_id(void);
void _cdecl prefetch(const void *x);

void _cdecl smp_wmb(void);
void _cdecl smp_mb(void);

int _cdecl first_cpu(void);
int _cdecl get_nr_cpus(void);
int _cdecl next_cpu(int cpu);

#endif
