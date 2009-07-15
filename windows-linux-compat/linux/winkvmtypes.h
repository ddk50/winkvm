
#ifndef _WINKVMTYPES_H_
#define _WINKVMTYPES_H_

#ifdef __WINKVM__

/* campatible header */

/* for IA32 only */
#include <linux/winkvmint.h>
#include <linux/winkvmlist.h>

/* PAGE_SHIFT determines the page size */
#define PAGE_SHIFT      12
#define PAGE_SIZE       (1UL << PAGE_SHIFT)
#define PAGE_MASK       (~(PAGE_SIZE-1))

#ifdef CONFIG_X86_32
# define BITS_PER_LONG 32
#else
# define BITS_PER_LONG 64
#endif

typedef int bool;

#define DIV_ROUND_UP(n,d)       (((n) + (d) - 1) / (d))
#define BIT(nr)                 (1UL << (nr))
#define BIT_MASK(nr)            (1UL << ((nr) % BITS_PER_LONG))
#define BIT_WORD(nr)            ((nr) / BITS_PER_LONG)
#define BITS_TO_LONGS(nr)       DIV_ROUND_UP(nr, BITS_PER_LONG)
#define BITS_PER_BYTE           8

#define DECLARE_BITMAP(name,bits) \
	unsigned long name[BITS_TO_LONGS(bits)]

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

enum km_type {
	KM_BOUNCE_READ = 0,
	KM_SKB_SUNRPC_DATA,
	KM_SKB_DATA_SOFTIRQ,
	KM_USER0,
	KM_USER1,
	KM_BIO_SRC_IRQ,
	KM_BIO_DST_IRQ,
	KM_PTE0,
	KM_PTE1,
	KM_IRQ0,
	KM_IRQ1,
	KM_SOFTIRQ0,
	KM_SOFTIRQ1,
	KM_TYPE_NR  
};

struct page {
	void *private;	
	int test; 
};

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

typedef struct {
	unsigned int magic;  
} spinlock_t;

struct file {
	int fd;  
};

struct mutex {	
	int test;	
};

struct __wait_queue_head {	
	spinlock_t lock;	
	struct list_head task_list;
};

typedef struct __wait_queue_head wait_queue_head_t;
typedef unsigned long sigset_t;

struct rw_semaphore {
	signed long		count;
};

struct module {
	void *__module;	
};

struct task_struct {
	int __test;	
};

struct hrtimer {
	int test;   
};

typedef struct {
	int test;
} atomic_t;

#endif /* __WINKVM__ */
#endif /* _WINKVMTYPES_H_ */
