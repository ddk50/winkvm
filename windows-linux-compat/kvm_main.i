# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
# 1 "/cygdrive/z/winkvm/windows-linux-compat//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./include/linux/autoconf.h" 1
# 1 "<command-line>" 2
# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
# 18 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
# 17 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h"
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
# 18 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 2

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
# 19 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c" 2
# 48 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
# 1 "include/asm/processor-flags.h" 1
# 49 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c" 2
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
# 50 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c" 2


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
# 53 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c" 2
# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/segment_descriptor.h" 1
struct segment_descriptor {
 u16 limit_low;
 u16 base_low;
 u8 base_mid;
 u8 type : 4;
 u8 system : 1;
 u8 dpl : 2;
 u8 present : 1;
 u8 limit_high : 4;
 u8 avl : 1;
 u8 long_mode : 1;
 u8 default_op : 1;
 u8 granularity : 1;
 u8 base_high;
} __attribute__((packed));
# 54 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c" 2

;;
;;





static spinlock_t kvm_lock;


static struct list_head vm_list = { &(vm_list), &(vm_list) };

struct kvm_arch_ops *kvm_arch_ops;
struct kvm_stat kvm_stat;
;

static struct kvm_stats_debugfs_item {
 const char *name;
 u32 *data;
 struct dentry *dentry;
} debugfs_entries[] = {
 { "pf_fixed", &kvm_stat.pf_fixed },
 { "pf_guest", &kvm_stat.pf_guest },
 { "tlb_flush", &kvm_stat.tlb_flush },
 { "invlpg", &kvm_stat.invlpg },
 { "exits", &kvm_stat.exits },
 { "io_exits", &kvm_stat.io_exits },
 { "mmio_exits", &kvm_stat.mmio_exits },
 { "signal_exits", &kvm_stat.signal_exits },
 { "irq_window", &kvm_stat.irq_window_exits },
 { "halt_exits", &kvm_stat.halt_exits },
 { "request_irq", &kvm_stat.request_irq_exits },
 { "irq_exits", &kvm_stat.irq_exits },
 { ((void *)0), ((void *)0) }
};

static struct dentry *debugfs_dir;

struct vfsmount *kvmfs_mnt;
# 113 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
static long kvm_vcpu_ioctl(struct file *file, unsigned int ioctl,
         unsigned long arg);

static struct inode *kvmfs_inode(struct file_operations *fops)
{
 int error = -12;
# 143 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
 struct inode *inode = new_inode();

 if (!inode)
  goto eexit_1;

 return inode;

eexit_1:
 return ERR_PTR(error);

}




static struct file *kvmfs_file(struct inode *inode, void *private_data, int type)

{
 struct file *file = get_empty_filp();

 if (!file)
  return ERR_PTR(-23);
# 179 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
 memset(file, 0, sizeof(struct file));
 file->private_data = private_data;
 file->__private_data_type = type;
 file->__inode = inode;
 return file;

}

unsigned long segment_base(u16 selector)
{
 struct descriptor_table gdt;
 struct segment_descriptor *d;
 unsigned long table_base;
 typedef unsigned long ul;
 unsigned long v;

 if (selector == 0)
  return 0;

 asm ("sgdt %0" : "=m"(gdt));
 table_base = gdt.base;

 if (selector & 4) {
  u16 ldt_selector;

  asm ("sldt %0" : "=g"(ldt_selector));
  table_base = segment_base(ldt_selector);
 }
 d = (struct segment_descriptor *)(table_base + (selector & ~7));
 v = d->base_low | ((ul)d->base_mid << 16) | ((ul)d->base_high << 24);





 return v;
}
;

static inline __attribute__((always_inline)) int valid_vcpu(int n)
{
 return __builtin_expect(!!(n >= 0 && n < 1), 1);
}

int kvm_read_guest(struct kvm_vcpu *vcpu, gva_t addr, unsigned long size,
       void *dest)
{
 unsigned char *host_buf = dest;
 unsigned long req_size = size;

 ;

 while (size) {
  hpa_t paddr;
  unsigned now;
  unsigned offset;
  hva_t guest_buf;

  paddr = gva_to_hpa(vcpu, addr);

  if (is_error_hpa(paddr))
   break;

  guest_buf = (hva_t)kmap_atomic(
     pfn_to_page(paddr >> 12),
     KM_USER0);
  offset = addr & ~(~((1UL << 12)-1));
  guest_buf |= offset;
  now = ((size) < ((1UL << 12) - offset) ? size : (1UL << 12) - offset);
  memcpy(host_buf, (void*)guest_buf, now);
  host_buf += now;
  addr += now;
  size -= now;
  kunmap_atomic((void *)(guest_buf & (~((1UL << 12)-1))), KM_USER0);
 }

 ;

 return req_size - size;
}
;

int kvm_write_guest(struct kvm_vcpu *vcpu, gva_t addr, unsigned long size,
     void *data)
{
 unsigned char *host_buf = data;
 unsigned long req_size = size;

 ;

 while (size) {
  hpa_t paddr;
  unsigned now;
  unsigned offset;
  hva_t guest_buf;
  gfn_t gfn;

  paddr = gva_to_hpa(vcpu, addr);

  if (is_error_hpa(paddr))
   break;

  gfn = vcpu->mmu.gva_to_gpa(vcpu, addr) >> 12;
  mark_page_dirty(vcpu->kvm, gfn);
  guest_buf = (hva_t)kmap_atomic(
    pfn_to_page(paddr >> 12), KM_USER0);
  offset = addr & ~(~((1UL << 12)-1));
  guest_buf |= offset;
  now = ((size) < ((1UL << 12) - offset) ? size : (1UL << 12) - offset);
  memcpy((void*)guest_buf, host_buf, now);
  host_buf += now;
  addr += now;
  size -= now;
  kunmap_atomic((void *)(guest_buf & (~((1UL << 12)-1))), KM_USER0);
 }

 ;

 return req_size - size;
}
;




static void vcpu_load(struct kvm_vcpu *vcpu)
{
 mutex_lock(&vcpu->mutex);
 kvm_arch_ops->vcpu_load(vcpu);
}





static struct kvm_vcpu *vcpu_load_slot(struct kvm *kvm, int slot)
{
 struct kvm_vcpu *vcpu = &kvm->vcpus[slot];

 mutex_lock(&vcpu->mutex);
 if (!vcpu->vmcs) {
  mutex_unlock(&vcpu->mutex);
  return ((void *)0);
 }
 kvm_arch_ops->vcpu_load(vcpu);
 return vcpu;
}

static void vcpu_put(struct kvm_vcpu *vcpu)
{
 kvm_arch_ops->vcpu_put(vcpu);
 mutex_unlock(&vcpu->mutex);
}

static struct kvm *kvm_create_vm(void)
{
 struct kvm *kvm = kzalloc(sizeof(struct kvm), ((0x10u) | (0x40u) | (0x80u)));
 int i;

 if (!kvm)
  return ERR_PTR(-12);

 spin_lock_init(&kvm->lock);
 INIT_LIST_HEAD(&kvm->active_mmu_pages);
 for (i = 0; i < 1; ++i) {
  struct kvm_vcpu *vcpu = &kvm->vcpus[i];

  mutex_init(&vcpu->mutex);
  vcpu->cpu = -1;
  vcpu->kvm = kvm;
  vcpu->mmu.root_hpa = (~(hpa_t)0);
  INIT_LIST_HEAD(&vcpu->free_pages);
  spin_lock(&kvm_lock);
  list_add(&kvm->vm_list, &vm_list);
  spin_unlock(&kvm_lock);
 }
 return kvm;
}

static int kvm_dev_open(struct inode *inode, struct file *filp)
{
 return 0;
}




static void kvm_free_physmem_slot(struct kvm_memory_slot *free,
      struct kvm_memory_slot *dont)
{
 int i;

 if (!dont || free->phys_mem != dont->phys_mem)
  if (free->phys_mem) {
   for (i = 0; i < free->npages; ++i)
    if (free->phys_mem[i])
     __free_page(free->phys_mem[i]);
   vfree(free->phys_mem);
  }

 if (!dont || free->dirty_bitmap != dont->dirty_bitmap)
  vfree(free->dirty_bitmap);

 free->phys_mem = ((void *)0);
 free->npages = 0;
 free->dirty_bitmap = ((void *)0);
}

static void kvm_free_physmem(struct kvm *kvm)
{
 int i;

 for (i = 0; i < kvm->nmemslots; ++i)
  kvm_free_physmem_slot(&kvm->memslots[i], ((void *)0));
}

static void kvm_free_vcpu(struct kvm_vcpu *vcpu)
{
 if (!vcpu->vmcs)
  return;

 vcpu_load(vcpu);
 kvm_mmu_destroy(vcpu);
 vcpu_put(vcpu);
 kvm_arch_ops->vcpu_free(vcpu);
}

static void kvm_free_vcpus(struct kvm *kvm)
{
 unsigned int i;

 for (i = 0; i < 1; ++i)
  kvm_free_vcpu(&kvm->vcpus[i]);
}

static int kvm_dev_release(struct inode *inode, struct file *filp)
{
 return 0;
}

static void kvm_destroy_vm(struct kvm *kvm)
{
 spin_lock(&kvm_lock);
 list_del(&kvm->vm_list);
 spin_unlock(&kvm_lock);
 kvm_free_vcpus(kvm);
 kvm_free_physmem(kvm);
 kfree(kvm);
}

static int kvm_vm_release(struct inode *inode, struct file *filp)
{
 struct kvm *kvm = filp->private_data;

 kvm_destroy_vm(kvm);
 return 0;
}

static void inject_gp(struct kvm_vcpu *vcpu)
{
 kvm_arch_ops->inject_gp(vcpu, 0);
}




static int load_pdptrs(struct kvm_vcpu *vcpu, unsigned long cr3)
{
 gfn_t pdpt_gfn = cr3 >> 12;
 unsigned offset = ((cr3 & ((1UL << 12)-1)) >> 5) << 2;
 int i;
 u64 pdpte;
 u64 *pdpt;
 int ret;
 struct kvm_memory_slot *memslot;

 spin_lock(&vcpu->kvm->lock);
 memslot = gfn_to_memslot(vcpu->kvm, pdpt_gfn);

 pdpt = kmap_atomic(gfn_to_page(memslot, pdpt_gfn), KM_USER0);

 ret = 1;
 for (i = 0; i < 4; ++i) {
  pdpte = pdpt[offset + i];
  if ((pdpte & 1) && (pdpte & 0xfffffff0000001e6ull)) {
   ret = 0;
   goto out;
  }
 }

 for (i = 0; i < 4; ++i)
  vcpu->pdptrs[i] = pdpt[offset + i];

out:
 kunmap_atomic(pdpt, KM_USER0);
 spin_unlock(&vcpu->kvm->lock);

 return ret;
}

void set_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
{
 if (cr0 & 0xffffffff1ffaffc0ULL) {
  printk("<7>" "set_cr0: 0x%lx #GP, reserved bits 0x%lx\n",
         cr0, vcpu->cr0);
  inject_gp(vcpu);
  return;
 }

 if ((cr0 & (1ULL << 29)) && !(cr0 & (1ULL << 30))) {
  printk("<7>" "set_cr0: #GP, CD == 0 && NW == 1\n");
  inject_gp(vcpu);
  return;
 }

 if ((cr0 & (1ULL << 31)) && !(cr0 & (1ULL << 0))) {
  printk("<7>" "set_cr0: #GP, set PG flag "
         "and a clear PE flag\n");
  inject_gp(vcpu);
  return;
 }

 if (!is_paging(vcpu) && (cr0 & (1ULL << 31))) {
# 522 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
  if (is_pae(vcpu) && !load_pdptrs(vcpu, vcpu->cr3)) {
   printk("<7>" "set_cr0: #GP, pdptrs "
          "reserved bits\n");
   inject_gp(vcpu);
   return;
  }

 }

 kvm_arch_ops->set_cr0(vcpu, cr0);
 vcpu->cr0 = cr0;

 spin_lock(&vcpu->kvm->lock);
 kvm_mmu_reset_context(vcpu);
 spin_unlock(&vcpu->kvm->lock);
 return;
}
;

void lmsw(struct kvm_vcpu *vcpu, unsigned long msw)
{
 kvm_arch_ops->decache_cr0_cr4_guest_bits(vcpu);
 set_cr0(vcpu, (vcpu->cr0 & ~0x0ful) | (msw & 0x0f));
}
;

void set_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
{
 if (cr4 & (~((1ULL << 11) - 1))) {
  printk("<7>" "set_cr4: #GP, reserved bits\n");
  inject_gp(vcpu);
  return;
 }

 if (is_long_mode(vcpu)) {
  if (!(cr4 & (1ULL << 5))) {
   printk("<7>" "set_cr4: #GP, clearing PAE while "
          "in long mode\n");
   inject_gp(vcpu);
   return;
  }
 } else if (is_paging(vcpu) && !is_pae(vcpu) && (cr4 & (1ULL << 5))
     && !load_pdptrs(vcpu, vcpu->cr3)) {
  printk("<7>" "set_cr4: #GP, pdptrs reserved bits\n");
  inject_gp(vcpu);
 }

 if (cr4 & (1ULL << 13)) {
  printk("<7>" "set_cr4: #GP, setting VMXE\n");
  inject_gp(vcpu);
  return;
 }
 kvm_arch_ops->set_cr4(vcpu, cr4);
 spin_lock(&vcpu->kvm->lock);
 kvm_mmu_reset_context(vcpu);
 spin_unlock(&vcpu->kvm->lock);
}
;

void set_cr3(struct kvm_vcpu *vcpu, unsigned long cr3)
{
 if (is_long_mode(vcpu)) {
  if (cr3 & (~((1ULL << 40) - 1) | 0x0fe7ULL)) {
   printk("<7>" "set_cr3: #GP, reserved bits\n");
   inject_gp(vcpu);
   return;
  }
 } else {
  if (cr3 & 0x07ULL) {
   printk("<7>" "set_cr3: #GP, reserved bits\n");
   inject_gp(vcpu);
   return;
  }
  if (is_paging(vcpu) && is_pae(vcpu) &&
      !load_pdptrs(vcpu, cr3)) {
   printk("<7>" "set_cr3: #GP, pdptrs "
          "reserved bits\n");
   inject_gp(vcpu);
   return;
  }
 }

 vcpu->cr3 = cr3;
 spin_lock(&vcpu->kvm->lock);
# 615 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
 if (__builtin_expect(!!(!gfn_to_memslot(vcpu->kvm, cr3 >> 12)), 0))
  inject_gp(vcpu);
 else
  vcpu->mmu.new_cr3(vcpu);
 spin_unlock(&vcpu->kvm->lock);
}
;

void set_cr8(struct kvm_vcpu *vcpu, unsigned long cr8)
{
 if ( cr8 & (~0x0fULL)) {
  printk("<7>" "set_cr8: #GP, reserved bits 0x%lx\n", cr8);
  inject_gp(vcpu);
  return;
 }
 vcpu->cr8 = cr8;
}
;

void fx_init(struct kvm_vcpu *vcpu)
{
 struct __attribute__ ((__packed__)) fx_image_s {
  u16 control;
  u16 status;
  u16 tag;
  u16 opcode;
  u64 ip;
  u64 operand;
  u32 mxcsr;
  u32 mxcsr_mask;

 } *fx_image;

 fx_save(vcpu->host_fx_image);
 fpu_init();
 fx_save(vcpu->guest_fx_image);
 fx_restore(vcpu->host_fx_image);

 fx_image = (struct fx_image_s *)vcpu->guest_fx_image;
 fx_image->mxcsr = 0x1f80;
 memset(vcpu->guest_fx_image + sizeof(struct fx_image_s),
        0, 512 - sizeof(struct fx_image_s));
}
;

static void do_remove_write_access(struct kvm_vcpu *vcpu, int slot)
{
 spin_lock(&vcpu->kvm->lock);
 kvm_mmu_slot_remove_write_access(vcpu, slot);
 spin_unlock(&vcpu->kvm->lock);
}







int kvm_vm_ioctl_set_memory_region(struct kvm *kvm,
           struct kvm_memory_region *mem)
{
 int r;
 gfn_t base_gfn;
 unsigned long npages;
 unsigned long i;
 struct kvm_memory_slot *memslot;
 struct kvm_memory_slot old, new;
 int memory_config_version;

 ;

 printk("<1>" "kvm->lock: %d\n", kvm->lock);

 r = -22;

 if (mem->memory_size & ((1UL << 12) - 1))
  goto out;
 if (mem->guest_phys_addr & ((1UL << 12) - 1))
  goto out;
 if (mem->slot >= 4)
  goto out;
 if (mem->guest_phys_addr + mem->memory_size < mem->guest_phys_addr)
  goto out;

 memslot = &kvm->memslots[mem->slot];
 base_gfn = mem->guest_phys_addr >> 12;
 npages = mem->memory_size >> 12;

 if (!npages)
  mem->flags &= ~1UL;

raced:
 spin_lock(&kvm->lock);

 memory_config_version = kvm->memory_config_version;
 new = old = *memslot;

 new.base_gfn = base_gfn;
 new.npages = npages;
 new.flags = mem->flags;


 r = -22;
 if (npages && old.npages && npages != old.npages)
  goto out_unlock;


 r = -17;
 for (i = 0; i < 4; ++i) {
  struct kvm_memory_slot *s = &kvm->memslots[i];

  if (s == memslot)
   continue;
  if (!((base_gfn + npages <= s->base_gfn) ||
        (base_gfn >= s->base_gfn + s->npages)))
   goto out_unlock;
 }




 spin_unlock(&kvm->lock);


 if (!npages)
  new.phys_mem = ((void *)0);


 if (!(new.flags & 1UL))
  new.dirty_bitmap = ((void *)0);

 r = -12;


 if (npages && !new.phys_mem) {
  new.phys_mem = vmalloc(npages * sizeof(struct page *));

  if (!new.phys_mem)
   goto out_free;

  memset(new.phys_mem, 0, npages * sizeof(struct page *));
  for (i = 0; i < npages; ++i) {



    new.phys_mem[i] = wk_alloc_page(new.base_gfn, i, ((0x10u) | (0x40u) | (0x80u) | (0x20000u) | (0x02u)) | (0x8000u));
   if (!new.phys_mem[i])
    goto out_free;
   ((new.phys_mem[i])->private = (0));
  }
 }


 if ((new.flags & 1UL) && !new.dirty_bitmap) {
  unsigned dirty_bytes = (((npages)+((typeof(npages))(32)-1))&~((typeof(npages))(32)-1)) / 8;

  new.dirty_bitmap = vmalloc(dirty_bytes);
  if (!new.dirty_bitmap)
   goto out_free;
  memset(new.dirty_bitmap, 0, dirty_bytes);
 }

 spin_lock(&kvm->lock);

 if (memory_config_version != kvm->memory_config_version) {
  spin_unlock(&kvm->lock);
  kvm_free_physmem_slot(&new, &old);
  goto raced;
 }

 r = -11;
 if (kvm->busy)
  goto out_unlock;

 if (mem->slot >= kvm->nmemslots)
  kvm->nmemslots = mem->slot + 1;

 *memslot = new;
 ++kvm->memory_config_version;

 spin_unlock(&kvm->lock);

 for (i = 0; i < 1; ++i) {
  struct kvm_vcpu *vcpu;

  vcpu = vcpu_load_slot(kvm, i);
  if (!vcpu)
   continue;
  if (new.flags & 1UL)
   do_remove_write_access(vcpu, mem->slot);
  kvm_mmu_reset_context(vcpu);
  vcpu_put(vcpu);
 }

 kvm_free_physmem_slot(&old, &new);
 ;
 return 0;

out_unlock:
 spin_unlock(&kvm->lock);
out_free:
 kvm_free_physmem_slot(&new, &old);
out:
 ;
 return r;
}




static int kvm_vm_ioctl_get_dirty_log(struct kvm *kvm,
          struct kvm_dirty_log *log)
{
 struct kvm_memory_slot *memslot;
 int r, i;
 int n;
 int cleared;
 unsigned long any = 0;

 spin_lock(&kvm->lock);





 ++kvm->busy;
 spin_unlock(&kvm->lock);
 r = -22;
 if (log->slot >= 4)
  goto out;

 memslot = &kvm->memslots[log->slot];
 r = -2;
 if (!memslot->dirty_bitmap)
  goto out;

 n = (((memslot->npages)+((typeof(memslot->npages))(32)-1))&~((typeof(memslot->npages))(32)-1)) / 8;

 for (i = 0; !any && i < n/sizeof(long); ++i)
  any = memslot->dirty_bitmap[i];

 r = -14;
 if (copy_to_user(log->dirty_bitmap, memslot->dirty_bitmap, n))
  goto out;

 if (any) {
  cleared = 0;
  for (i = 0; i < 1; ++i) {
   struct kvm_vcpu *vcpu;

   vcpu = vcpu_load_slot(kvm, i);
   if (!vcpu)
    continue;
   if (!cleared) {
    do_remove_write_access(vcpu, log->slot);
    memset(memslot->dirty_bitmap, 0, n);
    cleared = 1;
   }
   kvm_arch_ops->tlb_flush(vcpu);
   vcpu_put(vcpu);
  }
 }

 r = 0;

out:
 spin_lock(&kvm->lock);
 --kvm->busy;
 spin_unlock(&kvm->lock);
 return r;
}






static int kvm_vm_ioctl_get_memory_map(struct kvm *kvm,
           struct kvm_dirty_log *log)
{
 struct kvm_memory_slot *memslot;
 unsigned char *mem_bitmap = ((void *)0);
 int r, n;
 unsigned long i;


 spin_lock(&kvm->lock);
 ++kvm->busy;
 spin_unlock(&kvm->lock);

 r = -22;
 if (log->slot >= 4)
  goto out;

 memslot = &kvm->memslots[log->slot];
 r = -2;
 if (!memslot->phys_mem)
  goto out;


 n = memslot->npages / 8;
 r = -12;
 mem_bitmap = vmalloc(n);
 if (!mem_bitmap)
  goto out;
 memset(mem_bitmap, 0, n);


 for (i = 0; i < memslot->npages; ++i)
  if (memslot->phys_mem[i])
   __set_bit(i, mem_bitmap);


 r = -14;
 if (copy_to_user(log->dirty_bitmap, mem_bitmap, n))
  goto out;

 r = 0;
out:
 if (mem_bitmap)
  vfree(mem_bitmap);
 spin_lock(&kvm->lock);
 --kvm->busy;
 spin_unlock(&kvm->lock);
 return r;
}

struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn)
{
 int i;

 for (i = 0; i < kvm->nmemslots; ++i) {
  struct kvm_memory_slot *memslot = &kvm->memslots[i];

  if (gfn >= memslot->base_gfn
      && gfn < memslot->base_gfn + memslot->npages)
   return memslot;
 }
 return ((void *)0);
}
;

void mark_page_dirty(struct kvm *kvm, gfn_t gfn)
{
 int i;
 struct kvm_memory_slot *memslot = ((void *)0);
 unsigned long rel_gfn;

 ;

 for (i = 0; i < kvm->nmemslots; ++i) {
  memslot = &kvm->memslots[i];

  if (gfn >= memslot->base_gfn
      && gfn < memslot->base_gfn + memslot->npages) {

   if (!memslot || !memslot->dirty_bitmap) {
    ;
    return;
   }

   rel_gfn = gfn - memslot->base_gfn;


   if (!test_bit(rel_gfn, memslot->dirty_bitmap))
    set_bit(rel_gfn, memslot->dirty_bitmap);

   ;
   return;
  }
 }
}

static int emulator_read_std(unsigned long addr,
        unsigned long *val,
        unsigned int bytes,
        struct x86_emulate_ctxt *ctxt)
{
 struct kvm_vcpu *vcpu = ctxt->vcpu;
 void *data = val;

 while (bytes) {
  gpa_t gpa = vcpu->mmu.gva_to_gpa(vcpu, addr);
  unsigned offset = addr & ((1UL << 12)-1);
  unsigned tocopy = ((bytes) < ((unsigned)(1UL << 12) - offset) ? bytes : (unsigned)(1UL << 12) - offset);
  unsigned long pfn;
  struct kvm_memory_slot *memslot;
  void *page;

  if (gpa == (~(gpa_t)0))
   return 2;
  pfn = gpa >> 12;
  memslot = gfn_to_memslot(vcpu->kvm, pfn);
  if (!memslot)
   return 1;
  page = kmap_atomic(gfn_to_page(memslot, pfn), KM_USER0);

  memcpy(data, page + offset, tocopy);

  kunmap_atomic(page, KM_USER0);

  bytes -= tocopy;
  data += tocopy;
  addr += tocopy;
 }

 return 0;
}

static int emulator_write_std(unsigned long addr,
         unsigned long val,
         unsigned int bytes,
         struct x86_emulate_ctxt *ctxt)
{
 printk("<3>" "emulator_write_std: addr %lx n %d\n",
        addr, bytes);
 return 1;
}

static int emulator_read_emulated(unsigned long addr,
      unsigned long *val,
      unsigned int bytes,
      struct x86_emulate_ctxt *ctxt)
{
 struct kvm_vcpu *vcpu = ctxt->vcpu;

 if (vcpu->mmio_read_completed) {
  memcpy(val, vcpu->mmio_data, bytes);
  vcpu->mmio_read_completed = 0;
  return 0;
 } else if (emulator_read_std(addr, val, bytes, ctxt)
     == 0)
  return 0;
 else {
  gpa_t gpa = vcpu->mmu.gva_to_gpa(vcpu, addr);

  if (gpa == (~(gpa_t)0))
   return 2;
  vcpu->mmio_needed = 1;
  vcpu->mmio_phys_addr = gpa;
  vcpu->mmio_size = bytes;
  vcpu->mmio_is_write = 0;

  return 1;
 }
}

static int emulator_write_phys(struct kvm_vcpu *vcpu, gpa_t gpa,
          unsigned long val, int bytes)
{
 struct kvm_memory_slot *m;
 struct page *page;
 void *virt;

 if (((gpa + bytes - 1) >> 12) != (gpa >> 12))
  return 0;
 m = gfn_to_memslot(vcpu->kvm, gpa >> 12);
 if (!m)
  return 0;
 page = gfn_to_page(m, gpa >> 12);
 kvm_mmu_pre_write(vcpu, gpa, bytes);
 mark_page_dirty(vcpu->kvm, gpa >> 12);
 virt = kmap_atomic(page, KM_USER0);
 memcpy(virt + ((unsigned long)(gpa) & ~(~((1UL << 12)-1))), &val, bytes);
 kunmap_atomic(virt, KM_USER0);
 kvm_mmu_post_write(vcpu, gpa, bytes);
 return 1;
}

static int emulator_write_emulated(unsigned long addr,
       unsigned long val,
       unsigned int bytes,
       struct x86_emulate_ctxt *ctxt)
{
 struct kvm_vcpu *vcpu = ctxt->vcpu;
 gpa_t gpa = vcpu->mmu.gva_to_gpa(vcpu, addr);

 if (gpa == (~(gpa_t)0))
  return 2;

 if (emulator_write_phys(vcpu, gpa, val, bytes))
  return 0;

 vcpu->mmio_needed = 1;
 vcpu->mmio_phys_addr = gpa;
 vcpu->mmio_size = bytes;
 vcpu->mmio_is_write = 1;
 memcpy(vcpu->mmio_data, &val, bytes);

 return 0;
}

static int emulator_cmpxchg_emulated(unsigned long addr,
         unsigned long old,
         unsigned long new,
         unsigned int bytes,
         struct x86_emulate_ctxt *ctxt)
{
 static int reported;

 if (!reported) {
  reported = 1;
  printk("<4>" "kvm: emulating exchange as write\n");
 }
 return emulator_write_emulated(addr, new, bytes, ctxt);
}



static int emulator_cmpxchg8b_emulated(unsigned long addr,
           unsigned long old_lo,
           unsigned long old_hi,
           unsigned long new_lo,
           unsigned long new_hi,
           struct x86_emulate_ctxt *ctxt)
{
 static int reported;
 int r;

 if (!reported) {
  reported = 1;
  printk("<4>" "kvm: emulating exchange8b as write\n");
 }
 r = emulator_write_emulated(addr, new_lo, 4, ctxt);
 if (r != 0)
  return r;
 return emulator_write_emulated(addr+4, new_hi, 4, ctxt);
}



static unsigned long get_segment_base(struct kvm_vcpu *vcpu, int seg)
{
 return kvm_arch_ops->get_segment_base(vcpu, seg);
}

int emulate_invlpg(struct kvm_vcpu *vcpu, gva_t address)
{
 return 0;
}

int emulate_clts(struct kvm_vcpu *vcpu)
{
 unsigned long cr0;

 kvm_arch_ops->decache_cr0_cr4_guest_bits(vcpu);
 cr0 = vcpu->cr0 & ~(1ULL << 3);
 kvm_arch_ops->set_cr0(vcpu, cr0);
 return 0;
}

int emulator_get_dr(struct x86_emulate_ctxt* ctxt, int dr, unsigned long *dest)
{
 struct kvm_vcpu *vcpu = ctxt->vcpu;

 switch (dr) {
 case 0 ... 3:
  *dest = kvm_arch_ops->get_dr(vcpu, dr);
  return 0;
 default:
  printk("<7>" "%s: unexpected dr %u\n",
         __FUNCTION__, dr);
  return 1;
 }
}

int emulator_set_dr(struct x86_emulate_ctxt *ctxt, int dr, unsigned long value)
{
 unsigned long mask = (ctxt->mode == 8) ? ~0ULL : ~0U;
 int exception;

 kvm_arch_ops->set_dr(ctxt->vcpu, dr, value & mask, &exception);
 if (exception) {

  return 1;
 }
 return 0;
}

static void report_emulation_failure(struct x86_emulate_ctxt *ctxt)
{
 static int reported;
 u8 opcodes[4];
 unsigned long rip = ctxt->vcpu->rip;
 unsigned long rip_linear;

 rip_linear = rip + get_segment_base(ctxt->vcpu, VCPU_SREG_CS);

 if (reported)
  return;

 emulator_read_std(rip_linear, (void *)opcodes, 4, ctxt);

 printk("<3>" "emulation failed but !mmio_needed?"
        " rip %lx %02x %02x %02x %02x\n",
        rip, opcodes[0], opcodes[1], opcodes[2], opcodes[3]);
 reported = 1;
}

struct x86_emulate_ops emulate_ops = {
 .read_std = emulator_read_std,
 .write_std = emulator_write_std,
 .read_emulated = emulator_read_emulated,
 .write_emulated = emulator_write_emulated,
 .cmpxchg_emulated = emulator_cmpxchg_emulated,

 .cmpxchg8b_emulated = emulator_cmpxchg8b_emulated,

};

int emulate_instruction(struct kvm_vcpu *vcpu,
   struct kvm_run *run,
   unsigned long cr2,
   u16 error_code)
{
 struct x86_emulate_ctxt emulate_ctxt;
 int r;
 int cs_db, cs_l;

 ;

 vcpu->mmio_fault_cr2 = cr2;
 kvm_arch_ops->cache_regs(vcpu);

 kvm_arch_ops->get_cs_db_l_bits(vcpu, &cs_db, &cs_l);

 emulate_ctxt.vcpu = vcpu;
 emulate_ctxt.eflags = kvm_arch_ops->get_rflags(vcpu);
 emulate_ctxt.cr2 = cr2;
 emulate_ctxt.mode = (emulate_ctxt.eflags & 0x00020000)
  ? 0 : cs_l
  ? 8 : cs_db
  ? 4 : 2;

 if (emulate_ctxt.mode == 8) {
  emulate_ctxt.cs_base = 0;
  emulate_ctxt.ds_base = 0;
  emulate_ctxt.es_base = 0;
  emulate_ctxt.ss_base = 0;
 } else {
  emulate_ctxt.cs_base = get_segment_base(vcpu, VCPU_SREG_CS);
  emulate_ctxt.ds_base = get_segment_base(vcpu, VCPU_SREG_DS);
  emulate_ctxt.es_base = get_segment_base(vcpu, VCPU_SREG_ES);
  emulate_ctxt.ss_base = get_segment_base(vcpu, VCPU_SREG_SS);
 }

 emulate_ctxt.gs_base = get_segment_base(vcpu, VCPU_SREG_GS);
 emulate_ctxt.fs_base = get_segment_base(vcpu, VCPU_SREG_FS);

 vcpu->mmio_is_write = 0;
 r = x86_emulate_memop(&emulate_ctxt, &emulate_ops);

 if ((r || vcpu->mmio_is_write) && run) {
  run->mmio.phys_addr = vcpu->mmio_phys_addr;
  memcpy(run->mmio.data, vcpu->mmio_data, 8);
  run->mmio.len = vcpu->mmio_size;
  run->mmio.is_write = vcpu->mmio_is_write;
 }

 if (r) {
  if (kvm_mmu_unprotect_page_virt(vcpu, cr2)) {
   ;
   return EMULATE_DONE;
  }
  if (!vcpu->mmio_needed) {
   report_emulation_failure(&emulate_ctxt);
   ;
   return EMULATE_FAIL;
  }
  ;
  return EMULATE_DO_MMIO;
 }

 kvm_arch_ops->decache_regs(vcpu);
 kvm_arch_ops->set_rflags(vcpu, emulate_ctxt.eflags);

 if (vcpu->mmio_is_write) {
  ;
  return EMULATE_DO_MMIO;
 }

 ;

 return EMULATE_DONE;
}
;

int kvm_hypercall(struct kvm_vcpu *vcpu, struct kvm_run *run)
{
 unsigned long nr, a0, a1, a2, a3, a4, a5, ret;

 kvm_arch_ops->cache_regs(vcpu);
 ret = -1;
# 1319 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
 {
  nr = vcpu->regs[VCPU_REGS_RBX] & -1u;
  a0 = vcpu->regs[VCPU_REGS_RAX] & -1u;
  a1 = vcpu->regs[VCPU_REGS_RCX] & -1u;
  a2 = vcpu->regs[VCPU_REGS_RDX] & -1u;
  a3 = vcpu->regs[VCPU_REGS_RSI] & -1u;
  a4 = vcpu->regs[VCPU_REGS_RDI] & -1u;
  a5 = vcpu->regs[VCPU_REGS_RBP] & -1u;
 }
 switch (nr) {
 default:
  ;
 }
 vcpu->regs[VCPU_REGS_RAX] = ret;
 kvm_arch_ops->decache_regs(vcpu);
 return 1;
}
;

static u64 mk_cr_64(u64 curr_cr, u32 new_val)
{
 return (curr_cr & ~((1ULL << 32) - 1)) | new_val;
}

void realmode_lgdt(struct kvm_vcpu *vcpu, u16 limit, unsigned long base)
{
 struct descriptor_table dt = { limit, base };

 kvm_arch_ops->set_gdt(vcpu, &dt);
}

void realmode_lidt(struct kvm_vcpu *vcpu, u16 limit, unsigned long base)
{
 struct descriptor_table dt = { limit, base };

 kvm_arch_ops->set_idt(vcpu, &dt);
}

void realmode_lmsw(struct kvm_vcpu *vcpu, unsigned long msw,
     unsigned long *rflags)
{
 lmsw(vcpu, msw);
 *rflags = kvm_arch_ops->get_rflags(vcpu);
}

unsigned long realmode_get_cr(struct kvm_vcpu *vcpu, int cr)
{
 kvm_arch_ops->decache_cr0_cr4_guest_bits(vcpu);
 switch (cr) {
 case 0:
  return vcpu->cr0;
 case 2:
  return vcpu->cr2;
 case 3:
  return vcpu->cr3;
 case 4:
  return vcpu->cr4;
 default:
  printk("<7>" "%s: unexpected cr %u\n", __FUNCTION__, cr);
  return 0;
 }
}

void realmode_set_cr(struct kvm_vcpu *vcpu, int cr, unsigned long val,
       unsigned long *rflags)
{
 switch (cr) {
 case 0:
  set_cr0(vcpu, mk_cr_64(vcpu->cr0, val));
  *rflags = kvm_arch_ops->get_rflags(vcpu);
  break;
 case 2:
  vcpu->cr2 = val;
  break;
 case 3:
  set_cr3(vcpu, val);
  break;
 case 4:
  set_cr4(vcpu, mk_cr_64(vcpu->cr4, val));
  break;
 default:
  printk("<7>" "%s: unexpected cr %u\n", __FUNCTION__, cr);
 }
}




static int vcpu_register_para(struct kvm_vcpu *vcpu, gpa_t para_state_gpa)
{
 struct kvm_vcpu_para_state *para_state;
 hpa_t para_state_hpa, hypercall_hpa;
 struct page *para_state_page;
 unsigned char *hypercall;
 gpa_t hypercall_gpa;

 printk("<7>" "kvm: guest trying to enter paravirtual mode\n");
 printk("<7>" ".... para_state_gpa: %08Lx\n", para_state_gpa);




 if (para_state_gpa != (((para_state_gpa)+(1UL << 12)-1)&(~((1UL << 12)-1))))
  goto err_gp;

 para_state_hpa = gpa_to_hpa(vcpu, para_state_gpa);
 printk("<7>" ".... para_state_hpa: %08Lx\n", para_state_hpa);
 if (is_error_hpa(para_state_hpa))
  goto err_gp;

 mark_page_dirty(vcpu->kvm, para_state_gpa >> 12);
 para_state_page = pfn_to_page(para_state_hpa >> 12);
 para_state = kmap_atomic(para_state_page, KM_USER0);

 printk("<7>" "....  guest version: %d\n", para_state->guest_version);
 printk("<7>" "....           size: %d\n", para_state->size);

 para_state->host_version = 1;




 if (para_state->guest_version > 1) {
  para_state->ret = -1;
  goto err_kunmap_skip;
 }

 hypercall_gpa = para_state->hypercall_gpa;
 hypercall_hpa = gpa_to_hpa(vcpu, hypercall_gpa);
 printk("<7>" ".... hypercall_hpa: %08Lx\n", hypercall_hpa);
 if (is_error_hpa(hypercall_hpa)) {
  para_state->ret = -1;
  goto err_kunmap_skip;
 }

 printk("<7>" "kvm: para guest successfully registered.\n");
 vcpu->para_state_page = para_state_page;
 vcpu->para_state_gpa = para_state_gpa;
 vcpu->hypercall_gpa = hypercall_gpa;

 mark_page_dirty(vcpu->kvm, hypercall_gpa >> 12);
 hypercall = kmap_atomic(pfn_to_page(hypercall_hpa >> 12),
    KM_USER1) + (hypercall_hpa & ~(~((1UL << 12)-1)));
 kvm_arch_ops->patch_hypercall(vcpu, hypercall);
 kunmap_atomic(hypercall, KM_USER1);

 para_state->ret = 0;
err_kunmap_skip:
 kunmap_atomic(para_state, KM_USER0);
 return 0;
err_gp:
 return 1;
}

int kvm_get_msr_common(struct kvm_vcpu *vcpu, u32 msr, u64 *pdata)
{
 u64 data;

 switch (msr) {
 case 0xc0010010:
 case 0xc0010015:
 case 0x00000017:
 case 0x00000000:
 case 0x00000001:
 case 0x00000400:
 case 0x0000017a:
 case 0x00000179:
 case 0x00000403:
 case 0x00000403 +4:
 case 0x00000403 +8:
 case 0x00000403 +12:
 case 0x00000403 +16:
 case 0x0000008b:
 case 0x00000198:

 case 0xfe:
 case 0x200 ... 0x2ff:
  data = 0;
  break;
 case 0xcd:
  data = 3;
  break;
 case 0x0000001b:
  data = vcpu->apic_base;
  break;
 case 0x000001a0:
  data = vcpu->ia32_misc_enable_msr;
  break;





 default:
  printk("<3>" "kvm: unhandled rdmsr: 0x%x\n", msr);
  return 1;
 }
 *pdata = data;
 return 0;
}
;






static int get_msr(struct kvm_vcpu *vcpu, u32 msr_index, u64 *pdata)
{
 return kvm_arch_ops->get_msr(vcpu, msr_index, pdata);
}
# 1559 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
int kvm_set_msr_common(struct kvm_vcpu *vcpu, u32 msr, u64 data)
{
 switch (msr) {





 case 0x00000401:
  printk("<4>" "%s: MSR_IA32_MC0_STATUS 0x%llx, nop\n",
         __FUNCTION__, data);
  break;
 case 0x0000008b:
 case 0x00000079:
 case 0x200 ... 0x2ff:
  break;
 case 0x0000001b:
  vcpu->apic_base = data;
  break;
 case 0x000001a0:
  vcpu->ia32_misc_enable_msr = data;
  break;



 case 0x87655678:
  return vcpu_register_para(vcpu, data);

 default:
  printk("<3>" "kvm: unhandled wrmsr: 0x%x\n", msr);
  return 1;
 }
 return 0;
}
;






static int set_msr(struct kvm_vcpu *vcpu, u32 msr_index, u64 data)
{
 return kvm_arch_ops->set_msr(vcpu, msr_index, data);
}

void kvm_resched(struct kvm_vcpu *vcpu)
{
 ;






 ;
}
;

void load_msrs(struct kvm_msr_entry *e, int n)
{
 int i;

 for (i = 0; i < n; ++i)
  native_write_msr(e[i].index, e[i].data);
}
;

void save_msrs(struct kvm_msr_entry *e, int n)
{
 int i;

 for (i = 0; i < n; ++i)
  ((e[i].data) = native_read_msr(e[i].index));
}
;

int kvm_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 int r;

 ;

 vcpu_load(vcpu);


 vcpu->cr8 = kvm_run->cr8;

 if (kvm_run->emulated) {
  kvm_arch_ops->skip_emulated_instruction(vcpu);
  kvm_run->emulated = 0;
 }

 if (kvm_run->mmio_completed) {
  memcpy(vcpu->mmio_data, kvm_run->mmio.data, 8);
  vcpu->mmio_read_completed = 1;
  emulate_instruction(vcpu, kvm_run, vcpu->mmio_fault_cr2, 0);
 }

 vcpu->mmio_needed = 0;

 r = kvm_arch_ops->run(vcpu, kvm_run);

 vcpu_put(vcpu);

 ;
 return r;
}

int kvm_vcpu_ioctl_get_regs(struct kvm_vcpu *vcpu,
       struct kvm_regs *regs)
{
 ;
 vcpu_load(vcpu);

 kvm_arch_ops->cache_regs(vcpu);

 regs->rax = vcpu->regs[VCPU_REGS_RAX];
 regs->rbx = vcpu->regs[VCPU_REGS_RBX];
 regs->rcx = vcpu->regs[VCPU_REGS_RCX];
 regs->rdx = vcpu->regs[VCPU_REGS_RDX];
 regs->rsi = vcpu->regs[VCPU_REGS_RSI];
 regs->rdi = vcpu->regs[VCPU_REGS_RDI];
 regs->rsp = vcpu->regs[VCPU_REGS_RSP];
 regs->rbp = vcpu->regs[VCPU_REGS_RBP];
# 1695 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
 regs->rip = vcpu->rip;
 regs->rflags = kvm_arch_ops->get_rflags(vcpu);




 if (vcpu->guest_debug.enabled && vcpu->guest_debug.singlestep)
  regs->rflags &= ~(0x00000100 | 0x00010000);

 vcpu_put(vcpu);

 ;

 return 0;
}

int kvm_vcpu_ioctl_set_regs(struct kvm_vcpu *vcpu,
       struct kvm_regs *regs)
{
 ;
 vcpu_load(vcpu);

 vcpu->regs[VCPU_REGS_RAX] = regs->rax;
 vcpu->regs[VCPU_REGS_RBX] = regs->rbx;
 vcpu->regs[VCPU_REGS_RCX] = regs->rcx;
 vcpu->regs[VCPU_REGS_RDX] = regs->rdx;
 vcpu->regs[VCPU_REGS_RSI] = regs->rsi;
 vcpu->regs[VCPU_REGS_RDI] = regs->rdi;
 vcpu->regs[VCPU_REGS_RSP] = regs->rsp;
 vcpu->regs[VCPU_REGS_RBP] = regs->rbp;
# 1736 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
 vcpu->rip = regs->rip;
 kvm_arch_ops->set_rflags(vcpu, regs->rflags);

 kvm_arch_ops->decache_regs(vcpu);

 vcpu_put(vcpu);

 ;

 return 0;
}

static void get_segment(struct kvm_vcpu *vcpu,
   struct kvm_segment *var, int seg)
{
 return kvm_arch_ops->get_segment(vcpu, var, seg);
}

int kvm_vcpu_ioctl_get_sregs(struct kvm_vcpu *vcpu,
        struct kvm_sregs *sregs)
{
 struct descriptor_table dt;

 ;

 vcpu_load(vcpu);

 get_segment(vcpu, &sregs->cs, VCPU_SREG_CS);
 get_segment(vcpu, &sregs->ds, VCPU_SREG_DS);
 get_segment(vcpu, &sregs->es, VCPU_SREG_ES);
 get_segment(vcpu, &sregs->fs, VCPU_SREG_FS);
 get_segment(vcpu, &sregs->gs, VCPU_SREG_GS);
 get_segment(vcpu, &sregs->ss, VCPU_SREG_SS);

 get_segment(vcpu, &sregs->tr, VCPU_SREG_TR);
 get_segment(vcpu, &sregs->ldt, VCPU_SREG_LDTR);

 kvm_arch_ops->get_idt(vcpu, &dt);
 sregs->idt.limit = dt.limit;
 sregs->idt.base = dt.base;
 kvm_arch_ops->get_gdt(vcpu, &dt);
 sregs->gdt.limit = dt.limit;
 sregs->gdt.base = dt.base;

 kvm_arch_ops->decache_cr0_cr4_guest_bits(vcpu);
 sregs->cr0 = vcpu->cr0;
 sregs->cr2 = vcpu->cr2;
 sregs->cr3 = vcpu->cr3;
 sregs->cr4 = vcpu->cr4;
 sregs->cr8 = vcpu->cr8;
 sregs->efer = vcpu->shadow_efer;
 sregs->apic_base = vcpu->apic_base;

 memcpy(sregs->interrupt_bitmap, vcpu->irq_pending,
        sizeof sregs->interrupt_bitmap);

 vcpu_put(vcpu);

 ;

 return 0;
}

static void set_segment(struct kvm_vcpu *vcpu,
   struct kvm_segment *var, int seg)
{
 return kvm_arch_ops->set_segment(vcpu, var, seg);
}

int kvm_vcpu_ioctl_set_sregs(struct kvm_vcpu *vcpu,
        struct kvm_sregs *sregs)
{
 int mmu_reset_needed = 0;
 int i;
 struct descriptor_table dt;

 ;

 vcpu_load(vcpu);

 set_segment(vcpu, &sregs->cs, VCPU_SREG_CS);
 set_segment(vcpu, &sregs->ds, VCPU_SREG_DS);
 set_segment(vcpu, &sregs->es, VCPU_SREG_ES);
 set_segment(vcpu, &sregs->fs, VCPU_SREG_FS);
 set_segment(vcpu, &sregs->gs, VCPU_SREG_GS);
 set_segment(vcpu, &sregs->ss, VCPU_SREG_SS);

 set_segment(vcpu, &sregs->tr, VCPU_SREG_TR);
 set_segment(vcpu, &sregs->ldt, VCPU_SREG_LDTR);

 dt.limit = sregs->idt.limit;
 dt.base = sregs->idt.base;
 kvm_arch_ops->set_idt(vcpu, &dt);
 dt.limit = sregs->gdt.limit;
 dt.base = sregs->gdt.base;
 kvm_arch_ops->set_gdt(vcpu, &dt);

 vcpu->cr2 = sregs->cr2;
 mmu_reset_needed |= vcpu->cr3 != sregs->cr3;
 vcpu->cr3 = sregs->cr3;

 vcpu->cr8 = sregs->cr8;

 mmu_reset_needed |= vcpu->shadow_efer != sregs->efer;



 vcpu->apic_base = sregs->apic_base;

 kvm_arch_ops->decache_cr0_cr4_guest_bits(vcpu);

 mmu_reset_needed |= vcpu->cr0 != sregs->cr0;
 kvm_arch_ops->set_cr0_no_modeswitch(vcpu, sregs->cr0);

 mmu_reset_needed |= vcpu->cr4 != sregs->cr4;
 kvm_arch_ops->set_cr4(vcpu, sregs->cr4);
 if (!is_long_mode(vcpu) && is_pae(vcpu))
  load_pdptrs(vcpu, vcpu->cr3);

 if (mmu_reset_needed)
  kvm_mmu_reset_context(vcpu);

 memcpy(vcpu->irq_pending, sregs->interrupt_bitmap,
        sizeof vcpu->irq_pending);
 vcpu->irq_summary = 0;
 for (i = 0; i < (((256 + 7) / 8) / sizeof(unsigned long)); ++i)
  if (vcpu->irq_pending[i])
   __set_bit(i, &vcpu->irq_summary);

 vcpu_put(vcpu);

 ;

 return 0;
}
# 1879 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
u32 msrs_to_save[] = {
 0x00000174, 0x00000175, 0x00000176,
 0xc0000081,



 0x010,
};

unsigned num_msrs_to_save;

u32 emulated_msrs[] = {
 0x000001a0,
};

unsigned long get_emulated_msrs_array_size(void)
{
 return (sizeof(emulated_msrs) / sizeof((emulated_msrs)[0]) + (0));
}

static void kvm_init_msr_list(void)
{
 u32 dummy[2];
 unsigned i, j;

 ;

 for (i = j = 0; i < (sizeof(msrs_to_save) / sizeof((msrs_to_save)[0]) + (0)); i++) {
  if (({ int __err = 1; u64 __val = native_read_msr(msrs_to_save[i]); (*&dummy[0]) = (u32)__val; (*&dummy[1]) = (u32)(__val >> 32); __err; }) < 0)
   continue;
  if (j < i)
   msrs_to_save[j] = msrs_to_save[i];
  j++;
 }
 num_msrs_to_save = j;

 ;
}




static int do_set_msr(struct kvm_vcpu *vcpu, unsigned index, u64 *data)
{
 return set_msr(vcpu, index, *data);
}






static int __msr_io(struct kvm_vcpu *vcpu, struct kvm_msrs *msrs,
      struct kvm_msr_entry *entries,
      int (*do_msr)(struct kvm_vcpu *vcpu,
      unsigned index, u64 *data))
{
 int i;

 vcpu_load(vcpu);

 for (i = 0; i < msrs->nmsrs; ++i)
  if (do_msr(vcpu, entries[i].index, &entries[i].data))
   break;

 vcpu_put(vcpu);

 return i;
}






static int msr_io(struct kvm_vcpu *vcpu, struct kvm_msrs *user_msrs,
    int (*do_msr)(struct kvm_vcpu *vcpu,
    unsigned index, u64 *data),
    int writeback)
{
 struct kvm_msrs msrs;
 struct kvm_msr_entry *entries;
 int r, n;
 unsigned size;

 r = -14;
 if (copy_from_user(&msrs, user_msrs, sizeof msrs))
  goto out;

 r = -7;
 if (msrs.nmsrs >= 256)
  goto out;

 r = -12;
 size = sizeof(struct kvm_msr_entry) * msrs.nmsrs;
 entries = vmalloc(size);
 if (!entries)
  goto out;

 r = -14;
 if (copy_from_user(entries, user_msrs->entries, size))
  goto out_free;

 r = n = __msr_io(vcpu, &msrs, entries, do_msr);
 if (r < 0)
  goto out_free;

 r = -14;
 if (writeback && copy_to_user(user_msrs->entries, entries, size))
  goto out_free;

 r = n;

out_free:
 vfree(entries);
out:
 return r;
}




int kvm_vcpu_ioctl_translate(struct kvm_vcpu *vcpu,
        struct kvm_translation *tr)
{
 unsigned long vaddr = tr->linear_address;
 gpa_t gpa;

 vcpu_load(vcpu);
 spin_lock(&vcpu->kvm->lock);
 gpa = vcpu->mmu.gva_to_gpa(vcpu, vaddr);
 tr->physical_address = gpa;
 tr->valid = gpa != (~(gpa_t)0);
 tr->writeable = 1;
 tr->usermode = 0;
 spin_unlock(&vcpu->kvm->lock);
 vcpu_put(vcpu);

 return 0;
}

int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu,
        struct kvm_interrupt *irq)
{
 if (irq->irq < 0 || irq->irq >= 256)
  return -22;
 vcpu_load(vcpu);

 set_bit(irq->irq, vcpu->irq_pending);
 set_bit(irq->irq / 32, &vcpu->irq_summary);

 vcpu_put(vcpu);

 return 0;
}

static int kvm_vcpu_ioctl_debug_guest(struct kvm_vcpu *vcpu,
          struct kvm_debug_guest *dbg)
{
 int r;

 vcpu_load(vcpu);

 r = kvm_arch_ops->set_guest_debug(vcpu, dbg);

 vcpu_put(vcpu);

 return r;
}

static int kvm_vcpu_release(struct inode *inode, struct file *filp)
{
 struct kvm_vcpu *vcpu = filp->private_data;

 fput(vcpu->kvm->filp);
 return 0;
}

static struct file_operations kvm_vcpu_fops = {
 .release = kvm_vcpu_release,
 .unlocked_ioctl = kvm_vcpu_ioctl,
 .compat_ioctl = kvm_vcpu_ioctl,
};




int create_vcpu_fd(struct kvm_vcpu *vcpu)
{
 int fd, r;
 struct inode *inode;
 struct file *file;

 ;

 atomic_inc(&vcpu->kvm->filp->f_count);

 inode = kvmfs_inode(&kvm_vcpu_fops);
 if (IS_ERR(inode)) {
  r = PTR_ERR(inode);
  goto out1;
 }




 file = kvmfs_file(inode, vcpu, WINKVM_VCPU);

 if (IS_ERR(file)) {
  r = PTR_ERR(file);
  goto out2;
 }

 r = get_unused_fd();
 if (r < 0)
  goto out3;
 fd = r;
 fd_install(fd, file);

 ;
 return fd;

out3:
 fput(file);
out2:
 iput(inode);
out1:
 fput(vcpu->kvm->filp);
 return r;
}




int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, int n)
{
 int r;
 struct kvm_vcpu *vcpu;

 ;

 r = -22;
 if (!valid_vcpu(n))
  goto out;

 vcpu = &kvm->vcpus[n];

 mutex_lock(&vcpu->mutex);

 if (vcpu->vmcs) {
  mutex_unlock(&vcpu->mutex);
  return -17;
 }

 vcpu->host_fx_image = (char*)((((hva_t)vcpu->fx_buf)+((typeof((hva_t)vcpu->fx_buf))(16)-1))&~((typeof((hva_t)vcpu->fx_buf))(16)-1));

 vcpu->guest_fx_image = vcpu->host_fx_image + 512;

 r = kvm_arch_ops->vcpu_create(vcpu);
 if (r < 0)
  goto out_free_vcpus;

 r = kvm_mmu_create(vcpu);
 if (r < 0)
  goto out_free_vcpus;

 kvm_arch_ops->vcpu_load(vcpu);
 r = kvm_mmu_setup(vcpu);
 if (r >= 0)
  r = kvm_arch_ops->vcpu_setup(vcpu);
 vcpu_put(vcpu);

 if (r < 0)
  goto out_free_vcpus;

 r = create_vcpu_fd(vcpu);
 if (r < 0)
  goto out_free_vcpus;

 ;
 return r;

out_free_vcpus:
 kvm_free_vcpu(vcpu);
 mutex_unlock(&vcpu->mutex);
out:
 return r;
}

long kvm_vcpu_ioctl(struct file *filp,
     unsigned int ioctl, unsigned long arg)
{
# 2293 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
 return -22;

}

static long kvm_vm_ioctl(struct file *filp,
      unsigned int ioctl, unsigned long arg)
{
# 2350 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
 return -22;

}

static struct page *kvm_vm_nopage(struct vm_area_struct *vma,
          unsigned long address,
          int *type)
{
 struct kvm *kvm = vma->vm_file->private_data;
 unsigned long pgoff;
 struct kvm_memory_slot *slot;
 struct page *page;

 *type = 0;
 pgoff = ((address - vma->vm_start) >> 12) + vma->vm_pgoff;
 slot = gfn_to_memslot(kvm, pgoff);
 if (!slot)
  return (((void *)0));
 page = gfn_to_page(slot, pgoff);
 if (!page)
  return (((void *)0));
 get_page(page);
 return page;
}

static struct vm_operations_struct kvm_vm_vm_ops = {
 .nopage = kvm_vm_nopage,
};

static int kvm_vm_mmap(struct file *file, struct vm_area_struct *vma)
{
 vma->vm_ops = &kvm_vm_vm_ops;
 return 0;
}

static struct file_operations kvm_vm_fops = {
 .release = kvm_vm_release,
 .unlocked_ioctl = kvm_vm_ioctl,
 .compat_ioctl = kvm_vm_ioctl,
 .mmap = kvm_vm_mmap,
};

int kvm_dev_ioctl_create_vm(void)
{
 int fd, r;
 struct inode *inode;
 struct file *file;
 struct kvm *kvm;

 inode = kvmfs_inode(&kvm_vm_fops);
 if (IS_ERR(inode)) {
  r = PTR_ERR(inode);
  goto out1;
 }

 kvm = kvm_create_vm();
 if (IS_ERR(kvm)) {
  r = PTR_ERR(kvm);
  goto out2;
 }




 file = kvmfs_file(inode, kvm, WINKVM_KVM);

 if (IS_ERR(file)) {
  r = PTR_ERR(file);
  goto out3;
 }
 kvm->filp = file;

 r = get_unused_fd();
 if (r < 0)
  goto out4;
 fd = r;
 fd_install(fd, file);

 return fd;

out4:
 fput(file);
out3:
 kvm_destroy_vm(kvm);
out2:
 iput(inode);
out1:
 return r;
}

static long kvm_dev_ioctl(struct file *filp,
     unsigned int ioctl, unsigned long arg)
{
# 2487 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
 return -22;

}

static struct file_operations kvm_chardev_ops = {
 .open = kvm_dev_open,
 .release = kvm_dev_release,
 .unlocked_ioctl = kvm_dev_ioctl,
 .compat_ioctl = kvm_dev_ioctl,
};

static struct miscdevice kvm_dev = {
 232,
 "kvm",
 &kvm_chardev_ops,
};

static int kvm_reboot(struct notifier_block *notifier, unsigned long val,
                       void *v)
{
 if (val == 0x0001) {




  printk("<6>" "kvm: exiting hardware virtualization\n");
  on_each_cpu(kvm_arch_ops->hardware_disable, ((void *)0), 0, 1);
 }
 return 0x0001;
}

static struct notifier_block kvm_reboot_notifier = {
 .notifier_call = kvm_reboot,
 .priority = 0,
};





static void decache_vcpus_on_cpu(int cpu)
{
 struct kvm *vm;
 struct kvm_vcpu *vcpu;
 int i;

 spin_lock(&kvm_lock);
 for (vm = ({ const typeof( ((typeof(*vm) *)0)->vm_list ) *__mptr = ((&vm_list)->next); (typeof(*vm) *)( (char *)__mptr - __builtin_offsetof(typeof(*vm),vm_list) );}); prefetch(vm->vm_list.next), &vm->vm_list != (&vm_list); vm = ({ const typeof( ((typeof(*vm) *)0)->vm_list ) *__mptr = (vm->vm_list.next); (typeof(*vm) *)( (char *)__mptr - __builtin_offsetof(typeof(*vm),vm_list) );}))
  for (i = 0; i < 1; ++i) {
   vcpu = &vm->vcpus[i];
# 2545 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
   if (mutex_trylock(&vcpu->mutex)) {
    if (vcpu->cpu == cpu) {
     kvm_arch_ops->vcpu_decache(vcpu);
     vcpu->cpu = -1;
    }
    mutex_unlock(&vcpu->mutex);
   }
  }
 spin_unlock(&kvm_lock);
}

static int kvm_cpu_hotplug(struct notifier_block *notifier, unsigned long val,
      void *v)
{
 int cpu = (long)v;

 switch (val) {
 case 0x0005:
 case 0x0004:
  printk("<6>" "kvm: disabling virtualization on CPU%d\n",
         cpu);
  decache_vcpus_on_cpu(cpu);
  smp_call_function_single(cpu, kvm_arch_ops->hardware_disable,
      ((void *)0), 0, 1);
  break;
 case 0x0002:
  printk("<6>" "kvm: enabling virtualization on CPU%d\n",
         cpu);
  smp_call_function_single(cpu, kvm_arch_ops->hardware_enable,
      ((void *)0), 0, 1);
  break;
 }
 return 0x0001;
}
# 2650 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
int kvm_init_arch(struct kvm_arch_ops *ops, struct module *module)
{
# 2714 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
 int r;

 printk("<3>" "starting kvm_init_arch\n");

 if (kvm_arch_ops) {
  printk("<3>" "winkvm: already loaded the other module\n");
  return -17;
 }

 if (!ops->cpu_has_kvm_support()) {
  printk("<3>" "winkvm: no hardware support\n");
  return -95;
 }

 if (ops->disabled_by_bios()) {
  printk("<3>" "kvm: disabled by bios\n");
  return -95;
 }

 kvm_arch_ops = ops;

 printk("<3>" "start kvm arch ops...\n");
 r = kvm_arch_ops->hardware_setup();
 if (r < 0) {
  printk("<3>" "Could not enable HVM hardware setup\n");
  goto out;
 }

 on_each_cpu(kvm_arch_ops->hardware_enable, ((void *)0), 0, 1);

 printk("<1>" "end\n");

out:
 return r;

}

void kvm_exit_arch(void)
{
# 2763 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
 ;

 on_each_cpu(kvm_arch_ops->hardware_disable, ((void *)0), 0, 1);
 kvm_arch_ops->hardware_unsetup();
 kvm_arch_ops = ((void *)0);

 ;

}

extern void test_call(char *from_func, int a, int b, int c);
static int kvm_init(void)
{
# 2814 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
 test_call(__FUNCTION__, 10, 20, 30);
 kvm_init_msr_list();

 return 0;

}
static void kvm_exit(void)
{






}



void test_1_t(int a, int b, int c)
{
 printk("<1>" "%d %d %d %s\n",
     a, b, c, __FUNCTION__);
 return;
}

static int test_2_t(int a, int b, int c)
{
 printk("<1>" "%d, %d, %d %s\n",
     a, b, c, __FUNCTION__);
 return 1;
}

int check_function_pointer_test(void)
{
 struct func_pointer_test *func_p;

 ;

 func_p = kmalloc(sizeof(struct func_pointer_test), ((0x10u) | (0x40u) | (0x80u)));
 if (!func_p) {
  printk("<1>" "Can not allocate memory for func test\n");
  return 0;
 }

 memset(func_p, 0, sizeof(struct func_pointer_test));

 func_p->test_1 = test_1_t;
 func_p->test_2 = test_2_t;

 func_p->test_1(1, 2, 3);
 func_p->test_2(10, 20, 30);

 kfree(func_p);

 ;

 return 1;

}





;
;
