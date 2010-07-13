# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx-debug.c"
# 1 "/cygdrive/z/winkvm/windows-linux-compat//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./include/linux/autoconf.h" 1
# 1 "<command-line>" 2
# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx-debug.c"
# 20 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx-debug.c"
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
# 21 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx-debug.c" 2


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
# 24 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx-debug.c" 2
# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/debug.h" 1
# 25 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx-debug.c" 2
