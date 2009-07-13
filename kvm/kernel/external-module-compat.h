
/*
 * Compatibility header for building as an external module.
 */

/*
 * Avoid picking up the kernel's kvm.h in case we have a newer one.
 */

#include <linux/compiler.h>
#include <linux/version.h>
#include "include/linux/kvm.h"
#include <linux/cpu.h>

/*
 * 2.6.16 does not have GFP_NOWAIT
 */

#include <linux/gfp.h>

#ifndef GFP_NOWAIT
#define GFP_NOWAIT (GFP_ATOMIC & ~__GFP_HIGH)
#endif


/*
 * kvm profiling support needs 2.6.20
 */
#include <linux/profile.h>

#ifndef KVM_PROFILING
#define KVM_PROFILING 1234
#define prof_on       4321
#endif

/*
 * smp_call_function_single() is not exported below 2.6.20
 */
#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,20)

#include <linux/spinlock.h>
#include <linux/smp.h>

static spinlock_t scfs_lock = SPIN_LOCK_UNLOCKED;
static int scfs_cpu;
static void (*scfs_func)(void *info);

static void scfs_thunk(void *info)
{
	if (raw_smp_processor_id() == scfs_cpu)
		scfs_func(info);
}

static inline int smp_call_function_single1(int cpu, void (*func)(void *info),
					   void *info, int nonatomic, int wait)
{
	int r;

	spin_lock(&scfs_lock);
	scfs_cpu = cpu;
	scfs_func = func;
	r = smp_call_function(scfs_thunk, info, nonatomic, wait);
	spin_unlock(&scfs_lock);
	return r;
}

#define smp_call_function_single smp_call_function_single1

#endif

/*
 * The cpu hotplug stubs are broken if !CONFIG_CPU_HOTPLUG
 */

#if LINUX_VERSION_CODE <= KERNEL_VERSION(2,6,15)
#define DEFINE_MUTEX(a) DECLARE_MUTEX(a)
#define mutex_lock_interruptible(a) down_interruptible(a)
#define mutex_unlock(a) up(a)
#define mutex_lock(a) down(a)
#define mutex_init(a) init_MUTEX(a)
#define mutex_trylock(a) down_trylock(a)
#define mutex semaphore
#endif

#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,14)
#ifndef kzalloc
#define kzalloc(size,flags)			\
({						\
	void *__ret = kmalloc(size, flags);	\
	if (__ret)
		memset(__ret, 0, size);
	__ret;
})
#endif
#endif

#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,21)

#ifndef CONFIG_HOTPLUG_CPU
#define register_cpu_notifier(nb) (0)
#endif

#endif

/*
 * get_sb() callback changed.
 */
#if LINUX_VERSION_CODE <= KERNEL_VERSION(2,6,16)

static struct super_block *kvmfs_get_sb(struct file_system_type *fs_type,
					int flags, const char *dev_name,
					void *data)
{
	return get_sb_pseudo(fs_type, "kvm:", NULL, KVMFS_MAGIC);
}

#endif

#include <linux/magic.h>
#ifndef KVMFS_SUPER_MAGIC
#define KVMFS_SUPER_MAGIC 0x19700426
#endif

#include <linux/miscdevice.h>
#ifndef KVM_MINOR
#define KVM_MINOR 232
#endif
