
#ifndef _WINKVMTYPES_H_
#define _WINKVMTYPES_H_

#ifdef __WINKVM__

/* campatible header */

/* for IA32 only */
#include <linux/winkvmint.h>
#include <linux/winkvmlist.h>

#define KERN_EMERG      "<0>"   /* system is unusable                   */
#define KERN_ALERT      "<1>"   /* action must be taken immediately     */
#define KERN_CRIT       "<2>"   /* critical conditions                  */
#define KERN_ERR        "<3>"   /* error conditions                     */
#define KERN_WARNING    "<4>"   /* warning conditions                   */
#define KERN_NOTICE     "<5>"   /* normal but significant condition     */
#define KERN_INFO       "<6>"   /* informational                        */
#define KERN_DEBUG      "<7>"   /* debug-level messages                 */

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
	union {
		unsigned long private;
		void *__mapping;
	};	
	void *virtual;	
	unsigned long index;
	unsigned long mapping;	
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
	void *private_data;
	int fd;
	int r_flags;	
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

struct inode {
	int test;	
};

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

struct file_operations {
	struct module *owner;
	/*  loff_t (*llseek) (struct file *, loff_t, int); */
	/*  ssize_t (*read) (struct file *, char __user *, size_t, loff_t *); */
	/*  ssize_t (*write) (struct file *, const char __user *, size_t, loff_t *); */
	/*  ssize_t (*aio_read) (struct kiocb *, const struct iovec *, unsigned long, loff_t); */
	/*  ssize_t (*aio_write) (struct kiocb *, const struct iovec *, unsigned long, loff_t); */
	/*  int (*readdir) (struct file *, void *, filldir_t); */
	/*  unsigned int (*poll) (struct file *, struct poll_table_struct *); */
	int (*ioctl) (struct inode *, struct file *, unsigned int, unsigned long);
	long (*unlocked_ioctl) (struct file *, unsigned int, unsigned long);
	long (*compat_ioctl) (struct file *, unsigned int, unsigned long);	
	int (*mmap) (struct file *, struct vm_area_struct *);
	int (*open) (struct inode *, struct file *);
	/*  int (*flush) (struct file *, fl_owner_t id); */
	int (*release) (struct inode *, struct file *);	
	/*  int (*fsync) (struct file *, struct dentry *, int datasync); */
	/*  int (*aio_fsync) (struct kiocb *, int datasync); */
	/*  int (*fasync) (int, struct file *, int); */
	/*  int (*lock) (struct file *, int, struct file_lock *); */
	/*  ssize_t (*sendpage) (struct file *, struct page *, int, size_t, loff_t *, int); */
	/*  unsigned long (*get_unmapped_area)(struct file *, unsigned long, unsigned long, unsigned long, unsigned long); */
	/*  int (*check_flags)(int); */
	/*  int (*dir_notify)(struct file *filp, unsigned long arg); */
	/*  int (*flock) (struct file *, int, struct file_lock *); */
	/*  ssize_t (*splice_write)(struct pipe_inode_info *, struct file *, loff_t *, size_t, unsigned int); */
	/*  ssize_t (*splice_read)(struct file *, loff_t *, struct pipe_inode_info *, size_t, unsigned int); */
	/*  int (*setlease)(struct file *, long, struct file_lock **); */
	/*  int (*fgetattr)(struct file *, struct kstat *); */
	/*  int (*fsetattr)(struct file *, struct iattr *); */
};

struct vm_operations_struct {
	void (*open)(struct vm_area_struct * area);
	void (*close)(struct vm_area_struct * area);
/* 	int (*fault)(struct vm_area_struct *vma, struct vm_fault *vmf);	 */	
	struct page *(*nopage)(struct vm_area_struct *area,
			unsigned long address, int *type);
	unsigned long (*nopfn)(struct vm_area_struct *area,
			unsigned long address);	

	/* notification that a previously read-only page is about to become
	 * writable, if an error is returned it will cause a SIGBUS */
/* 	int (*page_mkwrite)(struct vm_area_struct *vma, struct page *page); */
/* #ifdef CONFIG_NUMA */
/* 	int (*set_policy)(struct vm_area_struct *vma, struct mempolicy *new); */
/* 	struct mempolicy *(*get_policy)(struct vm_area_struct *vma, */
/* 					unsigned long addr); */
/* 	int (*migrate)(struct vm_area_struct *vma, const nodemask_t *from, */
/* 		const nodemask_t *to, unsigned long flags); */
/* #endif */	
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
	int (*notifier_call)(struct notifier_block *, unsigned long, void *);	
	struct notifier_block *next;	
	int priority;
};

#endif /* __WINKVM__ */
#endif /* _WINKVMTYPES_H_ */
