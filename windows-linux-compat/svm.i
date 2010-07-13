# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c"
# 1 "/cygdrive/z/winkvm/windows-linux-compat//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./include/linux/autoconf.h" 1
# 1 "<command-line>" 2
# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c"
# 25 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c"
# 1 "include/asm/msr-index.h" 1
# 26 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c" 2
# 1 "include/asm/processor-flags.h" 1
# 27 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c" 2


# 1 "include/linux/winkvmstab.h" 1






# 1 "include/linux/winkvmtypes.h" 1
# 12 "include/linux/winkvmtypes.h"
# 1 "include/linux/winkvmint.h" 1







typedef signed char __s8;
typedef unsigned char __u8;

typedef signed short __s16;
typedef unsigned short __u16;

typedef signed int __s32;
typedef unsigned int __u32;






typedef signed long long __s64;
typedef unsigned long long __u64;


typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef __u64 u64;

typedef __s8 s8;
typedef __s16 s16;
typedef __s32 s32;
typedef __s64 s64;


typedef signed char int8_t;
typedef short int int16_t;
typedef int int32_t;




typedef long long int int64_t;



typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;
typedef unsigned int uint32_t;




typedef unsigned long long int uint64_t;


typedef unsigned int size_t;

typedef int bool;
# 13 "include/linux/winkvmtypes.h" 2
# 1 "include/linux/winkvmlist.h" 1




# 1 "include/linux/stddef.h" 1



# 1 "include/linux/compiler.h" 1
# 40 "include/linux/compiler.h"
# 1 "include/linux/compiler-gcc4.h" 1





# 1 "include/linux/compiler-gcc.h" 1
# 7 "include/linux/compiler-gcc4.h" 2
# 41 "include/linux/compiler.h" 2
# 5 "include/linux/stddef.h" 2
# 15 "include/linux/stddef.h"
enum {
 false = 0,
 true = 1
};
# 6 "include/linux/winkvmlist.h" 2
# 1 "include/linux/poison.h" 1
# 7 "include/linux/winkvmlist.h" 2





extern void smp_wmb(void);
extern void smp_mb(void);
extern void prefetch(const void *x);
# 26 "include/linux/winkvmlist.h"
struct list_head {
 struct list_head *next, *prev;
};






static inline __attribute__((always_inline)) void INIT_LIST_HEAD(struct list_head *list)
{
 list->next = list;
 list->prev = list;
}
# 48 "include/linux/winkvmlist.h"
static inline __attribute__((always_inline)) void __list_add(struct list_head *new,
         struct list_head *prev,
         struct list_head *next)
{
 next->prev = new;
 new->next = next;
 new->prev = prev;
 prev->next = new;
}
# 72 "include/linux/winkvmlist.h"
static inline __attribute__((always_inline)) void list_add(struct list_head *new, struct list_head *head)
{
 __list_add(new, head, head->next);
}
# 89 "include/linux/winkvmlist.h"
static inline __attribute__((always_inline)) void list_add_tail(struct list_head *new, struct list_head *head)
{
 __list_add(new, head->prev, head);
}







static inline __attribute__((always_inline)) void __list_add_rcu(struct list_head * new,
  struct list_head * prev, struct list_head * next)
{
 new->next = next;
 new->prev = prev;
 smp_wmb();
 next->prev = new;
 prev->next = new;
}
# 126 "include/linux/winkvmlist.h"
static inline __attribute__((always_inline)) void list_add_rcu(struct list_head *new, struct list_head *head)
{
 __list_add_rcu(new, head, head->next);
}
# 147 "include/linux/winkvmlist.h"
static inline __attribute__((always_inline)) void list_add_tail_rcu(struct list_head *new,
     struct list_head *head)
{
 __list_add_rcu(new, head->prev, head);
}
# 160 "include/linux/winkvmlist.h"
static inline __attribute__((always_inline)) void __list_del(struct list_head * prev, struct list_head * next)
{
 next->prev = prev;
 prev->next = next;
}
# 173 "include/linux/winkvmlist.h"
static inline __attribute__((always_inline)) void list_del(struct list_head *entry)
{
 __list_del(entry->prev, entry->next);
 entry->next = ((void *) 0x00100100);
 entry->prev = ((void *) 0x00200200);
}
# 207 "include/linux/winkvmlist.h"
static inline __attribute__((always_inline)) void list_del_rcu(struct list_head *entry)
{
 __list_del(entry->prev, entry->next);
 entry->prev = ((void *) 0x00200200);
}
# 220 "include/linux/winkvmlist.h"
static inline __attribute__((always_inline)) void list_replace(struct list_head *old,
    struct list_head *new)
{
 new->next = old->next;
 new->next->prev = new;
 new->prev = old->prev;
 new->prev->next = new;
}

static inline __attribute__((always_inline)) void list_replace_init(struct list_head *old,
     struct list_head *new)
{
 list_replace(old, new);
 INIT_LIST_HEAD(old);
}
# 244 "include/linux/winkvmlist.h"
static inline __attribute__((always_inline)) void list_replace_rcu(struct list_head *old,
    struct list_head *new)
{
 new->next = old->next;
 new->prev = old->prev;
 smp_wmb();
 new->next->prev = new;
 new->prev->next = new;
 old->prev = ((void *) 0x00200200);
}





static inline __attribute__((always_inline)) void list_del_init(struct list_head *entry)
{
 __list_del(entry->prev, entry->next);
 INIT_LIST_HEAD(entry);
}






static inline __attribute__((always_inline)) void list_move(struct list_head *list, struct list_head *head)
{
 __list_del(list->prev, list->next);
 list_add(list, head);
}






static inline __attribute__((always_inline)) void list_move_tail(struct list_head *list,
      struct list_head *head)
{
 __list_del(list->prev, list->next);
 list_add_tail(list, head);
}






static inline __attribute__((always_inline)) int list_is_last(const struct list_head *list,
    const struct list_head *head)
{
 return list->next == head;
}





static inline __attribute__((always_inline)) int list_empty(const struct list_head *head)
{
 return head->next == head;
}
# 321 "include/linux/winkvmlist.h"
static inline __attribute__((always_inline)) int list_empty_careful(const struct list_head *head)
{
 struct list_head *next = head->next;
 return (next == head) && (next == head->prev);
}

static inline __attribute__((always_inline)) void __list_splice(struct list_head *list,
     struct list_head *head)
{
 struct list_head *first = list->next;
 struct list_head *last = list->prev;
 struct list_head *at = head->next;

 first->prev = head;
 head->next = first;

 last->next = at;
 at->prev = last;
}






static inline __attribute__((always_inline)) void list_splice(struct list_head *list, struct list_head *head)
{
 if (!list_empty(list))
  __list_splice(list, head);
}
# 359 "include/linux/winkvmlist.h"
static inline __attribute__((always_inline)) void list_splice_init(struct list_head *list,
        struct list_head *head)
{
 if (!list_empty(list)) {
  __list_splice(list, head);
  INIT_LIST_HEAD(list);
 }
}
# 385 "include/linux/winkvmlist.h"
static inline __attribute__((always_inline)) void list_splice_init_rcu(struct list_head *list,
     struct list_head *head,
     void (*sync)(void))
{
 struct list_head *first = list->next;
 struct list_head *last = list->prev;
 struct list_head *at = head->next;

 if (list_empty(head))
  return;



 INIT_LIST_HEAD(list);
# 407 "include/linux/winkvmlist.h"
 sync();
# 417 "include/linux/winkvmlist.h"
 last->next = at;
 smp_wmb();
 head->next = first;
 first->prev = head;
 at->prev = last;
}
# 705 "include/linux/winkvmlist.h"
struct hlist_head {
 struct hlist_node *first;
};

struct hlist_node {
 struct hlist_node *next, **pprev;
};




static inline __attribute__((always_inline)) void INIT_HLIST_NODE(struct hlist_node *h)
{
 h->next = ((void *)0);
 h->pprev = ((void *)0);
}

static inline __attribute__((always_inline)) int hlist_unhashed(const struct hlist_node *h)
{
 return !h->pprev;
}

static inline __attribute__((always_inline)) int hlist_empty(const struct hlist_head *h)
{
 return !h->first;
}

static inline __attribute__((always_inline)) void __hlist_del(struct hlist_node *n)
{
 struct hlist_node *next = n->next;
 struct hlist_node **pprev = n->pprev;
 *pprev = next;
 if (next)
  next->pprev = pprev;
}

static inline __attribute__((always_inline)) void hlist_del(struct hlist_node *n)
{
 __hlist_del(n);
 n->next = ((void *) 0x00100100);
 n->pprev = ((void *) 0x00200200);
}
# 767 "include/linux/winkvmlist.h"
static inline __attribute__((always_inline)) void hlist_del_rcu(struct hlist_node *n)
{
 __hlist_del(n);
 n->pprev = ((void *) 0x00200200);
}

static inline __attribute__((always_inline)) void hlist_del_init(struct hlist_node *n)
{
 if (!hlist_unhashed(n)) {
  __hlist_del(n);
  INIT_HLIST_NODE(n);
 }
}
# 788 "include/linux/winkvmlist.h"
static inline __attribute__((always_inline)) void hlist_replace_rcu(struct hlist_node *old,
     struct hlist_node *new)
{
 struct hlist_node *next = old->next;

 new->next = next;
 new->pprev = old->pprev;
 smp_wmb();
 if (next)
  new->next->pprev = &new->next;
 *new->pprev = new;
 old->pprev = ((void *) 0x00200200);
}

static inline __attribute__((always_inline)) void hlist_add_head(struct hlist_node *n, struct hlist_head *h)
{
 struct hlist_node *first = h->first;
 n->next = first;
 if (first)
  first->pprev = &n->next;
 h->first = n;
 n->pprev = &h->first;
}
# 832 "include/linux/winkvmlist.h"
static inline __attribute__((always_inline)) void hlist_add_head_rcu(struct hlist_node *n,
     struct hlist_head *h)
{
 struct hlist_node *first = h->first;
 n->next = first;
 n->pprev = &h->first;
 smp_wmb();
 if (first)
  first->pprev = &n->next;
 h->first = n;
}


static inline __attribute__((always_inline)) void hlist_add_before(struct hlist_node *n,
     struct hlist_node *next)
{
 n->pprev = next->pprev;
 n->next = next;
 next->pprev = &n->next;
 *(n->pprev) = n;
}

static inline __attribute__((always_inline)) void hlist_add_after(struct hlist_node *n,
     struct hlist_node *next)
{
 next->next = n->next;
 n->next = next;
 next->pprev = &n->next;

 if(next->next)
  next->next->pprev = &next->next;
}
# 883 "include/linux/winkvmlist.h"
static inline __attribute__((always_inline)) void hlist_add_before_rcu(struct hlist_node *n,
     struct hlist_node *next)
{
 n->pprev = next->pprev;
 n->next = next;
 smp_wmb();
 next->pprev = &n->next;
 *(n->pprev) = n;
}
# 911 "include/linux/winkvmlist.h"
static inline __attribute__((always_inline)) void hlist_add_after_rcu(struct hlist_node *prev,
           struct hlist_node *n)
{
 n->next = prev->next;
 n->pprev = &prev->next;
 smp_wmb();
 prev->next = n;
 if (n->next)
  n->next->pprev = &n->next;
}
# 14 "include/linux/winkvmtypes.h" 2
# 1 "include/linux/winwdm.h" 1




typedef struct _LIST_ENTRY {
 struct _LIST_ENTRY *Flink;
 struct _LIST_ENTRY *Blink;
} LIST_ENTRY;

typedef LIST_ENTRY* PLIST_ENTRY;
typedef LIST_ENTRY* RESTRICTED_POINTER;
typedef LIST_ENTRY* PRLIST_ENTRY;

typedef struct _SINGLE_LIST_ENTRY {
 struct _SINGLE_LIST_ENTRY *Next;
} SINGLE_LIST_ENTRY, *PSINGLE_LIST_ENTRY;
# 15 "include/linux/winkvmtypes.h" 2
# 1 "include/linux/winkvm.h" 1
# 9 "include/linux/winkvm.h"
#pragma pack(1)

struct page;

struct page_mapped {
 unsigned long size;
 void *systemVA;
 unsigned long h_pfn;
 unsigned long g_pfn;
 void *pMdl;
 void *userVA;
};

struct page_independed {
 unsigned long size;
 void *systemVA;
 unsigned long h_pfn;
 struct page *head_page;
};

struct page {
 union {
  unsigned long private;
  void *__mapping;
 };
 unsigned long index;
 int page_type;
 union {
  struct page_mapped mapped;
  struct page_independed independed;
 };
};

struct inode {
 void *__inode;
 };

typedef struct {
   int spinlock_number;
} spinlock_t;

struct mutex {
 int mutex_number;
};

enum private_data_type {
 WINKVM_KVM = -1,
 WINKVM_VCPU,
};

struct file {
 void *private_data;
 int __private_data_type;
 int fd;
 int f_count;
 struct inode *__inode;
 int r_flags;
};

struct task_struct {
  int counter;
};

#pragma pack()

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
# 16 "include/linux/winkvmtypes.h" 2
# 67 "include/linux/winkvmtypes.h"
struct i387_fxsave_struct {
 unsigned short cwd;
 unsigned short swd;
 unsigned short twd;
 unsigned short fop;
 long fip;
 long fcs;
 long foo;
 long fos;
 long mxcsr;
 long mxcsr_mask;
 long st_space[32];
 long xmm_space[32];
 long padding[56];
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

struct module {
 void *__module;
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

struct file_operations {
 struct module *owner;







 int (*ioctl) (struct inode*, struct file *, unsigned int, unsigned long);
 long (*unlocked_ioctl) (struct file *, unsigned int, unsigned long);
 long (*compat_ioctl) (struct file *, unsigned int, unsigned long);
 int (*mmap) (struct file*, struct vm_area_struct *);
 int (*open) (struct inode*, struct file *);

 int (*release) (struct inode*, struct file *);
# 151 "include/linux/winkvmtypes.h"
};

struct vm_operations_struct {
 void (*open)(struct vm_area_struct * area);
 void (*close)(struct vm_area_struct * area);

 struct page *(*nopage)(struct vm_area_struct *area,
   unsigned long address, int *type);
 unsigned long (*nopfn)(struct vm_area_struct *area,
   unsigned long address);
# 172 "include/linux/winkvmtypes.h"
};

struct miscdevice {
 int minor;
 const char *name;
 const struct file_operations *fops;



};

struct notifier_block {
 int (*notifier_call)(struct notifier_block *, unsigned long, void *);
 struct notifier_block *next;
 int priority;
};
# 8 "include/linux/winkvmstab.h" 2
# 1 "include/linux/winkvmgfp.h" 1
# 9 "include/linux/winkvmstab.h" 2


# 1 "include/asm/errno.h" 1
# 1 "include/asm-generic/errno.h" 1



# 1 "include/asm-generic/errno-base.h" 1
# 5 "include/asm-generic/errno.h" 2
# 1 "include/asm/errno.h" 2
# 12 "include/linux/winkvmstab.h" 2
# 52 "include/linux/winkvmstab.h"
extern int printk(const char *s, ...);

extern int first_cpu(void);
extern int get_nr_cpus(void);
extern int next_cpu(int cpu);
# 73 "include/linux/winkvmstab.h"
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




extern void mutex_init(struct mutex *lock);
extern void mutex_lock(struct mutex *lock);
extern void mutex_unlock(struct mutex *lock);
extern int mutex_trylock(struct mutex *lock);

extern int copy_to_user(void *to, const void *from, int n);
extern int copy_from_user(void *to, const void *from, int n);

extern void get_page(struct page *page);

extern struct task_struct *current;

extern int signal_pending(struct task_struct *p);
# 186 "include/linux/winkvmstab.h"
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


extern struct page *wk_alloc_page(unsigned long g_basefn, unsigned long i, unsigned int flags);


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
# 240 "include/linux/winkvmstab.h"
static inline __attribute__((always_inline)) unsigned long virt_to_phys(void *address)
{
 return __pa(address);
}

extern void local_irq_enable(void);
extern void local_irq_disable(void);




static inline __attribute__((always_inline)) void account_system_vtime(struct task_struct *tsk)
{
}

extern struct file *get_empty_filp(void);
extern struct inode *new_inode(void);
extern int get_unused_fd(void);
extern void fd_install(unsigned int fd, struct file *file);
# 289 "include/linux/winkvmstab.h"
static inline __attribute__((always_inline)) void set_bit(int nr, volatile unsigned long * addr)
{
 __asm__ __volatile__(
  "lock; btsl %1,%0"
  :"+m" ((*(volatile long *)addr))
  :"Ir" (nr));
}

static inline __attribute__((always_inline)) void __set_bit(int nr, volatile unsigned long * addr)
{
 __asm__(
  "btsl %1,%0"
  :"+m" ((*(volatile long *)addr))
  :"Ir" (nr));
}

static inline __attribute__((always_inline)) int test_bit(int nr, const void * addr)
{
 u8 v;
 const u32 *p = (const u32 *)addr;

 asm("btl %2,%1; setc %0" : "=qm" (v) : "m" (*p), "Ir" (nr));
 return v;
}
# 330 "include/linux/winkvmstab.h"
static inline __attribute__((always_inline)) void *ERR_PTR(long error)
{
 return (void *)error;
}

static inline __attribute__((always_inline)) long PTR_ERR(const void *ptr)
{
 return (long)ptr;
}

static inline __attribute__((always_inline)) long IS_ERR(const void *ptr)
{
 return (((unsigned long)ptr) >= (unsigned long)-4095);
}
# 30 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c" 2
# 1 "include/asm/winkvmmisc.h" 1







# 1 "include/asm/winkvm86.h" 1
# 9 "include/asm/winkvmmisc.h" 2




struct desc_ptr {
 unsigned short size;
 unsigned long address;
} __attribute__((packed));

struct Xgt_desc_struct {
 unsigned short size;
 unsigned long address __attribute__((packed));
 unsigned short pad;
} __attribute__ ((packed));

struct desc_struct {
 u16 limit0;
 u16 base0;
 unsigned base1 : 8, type : 4, s : 1, dpl : 2, p : 1;
 unsigned limit : 4, avl : 1, l : 1, d : 1, g : 1, base2 : 8;
} __attribute__((packed));
# 44 "include/asm/winkvmmisc.h"
extern void *memcpy(void *to, const void *from, size_t n);
extern void* memset(void* s, int c, unsigned n);
extern int strcmp(const char *str1, const char *str2);

static inline __attribute__((always_inline)) void native_cpuid(unsigned int *eax, unsigned int *ebx,
        unsigned int *ecx, unsigned int *edx)
{

 __asm__("cpuid"
   : "=a" (*eax),
     "=b" (*ebx),
     "=c" (*ecx),
     "=d" (*edx)
   : "0" (*eax), "2" (*ecx));
}
# 67 "include/asm/winkvmmisc.h"
static inline __attribute__((always_inline)) void cpuid(unsigned int op,
       unsigned int *eax, unsigned int *ebx,
       unsigned int *ecx, unsigned int *edx)
{
 *eax = op;
 *ecx = 0;
 native_cpuid(eax, ebx, ecx, edx);
}


static inline __attribute__((always_inline)) void cpuid_count(unsigned int op, int count,
          unsigned int *eax, unsigned int *ebx,
          unsigned int *ecx, unsigned int *edx)
{
 *eax = op;
 *ecx = count;
 native_cpuid(eax, ebx, ecx, edx);
}




static inline __attribute__((always_inline)) unsigned int cpuid_eax(unsigned int op)
{
 unsigned int eax, ebx, ecx, edx;

 cpuid(op, &eax, &ebx, &ecx, &edx);
 return eax;
}
static inline __attribute__((always_inline)) unsigned int cpuid_ebx(unsigned int op)
{
 unsigned int eax, ebx, ecx, edx;

 cpuid(op, &eax, &ebx, &ecx, &edx);
 return ebx;
}
static inline __attribute__((always_inline)) unsigned int cpuid_ecx(unsigned int op)
{
 unsigned int eax, ebx, ecx, edx;

 cpuid(op, &eax, &ebx, &ecx, &edx);
 return ecx;
}
static inline __attribute__((always_inline)) unsigned int cpuid_edx(unsigned int op)
{
 unsigned int eax, ebx, ecx, edx;

 cpuid(op, &eax, &ebx, &ecx, &edx);
 return edx;
}







static inline __attribute__((always_inline)) unsigned long __ffs(unsigned long word)
{
 __asm__("bsfl %1,%0"
  :"=r" (word)
  :"rm" (word));
 return word;
}
# 142 "include/asm/winkvmmisc.h"
static inline __attribute__((always_inline)) void clear_bit(int nr, volatile unsigned long * addr)
{
 __asm__ __volatile__(
  "lock; btrl %1,%0"
  :"+m" ((*(volatile long *)addr))
  :"Ir" (nr));
}
# 157 "include/asm/winkvmmisc.h"
static inline __attribute__((always_inline)) unsigned long long native_read_msr(unsigned int msr)
{
 unsigned long long val;

 asm volatile("rdmsr" : "=A" (val) : "c" (msr));
 return val;
}

static inline __attribute__((always_inline)) void native_write_msr(unsigned int msr, unsigned long long val)
{
 asm volatile("wrmsr" : : "c" (msr), "A"(val));
}

static inline __attribute__((always_inline)) void wrmsr(u32 __msr, u32 __low, u32 __high)
{
 native_write_msr(__msr, ((u64)__high << 32) | __low);
}
# 185 "include/asm/winkvmmisc.h"
static inline __attribute__((always_inline)) int wrmsr_safe(u32 __msr, u32 __low, u32 __high)
{

 native_write_msr(__msr, ((u64)__high << 32) | __low);
 return 1;
}
# 212 "include/asm/winkvmmisc.h"
static inline __attribute__((always_inline)) unsigned long long native_read_tsc(void)
{
 unsigned long long val;


 asm volatile("rdtsc" : "=A" (val));


 return val;
}
# 238 "include/asm/winkvmmisc.h"
static inline __attribute__((always_inline)) void load_TR_desc(void)
{
 asm volatile("ltr %w0"::"q" ((4)*8));
}

static inline __attribute__((always_inline)) void load_gdt(const struct Xgt_desc_struct *dtr)
{
 asm volatile("lgdt %0"::"m" (*dtr));
}

static inline __attribute__((always_inline)) void load_idt(const struct Xgt_desc_struct *dtr)
{
 asm volatile("lidt %0"::"m" (*dtr));
}

static inline __attribute__((always_inline)) void store_gdt(struct Xgt_desc_struct *dtr)
{
 asm ("sgdt %0":"=m" (*dtr));
}

static inline __attribute__((always_inline)) void store_idt(struct Xgt_desc_struct *dtr)
{
 asm ("sidt %0":"=m" (*dtr));
}

static inline __attribute__((always_inline)) unsigned long store_tr(void)
{
 unsigned long tr;
 asm ("str %0":"=r" (tr));
 return tr;
}

static inline __attribute__((always_inline)) void write_cr4(unsigned long val)
{
 asm volatile("movl %0,%%cr4": :"r" (val));
}

static inline __attribute__((always_inline)) unsigned long read_cr4(void)
{
 unsigned long val;
 asm volatile("movl %%cr4,%0\n\t" :"=r" (val));
 return val;
}

static inline __attribute__((always_inline)) unsigned long read_cr0(void)
{
 unsigned long val;
 asm volatile("movl %%cr0,%0\n\t" :"=r" (val));
 return val;
}

static inline __attribute__((always_inline)) void write_cr0(unsigned long val)
{
 asm volatile("movl %0,%%cr0": :"r" (val));
}

static inline __attribute__((always_inline)) unsigned long read_cr2(void)
{
 unsigned long val;
 asm volatile("movl %%cr2,%0\n\t" :"=r" (val));
 return val;
}

static inline __attribute__((always_inline)) void write_cr2(unsigned long val)
{
 asm volatile("movl %0,%%cr2": :"r" (val));
}

static inline __attribute__((always_inline)) unsigned long read_cr3(void)
{
 unsigned long val;
 asm volatile("movl %%cr3,%0\n\t" :"=r" (val));
 return val;
}

static inline __attribute__((always_inline)) void write_cr3(unsigned long val)
{
 asm volatile("movl %0,%%cr3": :"r" (val));
}





static inline __attribute__((always_inline)) unsigned short read_es(void)
{
 unsigned short r;
 asm volatile ("mov %%es, %0" : "=r"(r));
 return r;
}

static inline __attribute__((always_inline)) unsigned short read_cs(void)
{
 unsigned short r;
 asm volatile ("mov %%cs, %0" : "=r"(r));
 return r;
}

static inline __attribute__((always_inline)) unsigned short read_ss(void)
{
 unsigned short r;
 asm volatile ("mov %%ss, %0" : "=r"(r));
 return r;
}

static inline __attribute__((always_inline)) unsigned short read_ds(void)
{
 unsigned short r;
 asm volatile ("mov %%ds, %0" : "=r"(r));
 return r;
}

static inline __attribute__((always_inline)) unsigned short store_fs(void)
{
 unsigned short r;
 asm volatile ("mov %%fs, %0" : "=r"(r));
 return r;
}

static inline __attribute__((always_inline)) unsigned short store_gs(void)
{
 unsigned short r;
 asm volatile ("mov %%gs, %0" : "=r"(r));
 return r;
}

static inline __attribute__((always_inline)) unsigned long read_fs_base(void)
{
 unsigned short fs_s = store_fs() >> 3;
 unsigned long base_address;
 struct Xgt_desc_struct Xgt_desc;
 struct desc_struct *desc;

 ;

 store_gdt(&Xgt_desc);
 desc = (struct desc_struct*)Xgt_desc.address;

 base_address = (desc[fs_s].base2 << 24) | (desc[fs_s].base1 << 16) | desc[fs_s].base0;

 ;

 return base_address;
}

static inline __attribute__((always_inline)) unsigned long read_gs_base(void)
{
 unsigned short gs_s = store_gs() >> 3;
 unsigned long base_address;
 struct Xgt_desc_struct Xgt_desc;
 struct desc_struct *desc;

 ;

 store_gdt(&Xgt_desc);
 desc = (struct desc_struct*)Xgt_desc.address;

 base_address = (desc[gs_s].base2 << 24) | (desc[gs_s].base1 << 16) | desc[gs_s].base0;

 ;

 return base_address;
}
# 423 "include/asm/winkvmmisc.h"
static inline __attribute__((always_inline)) void native_set_debugreg(int regno, unsigned long value)
{
 switch (regno) {
 case 0:
  asm("movl %0,%%db0" : :"r" (value));
  break;
 case 1:
  asm("movl %0,%%db1" : :"r" (value));
  break;
 case 2:
  asm("movl %0,%%db2" : :"r" (value));
  break;
 case 3:
  asm("movl %0,%%db3" : :"r" (value));
  break;
 case 6:
  asm("movl %0,%%db6" : :"r" (value));
  break;
 case 7:
  asm("movl %0,%%db7" : :"r" (value));
  break;
 default:

  break;
 }
}







static __inline__ __attribute__((always_inline)) void atomic_inc(int *v)
{
 __asm__ __volatile__(
  "lock; incl %0"
  :"+m" (v));
}







static __inline__ __attribute__((always_inline)) void atomic_dec(int *v)
{
 __asm__ __volatile__(
  "lock; decl %0"
  :"+m" (v));
}
# 31 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c" 2

# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_svm.h" 1
# 11 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_svm.h"
# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.h" 1



enum {
 INTERCEPT_INTR,
 INTERCEPT_NMI,
 INTERCEPT_SMI,
 INTERCEPT_INIT,
 INTERCEPT_VINTR,
 INTERCEPT_SELECTIVE_CR0,
 INTERCEPT_STORE_IDTR,
 INTERCEPT_STORE_GDTR,
 INTERCEPT_STORE_LDTR,
 INTERCEPT_STORE_TR,
 INTERCEPT_LOAD_IDTR,
 INTERCEPT_LOAD_GDTR,
 INTERCEPT_LOAD_LDTR,
 INTERCEPT_LOAD_TR,
 INTERCEPT_RDTSC,
 INTERCEPT_RDPMC,
 INTERCEPT_PUSHF,
 INTERCEPT_POPF,
 INTERCEPT_CPUID,
 INTERCEPT_RSM,
 INTERCEPT_IRET,
 INTERCEPT_INTn,
 INTERCEPT_INVD,
 INTERCEPT_PAUSE,
 INTERCEPT_HLT,
 INTERCEPT_INVLPG,
 INTERCEPT_INVLPGA,
 INTERCEPT_IOIO_PROT,
 INTERCEPT_MSR_PROT,
 INTERCEPT_TASK_SWITCH,
 INTERCEPT_FERR_FREEZE,
 INTERCEPT_SHUTDOWN,
 INTERCEPT_VMRUN,
 INTERCEPT_VMMCALL,
 INTERCEPT_VMLOAD,
 INTERCEPT_VMSAVE,
 INTERCEPT_STGI,
 INTERCEPT_CLGI,
 INTERCEPT_SKINIT,
 INTERCEPT_RDTSCP,
 INTERCEPT_ICEBP,
 INTERCEPT_WBINVD,
};


struct __attribute__ ((__packed__)) vmcb_control_area {
 u16 intercept_cr_read;
 u16 intercept_cr_write;
 u16 intercept_dr_read;
 u16 intercept_dr_write;
 u32 intercept_exceptions;
 u64 intercept;
 u8 reserved_1[44];
 u64 iopm_base_pa;
 u64 msrpm_base_pa;
 u64 tsc_offset;
 u32 asid;
 u8 tlb_ctl;
 u8 reserved_2[3];
 u32 int_ctl;
 u32 int_vector;
 u32 int_state;
 u8 reserved_3[4];
 u32 exit_code;
 u32 exit_code_hi;
 u64 exit_info_1;
 u64 exit_info_2;
 u32 exit_int_info;
 u32 exit_int_info_err;
 u64 nested_ctl;
 u8 reserved_4[16];
 u32 event_inj;
 u32 event_inj_err;
 u64 nested_cr3;
 u64 lbr_ctl;
 u8 reserved_5[832];
};
# 114 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.h"
struct __attribute__ ((__packed__)) vmcb_seg {
 u16 selector;
 u16 attrib;
 u32 limit;
 u64 base;
};

struct __attribute__ ((__packed__)) vmcb_save_area {
 struct vmcb_seg es;
 struct vmcb_seg cs;
 struct vmcb_seg ss;
 struct vmcb_seg ds;
 struct vmcb_seg fs;
 struct vmcb_seg gs;
 struct vmcb_seg gdtr;
 struct vmcb_seg ldtr;
 struct vmcb_seg idtr;
 struct vmcb_seg tr;
 u8 reserved_1[43];
 u8 cpl;
 u8 reserved_2[4];
 u64 efer;
 u8 reserved_3[112];
 u64 cr4;
 u64 cr3;
 u64 cr0;
 u64 dr7;
 u64 dr6;
 u64 rflags;
 u64 rip;
 u8 reserved_4[88];
 u64 rsp;
 u8 reserved_5[24];
 u64 rax;
 u64 star;
 u64 lstar;
 u64 cstar;
 u64 sfmask;
 u64 kernel_gs_base;
 u64 sysenter_cs;
 u64 sysenter_esp;
 u64 sysenter_eip;
 u64 cr2;
 u8 reserved_6[32];
 u64 g_pat;
 u64 dbgctl;
 u64 br_from;
 u64 br_to;
 u64 last_excp_from;
 u64 last_excp_to;
};

struct __attribute__ ((__packed__)) vmcb {
 struct vmcb_control_area control;
 struct vmcb_save_area save;
};
# 12 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_svm.h" 2
# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
# 19 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h"
# 1 "include/linux/kvm.h" 1
# 45 "include/linux/kvm.h"
#pragma pack(1)


struct kvm_memory_region {
  __u32 slot;
  __u32 flags;
  __u64 guest_phys_addr;
  __u64 memory_size;
};


struct winkvm_memory_region {
 int vm_fd;
 struct kvm_memory_region kvm_memory_region;
};


struct winkvm_create_vcpu {
 int vm_fd;
 int vcpu_fd;
};

struct winkvm_transfer_mem {
 int vcpu_fd;
 __u32 gva;
 __u32 size;
 __u8 payload[0];
};

struct winkvm_mapmem_initialize {
 int vm_fd;
 int slot;
 __u32 base_gfn;
 __u32 npages;
 __u8 *mapUserVA;
};

struct winkvm_pfmap {
 __u64 phys;
 __u64 virt;
};

struct winkvm_getpvmap {
 int vm_fd;
 int slot;
 __u32 tablesize;
 struct winkvm_pfmap maptable[0];
};



#pragma pack()
# 105 "include/linux/kvm.h"
enum kvm_exit_reason {
  KVM_EXIT_UNKNOWN = 0,
  KVM_EXIT_EXCEPTION = 1,
  KVM_EXIT_IO = 2,
  KVM_EXIT_CPUID = 3,
  KVM_EXIT_DEBUG = 4,
  KVM_EXIT_HLT = 5,
  KVM_EXIT_MMIO = 6,
  KVM_EXIT_IRQ_WINDOW_OPEN = 7,
  KVM_EXIT_SHUTDOWN = 8,
};

#pragma pack(1)


struct kvm_run {

  int vcpu_fd;
  int _errno;
  int ioctl_r;


  __u32 emulated;
  __u32 mmio_completed;
  __u8 request_interrupt_window;
  __u8 padding1[7];


  __u32 exit_type;
  __u32 exit_reason;
  __u32 instruction_length;
  __u8 ready_for_interrupt_injection;
  __u8 if_flag;
  __u16 padding2;


  __u64 cr8;
  __u64 apic_base;

  union {

 struct {
   __u32 hardware_exit_reason;
 } hw;

 struct {
   __u32 exception;
   __u32 error_code;
 } ex;

 struct {


   __u8 direction;
   __u8 size;
   __u8 string;
   __u8 string_down;
   __u8 rep;
   __u8 pad;
   __u16 port;
   __u64 count;
   union {
  __u64 address;
  __u32 value;
   };
 } io;





 struct {
   __u64 phys_addr;
   __u8 data[8];
   __u32 len;
   __u8 is_write;
 } mmio;
  };
};


struct kvm_regs {

  int vcpu_fd;


  __u64 rax, rbx, rcx, rdx;
  __u64 rsi, rdi, rsp, rbp;
  __u64 r8, r9, r10, r11;
  __u64 r12, r13, r14, r15;
  __u64 rip, rflags;
};

struct kvm_segment {
  __u64 base;
  __u32 limit;
  __u16 selector;
  __u8 type;
  __u8 present, dpl, db, s, l, g, avl;
  __u8 unusable;
  __u8 padding;
};

struct kvm_dtable {
  __u64 base;
  __u16 limit;
  __u16 padding[3];
};


struct kvm_sregs {

  int vcpu_fd;


  struct kvm_segment cs, ds, es, fs, gs, ss;
  struct kvm_segment tr, ldt;
  struct kvm_dtable gdt, idt;
  __u64 cr0, cr2, cr3, cr4, cr8;
  __u64 efer;
  __u64 apic_base;
  __u64 interrupt_bitmap[(((256 + 7) / 8) / sizeof(__u64))];
};

struct kvm_msr_entry {
  __u32 index;
  __u32 reserved;
  __u64 data;
};


struct kvm_msrs {
  __u32 nmsrs;
  __u32 pad;

  struct kvm_msr_entry entries[0];
};


struct kvm_msr_list {
  __u32 nmsrs;
  __u32 indices[0];
};


struct kvm_translation {

  int vcpu_fd;


  __u64 linear_address;


  __u64 physical_address;
  __u8 valid;
  __u8 writeable;
  __u8 usermode;
  __u8 pad[5];
};


struct kvm_interrupt {


  int vcpu_fd;

  __u32 irq;
};

struct kvm_breakpoint {
  __u32 enabled;
  __u32 padding;
  __u64 address;
};


struct kvm_debug_guest {

  __u32 enabled;
  __u32 pad;
  struct kvm_breakpoint breakpoints[4];
  __u32 singlestep;
};


struct kvm_dirty_log {
  __u32 slot;
  __u32 padding;
  union {
 void *dirty_bitmap;
 __u64 __padding;
  };
};

#pragma pack()
# 20 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 2
# 1 "include/linux/kvm_para.h" 1
# 20 "include/linux/kvm_para.h"
struct kvm_vcpu_para_state {
# 29 "include/linux/kvm_para.h"
 u32 guest_version;
 u32 host_version;
 u32 size;
 u32 ret;






 u64 hypercall_gpa;

} __attribute__ ((aligned((1UL << 12))));
# 21 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 2
# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.h" 1
# 53 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.h"
enum vmcs_field {
 GUEST_ES_SELECTOR = 0x00000800,
 GUEST_CS_SELECTOR = 0x00000802,
 GUEST_SS_SELECTOR = 0x00000804,
 GUEST_DS_SELECTOR = 0x00000806,
 GUEST_FS_SELECTOR = 0x00000808,
 GUEST_GS_SELECTOR = 0x0000080a,
 GUEST_LDTR_SELECTOR = 0x0000080c,
 GUEST_TR_SELECTOR = 0x0000080e,
 HOST_ES_SELECTOR = 0x00000c00,
 HOST_CS_SELECTOR = 0x00000c02,
 HOST_SS_SELECTOR = 0x00000c04,
 HOST_DS_SELECTOR = 0x00000c06,
 HOST_FS_SELECTOR = 0x00000c08,
 HOST_GS_SELECTOR = 0x00000c0a,
 HOST_TR_SELECTOR = 0x00000c0c,
 IO_BITMAP_A = 0x00002000,
 IO_BITMAP_A_HIGH = 0x00002001,
 IO_BITMAP_B = 0x00002002,
 IO_BITMAP_B_HIGH = 0x00002003,
 MSR_BITMAP = 0x00002004,
 MSR_BITMAP_HIGH = 0x00002005,
 VM_EXIT_MSR_STORE_ADDR = 0x00002006,
 VM_EXIT_MSR_STORE_ADDR_HIGH = 0x00002007,
 VM_EXIT_MSR_LOAD_ADDR = 0x00002008,
 VM_EXIT_MSR_LOAD_ADDR_HIGH = 0x00002009,
 VM_ENTRY_MSR_LOAD_ADDR = 0x0000200a,
 VM_ENTRY_MSR_LOAD_ADDR_HIGH = 0x0000200b,
 TSC_OFFSET = 0x00002010,
 TSC_OFFSET_HIGH = 0x00002011,
 VIRTUAL_APIC_PAGE_ADDR = 0x00002012,
 VIRTUAL_APIC_PAGE_ADDR_HIGH = 0x00002013,
 VMCS_LINK_POINTER = 0x00002800,
 VMCS_LINK_POINTER_HIGH = 0x00002801,
 GUEST_IA32_DEBUGCTL = 0x00002802,
 GUEST_IA32_DEBUGCTL_HIGH = 0x00002803,
 PIN_BASED_VM_EXEC_CONTROL = 0x00004000,
 CPU_BASED_VM_EXEC_CONTROL = 0x00004002,
 EXCEPTION_BITMAP = 0x00004004,
 PAGE_FAULT_ERROR_CODE_MASK = 0x00004006,
 PAGE_FAULT_ERROR_CODE_MATCH = 0x00004008,
 CR3_TARGET_COUNT = 0x0000400a,
 VM_EXIT_CONTROLS = 0x0000400c,
 VM_EXIT_MSR_STORE_COUNT = 0x0000400e,
 VM_EXIT_MSR_LOAD_COUNT = 0x00004010,
 VM_ENTRY_CONTROLS = 0x00004012,
 VM_ENTRY_MSR_LOAD_COUNT = 0x00004014,
 VM_ENTRY_INTR_INFO_FIELD = 0x00004016,
 VM_ENTRY_EXCEPTION_ERROR_CODE = 0x00004018,
 VM_ENTRY_INSTRUCTION_LEN = 0x0000401a,
 TPR_THRESHOLD = 0x0000401c,
 SECONDARY_VM_EXEC_CONTROL = 0x0000401e,
 VM_INSTRUCTION_ERROR = 0x00004400,
 VM_EXIT_REASON = 0x00004402,
 VM_EXIT_INTR_INFO = 0x00004404,
 VM_EXIT_INTR_ERROR_CODE = 0x00004406,
 IDT_VECTORING_INFO_FIELD = 0x00004408,
 IDT_VECTORING_ERROR_CODE = 0x0000440a,
 VM_EXIT_INSTRUCTION_LEN = 0x0000440c,
 VMX_INSTRUCTION_INFO = 0x0000440e,
 GUEST_ES_LIMIT = 0x00004800,
 GUEST_CS_LIMIT = 0x00004802,
 GUEST_SS_LIMIT = 0x00004804,
 GUEST_DS_LIMIT = 0x00004806,
 GUEST_FS_LIMIT = 0x00004808,
 GUEST_GS_LIMIT = 0x0000480a,
 GUEST_LDTR_LIMIT = 0x0000480c,
 GUEST_TR_LIMIT = 0x0000480e,
 GUEST_GDTR_LIMIT = 0x00004810,
 GUEST_IDTR_LIMIT = 0x00004812,
 GUEST_ES_AR_BYTES = 0x00004814,
 GUEST_CS_AR_BYTES = 0x00004816,
 GUEST_SS_AR_BYTES = 0x00004818,
 GUEST_DS_AR_BYTES = 0x0000481a,
 GUEST_FS_AR_BYTES = 0x0000481c,
 GUEST_GS_AR_BYTES = 0x0000481e,
 GUEST_LDTR_AR_BYTES = 0x00004820,
 GUEST_TR_AR_BYTES = 0x00004822,
 GUEST_INTERRUPTIBILITY_INFO = 0x00004824,
 GUEST_ACTIVITY_STATE = 0X00004826,
 GUEST_SYSENTER_CS = 0x0000482A,
 HOST_IA32_SYSENTER_CS = 0x00004c00,
 CR0_GUEST_HOST_MASK = 0x00006000,
 CR4_GUEST_HOST_MASK = 0x00006002,
 CR0_READ_SHADOW = 0x00006004,
 CR4_READ_SHADOW = 0x00006006,
 CR3_TARGET_VALUE0 = 0x00006008,
 CR3_TARGET_VALUE1 = 0x0000600a,
 CR3_TARGET_VALUE2 = 0x0000600c,
 CR3_TARGET_VALUE3 = 0x0000600e,
 EXIT_QUALIFICATION = 0x00006400,
 GUEST_LINEAR_ADDRESS = 0x0000640a,
 GUEST_CR0 = 0x00006800,
 GUEST_CR3 = 0x00006802,
 GUEST_CR4 = 0x00006804,
 GUEST_ES_BASE = 0x00006806,
 GUEST_CS_BASE = 0x00006808,
 GUEST_SS_BASE = 0x0000680a,
 GUEST_DS_BASE = 0x0000680c,
 GUEST_FS_BASE = 0x0000680e,
 GUEST_GS_BASE = 0x00006810,
 GUEST_LDTR_BASE = 0x00006812,
 GUEST_TR_BASE = 0x00006814,
 GUEST_GDTR_BASE = 0x00006816,
 GUEST_IDTR_BASE = 0x00006818,
 GUEST_DR7 = 0x0000681a,
 GUEST_RSP = 0x0000681c,
 GUEST_RIP = 0x0000681e,
 GUEST_RFLAGS = 0x00006820,
 GUEST_PENDING_DBG_EXCEPTIONS = 0x00006822,
 GUEST_SYSENTER_ESP = 0x00006824,
 GUEST_SYSENTER_EIP = 0x00006826,
 HOST_CR0 = 0x00006c00,
 HOST_CR3 = 0x00006c02,
 HOST_CR4 = 0x00006c04,
 HOST_FS_BASE = 0x00006c06,
 HOST_GS_BASE = 0x00006c08,
 HOST_TR_BASE = 0x00006c0a,
 HOST_GDTR_BASE = 0x00006c0c,
 HOST_IDTR_BASE = 0x00006c0e,
 HOST_IA32_SYSENTER_ESP = 0x00006c10,
 HOST_IA32_SYSENTER_EIP = 0x00006c12,
 HOST_RSP = 0x00006c14,
 HOST_RIP = 0x00006c16,
};
# 22 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 2
# 91 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h"
typedef unsigned long gva_t;
typedef u64 gpa_t;
typedef unsigned long gfn_t;

typedef unsigned long hva_t;
typedef u64 hpa_t;
typedef unsigned long hfn_t;



#pragma pack(1)

struct kvm_pte_chain {
 u64 *parent_ptes[5];
 struct hlist_node link;
};
# 116 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h"
union kvm_mmu_page_role {
 unsigned word;
 struct {
  unsigned glevels : 4;
  unsigned level : 4;
  unsigned quadrant : 2;
  unsigned pad_for_nice_hex_output : 6;
  unsigned metaphysical : 1;
 };
};

struct kvm_mmu_page {
 struct list_head link;
 struct hlist_node hash_link;





 gfn_t gfn;
 union kvm_mmu_page_role role;

 hpa_t page_hpa;
 unsigned long slot_bitmap;


 int global;
 int multimapped;
 int root_count;
 union {
  u64 *parent_pte;
  struct hlist_head parent_ptes;
 };
};

struct vmcs {
 u32 revision_id;
 u32 abort;
 char data[0];
};



struct kvm_vcpu;






struct kvm_mmu {
 void (*new_cr3)(struct kvm_vcpu *vcpu);
 int (*page_fault)(struct kvm_vcpu *vcpu, gva_t gva, u32 err);
 void (*free)(struct kvm_vcpu *vcpu);
 gpa_t (*gva_to_gpa)(struct kvm_vcpu *vcpu, gva_t gva);
 hpa_t root_hpa;
 int root_level;
 int shadow_root_level;
 u64 *pae_root;
};


struct func_pointer_test {
 void (*test_1)(int a, int b, int c);
 int (*test_2)(int a, int b, int c);
 hpa_t root_hpa;
 int root_level;
 int shadow_root_level;
 u64 *pae_root;
};



struct kvm_mmu_memory_cache {
 int nobjs;
 void *objects[20];
};





struct kvm_guest_debug {
 int enabled;
 unsigned long bp[4];
 int singlestep;
};

enum {
 VCPU_REGS_RAX = 0,
 VCPU_REGS_RCX = 1,
 VCPU_REGS_RDX = 2,
 VCPU_REGS_RBX = 3,
 VCPU_REGS_RSP = 4,
 VCPU_REGS_RBP = 5,
 VCPU_REGS_RSI = 6,
 VCPU_REGS_RDI = 7,
# 223 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h"
 NR_VCPU_REGS
};

enum {
 VCPU_SREG_CS,
 VCPU_SREG_DS,
 VCPU_SREG_ES,
 VCPU_SREG_FS,
 VCPU_SREG_GS,
 VCPU_SREG_SS,
 VCPU_SREG_TR,
 VCPU_SREG_LDTR,
};

struct kvm_vcpu {
 struct kvm *kvm;
 union {
  struct vmcs *vmcs;
  struct vcpu_svm *svm;
 };
 struct mutex mutex;
 int cpu;
 int launched;
 int interrupt_window_open;
 unsigned long irq_summary;

 unsigned long irq_pending[(((256 + 7) / 8) / sizeof(unsigned long))];
 unsigned long regs[NR_VCPU_REGS];
 unsigned long rip;

 unsigned long cr0;
 unsigned long cr2;
 unsigned long cr3;
 gpa_t para_state_gpa;
 struct page *para_state_page;
 gpa_t hypercall_gpa;
 unsigned long cr4;
 unsigned long cr8;
 u64 pdptrs[4];
 u64 shadow_efer;
 u64 apic_base;
 u64 ia32_misc_enable_msr;
 int nmsrs;
 struct kvm_msr_entry *guest_msrs;
 struct kvm_msr_entry *host_msrs;

 struct list_head free_pages;
 struct kvm_mmu_page page_header_buf[256];
 struct kvm_mmu mmu;

 struct kvm_mmu_memory_cache mmu_pte_chain_cache;
 struct kvm_mmu_memory_cache mmu_rmap_desc_cache;

 gfn_t last_pt_write_gfn;
 int last_pt_write_count;

 struct kvm_guest_debug guest_debug;

 char fx_buf[(2 * 512 + 16)];
 char *host_fx_image;
 char *guest_fx_image;

 int mmio_needed;
 int mmio_read_completed;
 int mmio_is_write;
 int mmio_size;
 unsigned char mmio_data[8];
 gpa_t mmio_phys_addr;
 gva_t mmio_fault_cr2;

 struct {
  int active;
  u8 save_iopl;
  struct kvm_save_segment {
   u16 selector;
   unsigned long base;
   u32 limit;
   u32 ar;
  } tr, es, ds, fs, gs;
 } rmode;
};

struct kvm_memory_slot {
 gfn_t base_gfn;
 unsigned long npages;
 unsigned long flags;
 struct page **phys_mem;
 unsigned long *dirty_bitmap;
};

struct kvm {
 spinlock_t lock;
 int nmemslots;
 struct kvm_memory_slot memslots[4];



 struct list_head active_mmu_pages;
 int n_free_mmu_pages;
 struct hlist_head mmu_page_hash[256];
 struct kvm_vcpu vcpus[1];
 int memory_config_version;
 int busy;
 unsigned long rmap_overflow;
 struct list_head vm_list;
 struct file *filp;
};

struct kvm_stat {
 u32 pf_fixed;
 u32 pf_guest;
 u32 tlb_flush;
 u32 invlpg;

 u32 exits;
 u32 io_exits;
 u32 mmio_exits;
 u32 signal_exits;
 u32 irq_window_exits;
 u32 halt_exits;
 u32 request_irq_exits;
 u32 irq_exits;
};

struct descriptor_table {
 u16 limit;
 unsigned long base;
} __attribute__((packed));

struct kvm_arch_ops {
 int (*cpu_has_kvm_support)(void);
 int (*disabled_by_bios)(void);
 void (*hardware_enable)(void *dummy);
 void (*hardware_disable)(void *dummy);
 int (*hardware_setup)(void);
 void (*hardware_unsetup)(void);

 int (*vcpu_create)(struct kvm_vcpu *vcpu);
 void (*vcpu_free)(struct kvm_vcpu *vcpu);

 void (*vcpu_load)(struct kvm_vcpu *vcpu);
 void (*vcpu_put)(struct kvm_vcpu *vcpu);
 void (*vcpu_decache)(struct kvm_vcpu *vcpu);

 int (*set_guest_debug)(struct kvm_vcpu *vcpu,
          struct kvm_debug_guest *dbg);
 int (*get_msr)(struct kvm_vcpu *vcpu, u32 msr_index, u64 *pdata);
 int (*set_msr)(struct kvm_vcpu *vcpu, u32 msr_index, u64 data);
 u64 (*get_segment_base)(struct kvm_vcpu *vcpu, int seg);
 void (*get_segment)(struct kvm_vcpu *vcpu,
       struct kvm_segment *var, int seg);
 void (*set_segment)(struct kvm_vcpu *vcpu,
       struct kvm_segment *var, int seg);
 void (*get_cs_db_l_bits)(struct kvm_vcpu *vcpu, int *db, int *l);
 void (*decache_cr0_cr4_guest_bits)(struct kvm_vcpu *vcpu);
 void (*set_cr0)(struct kvm_vcpu *vcpu, unsigned long cr0);
 void (*set_cr0_no_modeswitch)(struct kvm_vcpu *vcpu,
          unsigned long cr0);
 void (*set_cr3)(struct kvm_vcpu *vcpu, unsigned long cr3);
 void (*set_cr4)(struct kvm_vcpu *vcpu, unsigned long cr4);
 void (*set_efer)(struct kvm_vcpu *vcpu, u64 efer);
 void (*get_idt)(struct kvm_vcpu *vcpu, struct descriptor_table *dt);
 void (*set_idt)(struct kvm_vcpu *vcpu, struct descriptor_table *dt);
 void (*get_gdt)(struct kvm_vcpu *vcpu, struct descriptor_table *dt);
 void (*set_gdt)(struct kvm_vcpu *vcpu, struct descriptor_table *dt);
 unsigned long (*get_dr)(struct kvm_vcpu *vcpu, int dr);
 void (*set_dr)(struct kvm_vcpu *vcpu, int dr, unsigned long value,
         int *exception);
 void (*cache_regs)(struct kvm_vcpu *vcpu);
 void (*decache_regs)(struct kvm_vcpu *vcpu);
 unsigned long (*get_rflags)(struct kvm_vcpu *vcpu);
 void (*set_rflags)(struct kvm_vcpu *vcpu, unsigned long rflags);

 void (*invlpg)(struct kvm_vcpu *vcpu, gva_t addr);
 void (*tlb_flush)(struct kvm_vcpu *vcpu);
 void (*inject_page_fault)(struct kvm_vcpu *vcpu,
      unsigned long addr, u32 err_code);

 void (*inject_gp)(struct kvm_vcpu *vcpu, unsigned err_code);

 int (*run)(struct kvm_vcpu *vcpu, struct kvm_run *run);
 int (*vcpu_setup)(struct kvm_vcpu *vcpu);
 void (*skip_emulated_instruction)(struct kvm_vcpu *vcpu);
 void (*patch_hypercall)(struct kvm_vcpu *vcpu,
    unsigned char *hypercall_addr);
};

extern struct kvm_stat kvm_stat;
extern struct kvm_arch_ops *kvm_arch_ops;




int kvm_init_arch(struct kvm_arch_ops *ops, struct module *module);
void kvm_exit_arch(void);

void kvm_mmu_destroy(struct kvm_vcpu *vcpu);
int kvm_mmu_create(struct kvm_vcpu *vcpu);
int kvm_mmu_setup(struct kvm_vcpu *vcpu);

int kvm_mmu_reset_context(struct kvm_vcpu *vcpu);
void kvm_mmu_slot_remove_write_access(struct kvm_vcpu *vcpu, int slot);

hpa_t gpa_to_hpa(struct kvm_vcpu *vcpu, gpa_t gpa);


static inline __attribute__((always_inline)) int is_error_hpa(hpa_t hpa) { return hpa >> ((sizeof(hpa_t) * 8) - 1); }
hpa_t gva_to_hpa(struct kvm_vcpu *vcpu, gva_t gva);

void kvm_emulator_want_group7_invlpg(void);

extern hpa_t bad_page_address;

static inline __attribute__((always_inline)) struct page *gfn_to_page(struct kvm_memory_slot *slot, gfn_t gfn)
{
 return slot->phys_mem[gfn - slot->base_gfn];
}

struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn);
void mark_page_dirty(struct kvm *kvm, gfn_t gfn);

enum emulation_result {
 EMULATE_DONE,
 EMULATE_DO_MMIO,
 EMULATE_FAIL,
};

int emulate_instruction(struct kvm_vcpu *vcpu, struct kvm_run *run,
   unsigned long cr2, u16 error_code);
void realmode_lgdt(struct kvm_vcpu *vcpu, u16 size, unsigned long address);
void realmode_lidt(struct kvm_vcpu *vcpu, u16 size, unsigned long address);
void realmode_lmsw(struct kvm_vcpu *vcpu, unsigned long msw,
     unsigned long *rflags);

unsigned long realmode_get_cr(struct kvm_vcpu *vcpu, int cr);
void realmode_set_cr(struct kvm_vcpu *vcpu, int cr, unsigned long value,
       unsigned long *rflags);

struct x86_emulate_ctxt;

int emulate_invlpg(struct kvm_vcpu *vcpu, gva_t address);
int emulate_clts(struct kvm_vcpu *vcpu);
int emulator_get_dr(struct x86_emulate_ctxt* ctxt, int dr,
      unsigned long *dest);
int emulator_set_dr(struct x86_emulate_ctxt *ctxt, int dr,
      unsigned long value);

void set_cr0(struct kvm_vcpu *vcpu, unsigned long cr0);
void set_cr3(struct kvm_vcpu *vcpu, unsigned long cr0);
void set_cr4(struct kvm_vcpu *vcpu, unsigned long cr0);
void set_cr8(struct kvm_vcpu *vcpu, unsigned long cr0);
void lmsw(struct kvm_vcpu *vcpu, unsigned long msw);

int kvm_get_msr_common(struct kvm_vcpu *vcpu, u32 msr, u64 *pdata);
int kvm_set_msr_common(struct kvm_vcpu *vcpu, u32 msr, u64 data);

void fx_init(struct kvm_vcpu *vcpu);

void load_msrs(struct kvm_msr_entry *e, int n);
void save_msrs(struct kvm_msr_entry *e, int n);
void kvm_resched(struct kvm_vcpu *vcpu);

int kvm_read_guest(struct kvm_vcpu *vcpu,
        gva_t addr,
        unsigned long size,
        void *dest);

int kvm_write_guest(struct kvm_vcpu *vcpu,
  gva_t addr,
  unsigned long size,
  void *data);

unsigned long segment_base(u16 selector);

void kvm_mmu_pre_write(struct kvm_vcpu *vcpu, gpa_t gpa, int bytes);
void kvm_mmu_post_write(struct kvm_vcpu *vcpu, gpa_t gpa, int bytes);
int kvm_mmu_unprotect_page_virt(struct kvm_vcpu *vcpu, gva_t gva);
void kvm_mmu_free_some_pages(struct kvm_vcpu *vcpu);

int kvm_hypercall(struct kvm_vcpu *vcpu, struct kvm_run *run);

extern __attribute__((__stdcall__)) void DbgBreakPoint(void);


static inline __attribute__((always_inline)) void dump_context(struct kvm_mmu *context)
{
# 521 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h"
 return;
}

static inline __attribute__((always_inline)) int kvm_mmu_page_fault(struct kvm_vcpu *vcpu, gva_t gva,
          u32 error_code)
{




 if (vcpu->kvm->n_free_mmu_pages < 5)
  kvm_mmu_free_some_pages(vcpu);

 dump_context(&vcpu->mmu);

 return vcpu->mmu.page_fault(vcpu, gva, error_code);
}

static inline __attribute__((always_inline)) struct page *_gfn_to_page(struct kvm *kvm, gfn_t gfn)
{
 struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
 return (slot) ? slot->phys_mem[gfn - slot->base_gfn] : ((void *)0);
}

static inline __attribute__((always_inline)) int is_long_mode(struct kvm_vcpu *vcpu)
{



 return 0;

}

static inline __attribute__((always_inline)) int is_pae(struct kvm_vcpu *vcpu)
{
 return vcpu->cr4 & (1ULL << 5);
}

static inline __attribute__((always_inline)) int is_pse(struct kvm_vcpu *vcpu)
{
 return vcpu->cr4 & (1ULL << 4);
}

static inline __attribute__((always_inline)) int is_paging(struct kvm_vcpu *vcpu)
{
 return vcpu->cr0 & (1ULL << 31);
}

static inline __attribute__((always_inline)) int memslot_id(struct kvm *kvm, struct kvm_memory_slot *slot)
{
 return slot - kvm->memslots;
}

static inline __attribute__((always_inline)) struct kvm_mmu_page *page_header(hpa_t shadow_page)
{
 struct page *page = pfn_to_page(shadow_page >> 12);

 return (struct kvm_mmu_page *)((page)->private);
}

static inline __attribute__((always_inline)) u16 read_fs(void)
{
 u16 seg;
 asm ("mov %%fs, %0" : "=g"(seg));
 return seg;
}

static inline __attribute__((always_inline)) u16 read_gs(void)
{
 u16 seg;
 asm ("mov %%gs, %0" : "=g"(seg));
 return seg;
}

static inline __attribute__((always_inline)) u16 read_ldt(void)
{
 u16 ldt;
 asm ("sldt %0" : "=g"(ldt));
 return ldt;
}

static inline __attribute__((always_inline)) void load_fs(u16 sel)
{
 asm ("mov %0, %%fs" : : "rm"(sel));
}

static inline __attribute__((always_inline)) void load_gs(u16 sel)
{
 asm ("mov %0, %%gs" : : "rm"(sel));
}


static inline __attribute__((always_inline)) void load_ldt(u16 sel)
{
 asm ("lldt %0" : : "rm"(sel));
}


static inline __attribute__((always_inline)) void get_idt(struct descriptor_table *table)
{
 asm ("sidt %0" : "=m"(*table));
}

static inline __attribute__((always_inline)) void get_gdt(struct descriptor_table *table)
{
 asm ("sgdt %0" : "=m"(*table));
}

static inline __attribute__((always_inline)) unsigned long read_tr_base(void)
{
 u16 tr;
 asm ("str %0" : "=g"(tr));
 return segment_base(tr);
}
# 646 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h"
static inline __attribute__((always_inline)) void fx_save(void *image)
{
 asm ("fxsave (%0)":: "r" (image));
}

static inline __attribute__((always_inline)) void fx_restore(void *image)
{
 asm ("fxrstor (%0)":: "r" (image));
}

static inline __attribute__((always_inline)) void fpu_init(void)
{
 asm ("finit");
}

static inline __attribute__((always_inline)) u32 get_rdx_init_val(void)
{
 return 0x600;
}
# 13 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_svm.h" 2

static const u32 host_save_msrs[] = {




 0x00000174, 0x00000175, 0x00000176,
 0x000001d9,

};




struct vcpu_svm {
 struct vmcb *vmcb;
 unsigned long vmcb_pa;
 struct svm_cpu_data *svm_data;
 uint64_t asid_generation;

 unsigned long cr0;
 unsigned long cr4;
 unsigned long db_regs[4];

 u64 next_rip;

 u64 host_msrs[(sizeof(host_save_msrs) / sizeof((host_save_msrs)[0]) + (0))];
 unsigned long host_cr2;
 unsigned long host_db_regs[4];
 unsigned long host_dr6;
 unsigned long host_dr7;
};
# 33 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c" 2
# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/x86_emulate.h" 1
# 14 "/home/ddk50/vmware/winkvm/kvm/kernel/x86_emulate.h"
struct x86_emulate_ctxt;
# 54 "/home/ddk50/vmware/winkvm/kvm/kernel/x86_emulate.h"
struct x86_emulate_ops {







 int (*read_std)(unsigned long addr,
   unsigned long *val,
   unsigned int bytes, struct x86_emulate_ctxt * ctxt);
# 74 "/home/ddk50/vmware/winkvm/kvm/kernel/x86_emulate.h"
 int (*write_std)(unsigned long addr,
    unsigned long val,
    unsigned int bytes, struct x86_emulate_ctxt * ctxt);







 int (*read_emulated) (unsigned long addr,
         unsigned long *val,
         unsigned int bytes,
         struct x86_emulate_ctxt * ctxt);
# 96 "/home/ddk50/vmware/winkvm/kvm/kernel/x86_emulate.h"
 int (*write_emulated) (unsigned long addr,
          unsigned long val,
          unsigned int bytes,
          struct x86_emulate_ctxt * ctxt);
# 109 "/home/ddk50/vmware/winkvm/kvm/kernel/x86_emulate.h"
 int (*cmpxchg_emulated) (unsigned long addr,
     unsigned long old,
     unsigned long new,
     unsigned int bytes,
     struct x86_emulate_ctxt * ctxt);
# 127 "/home/ddk50/vmware/winkvm/kvm/kernel/x86_emulate.h"
 int (*cmpxchg8b_emulated) (unsigned long addr,
       unsigned long old_lo,
       unsigned long old_hi,
       unsigned long new_lo,
       unsigned long new_hi,
       struct x86_emulate_ctxt * ctxt);
};

struct cpu_user_regs;

struct x86_emulate_ctxt {

 struct kvm_vcpu *vcpu;


 unsigned long eflags;
 unsigned long cr2;


 int mode;

 unsigned long cs_base;
 unsigned long ds_base;
 unsigned long es_base;
 unsigned long ss_base;
 unsigned long gs_base;
 unsigned long fs_base;
};
# 174 "/home/ddk50/vmware/winkvm/kvm/kernel/x86_emulate.h"
int x86_emulate_memop(struct x86_emulate_ctxt *ctxt,
        struct x86_emulate_ops *ops);






void *decode_register(u8 modrm_reg, unsigned long *regs,
        int highbyte_regs);
# 34 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c" 2

;;
;;
# 55 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c"
unsigned long iopm_base;
unsigned long msrpm_base;

struct kvm_ldttss_desc {
 u16 limit0;
 u16 base0;
 unsigned base1 : 8, type : 5, dpl : 2, p : 1;
 unsigned limit1 : 4, zero0 : 3, g : 1, base2 : 8;
 u32 base3;
 u32 zero1;
} __attribute__((packed));

struct svm_cpu_data {
 int cpu;

 uint64_t asid_generation;
 uint32_t max_asid;
 uint32_t next_asid;
 struct kvm_ldttss_desc *tss_desc;

 struct page *save_area;
};




static struct svm_cpu_data *g_svm_data_[1];


struct svm_init_data {
 int cpu;
 int r;
};

static u32 msrpm_ranges[] = {0, 0xc0000000, 0xc0010000};







static unsigned get_addr_size(struct kvm_vcpu *vcpu)
{
 struct vmcb_save_area *sa = &vcpu->svm->vmcb->save;
 u16 cs_attrib;

 if (!(sa->cr0 & (1ULL << 0)) || (sa->rflags & 0x00020000))
  return 2;

 cs_attrib = sa->cs.attrib;

 return (cs_attrib & (1 << 9)) ? 8 :
    (cs_attrib & (1 << 10)) ? 4 : 2;
}

static inline __attribute__((always_inline)) u8 pop_irq(struct kvm_vcpu *vcpu)
{
 int word_index = __ffs(vcpu->irq_summary);
 int bit_index = __ffs(vcpu->irq_pending[word_index]);
 int irq = word_index * 32 + bit_index;

 clear_bit(bit_index, &vcpu->irq_pending[word_index]);
 if (!vcpu->irq_pending[word_index])
  clear_bit(word_index, &vcpu->irq_summary);
 return irq;
}

static inline __attribute__((always_inline)) void push_irq(struct kvm_vcpu *vcpu, u8 irq)
{
 set_bit(irq, vcpu->irq_pending);
 set_bit(irq / 32, &vcpu->irq_summary);
}

static inline __attribute__((always_inline)) void clgi(void)
{
 asm volatile (".byte 0x0f, 0x01, 0xdd");
}

static inline __attribute__((always_inline)) void stgi(void)
{
 asm volatile (".byte 0x0f, 0x01, 0xdc");
}

static inline __attribute__((always_inline)) void invlpga(unsigned long addr, u32 asid)
{
 asm volatile (".byte 0x0f, 0x01, 0xdf" :: "a"(addr), "c"(asid));
}

static inline __attribute__((always_inline)) unsigned long kvm_read_cr2(void)
{
 unsigned long cr2;

 asm volatile ("mov %%cr2, %0" : "=r" (cr2));
 return cr2;
}

static inline __attribute__((always_inline)) void kvm_write_cr2(unsigned long val)
{
 asm volatile ("mov %0, %%cr2" :: "r" (val));
}

static inline __attribute__((always_inline)) unsigned long read_dr6(void)
{
 unsigned long dr6;

 asm volatile ("mov %%dr6, %0" : "=r" (dr6));
 return dr6;
}

static inline __attribute__((always_inline)) void write_dr6(unsigned long val)
{
 asm volatile ("mov %0, %%dr6" :: "r" (val));
}

static inline __attribute__((always_inline)) unsigned long read_dr7(void)
{
 unsigned long dr7;

 asm volatile ("mov %%dr7, %0" : "=r" (dr7));
 return dr7;
}

static inline __attribute__((always_inline)) void write_dr7(unsigned long val)
{
 asm volatile ("mov %0, %%dr7" :: "r" (val));
}

static inline __attribute__((always_inline)) void force_new_asid(struct kvm_vcpu *vcpu)
{
 vcpu->svm->asid_generation--;
}

static inline __attribute__((always_inline)) void flush_guest_tlb(struct kvm_vcpu *vcpu)
{
 force_new_asid(vcpu);
}

static void svm_set_efer(struct kvm_vcpu *vcpu, u64 efer)
{
 if (!(efer & (1 << 10)))
  efer &= ~(1 << 8);

 vcpu->svm->vmcb->save.efer = efer | (1ULL << 12);
 vcpu->shadow_efer = efer;
}

static void svm_inject_gp(struct kvm_vcpu *vcpu, unsigned error_code)
{
 vcpu->svm->vmcb->control.event_inj = (1 << 31) |
      (1 << 11) |
      (3 << 8) |
      13;
 vcpu->svm->vmcb->control.event_inj_err = error_code;
}

static void inject_ud(struct kvm_vcpu *vcpu)
{
 vcpu->svm->vmcb->control.event_inj = (1 << 31) |
      (3 << 8) |
      6;
}

static void inject_db(struct kvm_vcpu *vcpu)
{
 vcpu->svm->vmcb->control.event_inj = (1 << 31) |
      (3 << 8) |
      1;
}

static int is_page_fault(uint32_t info)
{
 info &= 0xff | (7 << 8) | (1 << 31);
 return info == (14 | (1 << 31) | (3 << 8));
}

static int is_external_interrupt(u32 info)
{
 info &= (7 << 8) | (1 << 31);
 return info == ((1 << 31) | (0 << 8));
}

static void skip_emulated_instruction(struct kvm_vcpu *vcpu)
{
 if (!vcpu->svm->next_rip) {
  printk("<7>" "%s: NOP\n", __FUNCTION__);
  return;
 }
 if (vcpu->svm->next_rip - vcpu->svm->vmcb->save.rip > 15) {
  printk("<3>" "%s: ip 0x%llx next 0x%llx\n",
         __FUNCTION__,
         vcpu->svm->vmcb->save.rip,
         vcpu->svm->next_rip);
 }

 vcpu->rip = vcpu->svm->vmcb->save.rip = vcpu->svm->next_rip;
 vcpu->svm->vmcb->control.int_state &= ~1;

 vcpu->interrupt_window_open = 1;
}

static int has_svm(void)
{
 uint32_t eax, ebx, ecx, edx;







 printk("<6>" "%s %d implement me!\n", __FUNCTION__, 266);


 cpuid(0x80000000, &eax, &ebx, &ecx, &edx);
 if (eax < 0x8000000a) {
  printk("<6>" "has_svm: can't execute cpuid_8000000a\n");
  return 0;
 }

 cpuid(0x80000001, &eax, &ebx, &ecx, &edx);
 if (!(ecx & (1 << 2))) {
  printk("<7>" "has_svm: svm not available\n");
  return 0;
 }
 return 1;
}

static void svm_hardware_disable(void *garbage)
{
 struct svm_cpu_data *svm_data
  = (g_svm_data_[(raw_smp_processor_id())]);

 if (svm_data) {
  uint64_t efer;

  native_write_msr(0xc0010117ULL, 0);
  ((efer) = native_read_msr(0xc0000080));
  native_write_msr(0xc0000080, efer & ~(1ULL << 12));

  (g_svm_data_[(raw_smp_processor_id())]) = ((void *)0);

  __free_page(svm_data->save_area);
  kfree(svm_data);
 }
}

static void svm_hardware_enable(void *garbage)
{

 struct svm_cpu_data *svm_data;
 uint64_t efer;



 struct Xgt_desc_struct gdt_descr;

 struct desc_struct *gdt;
 int me = raw_smp_processor_id();

 if (!has_svm()) {
  printk("<3>" "svm_cpu_init: err EOPNOTSUPP on %d\n", me);
  return;
 }

 svm_data = (g_svm_data_[(me)]);

 if (!svm_data) {
  printk("<3>" "svm_cpu_init: svm_data is NULL on %d\n",
         me);
  return;
 }

 svm_data->asid_generation = 1;
 svm_data->max_asid = cpuid_ebx(0x8000000a) - 1;
 svm_data->next_asid = svm_data->max_asid + 1;

 asm volatile ( "sgdt %0" : "=m"(gdt_descr) );
 gdt = (struct desc_struct *)gdt_descr.address;
 svm_data->tss_desc = (struct kvm_ldttss_desc *)(gdt + (4));

 ((efer) = native_read_msr(0xc0000080));
 native_write_msr(0xc0000080, efer | (1ULL << 12));

 native_write_msr(0xc0010117ULL, page_to_pfn(svm_data->save_area) << 12);

}

static int svm_cpu_init(int cpu)
{
 struct svm_cpu_data *svm_data;
 int r;

 svm_data = kzalloc(sizeof(struct svm_cpu_data), ((0x10u) | (0x40u) | (0x80u)));
 if (!svm_data)
  return -12;
 svm_data->cpu = cpu;
 svm_data->save_area = alloc_page(((0x10u) | (0x40u) | (0x80u)));
 r = -12;
 if (!svm_data->save_area)
  goto err_1;

 (g_svm_data_[(cpu)]) = svm_data;

 return 0;

err_1:
 kfree(svm_data);
 return r;

}

static int set_msr_interception(u32 *msrpm, unsigned msr,
    int read, int write)
{
 int i;

 for (i = 0; i < (sizeof(msrpm_ranges) / sizeof((msrpm_ranges)[0]) + (0)); i++) {
  if (msr >= msrpm_ranges[i] &&
      msr < msrpm_ranges[i] + (2048 * 8 / 2)) {
   u32 msr_offset = (i * (2048 * 8 / 2) + msr -
       msrpm_ranges[i]) * 2;

   u32 *base = msrpm + (msr_offset / 32);
   u32 msr_shift = msr_offset % 32;
   u32 mask = ((write) ? 0 : 2) | ((read) ? 0 : 1);
   *base = (*base & ~(0x3 << msr_shift)) |
    (mask << msr_shift);
   return 1;
  }
 }
 printk("<7>" "%s: not found 0x%x\n", __FUNCTION__, msr);
 return 0;
}

static int svm_hardware_setup(void)
{
 int cpu;
 struct page *iopm_pages;
 struct page *msrpm_pages;
 void *msrpm_va;
 int r;

 kvm_emulator_want_group7_invlpg();

 iopm_pages = alloc_pages(((0x10u) | (0x40u) | (0x80u)), 2);

 if (!iopm_pages)
  return -12;
 memset(page_address(iopm_pages), 0xff,
     (1UL << 12) * (1 << 2));
 iopm_base = page_to_pfn(iopm_pages) << 12;


 msrpm_pages = alloc_pages(((0x10u) | (0x40u) | (0x80u)), 1);

 r = -12;
 if (!msrpm_pages)
  goto err_1;

 msrpm_va = page_address(msrpm_pages);
 memset(msrpm_va, 0xff, (1UL << 12) * (1 << 1));
 msrpm_base = page_to_pfn(msrpm_pages) << 12;
# 427 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c"
 set_msr_interception(msrpm_va, 0xc0000081, 1, 1);
 set_msr_interception(msrpm_va, 0x00000174, 1, 1);
 set_msr_interception(msrpm_va, 0x00000175, 1, 1);
 set_msr_interception(msrpm_va, 0x00000176, 1, 1);

 for ((cpu) = first_cpu(); (cpu) < get_nr_cpus(); (cpu) = next_cpu((cpu))) {
  r = svm_cpu_init(cpu);
  if (r)
   goto err_2;
 }
 return 0;

err_2:
 __free_pages(msrpm_pages, 1);
 msrpm_base = 0;
err_1:
 __free_pages(iopm_pages, 2);
 iopm_base = 0;
 return r;
}

static void svm_hardware_unsetup(void)
{
 __free_pages(pfn_to_page(msrpm_base >> 12), 1);
 __free_pages(pfn_to_page(iopm_base >> 12), 2);
 iopm_base = msrpm_base = 0;
}

static void init_seg(struct vmcb_seg *seg)
{
 seg->selector = 0;
 seg->attrib = (1 << 7) | (1 << 4) |
  (1 << 1);
 seg->limit = 0xffff;
 seg->base = 0;
}

static void init_sys_seg(struct vmcb_seg *seg, uint32_t type)
{
 seg->selector = 0;
 seg->attrib = (1 << 7) | type;
 seg->limit = 0xffff;
 seg->base = 0;
}

static int svm_vcpu_setup(struct kvm_vcpu *vcpu)
{
 return 0;
}

static void init_vmcb(struct vmcb *vmcb)
{
 struct vmcb_control_area *control = &vmcb->control;
 struct vmcb_save_area *save = &vmcb->save;
 u64 tsc;

 control->intercept_cr_read = 1 |
     (1 << 3) |
     (1 << 4);

 control->intercept_cr_write = 1 |
     (1 << 3) |
     (1 << 4);

 control->intercept_dr_read = 1 |
     (1 << 1) |
     (1 << 2) |
     (1 << 3);

 control->intercept_dr_write = 1 |
     (1 << 1) |
     (1 << 2) |
     (1 << 3) |
     (1 << 5) |
     (1 << 7);

 control->intercept_exceptions = 1 << 14;


 control->intercept = (1ULL << INTERCEPT_INTR) |
    (1ULL << INTERCEPT_NMI) |
    (1ULL << INTERCEPT_SMI) |
# 520 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c"
    (1ULL << INTERCEPT_CPUID) |
    (1ULL << INTERCEPT_HLT) |
    (1ULL << INTERCEPT_INVLPGA) |
    (1ULL << INTERCEPT_IOIO_PROT) |
    (1ULL << INTERCEPT_MSR_PROT) |
    (1ULL << INTERCEPT_TASK_SWITCH) |
    (1ULL << INTERCEPT_SHUTDOWN) |
    (1ULL << INTERCEPT_VMRUN) |
    (1ULL << INTERCEPT_VMMCALL) |
    (1ULL << INTERCEPT_VMLOAD) |
    (1ULL << INTERCEPT_VMSAVE) |
    (1ULL << INTERCEPT_STGI) |
    (1ULL << INTERCEPT_CLGI) |
    (1ULL << INTERCEPT_SKINIT);

 control->iopm_base_pa = iopm_base;
 control->msrpm_base_pa = msrpm_base;
 ((tsc) = native_read_tsc());
 control->tsc_offset = -tsc;
 control->int_ctl = (1 << 24);

 init_seg(&save->es);
 init_seg(&save->ss);
 init_seg(&save->ds);
 init_seg(&save->fs);
 init_seg(&save->gs);

 save->cs.selector = 0xf000;

 save->cs.attrib = (1 << 1) | (1 << 7) |
  (1 << 4) | (1 << 3);
 save->cs.limit = 0xffff;






 save->cs.base = 0xf0000;

 save->gdtr.limit = 0xffff;
 save->idtr.limit = 0xffff;

 init_sys_seg(&save->ldtr, 2);
 init_sys_seg(&save->tr, 3);

 save->efer = (1ULL << 12);

        save->dr6 = 0xffff0ff0;
 save->dr7 = 0x400;
 save->rflags = 2;
 save->rip = 0x0000fff0;





 save->cr0 = 0x00000010 | (1ULL << 31) | (1ULL << 16);
 save->cr4 = (1ULL << 5);

}

static int svm_create_vcpu(struct kvm_vcpu *vcpu)
{
 struct page *page;
 int r;

 r = -12;
 vcpu->svm = kzalloc(sizeof *vcpu->svm, ((0x10u) | (0x40u) | (0x80u)));
 if (!vcpu->svm)
  goto out1;
 page = alloc_page(((0x10u) | (0x40u) | (0x80u)));
 if (!page)
  goto out2;

 vcpu->svm->vmcb = page_address(page);
 memset(vcpu->svm->vmcb, 0, (1UL << 12));
 vcpu->svm->vmcb_pa = page_to_pfn(page) << 12;
 vcpu->svm->cr0 = 0x00000010;
 vcpu->svm->asid_generation = 0;
 memset(vcpu->svm->db_regs, 0, sizeof(vcpu->svm->db_regs));
 init_vmcb(vcpu->svm->vmcb);

 fx_init(vcpu);

 return 0;

out2:
 kfree(vcpu->svm);
out1:
 return r;
}

static void svm_free_vcpu(struct kvm_vcpu *vcpu)
{
 if (!vcpu->svm)
  return;
 if (vcpu->svm->vmcb)
  __free_page(pfn_to_page(vcpu->svm->vmcb_pa >> 12));
 kfree(vcpu->svm);
}

static void svm_vcpu_load(struct kvm_vcpu *vcpu)
{
 get_cpu();
}

static void svm_vcpu_put(struct kvm_vcpu *vcpu)
{
 put_cpu();
}

static void svm_vcpu_decache(struct kvm_vcpu *vcpu)
{
}

static void svm_cache_regs(struct kvm_vcpu *vcpu)
{
 vcpu->regs[VCPU_REGS_RAX] = vcpu->svm->vmcb->save.rax;
 vcpu->regs[VCPU_REGS_RSP] = vcpu->svm->vmcb->save.rsp;
 vcpu->rip = vcpu->svm->vmcb->save.rip;
}

static void svm_decache_regs(struct kvm_vcpu *vcpu)
{
 vcpu->svm->vmcb->save.rax = vcpu->regs[VCPU_REGS_RAX];
 vcpu->svm->vmcb->save.rsp = vcpu->regs[VCPU_REGS_RSP];
 vcpu->svm->vmcb->save.rip = vcpu->rip;
}

static unsigned long svm_get_rflags(struct kvm_vcpu *vcpu)
{
 return vcpu->svm->vmcb->save.rflags;
}

static void svm_set_rflags(struct kvm_vcpu *vcpu, unsigned long rflags)
{
 vcpu->svm->vmcb->save.rflags = rflags;
}

static struct vmcb_seg *svm_seg(struct kvm_vcpu *vcpu, int seg)
{
 struct vmcb_save_area *save = &vcpu->svm->vmcb->save;

 switch (seg) {
 case VCPU_SREG_CS: return &save->cs;
 case VCPU_SREG_DS: return &save->ds;
 case VCPU_SREG_ES: return &save->es;
 case VCPU_SREG_FS: return &save->fs;
 case VCPU_SREG_GS: return &save->gs;
 case VCPU_SREG_SS: return &save->ss;
 case VCPU_SREG_TR: return &save->tr;
 case VCPU_SREG_LDTR: return &save->ldtr;
 }
 do { } while(0);;
 return ((void *)0);
}

static u64 svm_get_segment_base(struct kvm_vcpu *vcpu, int seg)
{
 struct vmcb_seg *s = svm_seg(vcpu, seg);

 return s->base;
}

static void svm_get_segment(struct kvm_vcpu *vcpu,
       struct kvm_segment *var, int seg)
{
 struct vmcb_seg *s = svm_seg(vcpu, seg);

 var->base = s->base;
 var->limit = s->limit;
 var->selector = s->selector;
 var->type = s->attrib & (0xf);
 var->s = (s->attrib >> 4) & 1;
 var->dpl = (s->attrib >> 5) & 3;
 var->present = (s->attrib >> 7) & 1;
 var->avl = (s->attrib >> 8) & 1;
 var->l = (s->attrib >> 9) & 1;
 var->db = (s->attrib >> 10) & 1;
 var->g = (s->attrib >> 11) & 1;
 var->unusable = !var->present;
}

static void svm_get_cs_db_l_bits(struct kvm_vcpu *vcpu, int *db, int *l)
{
 struct vmcb_seg *s = svm_seg(vcpu, VCPU_SREG_CS);

 *db = (s->attrib >> 10) & 1;
 *l = (s->attrib >> 9) & 1;
}

static void svm_get_idt(struct kvm_vcpu *vcpu, struct descriptor_table *dt)
{
 dt->limit = vcpu->svm->vmcb->save.idtr.limit;
 dt->base = vcpu->svm->vmcb->save.idtr.base;
}

static void svm_set_idt(struct kvm_vcpu *vcpu, struct descriptor_table *dt)
{
 vcpu->svm->vmcb->save.idtr.limit = dt->limit;
 vcpu->svm->vmcb->save.idtr.base = dt->base ;
}

static void svm_get_gdt(struct kvm_vcpu *vcpu, struct descriptor_table *dt)
{
 dt->limit = vcpu->svm->vmcb->save.gdtr.limit;
 dt->base = vcpu->svm->vmcb->save.gdtr.base;
}

static void svm_set_gdt(struct kvm_vcpu *vcpu, struct descriptor_table *dt)
{
 vcpu->svm->vmcb->save.gdtr.limit = dt->limit;
 vcpu->svm->vmcb->save.gdtr.base = dt->base ;
}

static void svm_decache_cr0_cr4_guest_bits(struct kvm_vcpu *vcpu)
{
}

static void svm_set_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
{
# 755 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c"
 vcpu->svm->cr0 = cr0;
 vcpu->svm->vmcb->save.cr0 = cr0 | (1ULL << 31) | (1ULL << 16);
 vcpu->cr0 = cr0;
}

static void svm_set_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
{
       vcpu->cr4 = cr4;
       vcpu->svm->vmcb->save.cr4 = cr4 | (1ULL << 5);
}

static void svm_set_segment(struct kvm_vcpu *vcpu,
       struct kvm_segment *var, int seg)
{
 struct vmcb_seg *s = svm_seg(vcpu, seg);

 s->base = var->base;
 s->limit = var->limit;
 s->selector = var->selector;
 if (var->unusable)
  s->attrib = 0;
 else {
  s->attrib = (var->type & (0xf));
  s->attrib |= (var->s & 1) << 4;
  s->attrib |= (var->dpl & 3) << 5;
  s->attrib |= (var->present & 1) << 7;
  s->attrib |= (var->avl & 1) << 8;
  s->attrib |= (var->l & 1) << 9;
  s->attrib |= (var->db & 1) << 10;
  s->attrib |= (var->g & 1) << 11;
 }
 if (seg == VCPU_SREG_CS)
  vcpu->svm->vmcb->save.cpl
   = (vcpu->svm->vmcb->save.cs.attrib
      >> 5) & 3;

}
# 800 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c"
static int svm_guest_debug(struct kvm_vcpu *vcpu, struct kvm_debug_guest *dbg)
{
 return -95;
}

static void load_host_msrs(struct kvm_vcpu *vcpu)
{
 int i;

 for ( i = 0; i < (sizeof(host_save_msrs) / sizeof((host_save_msrs)[0]) + (0)); i++)
  native_write_msr(host_save_msrs[i], vcpu->svm->host_msrs[i]);
}

static void save_host_msrs(struct kvm_vcpu *vcpu)
{
 int i;

 for ( i = 0; i < (sizeof(host_save_msrs) / sizeof((host_save_msrs)[0]) + (0)); i++)
  ((vcpu->svm->host_msrs[i]) = native_read_msr(host_save_msrs[i]));
}

static void new_asid(struct kvm_vcpu *vcpu, struct svm_cpu_data *svm_data)
{
 if (svm_data->next_asid > svm_data->max_asid) {
  ++svm_data->asid_generation;
  svm_data->next_asid = 1;
  vcpu->svm->vmcb->control.tlb_ctl = 1;
 }

 vcpu->cpu = svm_data->cpu;
 vcpu->svm->asid_generation = svm_data->asid_generation;
 vcpu->svm->vmcb->control.asid = svm_data->next_asid++;
}

static void svm_invlpg(struct kvm_vcpu *vcpu, gva_t address)
{
 invlpga(address, vcpu->svm->vmcb->control.asid);
}

static unsigned long svm_get_dr(struct kvm_vcpu *vcpu, int dr)
{
 return vcpu->svm->db_regs[dr];
}

static void svm_set_dr(struct kvm_vcpu *vcpu, int dr, unsigned long value,
         int *exception)
{
 *exception = 0;

 if (vcpu->svm->vmcb->save.dr7 & (1 << 13)) {
  vcpu->svm->vmcb->save.dr7 &= ~(1 << 13);
  vcpu->svm->vmcb->save.dr6 |= (1 << 13);
  *exception = 1;
  return;
 }

 switch (dr) {
 case 0 ... 3:
  vcpu->svm->db_regs[dr] = value;
  return;
 case 4 ... 5:
  if (vcpu->cr4 & (1UL << 3)) {
   *exception = 6;
   return;
  }
 case 7: {
  if (value & ~((1ULL << 32) - 1)) {
   *exception = 13;
   return;
  }
  vcpu->svm->vmcb->save.dr7 = value;
  return;
 }
 default:
  printk("<7>" "%s: unexpected dr %u\n",
         __FUNCTION__, dr);
  *exception = 6;
  return;
 }
}

static int pf_interception(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 u32 exit_int_info = vcpu->svm->vmcb->control.exit_int_info;
 u64 fault_address;
 u32 error_code;
 enum emulation_result er;
 int r;

 if (is_external_interrupt(exit_int_info))
  push_irq(vcpu, exit_int_info & 0xff);

 spin_lock(&vcpu->kvm->lock);

 fault_address = vcpu->svm->vmcb->control.exit_info_2;
 error_code = vcpu->svm->vmcb->control.exit_info_1;
 r = kvm_mmu_page_fault(vcpu, fault_address, error_code);
 if (r < 0) {
  spin_unlock(&vcpu->kvm->lock);
  return r;
 }
 if (!r) {
  spin_unlock(&vcpu->kvm->lock);
  return 1;
 }
 er = emulate_instruction(vcpu, kvm_run, fault_address, error_code);
 spin_unlock(&vcpu->kvm->lock);

 switch (er) {
 case EMULATE_DONE:
  return 1;
 case EMULATE_DO_MMIO:
  ++kvm_stat.mmio_exits;
  kvm_run->exit_reason = KVM_EXIT_MMIO;
  return 0;
 case EMULATE_FAIL:
  printk("<7>" "%s: emulate fail\n", __FUNCTION__);
  break;
 default:
  do { } while(0);;
 }

 kvm_run->exit_reason = KVM_EXIT_UNKNOWN;
 return 0;
}

static int shutdown_interception(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{




 memset(vcpu->svm->vmcb, 0, (1UL << 12));
 init_vmcb(vcpu->svm->vmcb);

 kvm_run->exit_reason = KVM_EXIT_SHUTDOWN;
 return 0;
}

static int io_get_override(struct kvm_vcpu *vcpu,
     struct vmcb_seg **seg,
     int *addr_override)
{
 u8 inst[15];
 unsigned ins_length;
 gva_t rip;
 int i;

 rip = vcpu->svm->vmcb->save.rip;
 ins_length = vcpu->svm->next_rip - rip;
 rip += vcpu->svm->vmcb->save.cs.base;

 if (ins_length > 15)
  printk("<7>"
         "%s: inst length err, cs base 0x%llx rip 0x%llx "
         "next rip 0x%llx ins_length %u\n",
         __FUNCTION__,
         vcpu->svm->vmcb->save.cs.base,
         vcpu->svm->vmcb->save.rip,
         vcpu->svm->vmcb->control.exit_info_2,
         ins_length);

 if (kvm_read_guest(vcpu, rip, ins_length, inst) != ins_length)

  return 0;

 *addr_override = 0;
 *seg = ((void *)0);
 for (i = 0; i < ins_length; i++)
  switch (inst[i]) {
  case 0xf0:
  case 0xf2:
  case 0xf3:
  case 0x66:
   continue;
  case 0x67:
   *addr_override = 1;
   continue;
  case 0x2e:
   *seg = &vcpu->svm->vmcb->save.cs;
   continue;
  case 0x36:
   *seg = &vcpu->svm->vmcb->save.ss;
   continue;
  case 0x3e:
   *seg = &vcpu->svm->vmcb->save.ds;
   continue;
  case 0x26:
   *seg = &vcpu->svm->vmcb->save.es;
   continue;
  case 0x64:
   *seg = &vcpu->svm->vmcb->save.fs;
   continue;
  case 0x65:
   *seg = &vcpu->svm->vmcb->save.gs;
   continue;
  default:
   return 1;
  }
 printk("<7>" "%s: unexpected\n", __FUNCTION__);
 return 0;
}

static unsigned long io_adress(struct kvm_vcpu *vcpu, int ins, u64 *address)
{
 unsigned long addr_mask;
 unsigned long *reg;
 struct vmcb_seg *seg;
 int addr_override;
 struct vmcb_save_area *save_area = &vcpu->svm->vmcb->save;
 u16 cs_attrib = save_area->cs.attrib;
 unsigned addr_size = get_addr_size(vcpu);

 if (!io_get_override(vcpu, &seg, &addr_override))
  return 0;

 if (addr_override)
  addr_size = (addr_size == 2) ? 4: (addr_size >> 1);

 if (ins) {
  reg = &vcpu->regs[VCPU_REGS_RDI];
  seg = &vcpu->svm->vmcb->save.es;
 } else {
  reg = &vcpu->regs[VCPU_REGS_RSI];
  seg = (seg) ? seg : &vcpu->svm->vmcb->save.ds;
 }

 addr_mask = ~0ULL >> (64 - (addr_size * 8));

 if ((cs_attrib & (1 << 9)) &&
     !(vcpu->svm->vmcb->save.rflags & 0x00020000)) {
  *address = (*reg & addr_mask);
  return addr_mask;
 }

 if (!(seg->attrib & 7)) {
  svm_inject_gp(vcpu, 0);
  return 0;
 }

 *address = (*reg & addr_mask) + seg->base;
 return addr_mask;
}

static int io_interception(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 u32 io_info = vcpu->svm->vmcb->control.exit_info_1;
 int _in = io_info & 1;

 ++kvm_stat.io_exits;

 vcpu->svm->next_rip = vcpu->svm->vmcb->control.exit_info_2;

 kvm_run->exit_reason = KVM_EXIT_IO;
 kvm_run->io.port = io_info >> 16;
 kvm_run->io.direction = (_in) ? 0 : 1;
 kvm_run->io.size = ((io_info & (7 << 4)) >> 4);
 kvm_run->io.string = (io_info & (1 << 2)) != 0;
 kvm_run->io.rep = (io_info & (1 << 3)) != 0;

 if (kvm_run->io.string) {
  unsigned addr_mask;

  addr_mask = io_adress(vcpu, _in, &kvm_run->io.address);
  if (!addr_mask) {
   printk("<7>" "%s: get io address failed\n",
          __FUNCTION__);
   return 1;
  }

  if (kvm_run->io.rep) {
   kvm_run->io.count
    = vcpu->regs[VCPU_REGS_RCX] & addr_mask;
   kvm_run->io.string_down = (vcpu->svm->vmcb->save.rflags
         & 0x00000400) != 0;
  }
 } else
  kvm_run->io.value = vcpu->svm->vmcb->save.rax;
 return 0;
}

static int nop_on_interception(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 return 1;
}

static int halt_interception(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 vcpu->svm->next_rip = vcpu->svm->vmcb->save.rip + 1;
 skip_emulated_instruction(vcpu);
 if (vcpu->irq_summary)
  return 1;

 kvm_run->exit_reason = KVM_EXIT_HLT;
 ++kvm_stat.halt_exits;
 return 0;
}

static int vmmcall_interception(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 vcpu->svm->next_rip = vcpu->svm->vmcb->save.rip + 3;
 skip_emulated_instruction(vcpu);
 return kvm_hypercall(vcpu, kvm_run);
}

static int invalid_op_interception(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 inject_ud(vcpu);
 return 1;
}

static int task_switch_interception(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 printk("<7>" "%s: task swiche is unsupported\n", __FUNCTION__);
 kvm_run->exit_reason = KVM_EXIT_UNKNOWN;
 return 0;
}

static int cpuid_interception(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 vcpu->svm->next_rip = vcpu->svm->vmcb->save.rip + 2;
 kvm_run->exit_reason = KVM_EXIT_CPUID;
 return 0;
}

static int emulate_on_interception(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 if (emulate_instruction(vcpu, ((void *)0), 0, 0) != EMULATE_DONE)
  printk("<3>" "%s: failed\n", __FUNCTION__);
 return 1;
}

static int svm_get_msr(struct kvm_vcpu *vcpu, unsigned ecx, u64 *data)
{
 switch (ecx) {
 case 0x010: {
  u64 tsc;

  ((tsc) = native_read_tsc());
  *data = vcpu->svm->vmcb->control.tsc_offset + tsc;
  break;
 }
 case 0xc0000081:
  *data = vcpu->svm->vmcb->save.star;
  break;
# 1159 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c"
 case 0x00000174:
  *data = vcpu->svm->vmcb->save.sysenter_cs;
  break;
 case 0x00000176:
  *data = vcpu->svm->vmcb->save.sysenter_eip;
  break;
 case 0x00000175:
  *data = vcpu->svm->vmcb->save.sysenter_esp;
  break;
 default:
  return kvm_get_msr_common(vcpu, ecx, data);
 }
 return 0;
}

static int rdmsr_interception(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 u32 ecx = vcpu->regs[VCPU_REGS_RCX];
 u64 data;

 if (svm_get_msr(vcpu, ecx, &data))
  svm_inject_gp(vcpu, 0);
 else {
  vcpu->svm->vmcb->save.rax = data & 0xffffffff;
  vcpu->regs[VCPU_REGS_RDX] = data >> 32;
  vcpu->svm->next_rip = vcpu->svm->vmcb->save.rip + 2;
  skip_emulated_instruction(vcpu);
 }
 return 1;
}

static int svm_set_msr(struct kvm_vcpu *vcpu, unsigned ecx, u64 data)
{
 switch (ecx) {
 case 0x010: {
  u64 tsc;

  ((tsc) = native_read_tsc());
  vcpu->svm->vmcb->control.tsc_offset = data - tsc;
  break;
 }
 case 0xc0000081:
  vcpu->svm->vmcb->save.star = data;
  break;
# 1217 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c"
 case 0x00000174:
  vcpu->svm->vmcb->save.sysenter_cs = data;
  break;
 case 0x00000176:
  vcpu->svm->vmcb->save.sysenter_eip = data;
  break;
 case 0x00000175:
  vcpu->svm->vmcb->save.sysenter_esp = data;
  break;
 default:
  return kvm_set_msr_common(vcpu, ecx, data);
 }
 return 0;
}

static int wrmsr_interception(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 u32 ecx = vcpu->regs[VCPU_REGS_RCX];
 u64 data = (vcpu->svm->vmcb->save.rax & -1u)
  | ((u64)(vcpu->regs[VCPU_REGS_RDX] & -1u) << 32);
 vcpu->svm->next_rip = vcpu->svm->vmcb->save.rip + 2;
 if (svm_set_msr(vcpu, ecx, data))
  svm_inject_gp(vcpu, 0);
 else
  skip_emulated_instruction(vcpu);
 return 1;
}

static int msr_interception(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 if (vcpu->svm->vmcb->control.exit_info_1)
  return wrmsr_interception(vcpu, kvm_run);
 else
  return rdmsr_interception(vcpu, kvm_run);
}

static int interrupt_window_interception(struct kvm_vcpu *vcpu,
       struct kvm_run *kvm_run)
{




 if (kvm_run->request_interrupt_window &&
     !vcpu->irq_summary) {
  ++kvm_stat.irq_window_exits;
  kvm_run->exit_reason = KVM_EXIT_IRQ_WINDOW_OPEN;
  return 0;
 }

 return 1;
}

static int (*svm_exit_handlers[])(struct kvm_vcpu *vcpu,
          struct kvm_run *kvm_run) = {
 [0x000] = emulate_on_interception,
 [0x003] = emulate_on_interception,
 [0x004] = emulate_on_interception,

 [0x010] = emulate_on_interception,
 [0x013] = emulate_on_interception,
 [0x014] = emulate_on_interception,
 [0x020] = emulate_on_interception,
 [0x021] = emulate_on_interception,
 [0x022] = emulate_on_interception,
 [0x023] = emulate_on_interception,
 [0x030] = emulate_on_interception,
 [0x031] = emulate_on_interception,
 [0x032] = emulate_on_interception,
 [0x033] = emulate_on_interception,
 [0x035] = emulate_on_interception,
 [0x037] = emulate_on_interception,
 [0x040 + 14] = pf_interception,
 [0x060] = nop_on_interception,
 [0x061] = nop_on_interception,
 [0x062] = nop_on_interception,
 [0x063] = nop_on_interception,
 [0x064] = interrupt_window_interception,

 [0x072] = cpuid_interception,
 [0x078] = halt_interception,
 [0x079] = emulate_on_interception,
 [0x07a] = invalid_op_interception,
 [0x07b] = io_interception,
 [0x07c] = msr_interception,
 [0x07d] = task_switch_interception,
 [0x07f] = shutdown_interception,
 [0x080] = invalid_op_interception,
 [0x081] = vmmcall_interception,
 [0x082] = invalid_op_interception,
 [0x083] = invalid_op_interception,
 [0x084] = invalid_op_interception,
 [0x085] = invalid_op_interception,
 [0x086] = invalid_op_interception,
};


static int handle_exit(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 u32 exit_code = vcpu->svm->vmcb->control.exit_code;

 kvm_run->exit_type = 2;

 if (is_external_interrupt(vcpu->svm->vmcb->control.exit_int_info) &&
     exit_code != 0x040 + 14)
  printk("<3>" "%s: unexpected exit_ini_info 0x%x "
         "exit_code 0x%x\n",
         __FUNCTION__, vcpu->svm->vmcb->control.exit_int_info,
         exit_code);

 if (exit_code >= (sizeof(svm_exit_handlers) / sizeof((svm_exit_handlers)[0]) + (0))
     || svm_exit_handlers[exit_code] == 0) {
  kvm_run->exit_reason = KVM_EXIT_UNKNOWN;
  printk("<3>" "%s: 0x%x @ 0x%llx cr0 0x%lx rflags 0x%llx\n",
         __FUNCTION__,
         exit_code,
         vcpu->svm->vmcb->save.rip,
         vcpu->cr0,
         vcpu->svm->vmcb->save.rflags);
  return 0;
 }

 return svm_exit_handlers[exit_code](vcpu, kvm_run);
}

static void reload_tss(struct kvm_vcpu *vcpu)
{
 int cpu = raw_smp_processor_id();
 struct svm_cpu_data *svm_data;

 svm_data = (g_svm_data_[(cpu)]);
 svm_data->tss_desc->type = 9;
 load_TR_desc();
}

static void pre_svm_run(struct kvm_vcpu *vcpu)
{
 int cpu = raw_smp_processor_id();

 struct svm_cpu_data *svm_data = (g_svm_data_[(cpu)]);

 vcpu->svm->vmcb->control.tlb_ctl = 0;
 if (vcpu->cpu != cpu ||
     vcpu->svm->asid_generation != svm_data->asid_generation)
  new_asid(vcpu, svm_data);
}


static inline __attribute__((always_inline)) void kvm_do_inject_irq(struct kvm_vcpu *vcpu)
{
 struct vmcb_control_area *control;

 control = &vcpu->svm->vmcb->control;
 control->int_vector = pop_irq(vcpu);
 control->int_ctl &= ~(0x0f << 16);
 control->int_ctl |= (1 << 8) |
  (( 0xf) << 16);
}

static void kvm_reput_irq(struct kvm_vcpu *vcpu)
{
 struct vmcb_control_area *control = &vcpu->svm->vmcb->control;

 if (control->int_ctl & (1 << 8)) {
  control->int_ctl &= ~(1 << 8);
  push_irq(vcpu, control->int_vector);
 }

 vcpu->interrupt_window_open =
  !(control->int_state & 1);
}

static void do_interrupt_requests(struct kvm_vcpu *vcpu,
           struct kvm_run *kvm_run)
{
 struct vmcb_control_area *control = &vcpu->svm->vmcb->control;

 vcpu->interrupt_window_open =
  (!(control->int_state & 1) &&
   (vcpu->svm->vmcb->save.rflags & 0x00000200));

 if (vcpu->interrupt_window_open && vcpu->irq_summary)



  kvm_do_inject_irq(vcpu);




 if (!vcpu->interrupt_window_open &&
     (vcpu->irq_summary || kvm_run->request_interrupt_window)) {
  control->intercept |= 1ULL << INTERCEPT_VINTR;
 } else
  control->intercept &= ~(1ULL << INTERCEPT_VINTR);
}

static void post_kvm_run_save(struct kvm_vcpu *vcpu,
         struct kvm_run *kvm_run)
{
 kvm_run->ready_for_interrupt_injection = (vcpu->interrupt_window_open &&
        vcpu->irq_summary == 0);
 kvm_run->if_flag = (vcpu->svm->vmcb->save.rflags & 0x00000200) != 0;
 kvm_run->cr8 = vcpu->cr8;
 kvm_run->apic_base = vcpu->apic_base;
}







static int dm_request_for_irq_injection(struct kvm_vcpu *vcpu,
       struct kvm_run *kvm_run)
{
 return (!vcpu->irq_summary &&
  kvm_run->request_interrupt_window &&
  vcpu->interrupt_window_open &&
  (vcpu->svm->vmcb->save.rflags & 0x00000200));
}

static void save_db_regs(unsigned long *db_regs)
{
 asm volatile ("mov %%dr0, %0" : "=r"(db_regs[0]));
 asm volatile ("mov %%dr1, %0" : "=r"(db_regs[1]));
 asm volatile ("mov %%dr2, %0" : "=r"(db_regs[2]));
 asm volatile ("mov %%dr3, %0" : "=r"(db_regs[3]));
}

static void load_db_regs(unsigned long *db_regs)
{
 asm volatile ("mov %0, %%dr0" : : "r"(db_regs[0]));
 asm volatile ("mov %0, %%dr1" : : "r"(db_regs[1]));
 asm volatile ("mov %0, %%dr2" : : "r"(db_regs[2]));
 asm volatile ("mov %0, %%dr3" : : "r"(db_regs[3]));
}

static int svm_vcpu_run(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 u16 fs_selector;
 u16 gs_selector;
 u16 ldt_selector;
 int r;

again:
 if (!vcpu->mmio_read_completed)
  do_interrupt_requests(vcpu, kvm_run);

 clgi();

 pre_svm_run(vcpu);

 save_host_msrs(vcpu);
 fs_selector = read_fs();
 gs_selector = read_gs();
 ldt_selector = read_ldt();
 vcpu->svm->host_cr2 = kvm_read_cr2();
 vcpu->svm->host_dr6 = read_dr6();
 vcpu->svm->host_dr7 = read_dr7();
 vcpu->svm->vmcb->save.cr2 = vcpu->cr2;

 if (vcpu->svm->vmcb->save.dr7 & 0xff) {
  write_dr7(0);
  save_db_regs(vcpu->svm->host_db_regs);
  load_db_regs(vcpu->svm->db_regs);
 }

 fx_save(vcpu->host_fx_image);
 fx_restore(vcpu->guest_fx_image);

 asm volatile (






  "push %%ebx; push %%ecx; push %%edx;"
  "push %%esi; push %%edi; push %%ebp;"
# 1515 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c"
  "mov %c[rbx](%[vcpu]), %%ebx \n\t"
  "mov %c[rcx](%[vcpu]), %%ecx \n\t"
  "mov %c[rdx](%[vcpu]), %%edx \n\t"
  "mov %c[rsi](%[vcpu]), %%esi \n\t"
  "mov %c[rdi](%[vcpu]), %%edi \n\t"
  "mov %c[rbp](%[vcpu]), %%ebp \n\t"
# 1534 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c"
  "push %%eax \n\t"
  "mov %c[svm](%[vcpu]), %%eax \n\t"
  "mov %c[vmcb](%%eax), %%eax \n\t"
  ".byte 0x0f, 0x01, 0xda" "\n\t"
  ".byte 0x0f, 0x01, 0xd8" "\n\t"
  ".byte 0x0f, 0x01, 0xdb" "\n\t"
  "pop %%eax \n\t"
# 1565 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c"
  "mov %%ebx, %c[rbx](%[vcpu]) \n\t"
  "mov %%ecx, %c[rcx](%[vcpu]) \n\t"
  "mov %%edx, %c[rdx](%[vcpu]) \n\t"
  "mov %%esi, %c[rsi](%[vcpu]) \n\t"
  "mov %%edi, %c[rdi](%[vcpu]) \n\t"
  "mov %%ebp, %c[rbp](%[vcpu]) \n\t"

  "pop  %%ebp; pop  %%edi; pop  %%esi;"
  "pop  %%edx; pop  %%ecx; pop  %%ebx; \n\t"

  :
  : [vcpu]"a"(vcpu),
    [svm]"i"(__builtin_offsetof(struct kvm_vcpu,svm)),
    [vmcb]"i"(__builtin_offsetof(struct vcpu_svm,vmcb_pa)),
    [rbx]"i"(__builtin_offsetof(struct kvm_vcpu,regs[VCPU_REGS_RBX])),
    [rcx]"i"(__builtin_offsetof(struct kvm_vcpu,regs[VCPU_REGS_RCX])),
    [rdx]"i"(__builtin_offsetof(struct kvm_vcpu,regs[VCPU_REGS_RDX])),
    [rsi]"i"(__builtin_offsetof(struct kvm_vcpu,regs[VCPU_REGS_RSI])),
    [rdi]"i"(__builtin_offsetof(struct kvm_vcpu,regs[VCPU_REGS_RDI])),
    [rbp]"i"(__builtin_offsetof(struct kvm_vcpu,regs[VCPU_REGS_RBP]))
# 1595 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c"
  : "cc", "memory" );

 fx_save(vcpu->guest_fx_image);
 fx_restore(vcpu->host_fx_image);

 if ((vcpu->svm->vmcb->save.dr7 & 0xff))
  load_db_regs(vcpu->svm->host_db_regs);

 vcpu->cr2 = vcpu->svm->vmcb->save.cr2;

 write_dr6(vcpu->svm->host_dr6);
 write_dr7(vcpu->svm->host_dr7);
 kvm_write_cr2(vcpu->svm->host_cr2);

 load_fs(fs_selector);
 load_gs(gs_selector);
 load_ldt(ldt_selector);
 load_host_msrs(vcpu);

 reload_tss(vcpu);
# 1625 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c"
 stgi();

 kvm_reput_irq(vcpu);

 vcpu->svm->next_rip = 0;

 if (vcpu->svm->vmcb->control.exit_code == -1) {
  kvm_run->exit_type = 1;
  kvm_run->exit_reason = vcpu->svm->vmcb->control.exit_code;
  post_kvm_run_save(vcpu, kvm_run);
  return 0;
 }

 r = handle_exit(vcpu, kvm_run);
 if (r > 0) {
# 1651 "/home/ddk50/vmware/winkvm/kvm/kernel/svm.c"
  if (dm_request_for_irq_injection(vcpu, kvm_run)) {
   ++kvm_stat.request_irq_exits;
   post_kvm_run_save(vcpu, kvm_run);
   return -4;
  }
  kvm_resched(vcpu);
  goto again;
 }
 post_kvm_run_save(vcpu, kvm_run);
 return r;
}

static void svm_flush_tlb(struct kvm_vcpu *vcpu)
{
 force_new_asid(vcpu);
}

static void svm_set_cr3(struct kvm_vcpu *vcpu, unsigned long root)
{
 vcpu->svm->vmcb->save.cr3 = root;
 force_new_asid(vcpu);
}

static void svm_inject_page_fault(struct kvm_vcpu *vcpu,
      unsigned long addr,
      uint32_t err_code)
{
 uint32_t exit_int_info = vcpu->svm->vmcb->control.exit_int_info;

 ++kvm_stat.pf_guest;

 if (is_page_fault(exit_int_info)) {

  vcpu->svm->vmcb->control.event_inj_err = 0;
  vcpu->svm->vmcb->control.event_inj = (1 << 31) |
       (1 << 11) |
       (3 << 8) |
       8;
  return;
 }
 vcpu->cr2 = addr;
 vcpu->svm->vmcb->save.cr2 = addr;
 vcpu->svm->vmcb->control.event_inj = (1 << 31) |
      (1 << 11) |
      (3 << 8) |
      14;
 vcpu->svm->vmcb->control.event_inj_err = err_code;
}


static int is_disabled(void)
{
 return 0;
}

static void
svm_patch_hypercall(struct kvm_vcpu *vcpu, unsigned char *hypercall)
{



 hypercall[0] = 0x0f;
 hypercall[1] = 0x01;
 hypercall[2] = 0xd9;
 hypercall[3] = 0xc3;
}

static struct kvm_arch_ops svm_arch_ops = {
 .cpu_has_kvm_support = has_svm,
 .disabled_by_bios = is_disabled,
 .hardware_setup = svm_hardware_setup,
 .hardware_unsetup = svm_hardware_unsetup,
 .hardware_enable = svm_hardware_enable,
 .hardware_disable = svm_hardware_disable,

 .vcpu_create = svm_create_vcpu,
 .vcpu_free = svm_free_vcpu,

 .vcpu_load = svm_vcpu_load,
 .vcpu_put = svm_vcpu_put,
 .vcpu_decache = svm_vcpu_decache,

 .set_guest_debug = svm_guest_debug,
 .get_msr = svm_get_msr,
 .set_msr = svm_set_msr,
 .get_segment_base = svm_get_segment_base,
 .get_segment = svm_get_segment,
 .set_segment = svm_set_segment,
 .get_cs_db_l_bits = svm_get_cs_db_l_bits,
 .decache_cr0_cr4_guest_bits = svm_decache_cr0_cr4_guest_bits,
 .set_cr0 = svm_set_cr0,
 .set_cr0_no_modeswitch = svm_set_cr0,
 .set_cr3 = svm_set_cr3,
 .set_cr4 = svm_set_cr4,
 .set_efer = svm_set_efer,
 .get_idt = svm_get_idt,
 .set_idt = svm_set_idt,
 .get_gdt = svm_get_gdt,
 .set_gdt = svm_set_gdt,
 .get_dr = svm_get_dr,
 .set_dr = svm_set_dr,
 .cache_regs = svm_cache_regs,
 .decache_regs = svm_decache_regs,
 .get_rflags = svm_get_rflags,
 .set_rflags = svm_set_rflags,

 .invlpg = svm_invlpg,
 .tlb_flush = svm_flush_tlb,
 .inject_page_fault = svm_inject_page_fault,

 .inject_gp = svm_inject_gp,

 .run = svm_vcpu_run,
 .skip_emulated_instruction = skip_emulated_instruction,
 .vcpu_setup = svm_vcpu_setup,
 .patch_hypercall = svm_patch_hypercall,
};

static int svm_init(void)
{
 return kvm_init_arch(&svm_arch_ops, ((void *)0));
}

static void svm_exit(void)
{
 kvm_exit_arch();
}



