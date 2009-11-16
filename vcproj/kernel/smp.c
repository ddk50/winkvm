/*
 * smp.c
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

#include "init.h"
#include "kernel.h"
#include "smp.h"

ULONG_PTR NTAPI smp_call_function_wrapper(IN ULONG_PTR Context);

#define MAX_MUTEX_COUNT    50
#define MAX_SPINLOCK_COUNT 50

unsigned long bad_page_address;

/* 
  FIXME!: 未使用Mutexがどんどんふえていくのでこの実装はまずい
  kvm側で使用しているmutexスロットを開放するようにプログラミングすること！
*/
struct mutex_emulater_slot {	
	int used;
	FAST_MUTEX mutex;	
} mutex_slot[MAX_MUTEX_COUNT];

/* 
  FIXME!: 未使用spinlockがどんどんふえていくのでこの実装はまずい
  kvm側で使用しているspinlockスロットを開放するようにプログラミングすること！
*/
struct spinlock_emulater_slot {
	int used;
	KIRQL IrqL;
	KSPIN_LOCK spinlock;	
} spinlock_slot[MAX_SPINLOCK_COUNT];

static int mutex_emulater_initialized = 0;
static FAST_MUTEX emulater_mutex;

static int spinlock_emulater_initialized = 0;
static FAST_MUTEX emulater_spinlock;

/*
 * for smp_call_function;
 * per cpu;
 */
struct smpf_data {
	void (_cdecl *func)(void *info);
	void *info;
	int mycpu_num;
} *smpf_data_slot = NULL;

void init_smp_emulater(void)
{
	int i;
	KAFFINITY aps;
	ULONG cpus = KeQueryActiveProcessorCountCompatible(&aps);

	if (!mutex_emulater_initialized) {
		for (i = 0 ; i < MAX_MUTEX_COUNT ; ++i) {
			mutex_slot[i].used = 0;
		}
	}

	if (!spinlock_emulater_initialized) {
		for (i = 0 ; i < MAX_SPINLOCK_COUNT ; ++i) {
			spinlock_slot[i].used = 0;
		}
	}

	if (!smpf_data_slot) {
		smpf_data_slot = ExAllocatePoolWithTag(NonPagedPool, 
			                                   sizeof(struct smpf_data) * cpus,
											   MEM_TAG);
		SAFE_ASSERT(smpf_data_slot);
		RtlZeroMemory(smpf_data_slot, sizeof(struct smpf_data) * cpus);
	}

	ExInitializeFastMutex(&emulater_mutex);
	ExInitializeFastMutex(&emulater_spinlock);

	mutex_emulater_initialized    = 1;
	spinlock_emulater_initialized = 1;

	/* for debug */
	printk(KERN_ERR "Number Processors: %d\n", get_nr_cpus());
}

void release_smp_emulater(void)
{	
	int i;

	if (mutex_emulater_initialized) {		
		for (i = 0 ; i < MAX_MUTEX_COUNT ; ++i)
			mutex_slot[i].used = 0;
	}

	if (spinlock_emulater_initialized) {
		for (i = 0 ; i < MAX_SPINLOCK_COUNT ; ++i) {
			spinlock_slot[i].used = 0;
		}
	}

	if (smpf_data_slot)
		ExFreePoolWithTag(smpf_data_slot, MEM_TAG);

	return;
}

void _cdecl mutex_init(struct mutex *lock)
{
	int i;
	FAST_MUTEX *get_mutex = NULL;

	FUNCTION_ENTER();

	SAFE_ASSERT(mutex_emulater_initialized);

	ExAcquireFastMutex(&emulater_mutex);

	for (i = 0 ; i < MAX_MUTEX_COUNT ; ++i) {
		if(!mutex_slot[i].used) {
			get_mutex = &mutex_slot[i].mutex;
			mutex_slot[i].used = 1;
			lock->mutex_number = i;
			break;
		}
	}

	ExReleaseFastMutex(&emulater_mutex);

	SAFE_ASSERT(get_mutex != NULL);
	ExInitializeFastMutex(get_mutex);

	FUNCTION_EXIT();

	return;
}

void _cdecl mutex_lock(struct mutex *lock)
{
	FAST_MUTEX *mutex;
	SAFE_ASSERT(lock->mutex_number < MAX_MUTEX_COUNT);
	SAFE_ASSERT(mutex_slot[lock->mutex_number].used);
	FUNCTION_ENTER();

	mutex = &(mutex_slot[lock->mutex_number].mutex);

	ExAcquireFastMutex(mutex);

	FUNCTION_EXIT();
}

void _cdecl mutex_unlock(struct mutex *lock)
{
	FAST_MUTEX *mutex;

	FUNCTION_ENTER();

	SAFE_ASSERT(lock->mutex_number < MAX_MUTEX_COUNT);
	SAFE_ASSERT(mutex_slot[lock->mutex_number].used);

	mutex = &(mutex_slot[lock->mutex_number].mutex);

	ExReleaseFastMutex(mutex);

	FUNCTION_EXIT();
}

int _cdecl mutex_trylock(struct mutex *lock)
{
	FAST_MUTEX *mutex;

	FUNCTION_ENTER();

	SAFE_ASSERT(lock->mutex_number < MAX_MUTEX_COUNT);
	SAFE_ASSERT(mutex_slot[lock->mutex_number].used == 1);

	mutex = &mutex_slot[lock->mutex_number].mutex;
	if (ExTryToAcquireFastMutex(mutex)) {
		FUNCTION_EXIT();
		return 1;
	}

	FUNCTION_EXIT();
	return 0;
}

void _cdecl spin_lock_init(spinlock_t *lock)
{
	int i;
	struct spinlock_emulater_slot *new_slot = NULL;

	FUNCTION_ENTER();

	ExAcquireFastMutex(&emulater_spinlock); 

	for (i = 0 ; i < MAX_SPINLOCK_COUNT ; i++) {
		if (!spinlock_slot[i].used) {
			new_slot = &spinlock_slot[lock->spinlock_number];			
			lock->spinlock_number = i;
			spinlock_slot[i].used = 1;
			break;
		}
	}

	ExReleaseFastMutex(&emulater_spinlock);
	SAFE_ASSERT(new_slot);

	KeInitializeSpinLock(&new_slot->spinlock);

	FUNCTION_EXIT();
}

void _cdecl spin_lock(spinlock_t *lock)
{   
	struct spinlock_emulater_slot *slot;
	FUNCTION_ENTER();
	SAFE_ASSERT(lock->spinlock_number < MAX_SPINLOCK_COUNT);   	
	slot = &spinlock_slot[lock->spinlock_number];
	SAFE_ASSERT(slot->used);
	KeAcquireSpinLock(&slot->spinlock, &slot->IrqL);
	FUNCTION_EXIT();
}

void _cdecl spin_unlock(spinlock_t *lock)
{
	struct spinlock_emulater_slot *slot;
	FUNCTION_ENTER();
	SAFE_ASSERT(lock->spinlock_number < MAX_SPINLOCK_COUNT);   
	slot = &spinlock_slot[lock->spinlock_number];
	SAFE_ASSERT(slot->used);
	KeReleaseSpinLock(&slot->spinlock, slot->IrqL);
	FUNCTION_EXIT();
}

void _cdecl prefetch(const void *x)
{

}

void _cdecl smp_wmb(void)
{
	KeMemoryBarrier();
}

void _cdecl smp_mb(void)
{
	KeMemoryBarrier();
}

void _cdecl local_irq_enable(void)
{
	__asm {sti};
}

void _cdecl local_irq_disable(void)
{
	__asm {cli};
}

static int current_cpu = 0;

int _cdecl first_cpu(void)
{
	current_cpu = 0;
	return current_cpu;
}

int _cdecl get_nr_cpus(void)
{
	KAFFINITY aps;
	return (int)KeQueryActiveProcessorCountCompatible(&aps);
}

int _cdecl next_cpu(int cpu)
{	
	return (cpu + 1);
}

int _cdecl raw_smp_processor_id(void)
{
	return (int)KeGetCurrentProcessorNumber();
}

int _cdecl get_cpu(void)
{
	/* FIXME: smp process */
	/* This function have to ensure preempt */
	raw_smp_processor_id();
	return 1;
}

int _cdecl put_cpu(void)
{
	/* FIXME: smp process */
	/* This function have to ensure preempt */
	raw_smp_processor_id();
	return 1;
}

ULONG_PTR NTAPI smp_call_function_wrapper(IN ULONG_PTR Context)
{
	struct smpf_data *smpf = (struct smpf_data*)Context;
	smpf->func(smpf->info);
	return (ULONG_PTR)&smpf->mycpu_num;
}

/**
 * smp_call_function(): Run a function on all other CPUs.
 * @func: The function to run. This must be fast and non-blocking.
 * @info: An arbitrary pointer to pass to the function.
 * @nonatomic: Unused.
 * @wait: If true, wait (atomically) until function has completed on other CPUs.
 *
 * Returns 0 on success, else a negative status code.
 *
 * If @wait is true, then returns once @func has returned; otherwise
 * it returns just before the target cpu calls @func.
 *
 * You must not call this function with disabled interrupts or from a
 * hardware interrupt handler or from a bottom half handler.
 */
int _cdecl smp_call_function(void (_cdecl *func)(void *info), void *info, int nonatomic,
							 int wait)
{
	/*
	int i;
	KAFFINITY aps;
	*/

	/* SAFE_ASSERT(smpf_data_slot); */
	/* FIX ME!! does not support SMP */	

	/* Hmm... XP does not support KeIpiGenericCall... */
	/*
	for (i = 0 ; i < KeQueryActiveProcessorCountCompatible(&aps) ; i++) {
		KeIpiGenericCall(smp_call_function_wrapper, (ULONG_PTR)&smpf_data_slot[i]);
	}
	*/

	local_irq_disable();
	func(info);
	local_irq_enable();

	return 0;
}

/**
 * smp_call_function_single - Run a function on a specific CPU
 * @cpu: The target CPU.  Cannot be the calling CPU.
 * @func: The function to run. This must be fast and non-blocking.
 * @info: An arbitrary pointer to pass to the function.
 * @nonatomic: Unused.
 * @wait: If true, wait until function has completed on other CPUs.
 *
 * Returns 0 on success, else a negative status code.
 *
 * If @wait is true, then returns once @func has returned; otherwise
 * it returns just before the target cpu calls @func.
 */
int _cdecl smp_call_function_single(int cpu, void (_cdecl *func)(void *info), void *info,
									int nonatomic, int wait)
{	
	return smp_call_function(func, info, nonatomic, wait);	
}

/*
 * Call a function on all processors
 * redirect the smp_call_function
 * @info:  An arbitrary pointer to pass to the function.
 * @wait:  If true, wait (atomically) until function has completed on other CPUs.
 * @retry: Unused???
 */
int _cdecl on_each_cpu(void (_cdecl *func)(void *info), void *info, int retry, int wait)
{
	return smp_call_function(func, info, retry, wait);	
}

