# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c"
# 1 "/cygdrive/z/winkvm/windows-linux-compat//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./include/linux/autoconf.h" 1
# 1 "<command-line>" 2
# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c"
# 27 "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c"
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

# 1 "include/asm/msr-index.h" 1
# 11 "include/linux/winkvmstab.h" 2
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
# 28 "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c" 2
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
# 29 "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c" 2

# 1 "include/asm/processor-flags.h" 1
# 31 "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c" 2


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
# 34 "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c" 2
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
# 35 "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c" 2
# 44 "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c"
static void kvm_mmu_audit(struct kvm_vcpu *vcpu, const char *msg) {}
# 165 "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c"
struct kvm_rmap_desc {
 u64 *shadow_ptes[4];
 struct kvm_rmap_desc *more;
};

static int is_write_protection(struct kvm_vcpu *vcpu)
{
 return vcpu->cr0 & (1ULL << 16);
}

static int is_cpuid_PSE36(void)
{
 return 1;
}

static int is_nx(struct kvm_vcpu *vcpu)
{
 return vcpu->shadow_efer & (1<<11);
}

static int is_present_pte(unsigned long pte)
{
 return pte & (1ULL << 0);
}

static int is_writeble_pte(unsigned long pte)
{
 return pte & (1ULL << 1);
}

static int is_io_pte(unsigned long pte)
{
 return pte & (1ULL << 9);
}

static int is_rmap_pte(u64 pte)
{
 return (pte & ((1ULL << 1) | (1ULL << 0)))
  == ((1ULL << 1) | (1ULL << 0));
}

static int mmu_topup_memory_cache(struct kvm_mmu_memory_cache *cache,
      size_t objsize, int min)
{
 void *obj;

 ;

 if (cache->nobjs >= min) {
  ;
  return 0;
 }

 while (cache->nobjs < (sizeof(cache->objects) / sizeof((cache->objects)[0]) + (0))) {
  obj = kzalloc(objsize, (((0x20u)) & ~(0x20u)));
  if (!obj) {
   ;
   return -12;
  }
  cache->objects[cache->nobjs++] = obj;
 }

 ;
 return 0;
}

static void mmu_free_memory_cache(struct kvm_mmu_memory_cache *mc)
{
 ;
 while (mc->nobjs)
  kfree(mc->objects[--mc->nobjs]);
 ;
}

static int mmu_topup_memory_caches(struct kvm_vcpu *vcpu)
{
 int r;

 ;

 r = mmu_topup_memory_cache(&vcpu->mmu_pte_chain_cache,
       sizeof(struct kvm_pte_chain), 4);
 if (r)
  goto out;
 r = mmu_topup_memory_cache(&vcpu->mmu_rmap_desc_cache,
       sizeof(struct kvm_rmap_desc), 1);
out:
 ;
 return r;
}

static void mmu_free_memory_caches(struct kvm_vcpu *vcpu)
{
 mmu_free_memory_cache(&vcpu->mmu_pte_chain_cache);
 mmu_free_memory_cache(&vcpu->mmu_rmap_desc_cache);
}

static void *mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc,
        size_t size)
{
 void *p;

 do { if (!mc->nobjs) { printk("assert: %s", __FUNCTION__); } } while(0);;
 p = mc->objects[--mc->nobjs];
 memset(p, 0, size);
 return p;
}

static void mmu_memory_cache_free(struct kvm_mmu_memory_cache *mc, void *obj)
{
 ;
 if (mc->nobjs < 20)
  mc->objects[mc->nobjs++] = obj;
 else
  kfree(obj);
 ;
}

static struct kvm_pte_chain *mmu_alloc_pte_chain(struct kvm_vcpu *vcpu)
{
 return mmu_memory_cache_alloc(&vcpu->mmu_pte_chain_cache,
          sizeof(struct kvm_pte_chain));
}

static void mmu_free_pte_chain(struct kvm_vcpu *vcpu,
          struct kvm_pte_chain *pc)
{
 mmu_memory_cache_free(&vcpu->mmu_pte_chain_cache, pc);
}

static struct kvm_rmap_desc *mmu_alloc_rmap_desc(struct kvm_vcpu *vcpu)
{
 void *ptr;
 ;
 ptr = mmu_memory_cache_alloc(&vcpu->mmu_rmap_desc_cache,
          sizeof(struct kvm_rmap_desc));
 ;
 return ptr;
}

static void mmu_free_rmap_desc(struct kvm_vcpu *vcpu,
          struct kvm_rmap_desc *rd)
{
 ;
 mmu_memory_cache_free(&vcpu->mmu_rmap_desc_cache, rd);
 ;
}
# 322 "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c"
static void rmap_add(struct kvm_vcpu *vcpu, u64 *spte)
{
 struct page *page;
 struct kvm_rmap_desc *desc;
 int i;

 ;

 if (!is_rmap_pte(*spte)) {
  ;
  return;
 }

 page = pfn_to_page((*spte & (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1))) >> 12);
 if (!((page)->private)) {
  do { } while (0);
  ((page)->private = ((unsigned long)spte));
 } else if (!(((page)->private) & 1)) {
  do { } while (0);
  desc = mmu_alloc_rmap_desc(vcpu);
  desc->shadow_ptes[0] = (u64 *)((page)->private);
  desc->shadow_ptes[1] = spte;
  ((page)->private = ((unsigned long)desc | 1));
 } else {
  do { } while (0);
  desc = (struct kvm_rmap_desc *)(((page)->private) & ~1ul);
  while (desc->shadow_ptes[4 -1] && desc->more)
   desc = desc->more;
  if (desc->shadow_ptes[4 -1]) {
   desc->more = mmu_alloc_rmap_desc(vcpu);
   desc = desc->more;
  }
  for (i = 0; desc->shadow_ptes[i]; ++i)
   ;
  desc->shadow_ptes[i] = spte;
 }

 ;
}

static void rmap_desc_remove_entry(struct kvm_vcpu *vcpu,
       struct page *page,
       struct kvm_rmap_desc *desc,
       int i,
       struct kvm_rmap_desc *prev_desc)
{
 int j;

 for (j = 4 - 1; !desc->shadow_ptes[j] && j > i; --j)
  ;
 desc->shadow_ptes[i] = desc->shadow_ptes[j];
 desc->shadow_ptes[j] = ((void *)0);
 if (j != 0)
  return;
 if (!prev_desc && !desc->more)
  ((page)->private = ((unsigned long)desc->shadow_ptes[0]));
 else
  if (prev_desc)
   prev_desc->more = desc->more;
  else
   ((page)->private = ((unsigned long)desc->more | 1));
 mmu_free_rmap_desc(vcpu, desc);
}

static void rmap_remove(struct kvm_vcpu *vcpu, u64 *spte)
{
 struct page *page;
 struct kvm_rmap_desc *desc;
 struct kvm_rmap_desc *prev_desc;
 int i;

 if (!is_rmap_pte(*spte))
  return;
 page = pfn_to_page((*spte & (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1))) >> 12);
 if (!((page)->private)) {
  printk("<3>" "rmap_remove: %p %llx 0->BUG\n", spte, *spte);
  do { } while(0);;
 } else if (!(((page)->private) & 1)) {
  do { } while (0);
  if ((u64 *)((page)->private) != spte) {
   printk("<3>" "rmap_remove:  %p %llx 1->BUG\n",
          spte, *spte);
   do { } while(0);;
  }
  ((page)->private = (0));
 } else {
  do { } while (0);
  desc = (struct kvm_rmap_desc *)(((page)->private) & ~1ul);
  prev_desc = ((void *)0);
  while (desc) {
   for (i = 0; i < 4 && desc->shadow_ptes[i]; ++i)
    if (desc->shadow_ptes[i] == spte) {
     rmap_desc_remove_entry(vcpu, page,
              desc, i,
              prev_desc);
     return;
    }
   prev_desc = desc;
   desc = desc->more;
  }
  do { } while(0);;
 }
}

static void rmap_write_protect(struct kvm_vcpu *vcpu, u64 gfn)
{
 struct kvm *kvm = vcpu->kvm;
 struct page *page;
 struct kvm_memory_slot *slot;
 struct kvm_rmap_desc *desc;
 u64 *spte;

 slot = gfn_to_memslot(kvm, gfn);
 do { if (!slot) { printk("assert: %s", __FUNCTION__); } } while(0);;
 page = gfn_to_page(slot, gfn);

 while (((page)->private)) {
  if (!(((page)->private) & 1))
   spte = (u64 *)((page)->private);
  else {
   desc = (struct kvm_rmap_desc *)(((page)->private) & ~1ul);
   spte = desc->shadow_ptes[0];
  }
  do { if (!spte) { printk("assert: %s", __FUNCTION__); } } while(0);;
  do { if ((*spte & (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1))) >> 12 != page_to_pfn(page)) { printk("assert: %s", __FUNCTION__); } } while(0);;

  do { if (!(*spte & (1ULL << 0))) { printk("assert: %s", __FUNCTION__); } } while(0);;
  do { if (!(*spte & (1ULL << 1))) { printk("assert: %s", __FUNCTION__); } } while(0);;
  do { } while (0);
  rmap_remove(vcpu, spte);
  kvm_arch_ops->tlb_flush(vcpu);
  *spte &= ~(u64)(1ULL << 1);
 }
}

static int is_empty_shadow_page(hpa_t page_hpa)
{
 u64 *pos;
 u64 *end;

 for (pos = __va(page_hpa), end = pos + (1UL << 12) / sizeof(u64);
        pos != end; pos++)
  if (*pos != 0) {
   printk("<3>" "%s: %p %llx\n", __FUNCTION__,
          pos, *pos);
   return 0;
  }
 return 1;
}

static void kvm_mmu_free_page(struct kvm_vcpu *vcpu, hpa_t page_hpa)
{
 struct kvm_mmu_page *page_head = page_header(page_hpa);

 if (!(is_empty_shadow_page(page_hpa))) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 476, "is_empty_shadow_page(page_hpa)"); };
 list_del(&page_head->link);
 page_head->page_hpa = page_hpa;
 list_add(&page_head->link, &vcpu->free_pages);
 ++vcpu->kvm->n_free_mmu_pages;
}

static unsigned kvm_page_table_hashfn(gfn_t gfn)
{
 return gfn;
}

static struct kvm_mmu_page *kvm_mmu_alloc_page(struct kvm_vcpu *vcpu,
            u64 *parent_pte)
{
 struct kvm_mmu_page *page;

 if (list_empty(&vcpu->free_pages))
  return ((void *)0);

 page = ({ const typeof( ((struct kvm_mmu_page *)0)->link ) *__mptr = (vcpu->free_pages.next); (struct kvm_mmu_page *)( (char *)__mptr - __builtin_offsetof(struct kvm_mmu_page,link) );});
 list_del(&page->link);
 list_add(&page->link, &vcpu->kvm->active_mmu_pages);
 if (!(is_empty_shadow_page(page->page_hpa))) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 499, "is_empty_shadow_page(page->page_hpa)"); };
 page->slot_bitmap = 0;
 page->global = 1;
 page->multimapped = 0;
 page->parent_pte = parent_pte;
 --vcpu->kvm->n_free_mmu_pages;
 return page;
}

static void mmu_page_add_parent_pte(struct kvm_vcpu *vcpu,
        struct kvm_mmu_page *page, u64 *parent_pte)
{
 struct kvm_pte_chain *pte_chain;
 struct hlist_node *node;
 int i;

 if (!parent_pte)
  return;
 if (!page->multimapped) {
  u64 *old = page->parent_pte;

  if (!old) {
   page->parent_pte = parent_pte;
   return;
  }
  page->multimapped = 1;
  pte_chain = mmu_alloc_pte_chain(vcpu);
  ((&page->parent_ptes)->first = ((void *)0));
  hlist_add_head(&pte_chain->link, &page->parent_ptes);
  pte_chain->parent_ptes[0] = old;
 }
 for (node = (&page->parent_ptes)->first; node && ({ prefetch(node->next); 1;}) && ({ pte_chain = ({ const typeof( ((typeof(*pte_chain) *)0)->link ) *__mptr = (node); (typeof(*pte_chain) *)( (char *)__mptr - __builtin_offsetof(typeof(*pte_chain),link) );}); 1;}); node = node->next) {
  if (pte_chain->parent_ptes[5 -1])
   continue;
  for (i = 0; i < 5; ++i)
   if (!pte_chain->parent_ptes[i]) {
    pte_chain->parent_ptes[i] = parent_pte;
    return;
   }
 }
 pte_chain = mmu_alloc_pte_chain(vcpu);
 do { if (!pte_chain) { printk("assert: %s", __FUNCTION__); } } while(0);;
 hlist_add_head(&pte_chain->link, &page->parent_ptes);
 pte_chain->parent_ptes[0] = parent_pte;
}

static void mmu_page_remove_parent_pte(struct kvm_vcpu *vcpu,
           struct kvm_mmu_page *page,
           u64 *parent_pte)
{
 struct kvm_pte_chain *pte_chain;
 struct hlist_node *node;
 int i;

 if (!page->multimapped) {
  do { if (page->parent_pte != parent_pte) { printk("assert: %s", __FUNCTION__); } } while(0);;
  page->parent_pte = ((void *)0);
  return;
 }
 for (node = (&page->parent_ptes)->first; node && ({ prefetch(node->next); 1;}) && ({ pte_chain = ({ const typeof( ((typeof(*pte_chain) *)0)->link ) *__mptr = (node); (typeof(*pte_chain) *)( (char *)__mptr - __builtin_offsetof(typeof(*pte_chain),link) );}); 1;}); node = node->next)
  for (i = 0; i < 5; ++i) {
   if (!pte_chain->parent_ptes[i])
    break;
   if (pte_chain->parent_ptes[i] != parent_pte)
    continue;
   while (i + 1 < 5
    && pte_chain->parent_ptes[i + 1]) {
    pte_chain->parent_ptes[i]
     = pte_chain->parent_ptes[i + 1];
    ++i;
   }
   pte_chain->parent_ptes[i] = ((void *)0);
   if (i == 0) {
    hlist_del(&pte_chain->link);
    mmu_free_pte_chain(vcpu, pte_chain);
    if (hlist_empty(&page->parent_ptes)) {
     page->multimapped = 0;
     page->parent_pte = ((void *)0);
    }
   }
   return;
  }
 do { } while(0);;
}

static struct kvm_mmu_page *kvm_mmu_lookup_page(struct kvm_vcpu *vcpu,
      gfn_t gfn)
{
 unsigned index;
 struct hlist_head *bucket;
 struct kvm_mmu_page *page;
 struct hlist_node *node;

 do { } while (0);
 index = kvm_page_table_hashfn(gfn) % 256;
 bucket = &vcpu->kvm->mmu_page_hash[index];
 for (node = (bucket)->first; node && ({ prefetch(node->next); 1;}) && ({ page = ({ const typeof( ((typeof(*page) *)0)->hash_link ) *__mptr = (node); (typeof(*page) *)( (char *)__mptr - __builtin_offsetof(typeof(*page),hash_link) );}); 1;}); node = node->next)
  if (page->gfn == gfn && !page->role.metaphysical) {
   do { } while (0);

   return page;
  }
 return ((void *)0);
}

static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
          gfn_t gfn,
          gva_t gaddr,
          unsigned level,
          int metaphysical,
          u64 *parent_pte)
{
 union kvm_mmu_page_role role;
 unsigned index;
 unsigned quadrant;
 struct hlist_head *bucket;
 struct kvm_mmu_page *page;
 struct hlist_node *node;

 ;

 role.word = 0;
 role.glevels = vcpu->mmu.root_level;
 role.level = level;
 role.metaphysical = metaphysical;
 if (vcpu->mmu.root_level <= 2) {
  quadrant = gaddr >> (12 + (9 * level));
  quadrant &= (1 << ((10 - 9) * level)) - 1;
  role.quadrant = quadrant;
 }
 do { } while (0);

 index = kvm_page_table_hashfn(gfn) % 256;
 bucket = &vcpu->kvm->mmu_page_hash[index];
 for (node = (bucket)->first; node && ({ prefetch(node->next); 1;}) && ({ page = ({ const typeof( ((typeof(*page) *)0)->hash_link ) *__mptr = (node); (typeof(*page) *)( (char *)__mptr - __builtin_offsetof(typeof(*page),hash_link) );}); 1;}); node = node->next)
  if (page->gfn == gfn && page->role.word == role.word) {
   mmu_page_add_parent_pte(vcpu, page, parent_pte);
   do { } while (0);
   ;
   return page;
  }
 page = kvm_mmu_alloc_page(vcpu, parent_pte);
 if (!page) {
  ;
  return page;
 }
 do { } while (0);
 page->gfn = gfn;
 page->role = role;
 hlist_add_head(&page->hash_link, bucket);
 if (!metaphysical)
  rmap_write_protect(vcpu, gfn);
 ;
 return page;
}

static void kvm_mmu_page_unlink_children(struct kvm_vcpu *vcpu,
      struct kvm_mmu_page *page)
{
 unsigned i;
 u64 *pt;
 u64 ent;

 pt = __va(page->page_hpa);

 if (page->role.level == 1) {
  for (i = 0; i < (1 << 9); ++i) {
   if (pt[i] & (1ULL << 0))
    rmap_remove(vcpu, &pt[i]);
   pt[i] = 0;
  }
  kvm_arch_ops->tlb_flush(vcpu);
  return;
 }

 for (i = 0; i < (1 << 9); ++i) {
  ent = pt[i];

  pt[i] = 0;
  if (!(ent & (1ULL << 0)))
   continue;
  ent &= (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1));
  mmu_page_remove_parent_pte(vcpu, page_header(ent), &pt[i]);
 }
}

static void kvm_mmu_put_page(struct kvm_vcpu *vcpu,
        struct kvm_mmu_page *page,
        u64 *parent_pte)
{
 mmu_page_remove_parent_pte(vcpu, page, parent_pte);
}

static void kvm_mmu_zap_page(struct kvm_vcpu *vcpu,
        struct kvm_mmu_page *page)
{
 u64 *parent_pte;

 while (page->multimapped || page->parent_pte) {
  if (!page->multimapped)
   parent_pte = page->parent_pte;
  else {
   struct kvm_pte_chain *chain;

   chain = ({ const typeof( ((struct kvm_pte_chain *)0)->link ) *__mptr = (page->parent_ptes.first); (struct kvm_pte_chain *)( (char *)__mptr - __builtin_offsetof(struct kvm_pte_chain,link) );});

   parent_pte = chain->parent_ptes[0];
  }
  do { if (!parent_pte) { printk("assert: %s", __FUNCTION__); } } while(0);;
  kvm_mmu_put_page(vcpu, page, parent_pte);
  *parent_pte = 0;
 }
 kvm_mmu_page_unlink_children(vcpu, page);
 if (!page->root_count) {
  hlist_del(&page->hash_link);
  kvm_mmu_free_page(vcpu, page->page_hpa);
 } else {
  list_del(&page->link);
  list_add(&page->link, &vcpu->kvm->active_mmu_pages);
 }
}

static int kvm_mmu_unprotect_page(struct kvm_vcpu *vcpu, gfn_t gfn)
{
 unsigned index;
 struct hlist_head *bucket;
 struct kvm_mmu_page *page;
 struct hlist_node *node, *n;
 int r;

 do { } while (0);
 r = 0;
 index = kvm_page_table_hashfn(gfn) % 256;
 bucket = &vcpu->kvm->mmu_page_hash[index];
 for (node = (bucket)->first; node && ({ n = node->next; 1; }) && ({ page = ({ const typeof( ((typeof(*page) *)0)->hash_link ) *__mptr = (node); (typeof(*page) *)( (char *)__mptr - __builtin_offsetof(typeof(*page),hash_link) );}); 1;}); node = n)
  if (page->gfn == gfn && !page->role.metaphysical) {
   do { } while (0);

   kvm_mmu_zap_page(vcpu, page);
   r = 1;
  }
 return r;
}

static void page_header_update_slot(struct kvm *kvm, void *pte, gpa_t gpa)
{
 ;

 int slot = memslot_id(kvm, gfn_to_memslot(kvm, gpa >> 12));
 struct kvm_mmu_page *page_head = page_header(__pa(pte));

 __set_bit(slot, &page_head->slot_bitmap);

 ;
}

hpa_t safe_gpa_to_hpa(struct kvm_vcpu *vcpu, gpa_t gpa)
{
 hpa_t hpa = gpa_to_hpa(vcpu, gpa);

 return is_error_hpa(hpa) ? bad_page_address | (gpa & ~(~((1UL << 12)-1))) : hpa;
}

hpa_t gpa_to_hpa(struct kvm_vcpu *vcpu, gpa_t gpa)
{
 struct kvm_memory_slot *slot;
 struct page *page;

 if (!((gpa & ((hpa_t)1 << ((sizeof(hpa_t) * 8) - 1))) == 0)) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 767, "(gpa & HPA_ERR_MASK) == 0"); };
 slot = gfn_to_memslot(vcpu->kvm, gpa >> 12);
 if (!slot)
  return gpa | ((hpa_t)1 << ((sizeof(hpa_t) * 8) - 1));
 page = gfn_to_page(slot, gpa >> 12);
 return ((hpa_t)page_to_pfn(page) << 12)
  | (gpa & ((1UL << 12)-1));
}

hpa_t gva_to_hpa(struct kvm_vcpu *vcpu, gva_t gva)
{
 gpa_t gpa = vcpu->mmu.gva_to_gpa(vcpu, gva);

 if (gpa == (~(gpa_t)0))
  return (~(gpa_t)0);
 return gpa_to_hpa(vcpu, gpa);
}

void nonpaging_new_cr3(struct kvm_vcpu *vcpu)
{
}

static int nonpaging_map(struct kvm_vcpu *vcpu, gva_t v, hpa_t p)
{
 int level = 3;
 hpa_t table_addr = vcpu->mmu.root_hpa;

 ;

 for (; ; level--) {
  u32 index = (((v) >> ( 12 + (level - 1) * 9 )) & ((1 << 9) - 1));
  u64 *table;
  u64 pte;

  if (!(((table_addr) != (~(hpa_t)0)))) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 801, "VALID_PAGE(table_addr)"); };
  table = __va(table_addr);

  if (level == 1) {
   pte = table[index];
   if (is_present_pte(pte) && is_writeble_pte(pte)) {
    ;
    return 0;
   }
   mark_page_dirty(vcpu->kvm, v >> 12);
   page_header_update_slot(vcpu->kvm, table, v);
   table[index] = p | (1ULL << 0) | (1ULL << 1) |
        (1ULL << 2);
   rmap_add(vcpu, &table[index]);
   ;
   return 0;
  }

  if (table[index] == 0) {
   struct kvm_mmu_page *new_table;
   gfn_t pseudo_gfn;

   pseudo_gfn = (v & ((((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1)) & ~((1ULL << (12 + 9)) - 1)))
    >> 12;
   new_table = kvm_mmu_get_page(vcpu, pseudo_gfn,
           v, level - 1,
           1, &table[index]);
   if (!new_table) {
    do { } while (0);
    ;
    return -12;
   }

   table[index] = new_table->page_hpa | (1ULL << 0)
    | (1ULL << 1) | (1ULL << 2);
  }
  table_addr = table[index] & (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1));
 }
}

static void mmu_free_roots(struct kvm_vcpu *vcpu)
{
 int i;
 struct kvm_mmu_page *page;
# 857 "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c"
 for (i = 0; i < 4; ++i) {
  hpa_t root = vcpu->mmu.pae_root[i];

  if (!(((root) != (~(hpa_t)0)))) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 860, "VALID_PAGE(root)"); };
  root &= (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1));
  page = page_header(root);
  --page->root_count;
  vcpu->mmu.pae_root[i] = (~(hpa_t)0);
 }
 vcpu->mmu.root_hpa = (~(hpa_t)0);
}

static void mmu_alloc_roots(struct kvm_vcpu *vcpu)
{
 int i;
 gfn_t root_gfn;
 struct kvm_mmu_page *page;

 root_gfn = vcpu->cr3 >> 12;
# 890 "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c"
 for (i = 0; i < 4; ++i) {
  hpa_t root = vcpu->mmu.pae_root[i];

  if (!(!((root) != (~(hpa_t)0)))) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 893, "!VALID_PAGE(root)"); };
  if (vcpu->mmu.root_level == 3)
   root_gfn = vcpu->pdptrs[i] >> 12;
  else if (vcpu->mmu.root_level == 0)
   root_gfn = 0;
  page = kvm_mmu_get_page(vcpu, root_gfn, i << 30,
     2, !is_paging(vcpu),
     ((void *)0));
  root = page->page_hpa;
  ++page->root_count;
  vcpu->mmu.pae_root[i] = root | (1ULL << 0);
 }
 vcpu->mmu.root_hpa = __pa(vcpu->mmu.pae_root);
}

gpa_t nonpaging_gva_to_gpa(struct kvm_vcpu *vcpu, gva_t vaddr)
{
 return vaddr;
}

int nonpaging_page_fault(struct kvm_vcpu *vcpu, gva_t gva,
       u32 error_code)
{
 gpa_t addr = gva;
 hpa_t paddr;
 int r;

 ;

 r = mmu_topup_memory_caches(vcpu);
 if (r) {
  ;
  return r;
 }

 if (!(vcpu)) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 928, "vcpu"); };
 if (!(((vcpu->mmu.root_hpa) != (~(hpa_t)0)))) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 929, "VALID_PAGE(vcpu->mmu.root_hpa)"); };

 paddr = gpa_to_hpa(vcpu , addr & (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1)));

 if (is_error_hpa(paddr)) {
  ;
  return 1;
 }

 r = nonpaging_map(vcpu, addr & (~((1UL << 12)-1)), paddr);

 ;
 return r;
}

static void nonpaging_free(struct kvm_vcpu *vcpu)
{
 mmu_free_roots(vcpu);
}

static int nonpaging_init_context(struct kvm_vcpu *vcpu)
{
 struct kvm_mmu *context = &vcpu->mmu;

 ;

 context->new_cr3 = nonpaging_new_cr3;
 context->page_fault = nonpaging_page_fault;
 context->gva_to_gpa = nonpaging_gva_to_gpa;
 context->free = nonpaging_free;
 context->root_level = 0;
 context->shadow_root_level = 3;
 mmu_alloc_roots(vcpu);
 if (!(((context->root_hpa) != (~(hpa_t)0)))) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 962, "VALID_PAGE(context->root_hpa)"); };
 kvm_arch_ops->set_cr3(vcpu, context->root_hpa);

 dump_context(context);

 ;

 return 0;
}

static void kvm_mmu_flush_tlb(struct kvm_vcpu *vcpu)
{
 ++kvm_stat.tlb_flush;
 kvm_arch_ops->tlb_flush(vcpu);
}

static void paging_new_cr3(struct kvm_vcpu *vcpu)
{
 do { } while (0);
 mmu_free_roots(vcpu);
 if (__builtin_expect(!!(vcpu->kvm->n_free_mmu_pages < 5), 0))
  kvm_mmu_free_some_pages(vcpu);
 mmu_alloc_roots(vcpu);
 kvm_mmu_flush_tlb(vcpu);
 kvm_arch_ops->set_cr3(vcpu, vcpu->mmu.root_hpa);
}

static void mark_pagetable_nonglobal(void *shadow_pte)
{
 page_header(__pa(shadow_pte))->global = 0;
}

static inline __attribute__((always_inline)) void set_pte_common(struct kvm_vcpu *vcpu,
        u64 *shadow_pte,
        gpa_t gaddr,
        int dirty,
        u64 access_bits,
        gfn_t gfn)
{
 hpa_t paddr;

 *shadow_pte |= access_bits << ((9 + 1) - 1);
 if (!dirty)
  access_bits &= ~(1ULL << 1);

 paddr = gpa_to_hpa(vcpu, gaddr & (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1)));

 *shadow_pte |= access_bits;

 if (!(*shadow_pte & (1ULL << 8)))
  mark_pagetable_nonglobal(shadow_pte);

 if (is_error_hpa(paddr)) {
  *shadow_pte |= gaddr;
  *shadow_pte |= (1ULL << 9);
  *shadow_pte &= ~(1ULL << 0);
  return;
 }

 *shadow_pte |= paddr;

 if (access_bits & (1ULL << 1)) {
  struct kvm_mmu_page *shadow;

  shadow = kvm_mmu_lookup_page(vcpu, gfn);
  if (shadow) {
   do { } while (0);

   access_bits &= ~(1ULL << 1);
   if (is_writeble_pte(*shadow_pte)) {
        *shadow_pte &= ~(1ULL << 1);
        kvm_arch_ops->tlb_flush(vcpu);
   }
  }
 }

 if (access_bits & (1ULL << 1))
  mark_page_dirty(vcpu->kvm, gaddr >> 12);

 page_header_update_slot(vcpu->kvm, shadow_pte, gaddr);
 rmap_add(vcpu, shadow_pte);
}

static void inject_page_fault(struct kvm_vcpu *vcpu,
         u64 addr,
         u32 err_code)
{
 kvm_arch_ops->inject_page_fault(vcpu, addr, err_code);
}

static inline __attribute__((always_inline)) int fix_read_pf(u64 *shadow_ent)
{
 if ((*shadow_ent & (1ULL << (((9 + 1) + 1)))) &&
     !(*shadow_ent & (1ULL << 2))) {




  *shadow_ent |= (1ULL << 2);
  *shadow_ent &= ~(1ULL << 1);

  return 1;

 }
 return 0;
}

static void paging_free(struct kvm_vcpu *vcpu)
{
 nonpaging_free(vcpu);
}


# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h" 1
# 59 "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h"
struct guest_walker64 {
 int level;
 gfn_t table_gfn[2];
 u64 *table;
 u64 *ptep;
 u64 inherited_ar;
 gfn_t gfn;
 u32 error_code;
};




static int paging64_walk_addr(struct guest_walker64 *walker,
       struct kvm_vcpu *vcpu, gva_t addr,
       int write_fault, int user_fault, int fetch_fault)
{
 hpa_t hpa;
 struct kvm_memory_slot *slot;
 u64 *ptep;
 u64 root;
 gfn_t table_gfn;

 do { } while (0);
 walker->level = vcpu->mmu.root_level;
 walker->table = ((void *)0);
 root = vcpu->cr3;

 if (!is_long_mode(vcpu)) {
  walker->ptep = &vcpu->pdptrs[(addr >> 30) & 3];
  root = *walker->ptep;
  if (!(root & (1ULL << 0)))
   goto not_present;
  --walker->level;
 }

 table_gfn = (root & (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1))) >> 12;
 walker->table_gfn[walker->level - 1] = table_gfn;
 do { } while (0);

 slot = gfn_to_memslot(vcpu->kvm, table_gfn);
 hpa = safe_gpa_to_hpa(vcpu, root & (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1)));
 walker->table = kmap_atomic(pfn_to_page(hpa >> 12), KM_USER0);

 if (!((!is_long_mode(vcpu) && is_pae(vcpu)) || (vcpu->cr3 & ~((~((1UL << 12)-1)) | ((1ULL << 5) - 1))) == 0)) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h", 104, "(!is_long_mode(vcpu) && is_pae(vcpu)) || (vcpu->cr3 & ~(PAGE_MASK | CR3_FLAGS_MASK)) == 0"); };


 walker->inherited_ar = (1ULL << 2) | (1ULL << 1);

 for (;;) {
  int index = (((addr) >> ( 12 + (walker->level - 1) * 9 )) & ((1 << 9) - 1));
  hpa_t paddr;

  ptep = &walker->table[index];
  if (!(((unsigned long)walker->table & (~((1UL << 12)-1))) == ((unsigned long)ptep & (~((1UL << 12)-1))))) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h", 114, "((unsigned long)walker->table & PAGE_MASK) == ((unsigned long)ptep & PAGE_MASK)"); };


  if (!is_present_pte(*ptep))
   goto not_present;

  if (write_fault && !is_writeble_pte(*ptep))
   if (user_fault || is_write_protection(vcpu))
    goto access_error;

  if (user_fault && !(*ptep & (1ULL << 2)))
   goto access_error;


  if (fetch_fault && is_nx(vcpu) && (*ptep & (1ULL << 63)))
   goto access_error;


  if (!(*ptep & (1ULL << 5))) {
   mark_page_dirty(vcpu->kvm, table_gfn);
   *ptep |= (1ULL << 5);
  }

  if (walker->level == 1) {
   walker->gfn = (*ptep & (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1)))
    >> 12;
   break;
  }

  if (walker->level == 2
      && (*ptep & (1ULL << 7))
      && (64 == 64 || is_pse(vcpu))) {
   walker->gfn = (*ptep & ((((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1)) & ~((1ULL << (12 + 9)) - 1)))
    >> 12;
   walker->gfn += (((addr) >> ( 12 + (1 - 1) * 9 )) & ((1 << 9) - 1));
   break;
  }

  if (walker->level != 3 || is_long_mode(vcpu))
   walker->inherited_ar &= walker->table[index];
  table_gfn = (*ptep & (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1))) >> 12;
  paddr = safe_gpa_to_hpa(vcpu, *ptep & (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1)));
  kunmap_atomic(walker->table, KM_USER0);
  walker->table = kmap_atomic(pfn_to_page(paddr >> 12),
         KM_USER0);
  --walker->level;
  walker->table_gfn[walker->level - 1 ] = table_gfn;
  do { } while (0);

 }
 walker->ptep = ptep;
 do { } while (0);
 return 1;

not_present:
 walker->error_code = 0;
 goto err;

access_error:
 walker->error_code = (1U << 0);

err:
 if (write_fault)
  walker->error_code |= (1U << 1);
 if (user_fault)
  walker->error_code |= (1U << 2);
 if (fetch_fault)
  walker->error_code |= (1U << 4);
 return 0;
}

static void paging64_release_walker(struct guest_walker64 *walker)
{
 if (walker->table)
  kunmap_atomic(walker->table, KM_USER0);
}

static void paging64_mark_pagetable_dirty(struct kvm *kvm,
     struct guest_walker64 *walker)
{
 mark_page_dirty(kvm, walker->table_gfn[walker->level - 1]);
}

static void paging64_set_pte(struct kvm_vcpu *vcpu, u64 guest_pte,
      u64 *shadow_pte, u64 access_bits, gfn_t gfn)
{
 if (!(*shadow_pte == 0)) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h", 199, "*shadow_pte == 0"); };
 access_bits &= guest_pte;
 *shadow_pte = (guest_pte & ((1ULL << 63) | ((1ULL << 0) | (1ULL << 5) | (1ULL << 6) | (1ULL << 8))));
 set_pte_common(vcpu, shadow_pte, guest_pte & (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1)),
         guest_pte & (1ULL << 6), access_bits, gfn);
}

static void paging64_set_pde(struct kvm_vcpu *vcpu, u64 guest_pde,
      u64 *shadow_pte, u64 access_bits, gfn_t gfn)
{
 gpa_t gaddr;

 if (!(*shadow_pte == 0)) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h", 211, "*shadow_pte == 0"); };
 access_bits &= guest_pde;
 gaddr = (gpa_t)gfn << 12;
 if (64 == 32 && is_cpuid_PSE36())
  gaddr |= (guest_pde & (((1ULL << 4) - 1) << 13)) <<
   (32 - 13);
 *shadow_pte = guest_pde & ((1ULL << 63) | ((1ULL << 0) | (1ULL << 5) | (1ULL << 6) | (1ULL << 8)));
 set_pte_common(vcpu, shadow_pte, gaddr,
         guest_pde & (1ULL << 6), access_bits, gfn);
}




static u64 *paging64_fetch(struct kvm_vcpu *vcpu, gva_t addr,
         struct guest_walker64 *walker)
{
 hpa_t shadow_addr;
 int level;
 u64 *prev_shadow_ent = ((void *)0);
 u64 *guest_ent = walker->ptep;

 if (!is_present_pte(*guest_ent))
  return ((void *)0);

 shadow_addr = vcpu->mmu.root_hpa;
 level = vcpu->mmu.shadow_root_level;
 if (level == 3) {
  shadow_addr = vcpu->mmu.pae_root[(addr >> 30) & 3];
  shadow_addr &= (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1));
  --level;
 }

 for (; ; level--) {
  u32 index = (((addr) >> ( 12 + (level - 1) * 9 )) & ((1 << 9) - 1));
  u64 *shadow_ent = ((u64 *)__va(shadow_addr)) + index;
  struct kvm_mmu_page *shadow_page;
  u64 shadow_pte;
  int metaphysical;
  gfn_t table_gfn;

  if (is_present_pte(*shadow_ent) || is_io_pte(*shadow_ent)) {
   if (level == 1)
    return shadow_ent;
   shadow_addr = *shadow_ent & (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1));
   prev_shadow_ent = shadow_ent;
   continue;
  }

  if (level == 1) {

   if (walker->level == 2) {
    if (prev_shadow_ent)
     *prev_shadow_ent |= (1ULL << 9);
    paging64_set_pde(vcpu, *guest_ent, shadow_ent,
            walker->inherited_ar,
            walker->gfn);
   } else {
    if (!(walker->level == 1)) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h", 269, "walker->level == PT_PAGE_TABLE_LEVEL"); };
    paging64_set_pte(vcpu, *guest_ent, shadow_ent,
            walker->inherited_ar,
            walker->gfn);
   }
   return shadow_ent;
  }

  if (level - 1 == 1
      && walker->level == 2) {
   metaphysical = 1;
   table_gfn = (*guest_ent & (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1)))
    >> 12;
  } else {
   metaphysical = 0;
   table_gfn = walker->table_gfn[level - 2];
  }
  shadow_page = kvm_mmu_get_page(vcpu, table_gfn, addr, level-1,
            metaphysical, shadow_ent);
  shadow_addr = shadow_page->page_hpa;
  shadow_pte = shadow_addr | (1ULL << 0) | (1ULL << 5)
   | (1ULL << 1) | (1ULL << 2);
  *shadow_ent = shadow_pte;
  prev_shadow_ent = shadow_ent;
 }
}
# 303 "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h"
static int paging64_fix_write_pf(struct kvm_vcpu *vcpu,
          u64 *shadow_ent,
          struct guest_walker64 *walker,
          gva_t addr,
          int user,
          int *write_pt)
{
 u64 *guest_ent;
 int writable_shadow;
 gfn_t gfn;
 struct kvm_mmu_page *page;

 if (is_writeble_pte(*shadow_ent))
  return !user || (*shadow_ent & (1ULL << 2));

 writable_shadow = *shadow_ent & (1ULL << (9 + 1));
 if (user) {




  if (!(*shadow_ent & (1ULL << (((9 + 1) + 1)))) || !writable_shadow)
   return 0;
  if (!(*shadow_ent & (1ULL << 2))) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h", 326, "*shadow_ent & PT_USER_MASK"); };
 } else




  if (!writable_shadow) {
   if (is_write_protection(vcpu))
    return 0;
   *shadow_ent &= ~(1ULL << 2);
  }

 guest_ent = walker->ptep;

 if (!is_present_pte(*guest_ent)) {
  *shadow_ent = 0;
  return 0;
 }

 gfn = walker->gfn;

 if (user) {



  while ((page = kvm_mmu_lookup_page(vcpu, gfn)) != ((void *)0)) {
   do { } while (0);

   kvm_mmu_zap_page(vcpu, page);
  }
 } else if (kvm_mmu_lookup_page(vcpu, gfn)) {
  do { } while (0);

  mark_page_dirty(vcpu->kvm, gfn);
  paging64_mark_pagetable_dirty(vcpu->kvm, walker);
  *guest_ent |= (1ULL << 6);
  *write_pt = 1;
  return 0;
 }
 mark_page_dirty(vcpu->kvm, gfn);
 *shadow_ent |= (1ULL << 1);
 paging64_mark_pagetable_dirty(vcpu->kvm, walker);
 *guest_ent |= (1ULL << 6);
 rmap_add(vcpu, shadow_ent);

 return 1;
}
# 388 "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h"
static int paging64_page_fault(struct kvm_vcpu *vcpu, gva_t addr,
          u32 error_code)
{
 int write_fault = error_code & (1U << 1);
 int user_fault = error_code & (1U << 2);
 int fetch_fault = error_code & (1U << 4);
 struct guest_walker64 walker;
 u64 *shadow_pte;
 int fixed;
 int write_pt = 0;
 int r;

 do { } while (0);
 kvm_mmu_audit(vcpu, "pre page fault");

 r = mmu_topup_memory_caches(vcpu);
 if (r)
  return r;




 r = paging64_walk_addr(&walker, vcpu, addr, write_fault, user_fault,
        fetch_fault);




 if (!r) {
  do { } while (0);
  inject_page_fault(vcpu, addr, walker.error_code);
  paging64_release_walker(&walker);
  return 0;
 }

 shadow_pte = paging64_fetch(vcpu, addr, &walker);
 do { } while (0);





 if (write_fault)
  fixed = paging64_fix_write_pf(vcpu, shadow_pte, &walker, addr,
         user_fault, &write_pt);
 else
  fixed = fix_read_pf(shadow_pte);

 do { } while (0);


 paging64_release_walker(&walker);




 if (is_io_pte(*shadow_pte))
  return 1;

 ++kvm_stat.pf_fixed;
 kvm_mmu_audit(vcpu, "post page fault (fixed)");

 return write_pt;
}

static gpa_t paging64_gva_to_gpa(struct kvm_vcpu *vcpu, gva_t vaddr)
{
 struct guest_walker64 walker;
 gpa_t gpa = (~(gpa_t)0);
 int r;

 r = paging64_walk_addr(&walker, vcpu, vaddr, 0, 0, 0);

 if (r) {
  gpa = (gpa_t)walker.gfn << 12;
  gpa |= vaddr & ~(~((1UL << 12)-1));
 }

 paging64_release_walker(&walker);
 return gpa;
}
# 1076 "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c" 2



# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h" 1
# 59 "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h"
struct guest_walker32 {
 int level;
 gfn_t table_gfn[2];
 u32 *table;
 u32 *ptep;
 u32 inherited_ar;
 gfn_t gfn;
 u32 error_code;
};




static int paging32_walk_addr(struct guest_walker32 *walker,
       struct kvm_vcpu *vcpu, gva_t addr,
       int write_fault, int user_fault, int fetch_fault)
{
 hpa_t hpa;
 struct kvm_memory_slot *slot;
 u32 *ptep;
 u32 root;
 gfn_t table_gfn;

 do { } while (0);
 walker->level = vcpu->mmu.root_level;
 walker->table = ((void *)0);
 root = vcpu->cr3;
# 95 "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h"
 table_gfn = (root & (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1))) >> 12;
 walker->table_gfn[walker->level - 1] = table_gfn;
 do { } while (0);

 slot = gfn_to_memslot(vcpu->kvm, table_gfn);
 hpa = safe_gpa_to_hpa(vcpu, root & (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1)));
 walker->table = kmap_atomic(pfn_to_page(hpa >> 12), KM_USER0);

 if (!((!is_long_mode(vcpu) && is_pae(vcpu)) || (vcpu->cr3 & ~((~((1UL << 12)-1)) | ((1ULL << 5) - 1))) == 0)) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h", 104, "(!is_long_mode(vcpu) && is_pae(vcpu)) || (vcpu->cr3 & ~(PAGE_MASK | CR3_FLAGS_MASK)) == 0"); };


 walker->inherited_ar = (1ULL << 2) | (1ULL << 1);

 for (;;) {
  int index = (((addr) >> ( 12 + (walker->level - 1) * 10 )) & ((1 << 10) - 1));
  hpa_t paddr;

  ptep = &walker->table[index];
  if (!(((unsigned long)walker->table & (~((1UL << 12)-1))) == ((unsigned long)ptep & (~((1UL << 12)-1))))) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h", 114, "((unsigned long)walker->table & PAGE_MASK) == ((unsigned long)ptep & PAGE_MASK)"); };


  if (!is_present_pte(*ptep))
   goto not_present;

  if (write_fault && !is_writeble_pte(*ptep))
   if (user_fault || is_write_protection(vcpu))
    goto access_error;

  if (user_fault && !(*ptep & (1ULL << 2)))
   goto access_error;






  if (!(*ptep & (1ULL << 5))) {
   mark_page_dirty(vcpu->kvm, table_gfn);
   *ptep |= (1ULL << 5);
  }

  if (walker->level == 1) {
   walker->gfn = (*ptep & (~((1UL << 12)-1)))
    >> 12;
   break;
  }

  if (walker->level == 2
      && (*ptep & (1ULL << 7))
      && (32 == 64 || is_pse(vcpu))) {
   walker->gfn = (*ptep & ((~((1UL << 12)-1)) & ~((1ULL << (12 + 10)) - 1)))
    >> 12;
   walker->gfn += (((addr) >> ( 12 + (1 - 1) * 10 )) & ((1 << 10) - 1));
   break;
  }

  if (walker->level != 3 || is_long_mode(vcpu))
   walker->inherited_ar &= walker->table[index];
  table_gfn = (*ptep & (~((1UL << 12)-1))) >> 12;
  paddr = safe_gpa_to_hpa(vcpu, *ptep & (~((1UL << 12)-1)));
  kunmap_atomic(walker->table, KM_USER0);
  walker->table = kmap_atomic(pfn_to_page(paddr >> 12),
         KM_USER0);
  --walker->level;
  walker->table_gfn[walker->level - 1 ] = table_gfn;
  do { } while (0);

 }
 walker->ptep = ptep;
 do { } while (0);
 return 1;

not_present:
 walker->error_code = 0;
 goto err;

access_error:
 walker->error_code = (1U << 0);

err:
 if (write_fault)
  walker->error_code |= (1U << 1);
 if (user_fault)
  walker->error_code |= (1U << 2);
 if (fetch_fault)
  walker->error_code |= (1U << 4);
 return 0;
}

static void paging32_release_walker(struct guest_walker32 *walker)
{
 if (walker->table)
  kunmap_atomic(walker->table, KM_USER0);
}

static void paging32_mark_pagetable_dirty(struct kvm *kvm,
     struct guest_walker32 *walker)
{
 mark_page_dirty(kvm, walker->table_gfn[walker->level - 1]);
}

static void paging32_set_pte(struct kvm_vcpu *vcpu, u64 guest_pte,
      u64 *shadow_pte, u64 access_bits, gfn_t gfn)
{
 if (!(*shadow_pte == 0)) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h", 199, "*shadow_pte == 0"); };
 access_bits &= guest_pte;
 *shadow_pte = (guest_pte & ((1ULL << 0) | (1ULL << 5) | (1ULL << 6) | (1ULL << 8)));
 set_pte_common(vcpu, shadow_pte, guest_pte & (~((1UL << 12)-1)),
         guest_pte & (1ULL << 6), access_bits, gfn);
}

static void paging32_set_pde(struct kvm_vcpu *vcpu, u64 guest_pde,
      u64 *shadow_pte, u64 access_bits, gfn_t gfn)
{
 gpa_t gaddr;

 if (!(*shadow_pte == 0)) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h", 211, "*shadow_pte == 0"); };
 access_bits &= guest_pde;
 gaddr = (gpa_t)gfn << 12;
 if (32 == 32 && is_cpuid_PSE36())
  gaddr |= (guest_pde & (((1ULL << 4) - 1) << 13)) <<
   (32 - 13);
 *shadow_pte = guest_pde & ((1ULL << 0) | (1ULL << 5) | (1ULL << 6) | (1ULL << 8));
 set_pte_common(vcpu, shadow_pte, gaddr,
         guest_pde & (1ULL << 6), access_bits, gfn);
}




static u64 *paging32_fetch(struct kvm_vcpu *vcpu, gva_t addr,
         struct guest_walker32 *walker)
{
 hpa_t shadow_addr;
 int level;
 u64 *prev_shadow_ent = ((void *)0);
 u32 *guest_ent = walker->ptep;

 if (!is_present_pte(*guest_ent))
  return ((void *)0);

 shadow_addr = vcpu->mmu.root_hpa;
 level = vcpu->mmu.shadow_root_level;
 if (level == 3) {
  shadow_addr = vcpu->mmu.pae_root[(addr >> 30) & 3];
  shadow_addr &= (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1));
  --level;
 }

 for (; ; level--) {
  u32 index = (((addr) >> ( 12 + (level - 1) * 9 )) & ((1 << 9) - 1));
  u64 *shadow_ent = ((u64 *)__va(shadow_addr)) + index;
  struct kvm_mmu_page *shadow_page;
  u64 shadow_pte;
  int metaphysical;
  gfn_t table_gfn;

  if (is_present_pte(*shadow_ent) || is_io_pte(*shadow_ent)) {
   if (level == 1)
    return shadow_ent;
   shadow_addr = *shadow_ent & (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1));
   prev_shadow_ent = shadow_ent;
   continue;
  }

  if (level == 1) {

   if (walker->level == 2) {
    if (prev_shadow_ent)
     *prev_shadow_ent |= (1ULL << 9);
    paging32_set_pde(vcpu, *guest_ent, shadow_ent,
            walker->inherited_ar,
            walker->gfn);
   } else {
    if (!(walker->level == 1)) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h", 269, "walker->level == PT_PAGE_TABLE_LEVEL"); };
    paging32_set_pte(vcpu, *guest_ent, shadow_ent,
            walker->inherited_ar,
            walker->gfn);
   }
   return shadow_ent;
  }

  if (level - 1 == 1
      && walker->level == 2) {
   metaphysical = 1;
   table_gfn = (*guest_ent & (~((1UL << 12)-1)))
    >> 12;
  } else {
   metaphysical = 0;
   table_gfn = walker->table_gfn[level - 2];
  }
  shadow_page = kvm_mmu_get_page(vcpu, table_gfn, addr, level-1,
            metaphysical, shadow_ent);
  shadow_addr = shadow_page->page_hpa;
  shadow_pte = shadow_addr | (1ULL << 0) | (1ULL << 5)
   | (1ULL << 1) | (1ULL << 2);
  *shadow_ent = shadow_pte;
  prev_shadow_ent = shadow_ent;
 }
}
# 303 "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h"
static int paging32_fix_write_pf(struct kvm_vcpu *vcpu,
          u64 *shadow_ent,
          struct guest_walker32 *walker,
          gva_t addr,
          int user,
          int *write_pt)
{
 u32 *guest_ent;
 int writable_shadow;
 gfn_t gfn;
 struct kvm_mmu_page *page;

 if (is_writeble_pte(*shadow_ent))
  return !user || (*shadow_ent & (1ULL << 2));

 writable_shadow = *shadow_ent & (1ULL << (9 + 1));
 if (user) {




  if (!(*shadow_ent & (1ULL << (((9 + 1) + 1)))) || !writable_shadow)
   return 0;
  if (!(*shadow_ent & (1ULL << 2))) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h", 326, "*shadow_ent & PT_USER_MASK"); };
 } else




  if (!writable_shadow) {
   if (is_write_protection(vcpu))
    return 0;
   *shadow_ent &= ~(1ULL << 2);
  }

 guest_ent = walker->ptep;

 if (!is_present_pte(*guest_ent)) {
  *shadow_ent = 0;
  return 0;
 }

 gfn = walker->gfn;

 if (user) {



  while ((page = kvm_mmu_lookup_page(vcpu, gfn)) != ((void *)0)) {
   do { } while (0);

   kvm_mmu_zap_page(vcpu, page);
  }
 } else if (kvm_mmu_lookup_page(vcpu, gfn)) {
  do { } while (0);

  mark_page_dirty(vcpu->kvm, gfn);
  paging32_mark_pagetable_dirty(vcpu->kvm, walker);
  *guest_ent |= (1ULL << 6);
  *write_pt = 1;
  return 0;
 }
 mark_page_dirty(vcpu->kvm, gfn);
 *shadow_ent |= (1ULL << 1);
 paging32_mark_pagetable_dirty(vcpu->kvm, walker);
 *guest_ent |= (1ULL << 6);
 rmap_add(vcpu, shadow_ent);

 return 1;
}
# 388 "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h"
static int paging32_page_fault(struct kvm_vcpu *vcpu, gva_t addr,
          u32 error_code)
{
 int write_fault = error_code & (1U << 1);
 int user_fault = error_code & (1U << 2);
 int fetch_fault = error_code & (1U << 4);
 struct guest_walker32 walker;
 u64 *shadow_pte;
 int fixed;
 int write_pt = 0;
 int r;

 do { } while (0);
 kvm_mmu_audit(vcpu, "pre page fault");

 r = mmu_topup_memory_caches(vcpu);
 if (r)
  return r;




 r = paging32_walk_addr(&walker, vcpu, addr, write_fault, user_fault,
        fetch_fault);




 if (!r) {
  do { } while (0);
  inject_page_fault(vcpu, addr, walker.error_code);
  paging32_release_walker(&walker);
  return 0;
 }

 shadow_pte = paging32_fetch(vcpu, addr, &walker);
 do { } while (0);





 if (write_fault)
  fixed = paging32_fix_write_pf(vcpu, shadow_pte, &walker, addr,
         user_fault, &write_pt);
 else
  fixed = fix_read_pf(shadow_pte);

 do { } while (0);


 paging32_release_walker(&walker);




 if (is_io_pte(*shadow_pte))
  return 1;

 ++kvm_stat.pf_fixed;
 kvm_mmu_audit(vcpu, "post page fault (fixed)");

 return write_pt;
}

static gpa_t paging32_gva_to_gpa(struct kvm_vcpu *vcpu, gva_t vaddr)
{
 struct guest_walker32 walker;
 gpa_t gpa = (~(gpa_t)0);
 int r;

 r = paging32_walk_addr(&walker, vcpu, vaddr, 0, 0, 0);

 if (r) {
  gpa = (gpa_t)walker.gfn << 12;
  gpa |= vaddr & ~(~((1UL << 12)-1));
 }

 paging32_release_walker(&walker);
 return gpa;
}
# 1080 "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c" 2


static int paging64_init_context_common(struct kvm_vcpu *vcpu, int level)
{
 struct kvm_mmu *context = &vcpu->mmu;

 ;

 if (!(is_pae(vcpu))) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 1088, "is_pae(vcpu)"); };
 context->new_cr3 = paging_new_cr3;
 context->page_fault = paging64_page_fault;
 context->gva_to_gpa = paging64_gva_to_gpa;
 context->free = paging_free;
 context->root_level = level;
 context->shadow_root_level = level;
 mmu_alloc_roots(vcpu);
 if (!(((context->root_hpa) != (~(hpa_t)0)))) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 1096, "VALID_PAGE(context->root_hpa)"); };
 kvm_arch_ops->set_cr3(vcpu, context->root_hpa |
      (vcpu->cr3 & ((1ULL << 4) | (1ULL << 3))));

 ;

 return 0;
}

static int paging64_init_context(struct kvm_vcpu *vcpu)
{
 return paging64_init_context_common(vcpu, 4);
}

static int paging32_init_context(struct kvm_vcpu *vcpu)
{
 struct kvm_mmu *context = &vcpu->mmu;

 ;

 context->new_cr3 = paging_new_cr3;
 context->page_fault = paging32_page_fault;
 context->gva_to_gpa = paging32_gva_to_gpa;
 context->free = paging_free;
 context->root_level = 2;
 context->shadow_root_level = 3;
 mmu_alloc_roots(vcpu);
 if (!(((context->root_hpa) != (~(hpa_t)0)))) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 1123, "VALID_PAGE(context->root_hpa)"); };
 kvm_arch_ops->set_cr3(vcpu, context->root_hpa |
      (vcpu->cr3 & ((1ULL << 4) | (1ULL << 3))));

 ;

 return 0;
}

static int paging32E_init_context(struct kvm_vcpu *vcpu)
{
 return paging64_init_context_common(vcpu, 3);
}

static int init_kvm_mmu(struct kvm_vcpu *vcpu)
{
 ;
 if (!(vcpu)) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 1140, "vcpu"); };
 if (!(!((vcpu->mmu.root_hpa) != (~(hpa_t)0)))) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 1141, "!VALID_PAGE(vcpu->mmu.root_hpa)"); };

 if (!is_paging(vcpu)) {
  ;
  return nonpaging_init_context(vcpu);
 } else if (is_long_mode(vcpu)) {
  ;
  return paging64_init_context(vcpu);
 } else if (is_pae(vcpu)) {
  ;
  return paging32E_init_context(vcpu);
 } else {
  ;
  return paging32_init_context(vcpu);
 }
}

static void destroy_kvm_mmu(struct kvm_vcpu *vcpu)
{
 if (!(vcpu)) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 1160, "vcpu"); };
 if (((vcpu->mmu.root_hpa) != (~(hpa_t)0))) {
  vcpu->mmu.free(vcpu);
  vcpu->mmu.root_hpa = (~(hpa_t)0);
 }
}

int kvm_mmu_reset_context(struct kvm_vcpu *vcpu)
{
 int r;

 ;

 destroy_kvm_mmu(vcpu);
 r = init_kvm_mmu(vcpu);
 if (r < 0)
  goto out;
 r = mmu_topup_memory_caches(vcpu);
out:
 ;
 return r;
}

static void mmu_pre_write_zap_pte(struct kvm_vcpu *vcpu,
      struct kvm_mmu_page *page,
      u64 *spte)
{
 u64 pte;
 struct kvm_mmu_page *child;

 pte = *spte;
 if (is_present_pte(pte)) {
  if (page->role.level == 1)
   rmap_remove(vcpu, spte);
  else {
   child = page_header(pte & (((1ULL << 52) - 1) & ~(u64)((1UL << 12)-1)));
   mmu_page_remove_parent_pte(vcpu, child, spte);
  }
 }
 *spte = 0;
}

void kvm_mmu_pre_write(struct kvm_vcpu *vcpu, gpa_t gpa, int bytes)
{
 gfn_t gfn = gpa >> 12;
 struct kvm_mmu_page *page;
 struct hlist_node *node, *n;
 struct hlist_head *bucket;
 unsigned index;
 u64 *spte;
 unsigned offset = ((unsigned long)(gpa) & ~(~((1UL << 12)-1)));
 unsigned pte_size;
 unsigned page_offset;
 unsigned misaligned;
 int level;
 int flooded = 0;
 int npte;

 do { } while (0);
 if (gfn == vcpu->last_pt_write_gfn) {
  ++vcpu->last_pt_write_count;
  if (vcpu->last_pt_write_count >= 3)
   flooded = 1;
 } else {
  vcpu->last_pt_write_gfn = gfn;
  vcpu->last_pt_write_count = 1;
 }
 index = kvm_page_table_hashfn(gfn) % 256;
 bucket = &vcpu->kvm->mmu_page_hash[index];
 for (node = (bucket)->first; node && ({ n = node->next; 1; }) && ({ page = ({ const typeof( ((typeof(*page) *)0)->hash_link ) *__mptr = (node); (typeof(*page) *)( (char *)__mptr - __builtin_offsetof(typeof(*page),hash_link) );}); 1;}); node = n) {
  if (page->gfn != gfn || page->role.metaphysical)
   continue;
  pte_size = page->role.glevels == 2 ? 4 : 8;
  misaligned = (offset ^ (offset + bytes - 1)) & ~(pte_size - 1);
  if (misaligned || flooded) {
# 1245 "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c"
   do { } while (0);

   kvm_mmu_zap_page(vcpu, page);
   continue;
  }
  page_offset = offset;
  level = page->role.level;
  npte = 1;
  if (page->role.glevels == 2) {
   page_offset <<= 1;





   if (level == 2) {
    page_offset <<= 1;
    npte = 2;
   }
   page_offset &= ~(~((1UL << 12)-1));
  }
  spte = __va(page->page_hpa);
  spte += page_offset / sizeof(*spte);
  while (npte--) {
   mmu_pre_write_zap_pte(vcpu, page, spte);
   ++spte;
  }
 }
}

void kvm_mmu_post_write(struct kvm_vcpu *vcpu, gpa_t gpa, int bytes)
{
}

int kvm_mmu_unprotect_page_virt(struct kvm_vcpu *vcpu, gva_t gva)
{
 gpa_t gpa = vcpu->mmu.gva_to_gpa(vcpu, gva);

 return kvm_mmu_unprotect_page(vcpu, gpa >> 12);
}

void kvm_mmu_free_some_pages(struct kvm_vcpu *vcpu)
{
 ;
 while (vcpu->kvm->n_free_mmu_pages < 25) {
  struct kvm_mmu_page *page;

  page = ({ const typeof( ((struct kvm_mmu_page *)0)->link ) *__mptr = (vcpu->kvm->active_mmu_pages.prev); (struct kvm_mmu_page *)( (char *)__mptr - __builtin_offsetof(struct kvm_mmu_page,link) );});

  kvm_mmu_zap_page(vcpu, page);
 }
 ;
}
;

static void free_mmu_pages(struct kvm_vcpu *vcpu)
{
 struct kvm_mmu_page *page;

 while (!list_empty(&vcpu->kvm->active_mmu_pages)) {
  page = ({ const typeof( ((struct kvm_mmu_page *)0)->link ) *__mptr = (vcpu->kvm->active_mmu_pages.next); (struct kvm_mmu_page *)( (char *)__mptr - __builtin_offsetof(struct kvm_mmu_page,link) );});

  kvm_mmu_zap_page(vcpu, page);
 }
 while (!list_empty(&vcpu->free_pages)) {
  page = ({ const typeof( ((struct kvm_mmu_page *)0)->link ) *__mptr = (vcpu->free_pages.next); (struct kvm_mmu_page *)( (char *)__mptr - __builtin_offsetof(struct kvm_mmu_page,link) );});

  list_del(&page->link);
  __free_page(pfn_to_page(page->page_hpa >> 12));
  page->page_hpa = (~(hpa_t)0);
 }
 free_page((unsigned long)vcpu->mmu.pae_root);
}

static int alloc_mmu_pages(struct kvm_vcpu *vcpu)
{
 struct page *page;
 int i;

 if (!(vcpu)) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 1324, "vcpu"); };

 ;

 for (i = 0; i < 256; i++) {
  struct kvm_mmu_page *page_header = &vcpu->page_header_buf[i];

  INIT_LIST_HEAD(&page_header->link);
  if ((page = alloc_page(((0x10u) | (0x40u) | (0x80u)))) == ((void *)0))
   goto error_1;
  ((page)->private = ((unsigned long)page_header));
  page_header->page_hpa = (hpa_t)page_to_pfn(page) << 12;

  memset(__va(page_header->page_hpa), 0, (1UL << 12));
  list_add(&page_header->link, &vcpu->free_pages);
  ++vcpu->kvm->n_free_mmu_pages;
 }






 page = alloc_page(((0x10u) | (0x40u) | (0x80u)) | (0x04u));
 if (!page)
  goto error_1;
 vcpu->mmu.pae_root = page_address(page);
 for (i = 0; i < 4; ++i)
  vcpu->mmu.pae_root[i] = (~(hpa_t)0);

 ;
 return 0;

error_1:
 free_mmu_pages(vcpu);
 return -12;
}

int kvm_mmu_create(struct kvm_vcpu *vcpu)
{
 if (!(vcpu)) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 1364, "vcpu"); };
 if (!(!((vcpu->mmu.root_hpa) != (~(hpa_t)0)))) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 1365, "!VALID_PAGE(vcpu->mmu.root_hpa)"); };
 if (!(list_empty(&vcpu->free_pages))) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 1366, "list_empty(&vcpu->free_pages)"); };

 return alloc_mmu_pages(vcpu);
}

int kvm_mmu_setup(struct kvm_vcpu *vcpu)
{
 if (!(vcpu)) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 1373, "vcpu"); };
 if (!(!((vcpu->mmu.root_hpa) != (~(hpa_t)0)))) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 1374, "!VALID_PAGE(vcpu->mmu.root_hpa)"); };
 if (!(!list_empty(&vcpu->free_pages))) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 1375, "!list_empty(&vcpu->free_pages)"); };

 return init_kvm_mmu(vcpu);
}

void kvm_mmu_destroy(struct kvm_vcpu *vcpu)
{
 if (!(vcpu)) { printk("<4>" "assertion failed %s:%d: %s\n", "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c", 1382, "vcpu"); };

 destroy_kvm_mmu(vcpu);
 free_mmu_pages(vcpu);
 mmu_free_memory_caches(vcpu);
}

void kvm_mmu_slot_remove_write_access(struct kvm_vcpu *vcpu, int slot)
{
 struct kvm *kvm = vcpu->kvm;
 struct kvm_mmu_page *page;

 for (page = ({ const typeof( ((typeof(*page) *)0)->link ) *__mptr = ((&kvm->active_mmu_pages)->next); (typeof(*page) *)( (char *)__mptr - __builtin_offsetof(typeof(*page),link) );}); prefetch(page->link.next), &page->link != (&kvm->active_mmu_pages); page = ({ const typeof( ((typeof(*page) *)0)->link ) *__mptr = (page->link.next); (typeof(*page) *)( (char *)__mptr - __builtin_offsetof(typeof(*page),link) );})) {
  int i;
  u64 *pt;

  if (!test_bit(slot, &page->slot_bitmap))
   continue;

  pt = __va(page->page_hpa);
  for (i = 0; i < (1 << 9); ++i)

   if (pt[i] & (1ULL << 1)) {
    rmap_remove(vcpu, &pt[i]);
    pt[i] &= ~(1ULL << 1);
   }
 }
}
