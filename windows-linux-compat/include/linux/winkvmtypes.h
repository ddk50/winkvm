
#ifndef _WINKVMTYPES_H_
#define _WINKVMTYPES_H_

#ifdef __WINKVM__

#ifndef __user

/* campatible header */

/* for IA32 only */
#include <linux/winkvmint.h>
#include <linux/winkvmlist.h>
#include <linux/winwdm.h>
#include <linux/winkvm.h>

#define KERN_EMERG      "<0>"   /* system is unusable                   */
#define KERN_ALERT      "<1>"   /* action must be taken immediately     */
#define KERN_CRIT       "<2>"   /* critical conditions                  */
#define KERN_ERR        "<3>"   /* error conditions                     */
#define KERN_WARNING    "<4>"   /* warning conditions                   */
#define KERN_NOTICE     "<5>"   /* normal but significant condition     */
#define KERN_INFO       "<6>"   /* informational                        */
#define KERN_DEBUG      "<7>"   /* debug-level messages                 */

/* PAGE_SHIFT determines the page size */
#ifndef _MSC_VER
#define PAGE_SHIFT      12
#define PAGE_SIZE       (1UL << PAGE_SHIFT)
#define PAGE_MASK       (~(PAGE_SIZE-1))
#endif

#ifdef CONFIG_X86_32
# define BITS_PER_LONG 32
#else
# define BITS_PER_LONG 64
#endif

#define DIV_ROUND_UP(n,d)       (((n) + (d) - 1) / (d))
#define BIT(nr)                 (1UL << (nr))
#define BIT_MASK(nr)            (1UL << ((nr) % BITS_PER_LONG))
#define BIT_WORD(nr)            ((nr) / BITS_PER_LONG)
#define BITS_TO_LONGS(nr)       DIV_ROUND_UP(nr, BITS_PER_LONG)
#define BITS_PER_BYTE           8

#define DECLARE_BITMAP(name,bits) \
	unsigned long name[BITS_TO_LONGS(bits)]

#define ALIGN(x,a)		__ALIGN_MASK(x,(typeof(x))(a)-1)
#define __ALIGN_MASK(x,mask)	(((x)+(mask))&~(mask))
#define PTR_ALIGN(p, a)		((typeof(p))ALIGN((unsigned long)(p), (a)))
#define IS_ALIGNED(x,a)		(((x) % ((typeof(x))(a))) == 0)

#define inline      inline      __attribute__((always_inline))
#define __inline__  __inline__  __attribute__((always_inline))
#define __inline    __inline    __attribute__((always_inline))
//#define __deprecated            __attribute__((deprecated))
#define __packed            __attribute__((packed))

/* &a[0] degrades to a pointer: a different type from an array */
#define __must_be_array_w(a) (0)

#define ARRAY_SIZE(arr) \
	(sizeof(arr) / sizeof((arr)[0]) + __must_be_array_w(arr))
#define __user

struct i387_fxsave_struct {
	unsigned short  cwd;
	unsigned short  swd;
	unsigned short  twd;
	unsigned short  fop;
	long    fip;	
	long    fcs;
	long    foo;
	long    fos;
	long    mxcsr;
	long    mxcsr_mask;
	long    st_space[32];   /* 8*16 bytes for each FP-reg = 128 bytes */
	long    xmm_space[32];  /* 8*16 bytes for each XMM-reg = 128 bytes */
	long    padding[56];
} __attribute__ ((aligned (16)));

typedef struct { unsigned long long pgprot; } pgprot_t;

struct __wait_queue_head {	
	spinlock_t lock;  
	struct list_head task_list;	
};

typedef struct __wait_queue_head wait_queue_head_t;
typedef unsigned long sigset_t;

struct rw_semaphore {
	signed long count;	
};

struct hrtimer {
	int test;   
};

typedef struct {
	int test;	
} atomic_t;


struct vm_area_struct {
	unsigned long vm_pgoff;
	unsigned long vm_start;
	unsigned long vm_end;
	pgprot_t vm_page_prot;
	struct mm_struct *vm_mm;
	struct file *vm_file;
	void *vm_private_data;	
	int vm_flags;
	void *vm_ops;
};

struct miscdevice  {	
	int minor;
	const char *name;
	const struct file_operations *fops;
/* 	struct list_head list; */
/* 	struct device *parent; */
/* 	struct device *this_device;	 */	
};

struct notifier_block {
	int (__cdecl *notifier_call)(struct notifier_block *, unsigned long, void *);  
	struct notifier_block *next;	
	int priority;
};

#endif /* __user */

#endif /* __WINKVM__ */
#endif /* _WINKVMTYPES_H_ */
