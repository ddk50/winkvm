
#include "init.h"
#include "kernel.h"
#include "smp.h"

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
int _cdecl on_each_cpu(void (*func)(void *info), void *info, int retry, int wait)
{
	return 1;
}
*/

void init_smp_emulater(void)
{
	int i;

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

	return;
}

void _cdecl mutex_init(struct mutex *lock)
{
	int i;
	FAST_MUTEX *get_mutex = NULL;

	ASSERT(mutex_emulater_initialized);

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

	ASSERT(get_mutex != NULL);

	return;
}

void _cdecl mutex_lock(struct mutex *lock)
{
	FAST_MUTEX *mutex;
	ASSERT(lock->mutex_number < MAX_MUTEX_COUNT);
	ASSERT(mutex_slot[lock->mutex_number].used == 1);

	mutex = &mutex_slot[lock->mutex_number].mutex;

	ExAcquireFastMutex(mutex);
}

void _cdecl mutex_unlock(struct mutex *lock)
{
	FAST_MUTEX *mutex;
	ASSERT(lock->mutex_number < MAX_MUTEX_COUNT);
	ASSERT(mutex_slot[lock->mutex_number].used == 1);

	mutex = &mutex_slot[lock->mutex_number].mutex;

	ExReleaseFastMutex(mutex);
}

int _cdecl mutex_trylock(struct mutex *lock)
{
	FAST_MUTEX *mutex;
	ASSERT(lock->mutex_number < MAX_MUTEX_COUNT);
	ASSERT(mutex_slot[lock->mutex_number].used == 1);

	mutex = &mutex_slot[lock->mutex_number].mutex;
	if (ExTryToAcquireFastMutex(mutex))
		return 1;

	return 0;
}

void _cdecl spin_lock_init(spinlock_t *lock)
{
	int i;
	struct spinlock_emulater_slot *new_slot = NULL;

	ExAcquireFastMutex(&emulater_spinlock); 

	for (i = 0 ; i < MAX_SPINLOCK_COUNT ; i++) {
		if (!spinlock_slot[i].used) {
			new_slot = &spinlock_slot[lock->spinlock_number];			
			lock->spinlock_number = i;
			spinlock_slot[i].used = 1;

			RtlZeroMemory(new_slot, sizeof(struct spinlock_emulater_slot));
			break;
		}
	}

	ExReleaseFastMutex(&emulater_spinlock);
	ASSERT(new_slot);

	KeInitializeSpinLock(&new_slot->spinlock);
}

void _cdecl spin_lock(spinlock_t *lock)
{   
	struct spinlock_emulater_slot *slot = &spinlock_slot[lock->spinlock_number];
	ASSERT(!slot->used);
	KeAcquireSpinLock(&slot->spinlock, &slot->IrqL);
}

void _cdecl spin_unlock(spinlock_t *lock)
{
	struct spinlock_emulater_slot *slot = &spinlock_slot[lock->spinlock_number];
	ASSERT(!slot->used);
	KeReleaseSpinLock(&slot->spinlock, slot->IrqL);
}

void _cdecl prefetch(const void *x)
{

}

/*
int _cdecl smp_call_function(void (*func)(void *info), void *info, int retry, int wait)
{
	return 1;
}

int _cdecl smp_call_function_single(int cpuid, void (*func)(void *info), void *info,
									int retry, int wait)
{
	return 1;
}
*/

int _cdecl smp_call_function_single(int cpu, void (*func) (void *info), void *info,
									int nonatomic, int wait)
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

void _cdecl local_irq_enable(void)
{
	ASSERT(0);
	return;
}

void _cdecl local_irq_disable(void)
{
	ASSERT(0);
	return;
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

static int current_cpu = 0;

int _cdecl first_cpu(void)
{
	current_cpu = 0;
	return 1;
}

int _cdecl get_nr_cpus(void)
{
	KAFFINITY aps;
	return (int)(KeQueryActiveProcessorCountCompatible(&aps) - 1);
}

int _cdecl next_cpu(int cpu)
{
	return ++current_cpu;
}

int _cdecl raw_smp_processor_id(void)
{
	ASSERT(0);
	return 1;
}

int _cdecl get_cpu(void)
{
	ASSERT(0);
	return 1;
}

int _cdecl put_cpu(void)
{
	ASSERT(0);
	return 1;
}