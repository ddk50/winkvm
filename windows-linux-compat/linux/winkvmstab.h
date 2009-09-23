
#ifndef _WINKVMSTAB_H_
#define _WINKVMSTAB_H_

#ifdef __WINKVM__

#include <linux/winkvmtypes.h>
#include <linux/winkvmgfp.h>

#include <asm/msr-index.h>
#include <asm/errno.h>

#define BUG(x) do { } while(0);
#define BUG_ON(x) \
	do { \
		if (x) {								\
			printk("assert: %s", __FUNCTION__); \
		}										\
	} while(0);

#define THIS_MODULE NULL
#define MODULE_INFO(ver, verstr);
#define MODULE_AUTHOR(author);
#define MODULE_LICENSE(form);

#define __init
#define __exit

#define asmlinkage __attribute__((regparm(0)))

#define module_init(x)
#define module_exit(x)

#define hrtimer_kallsyms_resolve() do {} while (0);

#define __ex(x) x"\n\t"

#define EXPORT_SYMBOL_GPL(x)
#define KVMTRACE_1D(a, b, c, d)
#define NR_CPUS (get_nr_cpus())

/* remove this!! */
#ifndef _EFER_SVME
#define _EFER_SVME		12
#define EFER_SVME		(1<<_EFER_SVME)
#endif

/* remove this!! */
#define X86_SHADOW_INT_MOV_SS  1
#define X86_SHADOW_INT_STI     2

extern int printk(const char *s, ...);

extern int first_cpu(void);
extern int get_nr_cpus(void);
extern int next_cpu(int cpu);

#define for_each_online_cpu(cpu)				\
	for ((cpu) = first_cpu();					\
		 (cpu) < get_nr_cpus();					\
		 (cpu) = next_cpu((cpu)))

#define for_each_possible_cpu(cpu)				\
    for ((cpu) = first_cpu();					\
		 (cpu) < get_nr_cpus();					\
		 (cpu) = next_cpu((cpu)))

#define for_each_present_cpu(cpu) \
	for ((cpu) = first_cpu();	  \
		 (cpu) < get_nr_cpus();	  \
		 (cpu) = next_cpu((cpu)))

extern int raw_smp_processor_id(void);
extern int get_cpu(void);
extern int put_cpu(void);

extern void spin_lock_init(spinlock_t *lock);
extern void spin_lock(spinlock_t *lock);
extern void spin_unlock(spinlock_t *lock);

extern int cpu_to_node(int cpu);

extern int smp_call_function(void (*func)(void *info), void *info, int nonatomic,
							 int wait);

extern int smp_call_function_single(int cpu, void (*func) (void *info), void *info,
									int nonatomic, int wait);

extern int on_each_cpu(void (*func)(void *info), void *info, int retry, int wait);

#define dump_stack()
#define per_cpu(x, y) (g_##x##_[(y)])

extern void mutex_init(struct mutex *lock);
extern void mutex_lock(struct mutex *lock);
extern void mutex_unlock(struct mutex *lock);
extern int mutex_trylock(struct mutex *lock);

extern int copy_to_user(void *to, const void *from, int n);
extern int copy_from_user(void *to, const void *from, int n);

extern void get_page(struct page *page);

/* temporary */
#define __WINKVM_CPUNUMS__ 1

/*
 * Error return values for the *_nopage functions 
 */
#define NOPAGE_SIGBUS	(NULL)
#define NOPAGE_OOM	((struct page *) (-1))

/*
 * Error return values for the *_nopfn functions
 */
#define NOPFN_SIGBUS	((unsigned long) -1)
#define NOPFN_OOM	((unsigned long) -2)
#define NOPFN_REFAULT	((unsigned long) -3)

/*
 * Different kinds of faults, as returned by handle_mm_fault().
 * Used to decide whether a process gets delivered SIGBUS or
 * just gets major/minor fault counters bumped up.
 */

#define VM_FAULT_MINOR	0 /* For backwards compat. Remove me quickly. */

#define VM_FAULT_OOM	0x0001
#define VM_FAULT_SIGBUS	0x0002
#define VM_FAULT_MAJOR	0x0004
#define VM_FAULT_WRITE	0x0008	/* Special case for get_user_pages */

#define VM_FAULT_NOPAGE	0x0100	/* ->fault installed the pte, not return page */
#define VM_FAULT_LOCKED	0x0200	/* ->fault locked the returned page */

#define VM_FAULT_ERROR	(VM_FAULT_OOM | VM_FAULT_SIGBUS)

/* notifier.h */

#define SYS_DOWN	0x0001	/* Notify of system down */
#define SYS_RESTART	SYS_DOWN
#define SYS_HALT	0x0002	/* Notify of system halt */
#define SYS_POWER_OFF	0x0003	/* Notify of system power off */


#define NOTIFY_DONE		0x0000		/* Don't care */
#define NOTIFY_OK		0x0001		/* Suits me */
#define NOTIFY_STOP_MASK	0x8000		/* Don't call further */
#define NOTIFY_BAD		(NOTIFY_STOP_MASK|0x0002)
						/* Bad/Veto action */
/*
 * Clean way to return from the notifier and stop further calls.
 */
#define NOTIFY_STOP		(NOTIFY_OK|NOTIFY_STOP_MASK)

#define CPU_ONLINE		0x0002 /* CPU (unsigned)v is up */
#define CPU_UP_PREPARE		0x0003 /* CPU (unsigned)v coming up */
#define CPU_UP_CANCELED		0x0004 /* CPU (unsigned)v NOT coming up */
#define CPU_DOWN_PREPARE	0x0005 /* CPU (unsigned)v going down */
#define CPU_DOWN_FAILED		0x0006 /* CPU (unsigned)v NOT going down */
#define CPU_DEAD		0x0007 /* CPU (unsigned)v dead */
#define CPU_LOCK_ACQUIRE	0x0008 /* Acquire all hotcpu locks */
#define CPU_LOCK_RELEASE	0x0009 /* Release all hotcpu locks */
#define CPU_DYING		0x000A /* CPU (unsigned)v not running any task,
				        * not handling interrupts, soon dead */

/* Used for CPU hotplug events occuring while tasks are frozen due to a suspend
 * operation in progress
 */
#define CPU_TASKS_FROZEN	0x0010

#define CPU_ONLINE_FROZEN	(CPU_ONLINE | CPU_TASKS_FROZEN)
#define CPU_UP_PREPARE_FROZEN	(CPU_UP_PREPARE | CPU_TASKS_FROZEN)
#define CPU_UP_CANCELED_FROZEN	(CPU_UP_CANCELED | CPU_TASKS_FROZEN)
#define CPU_DOWN_PREPARE_FROZEN	(CPU_DOWN_PREPARE | CPU_TASKS_FROZEN)
#define CPU_DOWN_FAILED_FROZEN	(CPU_DOWN_FAILED | CPU_TASKS_FROZEN)
#define CPU_DEAD_FROZEN		(CPU_DEAD | CPU_TASKS_FROZEN)
#define CPU_DYING_FROZEN	(CPU_DYING | CPU_TASKS_FROZEN)

/* end notifier.h */

extern void fput(struct file *file);
extern void iput(struct inode *inode);

extern void *kmap(struct page *page);
extern void kunmap(struct page *page);
extern void *kmap_atomic_prot(struct page *page, enum km_type type, pgprot_t prot);
extern void *kmap_atomic(struct page *page, enum km_type type);
extern void kunmap_atomic(void *kvaddr, enum km_type type);
extern void *kmap_atomic_pfn(unsigned long pfn, enum km_type type);
extern struct page *kmap_atomic_to_page(void *ptr);

extern struct page *pfn_to_page(unsigned long pfn);
extern unsigned long page_to_pfn(struct page *page);

extern int get_order(unsigned long size);

extern struct page *alloc_pages(unsigned int flags, unsigned int order);
extern struct page *alloc_page(unsigned int flags);

extern struct page *alloc_pages_node(int nid, unsigned int gfp_mask,									 
									 unsigned int order);

extern void __free_page(struct page *page);
extern void __free_pages(struct page *page, unsigned int order);

extern void free_page(unsigned long addr);
extern void free_pages(unsigned long addr, unsigned long order);

extern void *vmalloc(unsigned long size);
extern void vfree(void *addr);

extern void *kmalloc(size_t size, int flags);
extern void *kzalloc(size_t size, int flags);
extern void kfree(void *obj);

extern void *page_address(struct page *page);
extern u64 __pa(void *vaddr);
extern void *__va(unsigned long paddr);

/* X86 only */
#define PAGE_SHIFT	12
#define PAGE_SIZE	(1UL << PAGE_SHIFT)
#define PAGE_MASK	(~(PAGE_SIZE-1))

#define LARGE_PAGE_MASK (~(LARGE_PAGE_SIZE-1))
#define LARGE_PAGE_SIZE (1UL << PMD_SHIFT)
#define PAGE_ALIGN(addr)	(((addr)+PAGE_SIZE-1)&PAGE_MASK)

#define offset_in_page(p)	((unsigned long)(p) & ~PAGE_MASK)

static inline unsigned long virt_to_phys(void *address)  
{
	return __pa(address);	
}

extern void local_irq_enable(void);
extern void local_irq_disable(void);

#define page_private(page)		((page)->private)
#define set_page_private(page, v)	((page)->private = (v))

static inline void account_system_vtime(struct task_struct *tsk)
{
}

extern struct file *get_empty_filp(void);
extern struct inode *new_inode(void);
extern int get_unused_fd(void);
extern void fd_install(unsigned int fd, struct file *file);

#ifdef CONFIG_SMP
#ifndef __WINKVM__			  
#define LOCK_PREFIX								\
	".section .smp_locks,\"a\"\n"				\
	"  .align 4\n"								\
	"  .long 661f\n" /* address */				\
	".previous\n"								\
	"661:\n\tlock; "
#else
#define LOCK_PREFIX								\
	"  .align 4\n"								\
	"  .long 661f\n" /* address */				\
	"661:\n\tlock; "
#endif			  
#else /* ! CONFIG_SMP */
#define LOCK_PREFIX ""
#endif

#define ADDR (*(volatile long *)addr)

static inline void set_bit(int nr, volatile unsigned long *addr)	
{	
	__asm__ __volatile__(LOCK_PREFIX
						 "btsl %1,%0"
						 :"+m" (ADDR)
						 :"Ir" (nr));	
}

static inline void __set_bit(int nr, volatile unsigned long *addr)	
{	
	__asm__("btsl %1,%0"
			:"+m" (ADDR)
			:"Ir" (nr));	
}

static inline int test_bit(int nr, const void *addr)	
{	
	u8 v;
	const u32 *p = (const u32 *)addr;

	asm("btl %2,%1; setc %0" : "=qm" (v) : "m" (*p), "Ir" (nr));
	return v;	
}

#ifndef min
#define min(x,y) ((x) < (y) ? x : y)
#endif


/*
 * Kernel pointers have redundant information, so we can use a
 * scheme where we can return either an error code or a dentry
 * pointer with the same return value.
 *
 * This should be a per-architecture thing, to allow different
 * error and pointer decisions.
 */
#define MAX_ERRNO	4095
#define IS_ERR_VALUE(x) ((x) >= (unsigned long)-MAX_ERRNO)

static inline void *ERR_PTR(long error)
{
	printk(KERN_ALERT "%s\n", __FUNCTION__);	
	return (void *)error;	
}

static inline long PTR_ERR(const void *ptr)
{
	printk(KERN_ALERT "%s\n", __FUNCTION__);	
	return (long)ptr;	
}

static inline long IS_ERR(const void *ptr)
{
	printk(KERN_ALERT "%s\n", __FUNCTION__);	
	return IS_ERR_VALUE((unsigned long)ptr);	
}

/* for DEBUG */
#define FUNCTION_ENTER()       printk(KERN_ALERT " --> %s\n", __FUNCTION__)
#define FUNCTION_EXIT()        printk(KERN_ALERT " <-- %s\n", __FUNCTION__)

#endif /* __WINKVM__ */

#endif /* _WINKVMSTAB_H_ */
