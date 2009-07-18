
#ifndef _WINKVMSTAB_H_
#define _WINKVMSTAB_H_

#ifdef __WINKVM__

#include <linux/winkvmtypes.h>
#include <linux/winkvmgfp.h>

#include <asm/msr-index.h>
#include <asm/errno.h>

#define KERN_EMERG      "<0>"   /* system is unusable                   */
#define KERN_ALERT      "<1>"   /* action must be taken immediately     */
#define KERN_CRIT       "<2>"   /* critical conditions                  */
#define KERN_ERR        "<3>"   /* error conditions                     */
#define KERN_WARNING    "<4>"   /* warning conditions                   */
#define KERN_NOTICE     "<5>"   /* normal but significant condition     */
#define KERN_INFO       "<6>"   /* informational                        */
#define KERN_DEBUG      "<7>"   /* debug-level messages                 */

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

#define module_init(x)
#define module_exit(x)

// extern void *wkstab_kmalloc(int, int);

// #define kmalloc(size, type)						\
// 	wkstab_kmalloc(size, type);

#define hrtimer_kallsyms_resolve() do {} while (0);

#define __ex(x) x"\n\t"

#define EXPORT_SYMBOL_GPL(x)
#define KVMTRACE_1D(a, b, c, d)
#define NR_CPUS (winkvmstab_get_nr_cpus())

/* remove this!! */
#ifndef _EFER_SVME
#define _EFER_SVME		12
#define EFER_SVME		(1<<_EFER_SVME)
#endif


/* remove this!! */
#define X86_SHADOW_INT_MOV_SS  1
#define X86_SHADOW_INT_STI     2

extern int printk(const char *s, ...);

extern int winkvmstab_first_cpu(void);
extern int winkvmstab_get_nr_cpus(void);
extern int winkvmstab_next_cpu(int cpu);

#define for_each_online_cpu(cpu) \
	for ((cpu) = winkvmstab_first_cpu();	\
		 (cpu) < winkvmstab_get_nr_cpus();	\
		 (cpu) = winkvmstab_next_cpu((cpu)))

#define for_each_possible_cpu(cpu) \
  for ((cpu) = winkvmstab_first_cpu(); \
	   (cpu) < winkvmstab_get_nr_cpus(); \	   
	   (cpu) = winkvmstab_next_cpu((cpu)))		

#define for_each_present_cpu(cpu) \	
	  for ((cpu) = winkvmstab_first_cpu(); \
		   (cpu) < winkvmstab_get_nr_cpus(); \
		   (cpu) = winkvmstab_next_cpu((cpu)))

#define on_each_cpu(func,info,retry,wait)		\
		({										\
		  local_irq_disable();					\
		  func(info);							\
		  local_irq_enable();					\
		  0;									\
		})	  
	
extern int raw_smp_processor_id(void);
extern int get_cpu(void);
extern int put_cpu(void);

extern void spin_lock(spinlock_t *lock);
extern void spin_unlock(spinlock_t *lock);

extern int cpu_to_node(int cpu);

int smp_call_function_single(int cpu, void (*func) (void *info), void *info,
							 int nonatomic, int wait);

#define dump_stack()
#define per_cpu(x, y) (g_##x##_[(y)])

/* temporary */
#define __WINKVM_CPUNUMS__ 4

// extern unsigned long
// winkvm_do_mmap(struct file *file, unsigned long addr,
// 			   unsigned long len, unsigned long prot,
// 			   unsigned long flag, unsigned long offset);

// /* not fastcall */
// extern void winkvm_free_page(unsigned long addr);
// extern void winkvm_free_pages(unsigned long addr, unsigned int order);
// extern void __winkvm_free_page(struct page* page);
// extern void __winkvm_free_pages(struct page* page, unsigned int order);
// extern struct page *winkvm_alloc_page(int gfp_mask);
// extern struct page *winkvm_alloc_pages(int gfp_mask, unsigned int order);
// extern struct page *winkvm_alloc_pages_node(int nid, int gfp_mask, unsigned int order);
// extern unsigned long __winkvm_get_free_pages(int gfp_mask, unsigned int order);

// extern int winkvm_init(void *opaque, unsigned int vcpu_size);
// extern void winkvm_exit(void);

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
extern unsigned long __pa(void *vaddr);

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

#endif /* __WINKVM__ */

#endif /* _WINKVMSTAB_H_ */
