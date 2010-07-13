# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
# 1 "/cygdrive/z/winkvm/windows-linux-compat//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./include/linux/autoconf.h" 1
# 1 "<command-line>" 2
# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
# 18 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
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
# 19 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 2

# 1 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_vmx.h" 1
# 21 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 2
# 31 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
# 1 "include/asm/processor-flags.h" 1
# 32 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 2



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
# 36 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 2

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
# 38 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 2

;;
;;





static struct vmcs *g_vmxarea_[1];
static struct vmcs *g_current_vmcs_[1];
# 56 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
static struct vmcs_descriptor {
 int size;
 int order;
 u32 revision_id;
} vmcs_descriptor;
# 70 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
static struct kvm_vmx_segment_field {
 unsigned selector;
 unsigned base;
 unsigned limit;
 unsigned ar_bytes;
} kvm_vmx_segment_fields[] = {
 [VCPU_SREG_CS] = { .selector = GUEST_CS_SELECTOR, .base = GUEST_CS_BASE, .limit = GUEST_CS_LIMIT, .ar_bytes = GUEST_CS_AR_BYTES, },
 [VCPU_SREG_DS] = { .selector = GUEST_DS_SELECTOR, .base = GUEST_DS_BASE, .limit = GUEST_DS_LIMIT, .ar_bytes = GUEST_DS_AR_BYTES, },
 [VCPU_SREG_ES] = { .selector = GUEST_ES_SELECTOR, .base = GUEST_ES_BASE, .limit = GUEST_ES_LIMIT, .ar_bytes = GUEST_ES_AR_BYTES, },
 [VCPU_SREG_FS] = { .selector = GUEST_FS_SELECTOR, .base = GUEST_FS_BASE, .limit = GUEST_FS_LIMIT, .ar_bytes = GUEST_FS_AR_BYTES, },
 [VCPU_SREG_GS] = { .selector = GUEST_GS_SELECTOR, .base = GUEST_GS_BASE, .limit = GUEST_GS_LIMIT, .ar_bytes = GUEST_GS_AR_BYTES, },
 [VCPU_SREG_SS] = { .selector = GUEST_SS_SELECTOR, .base = GUEST_SS_BASE, .limit = GUEST_SS_LIMIT, .ar_bytes = GUEST_SS_AR_BYTES, },
 [VCPU_SREG_TR] = { .selector = GUEST_TR_SELECTOR, .base = GUEST_TR_BASE, .limit = GUEST_TR_LIMIT, .ar_bytes = GUEST_TR_AR_BYTES, },
 [VCPU_SREG_LDTR] = { .selector = GUEST_LDTR_SELECTOR, .base = GUEST_LDTR_BASE, .limit = GUEST_LDTR_LIMIT, .ar_bytes = GUEST_LDTR_AR_BYTES, },
};

static const u32 vmx_msr_index[] = {



 0xc0000080, 0xc0000081,
};


static inline __attribute__((always_inline)) int is_page_fault(u32 intr_info)
{
 return (intr_info & (0x700 | 0xff |
        0x80000000)) ==
  ((3 << 8) | 14 | 0x80000000);
}

static inline __attribute__((always_inline)) int is_external_interrupt(u32 intr_info)
{
 ;
 ;
 return (intr_info & (0x700 | 0x80000000))
  == ((0 << 8) | 0x80000000);
}

static struct kvm_msr_entry *find_msr_entry(struct kvm_vcpu *vcpu, u32 msr)
{
 int i;

 for (i = 0; i < vcpu->nmsrs; ++i)
  if (vcpu->guest_msrs[i].index == msr)
   return &vcpu->guest_msrs[i];
 return ((void *)0);
}

static void vmcs_clear(struct vmcs *vmcs)
{
 u64 phys_addr = __pa(vmcs);
 u8 error;

 asm volatile (".byte 0x66, 0x0f, 0xc7, 0x30" "; setna %0"
        : "=g"(error) : "a"(&phys_addr), "m"(phys_addr)
        : "cc", "memory");
 if (error)
  printk("<3>" "kvm: vmclear fail: %p/%llx\n",
         vmcs, phys_addr);
}

static void __vcpu_clear(void *arg)
{
 struct kvm_vcpu *vcpu = arg;
 int cpu = raw_smp_processor_id();

 if (vcpu->cpu == cpu)
  vmcs_clear(vcpu->vmcs);

 if ((g_current_vmcs_[(cpu)]) == vcpu->vmcs)
  (g_current_vmcs_[(cpu)]) = ((void *)0);
}

static void vcpu_clear(struct kvm_vcpu *vcpu)
{
 if (vcpu->cpu != raw_smp_processor_id() && vcpu->cpu != -1)
  smp_call_function_single(vcpu->cpu, __vcpu_clear, vcpu, 0, 1);
 else
  __vcpu_clear(vcpu);
 vcpu->launched = 0;
}

static unsigned long vmcs_readl(unsigned long field)
{
 unsigned long value;

 asm volatile (".byte 0x0f, 0x78, 0xd0"
        : "=a"(value) : "d"(field) : "cc");
 return value;
}

static u16 vmcs_read16(unsigned long field)
{
 return vmcs_readl(field);
}

static u32 vmcs_read32(unsigned long field)
{
 return vmcs_readl(field);
}

static u64 vmcs_read64(unsigned long field)
{



 return vmcs_readl(field) | ((u64)vmcs_readl(field+1) << 32);

}

static __attribute__((noinline)) void vmwrite_error(unsigned long field, unsigned long value)
{
 printk("<3>" "vmwrite error: reg %lx value %lx (err %d)\n",
        field, value, vmcs_read32(VM_INSTRUCTION_ERROR));
 ;
}

static void vmcs_writel(unsigned long field, unsigned long value)
{
 u8 error;

 asm volatile (".byte 0x0f, 0x79, 0xd0" "; setna %0"
         : "=q"(error) : "a"(value), "d"(field) : "cc" );
 if (__builtin_expect(!!(error), 0))
  vmwrite_error(field, value);
}

static void vmcs_write16(unsigned long field, u16 value)
{
 vmcs_writel(field, value);
}

static void vmcs_write32(unsigned long field, u32 value)
{
 vmcs_writel(field, value);
}

static void vmcs_write64(unsigned long field, u64 value)
{



 vmcs_writel(field, value);
 asm volatile ("");
 vmcs_writel(field+1, value >> 32);

}





static void vmx_vcpu_load(struct kvm_vcpu *vcpu)
{
 u64 phys_addr = __pa(vcpu->vmcs);
 int cpu;

 ;

 cpu = get_cpu();

 if (vcpu->cpu != cpu)
  vcpu_clear(vcpu);

 if ((g_current_vmcs_[(cpu)]) != vcpu->vmcs) {
  u8 error;

  (g_current_vmcs_[(cpu)]) = vcpu->vmcs;

  asm volatile (".byte 0x0f, 0xc7, 0x30" "; setna %0"
         : "=g"(error) : "a"(&phys_addr), "m"(phys_addr)
         : "cc");
  if (error)
   printk("<3>" "kvm: vmptrld %p/%llx fail\n",
          vcpu->vmcs, phys_addr);
 }

 if (vcpu->cpu != cpu) {
  struct descriptor_table dt;
  unsigned long sysenter_esp;

  vcpu->cpu = cpu;




  vmcs_writel(HOST_TR_BASE, read_tr_base());
  get_gdt(&dt);
  vmcs_writel(HOST_GDTR_BASE, dt.base);

  ((sysenter_esp) = native_read_msr(0x00000175));
  vmcs_writel(HOST_IA32_SYSENTER_ESP, sysenter_esp);
 }

 ;
}

static void vmx_vcpu_put(struct kvm_vcpu *vcpu)
{
 put_cpu();
}

static void vmx_vcpu_decache(struct kvm_vcpu *vcpu)
{
 vcpu_clear(vcpu);
}

static unsigned long vmx_get_rflags(struct kvm_vcpu *vcpu)
{
 return vmcs_readl(GUEST_RFLAGS);
}

static void vmx_set_rflags(struct kvm_vcpu *vcpu, unsigned long rflags)
{
 vmcs_writel(GUEST_RFLAGS, rflags);
}

static void skip_emulated_instruction(struct kvm_vcpu *vcpu)
{
 unsigned long rip;
 u32 interruptibility;

 rip = vmcs_readl(GUEST_RIP);
 rip += vmcs_read32(VM_EXIT_INSTRUCTION_LEN);
 vmcs_writel(GUEST_RIP, rip);





 interruptibility = vmcs_read32(GUEST_INTERRUPTIBILITY_INFO);
 if (interruptibility & 3)
  vmcs_write32(GUEST_INTERRUPTIBILITY_INFO,
        interruptibility & ~3);
 vcpu->interrupt_window_open = 1;
}

static void vmx_inject_gp(struct kvm_vcpu *vcpu, unsigned error_code)
{
 printk("<7>" "inject_general_protection: rip 0x%lx\n",
        vmcs_readl(GUEST_RIP));
 vmcs_write32(VM_ENTRY_EXCEPTION_ERROR_CODE, error_code);
 vmcs_write32(VM_ENTRY_INTR_INFO_FIELD,
       13 |
       (3 << 8) |
       0x800 |
       0x80000000);
}





static u64 guest_read_tsc(void)
{
 u64 host_tsc, tsc_offset;

 ((host_tsc) = native_read_tsc());
 tsc_offset = vmcs_read64(TSC_OFFSET);
 return host_tsc + tsc_offset;
}





static void guest_write_tsc(u64 guest_tsc)
{
 u64 host_tsc;

 ((host_tsc) = native_read_tsc());
 vmcs_write64(TSC_OFFSET, guest_tsc - host_tsc);
}

static void reload_tss(void)
{





 struct descriptor_table gdt;
 struct segment_descriptor *descs;

 get_gdt(&gdt);
 descs = (void *)gdt.base;
 descs[(4)].type = 9;
 load_TR_desc();

}






static int vmx_get_msr(struct kvm_vcpu *vcpu, u32 msr_index, u64 *pdata)
{
 u64 data;
 struct kvm_msr_entry *msr;

 if (!pdata) {
  printk("<3>" "BUG: get_msr called with NULL pdata\n");
  return -22;
 }

 switch (msr_index) {
# 388 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
 case 0x010:
  data = guest_read_tsc();
  break;
 case 0x00000174:
  data = vmcs_read32(GUEST_SYSENTER_CS);
  break;
 case 0x00000176:
  data = vmcs_readl(GUEST_SYSENTER_EIP);
  break;
 case 0x00000175:
  data = vmcs_readl(GUEST_SYSENTER_ESP);
  break;
 default:
  msr = find_msr_entry(vcpu, msr_index);
  if (msr) {
   data = msr->data;
   break;
  }
  return kvm_get_msr_common(vcpu, msr_index, pdata);
 }

 *pdata = data;
 return 0;
}






static int vmx_set_msr(struct kvm_vcpu *vcpu, u32 msr_index, u64 data)
{
 struct kvm_msr_entry *msr;
 switch (msr_index) {
# 432 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
 case 0x00000174:
  vmcs_write32(GUEST_SYSENTER_CS, data);
  break;
 case 0x00000176:
  vmcs_writel(GUEST_SYSENTER_EIP, data);
  break;
 case 0x00000175:
  vmcs_writel(GUEST_SYSENTER_ESP, data);
  break;
 case 0x010:
  guest_write_tsc(data);
  break;
 default:
  msr = find_msr_entry(vcpu, msr_index);
  if (msr) {
   msr->data = data;
   break;
  }
  return kvm_set_msr_common(vcpu, msr_index, data);
  msr->data = data;
  break;
 }

 return 0;
}





static void vcpu_load_rsp_rip(struct kvm_vcpu *vcpu)
{
 vcpu->regs[VCPU_REGS_RSP] = vmcs_readl(GUEST_RSP);
 vcpu->rip = vmcs_readl(GUEST_RIP);
}





static void vcpu_put_rsp_rip(struct kvm_vcpu *vcpu)
{
 vmcs_writel(GUEST_RSP, vcpu->regs[VCPU_REGS_RSP]);
 vmcs_writel(GUEST_RIP, vcpu->rip);
}

static int set_guest_debug(struct kvm_vcpu *vcpu, struct kvm_debug_guest *dbg)
{
 unsigned long dr7 = 0x400;
 u32 exception_bitmap;
 int old_singlestep;

 exception_bitmap = vmcs_read32(EXCEPTION_BITMAP);
 old_singlestep = vcpu->guest_debug.singlestep;

 vcpu->guest_debug.enabled = dbg->enabled;
 if (vcpu->guest_debug.enabled) {
  int i;

  dr7 |= 0x200;
  for (i = 0; i < 4; ++i) {
   if (!dbg->breakpoints[i].enabled)
    continue;
   vcpu->guest_debug.bp[i] = dbg->breakpoints[i].address;
   dr7 |= 2 << (i*2);
   dr7 |= 0 << (i*4+16);
  }

  exception_bitmap |= (1u << 1);

  vcpu->guest_debug.singlestep = dbg->singlestep;
 } else {
  exception_bitmap &= ~(1u << 1);
  vcpu->guest_debug.singlestep = 0;
 }

 if (old_singlestep && !vcpu->guest_debug.singlestep) {
  unsigned long flags;

  flags = vmcs_readl(GUEST_RFLAGS);
  flags &= ~(0x00000100 | 0x00010000);
  vmcs_writel(GUEST_RFLAGS, flags);
 }

 vmcs_write32(EXCEPTION_BITMAP, exception_bitmap);
 vmcs_writel(GUEST_DR7, dr7);

 return 0;
}

static int cpu_has_kvm_support(void)
{
 unsigned long ecx = cpuid_ecx(1);
 printk("<1>" "%s\n", __FUNCTION__);
 return test_bit(5, &ecx);
}

static int vmx_disabled_by_bios(void)
{
 u64 msr;

 printk("<1>" "%s\n", __FUNCTION__);

 ((msr) = native_read_msr(0x03a));
 return (msr & 5) == 1;
}


extern int check_ensure_vmx(void);


static void hardware_enable(void *garbage)
{
 int cpu = raw_smp_processor_id();
 u64 phys_addr = __pa((g_vmxarea_[(cpu)]));
 u64 old;

 printk("<1>" "%s:0\n", __FUNCTION__);

 ((old) = native_read_msr(0x03a));

 printk("<1>" "%s:1\n", __FUNCTION__);

 if ((old & 5) != 5)

  native_write_msr(0x03a, old | 5);

 printk("<1>" "%s:2\n", __FUNCTION__);

 write_cr4(read_cr4() | 0x2000);

 printk("<1>" "%s:3 phys_addr: 0x%x\n", __FUNCTION__, phys_addr);

 check_ensure_vmx();

 asm volatile (".byte 0xf3, 0x0f, 0xc7, 0x30" : : "a"(&phys_addr), "m"(phys_addr)
        : "memory", "cc");

 printk("<1>" "%s:4\n", __FUNCTION__);

}

static void hardware_disable(void *garbage)
{
 ;
 asm volatile (".byte 0x0f, 0x01, 0xc4" : : : "cc");
 ;
}

static void setup_vmcs_descriptor(void)
{
 u32 vmx_msr_low, vmx_msr_high;

 printk("<1>" "%s\n", __FUNCTION__);

 do { u64 __val = native_read_msr(0x480); (vmx_msr_low) = (u32)__val; (vmx_msr_high) = (u32)(__val >> 32); } while(0);
 vmcs_descriptor.size = vmx_msr_high & 0x1fff;
 vmcs_descriptor.order = get_order(vmcs_descriptor.size);
 vmcs_descriptor.revision_id = vmx_msr_low;
}

static struct vmcs *alloc_vmcs_cpu(int cpu)
{
 int node = cpu_to_node(cpu);
 struct page *pages;
 struct vmcs *vmcs;

 ;

 pages = alloc_pages_node(node, ((0x10u) | (0x40u) | (0x80u)), vmcs_descriptor.order);
 if (!pages) {
  return ((void *)0);
 }
 vmcs = page_address(pages);
 memset(vmcs, 0, vmcs_descriptor.size);
 vmcs->revision_id = vmcs_descriptor.revision_id;

 printk("<1>" "vmcs pointer: 0x%x\n", (unsigned long)vmcs);
 printk("<1>" "vmcs revision_id: %d\n", vmcs->revision_id);
 printk("<1>" "vmcs abort: %d\n", vmcs->abort);

 ;

 return vmcs;
}

static struct vmcs *alloc_vmcs(void)
{
 struct vmcs *ptr;
 ;
 ptr = alloc_vmcs_cpu(raw_smp_processor_id());
 ;
 return ptr;
}

static void free_vmcs(struct vmcs *vmcs)
{
 ;
 free_pages((unsigned long)vmcs, vmcs_descriptor.order);
 ;
}

static void free_kvm_area(void)
{
 int cpu;

 ;

 for ((cpu) = first_cpu(); (cpu) < get_nr_cpus(); (cpu) = next_cpu((cpu)))
  free_vmcs((g_vmxarea_[(cpu)]));

 ;
}

extern struct vmcs *alloc_vmcs_cpu(int cpu);

static int alloc_kvm_area(void)
{
 int cpu;

 ;

 printk("<1>" "first_cpu() = %d, get_nr_cpus() = %d\n",
     first_cpu(), get_nr_cpus());

 for ((cpu) = first_cpu(); (cpu) < get_nr_cpus(); (cpu) = next_cpu((cpu))) {
  struct vmcs *vmcs;

  printk("<1>" "call each online\n", __FUNCTION__);

  vmcs = alloc_vmcs_cpu(cpu);
  if (!vmcs) {
   free_kvm_area();
   ;
   return -12;
  }

  (g_vmxarea_[(cpu)]) = vmcs;
  printk("<1>" "%d\n", cpu);
 }

 ;

 return 0;
}

static int hardware_setup(void)
{
 printk("<1>" "%s\n", __FUNCTION__);
 setup_vmcs_descriptor();
 return alloc_kvm_area();
}

static void hardware_unsetup(void)
{
 free_kvm_area();
}

static void update_exception_bitmap(struct kvm_vcpu *vcpu)
{
 if (vcpu->rmode.active)
  vmcs_write32(EXCEPTION_BITMAP, ~0);
 else
  vmcs_write32(EXCEPTION_BITMAP, 1 << 14);
}

static void fix_pmode_dataseg(int seg, struct kvm_save_segment *save)
{
 struct kvm_vmx_segment_field *sf = &kvm_vmx_segment_fields[seg];

 if (vmcs_readl(sf->base) == save->base && (save->base & (1 << 4))) {
  vmcs_write16(sf->selector, save->selector);
  vmcs_writel(sf->base, save->base);
  vmcs_write32(sf->limit, save->limit);
  vmcs_write32(sf->ar_bytes, save->ar);
 } else {
  u32 dpl = (vmcs_read16(sf->selector) & 0x03)
   << 5;
  vmcs_write32(sf->ar_bytes, 0x93 | dpl);
 }
}

static void enter_pmode(struct kvm_vcpu *vcpu)
{
 unsigned long flags;

 vcpu->rmode.active = 0;

 vmcs_writel(GUEST_TR_BASE, vcpu->rmode.tr.base);
 vmcs_write32(GUEST_TR_LIMIT, vcpu->rmode.tr.limit);
 vmcs_write32(GUEST_TR_AR_BYTES, vcpu->rmode.tr.ar);

 flags = vmcs_readl(GUEST_RFLAGS);
 flags &= ~(0x00003000 | 0x00020000);
 flags |= (vcpu->rmode.save_iopl << 12);
 vmcs_writel(GUEST_RFLAGS, flags);

 vmcs_writel(GUEST_CR4, (vmcs_readl(GUEST_CR4) & ~(1ULL << 0)) |
   (vmcs_readl(CR4_READ_SHADOW) & (1ULL << 0)));

 update_exception_bitmap(vcpu);

 fix_pmode_dataseg(VCPU_SREG_ES, &vcpu->rmode.es);
 fix_pmode_dataseg(VCPU_SREG_DS, &vcpu->rmode.ds);
 fix_pmode_dataseg(VCPU_SREG_GS, &vcpu->rmode.gs);
 fix_pmode_dataseg(VCPU_SREG_FS, &vcpu->rmode.fs);

 vmcs_write16(GUEST_SS_SELECTOR, 0);
 vmcs_write32(GUEST_SS_AR_BYTES, 0x93);

 vmcs_write16(GUEST_CS_SELECTOR,
       vmcs_read16(GUEST_CS_SELECTOR) & ~0x03);
 vmcs_write32(GUEST_CS_AR_BYTES, 0x9b);
}

static int rmode_tss_base(struct kvm* kvm)
{
 gfn_t base_gfn = kvm->memslots[0].base_gfn + kvm->memslots[0].npages - 3;
 return base_gfn << 12;
}

static void fix_rmode_seg(int seg, struct kvm_save_segment *save)
{
 struct kvm_vmx_segment_field *sf = &kvm_vmx_segment_fields[seg];

 save->selector = vmcs_read16(sf->selector);
 save->base = vmcs_readl(sf->base);
 save->limit = vmcs_read32(sf->limit);
 save->ar = vmcs_read32(sf->ar_bytes);
 vmcs_write16(sf->selector, vmcs_readl(sf->base) >> 4);
 vmcs_write32(sf->limit, 0xffff);
 vmcs_write32(sf->ar_bytes, 0xf3);
}

static void enter_rmode(struct kvm_vcpu *vcpu)
{
 unsigned long flags;

 vcpu->rmode.active = 1;

 vcpu->rmode.tr.base = vmcs_readl(GUEST_TR_BASE);
 vmcs_writel(GUEST_TR_BASE, rmode_tss_base(vcpu->kvm));

 vcpu->rmode.tr.limit = vmcs_read32(GUEST_TR_LIMIT);
 vmcs_write32(GUEST_TR_LIMIT, (0x68 + (256 / 8) + (65536 / 8) + 1) - 1);

 vcpu->rmode.tr.ar = vmcs_read32(GUEST_TR_AR_BYTES);
 vmcs_write32(GUEST_TR_AR_BYTES, 0x008b);

 flags = vmcs_readl(GUEST_RFLAGS);
 vcpu->rmode.save_iopl = (flags & 0x00003000) >> 12;

 flags |= 0x00003000 | 0x00020000;

 vmcs_writel(GUEST_RFLAGS, flags);
 vmcs_writel(GUEST_CR4, vmcs_readl(GUEST_CR4) | (1ULL << 0));
 update_exception_bitmap(vcpu);

 vmcs_write16(GUEST_SS_SELECTOR, vmcs_readl(GUEST_SS_BASE) >> 4);
 vmcs_write32(GUEST_SS_LIMIT, 0xffff);
 vmcs_write32(GUEST_SS_AR_BYTES, 0xf3);

 vmcs_write32(GUEST_CS_AR_BYTES, 0xf3);
 vmcs_write32(GUEST_CS_LIMIT, 0xffff);
 vmcs_write16(GUEST_CS_SELECTOR, vmcs_readl(GUEST_CS_BASE) >> 4);

 fix_rmode_seg(VCPU_SREG_ES, &vcpu->rmode.es);
 fix_rmode_seg(VCPU_SREG_DS, &vcpu->rmode.ds);
 fix_rmode_seg(VCPU_SREG_GS, &vcpu->rmode.gs);
 fix_rmode_seg(VCPU_SREG_FS, &vcpu->rmode.fs);
}
# 838 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
static void vmx_decache_cr0_cr4_guest_bits(struct kvm_vcpu *vcpu)
{
 vcpu->cr0 &= ((1ULL << 31) | (1ULL << 0) | (1ULL << 16) | (1ULL << 5) | (1ULL << 29) | (1ULL << 30));
 vcpu->cr0 |= vmcs_readl(GUEST_CR0) & ~((1ULL << 31) | (1ULL << 0) | (1ULL << 16) | (1ULL << 5) | (1ULL << 29) | (1ULL << 30));

 vcpu->cr4 &= ((1ULL << 4) | (1ULL << 5) | (1ULL << 7) | (1ULL << 13) | (1ULL << 0));
 vcpu->cr4 |= vmcs_readl(GUEST_CR4) & ~((1ULL << 4) | (1ULL << 5) | (1ULL << 7) | (1ULL << 13) | (1ULL << 0));
}

static void vmx_set_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
{
 if (vcpu->rmode.active && (cr0 & (1ULL << 0)))
  enter_pmode(vcpu);

 if (!vcpu->rmode.active && !(cr0 & (1ULL << 0)))
  enter_rmode(vcpu);
# 864 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
 vmcs_writel(CR0_READ_SHADOW, cr0);
 vmcs_writel(GUEST_CR0,
      (cr0 & ~((1ULL << 31) | (1ULL << 0) | (1ULL << 16) | (1ULL << 5) | (1ULL << 29) | (1ULL << 30))) | ((1ULL << 31) | (1ULL << 0) | (1ULL << 16) | (1ULL << 5)));
 vcpu->cr0 = cr0;
}




static void vmx_set_cr0_no_modeswitch(struct kvm_vcpu *vcpu, unsigned long cr0)
{
 if (!vcpu->rmode.active && !(cr0 & (1ULL << 0)))
  enter_rmode(vcpu);

 vcpu->rmode.active = ((cr0 & (1ULL << 0)) == 0);
 update_exception_bitmap(vcpu);
 vmcs_writel(CR0_READ_SHADOW, cr0);
 vmcs_writel(GUEST_CR0,
      (cr0 & ~((1ULL << 31) | (1ULL << 0) | (1ULL << 16) | (1ULL << 5) | (1ULL << 29) | (1ULL << 30))) | ((1ULL << 31) | (1ULL << 0) | (1ULL << 16) | (1ULL << 5)));
 vcpu->cr0 = cr0;
}

static void vmx_set_cr3(struct kvm_vcpu *vcpu, unsigned long cr3)
{
 vmcs_writel(GUEST_CR3, cr3);
}

static void vmx_set_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
{
 vmcs_writel(CR4_READ_SHADOW, cr4);
 vmcs_writel(GUEST_CR4, cr4 | (vcpu->rmode.active ?
      ((1ULL << 13) | (1ULL << 5) | (1ULL << 0)) : ((1ULL << 13) | (1ULL << 5))));
 vcpu->cr4 = cr4;
}
# 923 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
static u64 vmx_get_segment_base(struct kvm_vcpu *vcpu, int seg)
{
 struct kvm_vmx_segment_field *sf = &kvm_vmx_segment_fields[seg];

 return vmcs_readl(sf->base);
}

static void vmx_get_segment(struct kvm_vcpu *vcpu,
       struct kvm_segment *var, int seg)
{
 struct kvm_vmx_segment_field *sf = &kvm_vmx_segment_fields[seg];
 u32 ar;

 var->base = vmcs_readl(sf->base);
 var->limit = vmcs_read32(sf->limit);
 var->selector = vmcs_read16(sf->selector);
 ar = vmcs_read32(sf->ar_bytes);
 if (ar & (1 << 16))
  ar = 0;
 var->type = ar & 15;
 var->s = (ar >> 4) & 1;
 var->dpl = (ar >> 5) & 3;
 var->present = (ar >> 7) & 1;
 var->avl = (ar >> 12) & 1;
 var->l = (ar >> 13) & 1;
 var->db = (ar >> 14) & 1;
 var->g = (ar >> 15) & 1;
 var->unusable = (ar >> 16) & 1;
}

static void vmx_set_segment(struct kvm_vcpu *vcpu,
       struct kvm_segment *var, int seg)
{
 struct kvm_vmx_segment_field *sf = &kvm_vmx_segment_fields[seg];
 u32 ar;

 vmcs_writel(sf->base, var->base);
 vmcs_write32(sf->limit, var->limit);
 vmcs_write16(sf->selector, var->selector);
 if (var->unusable)
  ar = 1 << 16;
 else {
  ar = var->type & 15;
  ar |= (var->s & 1) << 4;
  ar |= (var->dpl & 3) << 5;
  ar |= (var->present & 1) << 7;
  ar |= (var->avl & 1) << 12;
  ar |= (var->l & 1) << 13;
  ar |= (var->db & 1) << 14;
  ar |= (var->g & 1) << 15;
 }
 if (ar == 0)
  ar = (1 << 16);
 vmcs_write32(sf->ar_bytes, ar);
}

static void vmx_get_cs_db_l_bits(struct kvm_vcpu *vcpu, int *db, int *l)
{
 u32 ar = vmcs_read32(GUEST_CS_AR_BYTES);

 *db = (ar >> 14) & 1;
 *l = (ar >> 13) & 1;
}

static void vmx_get_idt(struct kvm_vcpu *vcpu, struct descriptor_table *dt)
{
 dt->limit = vmcs_read32(GUEST_IDTR_LIMIT);
 dt->base = vmcs_readl(GUEST_IDTR_BASE);
}

static void vmx_set_idt(struct kvm_vcpu *vcpu, struct descriptor_table *dt)
{
 vmcs_write32(GUEST_IDTR_LIMIT, dt->limit);
 vmcs_writel(GUEST_IDTR_BASE, dt->base);
}

static void vmx_get_gdt(struct kvm_vcpu *vcpu, struct descriptor_table *dt)
{
 dt->limit = vmcs_read32(GUEST_GDTR_LIMIT);
 dt->base = vmcs_readl(GUEST_GDTR_BASE);
}

static void vmx_set_gdt(struct kvm_vcpu *vcpu, struct descriptor_table *dt)
{
 vmcs_write32(GUEST_GDTR_LIMIT, dt->limit);
 vmcs_writel(GUEST_GDTR_BASE, dt->base);
}

static int init_rmode_tss(struct kvm* kvm)
{
 struct page *p1, *p2, *p3;
 gfn_t fn = rmode_tss_base(kvm) >> 12;
 char *page;

 ;

 p1 = _gfn_to_page(kvm, fn++);
 p2 = _gfn_to_page(kvm, fn++);
 p3 = _gfn_to_page(kvm, fn);

 if (!p1 || !p2 || !p3) {
  printk("<7>" "%s: gfn_to_page failed\n", __FUNCTION__);
  ;
  return 0;
 }

 page = kmap_atomic(p1, KM_USER0);
 memset(page, 0, (1UL << 12));
 *(u16*)(page + 0x66) = 0x68 + (256 / 8);
 kunmap_atomic(page, KM_USER0);

 page = kmap_atomic(p2, KM_USER0);
 memset(page, 0, (1UL << 12));
 kunmap_atomic(page, KM_USER0);

 page = kmap_atomic(p3, KM_USER0);
 memset(page, 0, (1UL << 12));
 *(page + (0x68 + (256 / 8) + (65536 / 8) + 1) - 2 * (1UL << 12) - 1) = ~0;
 kunmap_atomic(page, KM_USER0);

 ;

 return 1;
}

static void vmcs_write32_fixedbits(u32 msr, u32 vmcs_field, u32 val)
{
 u32 msr_high, msr_low;

 do { u64 __val = native_read_msr(msr); (msr_low) = (u32)__val; (msr_high) = (u32)(__val >> 32); } while(0);

 val &= msr_high;
 val |= msr_low;
 vmcs_write32(vmcs_field, val);
}

static void seg_setup(int seg)
{
 struct kvm_vmx_segment_field *sf = &kvm_vmx_segment_fields[seg];

 vmcs_write16(sf->selector, 0);
 vmcs_writel(sf->base, 0);
 vmcs_write32(sf->limit, 0xffff);
 vmcs_write32(sf->ar_bytes, 0x93);
}


extern void kvm_vmx_fake_return(void);




static int vmx_vcpu_setup(struct kvm_vcpu *vcpu)
{
 u32 host_sysenter_cs;
 u32 junk;
 unsigned long a;
 struct descriptor_table dt;
 int i;
 int ret = 0;
 int nr_good_msrs;



 if (!init_rmode_tss(vcpu->kvm)) {
  ret = -12;
  goto out;
 }

 memset(vcpu->regs, 0, sizeof(vcpu->regs));
 vcpu->regs[VCPU_REGS_RDX] = get_rdx_init_val();
 vcpu->cr8 = 0;
 vcpu->apic_base = 0xfee00000 |
                  (1<<8) |
   (1<<11);

 fx_init(vcpu);





 vmcs_write16(GUEST_CS_SELECTOR, 0xf000);
 vmcs_writel(GUEST_CS_BASE, 0x000f0000);
 vmcs_write32(GUEST_CS_LIMIT, 0xffff);
 vmcs_write32(GUEST_CS_AR_BYTES, 0x9b);

 seg_setup(VCPU_SREG_DS);
 seg_setup(VCPU_SREG_ES);
 seg_setup(VCPU_SREG_FS);
 seg_setup(VCPU_SREG_GS);
 seg_setup(VCPU_SREG_SS);

 vmcs_write16(GUEST_TR_SELECTOR, 0);
 vmcs_writel(GUEST_TR_BASE, 0);
 vmcs_write32(GUEST_TR_LIMIT, 0xffff);
 vmcs_write32(GUEST_TR_AR_BYTES, 0x008b);

 vmcs_write16(GUEST_LDTR_SELECTOR, 0);
 vmcs_writel(GUEST_LDTR_BASE, 0);
 vmcs_write32(GUEST_LDTR_LIMIT, 0xffff);
 vmcs_write32(GUEST_LDTR_AR_BYTES, 0x00082);

 vmcs_write32(GUEST_SYSENTER_CS, 0);
 vmcs_writel(GUEST_SYSENTER_ESP, 0);
 vmcs_writel(GUEST_SYSENTER_EIP, 0);

 vmcs_writel(GUEST_RFLAGS, 0x02);
 vmcs_writel(GUEST_RIP, 0xfff0);
 vmcs_writel(GUEST_RSP, 0);


 vmcs_writel(GUEST_DR7, 0x400);

 vmcs_writel(GUEST_GDTR_BASE, 0);
 vmcs_write32(GUEST_GDTR_LIMIT, 0xffff);

 vmcs_writel(GUEST_IDTR_BASE, 0);
 vmcs_write32(GUEST_IDTR_LIMIT, 0xffff);

 vmcs_write32(GUEST_ACTIVITY_STATE, 0);
 vmcs_write32(GUEST_INTERRUPTIBILITY_INFO, 0);
 vmcs_write32(GUEST_PENDING_DBG_EXCEPTIONS, 0);


 vmcs_write64(IO_BITMAP_A, 0);
 vmcs_write64(IO_BITMAP_B, 0);

 guest_write_tsc(0);

 vmcs_write64(VMCS_LINK_POINTER, -1ull);


 vmcs_write64(GUEST_IA32_DEBUGCTL, 0);


 vmcs_write32_fixedbits(0x481,
          PIN_BASED_VM_EXEC_CONTROL,
          0x1
          | 0x8
   );
 vmcs_write32_fixedbits(0x482,
          CPU_BASED_VM_EXEC_CONTROL,
          0x00000080
          | 0x00080000
          | 0x00100000
          | 0x01000000
          | 0x00800000
          | 0x00000008
   );

 vmcs_write32(EXCEPTION_BITMAP, 1 << 14);
 vmcs_write32(PAGE_FAULT_ERROR_CODE_MASK, 0);
 vmcs_write32(PAGE_FAULT_ERROR_CODE_MATCH, 0);
 vmcs_write32(CR3_TARGET_COUNT, 0);

 vmcs_writel(HOST_CR0, read_cr0());
 vmcs_writel(HOST_CR4, read_cr4());
 vmcs_writel(HOST_CR3, read_cr3());
# 1191 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
 vmcs_write16(HOST_CS_SELECTOR, read_cs());
 vmcs_write16(HOST_DS_SELECTOR, read_ds() & ~3);
 vmcs_write16(HOST_ES_SELECTOR, read_es() & ~3);
 vmcs_write16(HOST_FS_SELECTOR, read_fs());
 vmcs_write16(HOST_GS_SELECTOR, read_gs());
 vmcs_write16(HOST_SS_SELECTOR, read_ss());
# 1209 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
 vmcs_writel(HOST_FS_BASE, read_fs_base());
 vmcs_writel(HOST_GS_BASE, read_gs_base());






 vmcs_write16(HOST_TR_SELECTOR, store_tr());


 get_idt(&dt);
 vmcs_writel(HOST_IDTR_BASE, dt.base);



 vmcs_writel(HOST_RIP, (unsigned long)kvm_vmx_fake_return);

 do { u64 __val = native_read_msr(0x00000174); (host_sysenter_cs) = (u32)__val; (junk) = (u32)(__val >> 32); } while(0);
 vmcs_write32(HOST_IA32_SYSENTER_CS, host_sysenter_cs);
 ((a) = native_read_msr(0x00000175));
 vmcs_writel(HOST_IA32_SYSENTER_ESP, a);
 ((a) = native_read_msr(0x00000176));
 vmcs_writel(HOST_IA32_SYSENTER_EIP, a);

 for (i = 0; i < (sizeof(vmx_msr_index) / sizeof((vmx_msr_index)[0]) + (0)); ++i) {
  u32 index = vmx_msr_index[i];
  u32 data_low, data_high;
  u64 data;
  int j = vcpu->nmsrs;

  if (({ int __err = 1; u64 __val = native_read_msr(index); (*&data_low) = (u32)__val; (*&data_high) = (u32)(__val >> 32); __err; }) < 0)
   continue;
  if (wrmsr_safe(index, data_low, data_high) < 0)
   continue;
  data = data_low | ((u64)data_high << 32);
  vcpu->host_msrs[j].index = index;
  vcpu->host_msrs[j].reserved = 0;
  vcpu->host_msrs[j].data = data;
  vcpu->guest_msrs[j] = vcpu->host_msrs[j];
  ++vcpu->nmsrs;
 }
 printk("<7>" "kvm: msrs: %d\n", vcpu->nmsrs);

 nr_good_msrs = vcpu->nmsrs - 0;
 vmcs_writel(VM_ENTRY_MSR_LOAD_ADDR,
      virt_to_phys(vcpu->guest_msrs + 0));
 vmcs_writel(VM_EXIT_MSR_STORE_ADDR,
      virt_to_phys(vcpu->guest_msrs + 0));
 vmcs_writel(VM_EXIT_MSR_LOAD_ADDR,
      virt_to_phys(vcpu->host_msrs + 0));
 vmcs_write32_fixedbits(0x483, VM_EXIT_CONTROLS,
               (0 << 9));
 vmcs_write32(VM_EXIT_MSR_STORE_COUNT, nr_good_msrs);
 vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, nr_good_msrs);
 vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, nr_good_msrs);



 vmcs_write32_fixedbits(0x484,
                               VM_ENTRY_CONTROLS, 0);
 vmcs_write32(VM_ENTRY_INTR_INFO_FIELD, 0);






 vmcs_writel(CR0_GUEST_HOST_MASK, ((1ULL << 31) | (1ULL << 0) | (1ULL << 16) | (1ULL << 5) | (1ULL << 29) | (1ULL << 30)));
 vmcs_writel(CR4_GUEST_HOST_MASK, ((1ULL << 4) | (1ULL << 5) | (1ULL << 7) | (1ULL << 13) | (1ULL << 0)));

 vcpu->cr0 = 0x60000010;
 vmx_set_cr0(vcpu, vcpu->cr0);
 vmx_set_cr4(vcpu, 0);




 return 0;

out:
 return ret;
}

static void inject_rmode_irq(struct kvm_vcpu *vcpu, int irq)
{
 u16 ent[2];
 u16 cs;
 u16 ip;
 unsigned long flags;
 unsigned long ss_base = vmcs_readl(GUEST_SS_BASE);
 u16 sp = vmcs_readl(GUEST_RSP);
 u32 ss_limit = vmcs_read32(GUEST_SS_LIMIT);

 if (sp > ss_limit || sp - 6 > sp) {
  printk("<7>" "%s: #SS, rsp 0x%lx ss 0x%lx limit 0x%x\n", __FUNCTION__, vmcs_readl(GUEST_RSP), vmcs_readl(GUEST_SS_BASE), vmcs_read32(GUEST_SS_LIMIT));




  return;
 }

 if (kvm_read_guest(vcpu, irq * sizeof(ent), sizeof(ent), &ent) !=
        sizeof(ent)) {
  printk("<7>" "%s: read guest err\n", __FUNCTION__);
  return;
 }

 flags = vmcs_readl(GUEST_RFLAGS);
 cs = vmcs_readl(GUEST_CS_BASE) >> 4;
 ip = vmcs_readl(GUEST_RIP);


 if (kvm_write_guest(vcpu, ss_base + sp - 2, 2, &flags) != 2 ||
     kvm_write_guest(vcpu, ss_base + sp - 4, 2, &cs) != 2 ||
     kvm_write_guest(vcpu, ss_base + sp - 6, 2, &ip) != 2) {
  printk("<7>" "%s: write guest err\n", __FUNCTION__);
  return;
 }

 vmcs_writel(GUEST_RFLAGS, flags &
      ~( 0x00000200 | 0x00040000 | 0x00000100));
 vmcs_write16(GUEST_CS_SELECTOR, ent[1]) ;
 vmcs_writel(GUEST_CS_BASE, ent[1] << 4);
 vmcs_writel(GUEST_RIP, ent[0]);
 vmcs_writel(GUEST_RSP, (vmcs_readl(GUEST_RSP) & ~0xffff) | (sp - 6));
}

static void kvm_do_inject_irq(struct kvm_vcpu *vcpu)
{
 int word_index = __ffs(vcpu->irq_summary);
 int bit_index = __ffs(vcpu->irq_pending[word_index]);
 int irq = word_index * 32 + bit_index;

 ;

 clear_bit(bit_index, &vcpu->irq_pending[word_index]);
 if (!vcpu->irq_pending[word_index])
  clear_bit(word_index, &vcpu->irq_summary);

 if (vcpu->rmode.active) {
  inject_rmode_irq(vcpu, irq);
  ;
  return;
 }
 vmcs_write32(VM_ENTRY_INTR_INFO_FIELD,
   irq | (0 << 8) | 0x80000000);

 ;
}


static void do_interrupt_requests(struct kvm_vcpu *vcpu,
           struct kvm_run *kvm_run)
{
 u32 cpu_based_vm_exec_control;

 ;

 vcpu->interrupt_window_open =
  ((vmcs_readl(GUEST_RFLAGS) & 0x00000200) &&
   (vmcs_read32(GUEST_INTERRUPTIBILITY_INFO) & 3) == 0);

 if (vcpu->interrupt_window_open &&
     vcpu->irq_summary &&
     !(vmcs_read32(VM_ENTRY_INTR_INFO_FIELD) & 0x80000000))



  kvm_do_inject_irq(vcpu);

 cpu_based_vm_exec_control = vmcs_read32(CPU_BASED_VM_EXEC_CONTROL);
 if (!vcpu->interrupt_window_open &&
     (vcpu->irq_summary || kvm_run->request_interrupt_window))



  cpu_based_vm_exec_control |= 0x00000004;
 else
  cpu_based_vm_exec_control &= ~0x00000004;
 vmcs_write32(CPU_BASED_VM_EXEC_CONTROL, cpu_based_vm_exec_control);

 ;
}

static void kvm_guest_debug_pre(struct kvm_vcpu *vcpu)
{
 struct kvm_guest_debug *dbg = &vcpu->guest_debug;

 native_set_debugreg(0, dbg->bp[0]);
 native_set_debugreg(1, dbg->bp[1]);
 native_set_debugreg(2, dbg->bp[2]);
 native_set_debugreg(3, dbg->bp[3]);

 if (dbg->singlestep) {
  unsigned long flags;

  flags = vmcs_readl(GUEST_RFLAGS);
  flags |= 0x00000100 | 0x00010000;
  vmcs_writel(GUEST_RFLAGS, flags);
 }
}

static int handle_rmode_exception(struct kvm_vcpu *vcpu,
      int vec, u32 err_code)
{
 ;
 if (!vcpu->rmode.active) {
  ;
  return 0;
 }

 if (vec == 13 && err_code == 0) {
  if (emulate_instruction(vcpu, ((void *)0), 0, 0) == EMULATE_DONE) {
   ;
   return 1;
  }
 }

 ;
 return 0;
}

static int handle_exception(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 u32 intr_info, error_code;
 unsigned long cr2, rip;
 u32 vect_info;
 enum emulation_result er;
 int r;

 ;

 vect_info = vmcs_read32(IDT_VECTORING_INFO_FIELD);
 intr_info = vmcs_read32(VM_EXIT_INTR_INFO);

 if ((vect_info & 0x80000000) &&
      !is_page_fault(intr_info)) {
  printk("<3>" "%s: unexpected, vectoring info 0x%x "
         "intr info 0x%x\n", __FUNCTION__, vect_info, intr_info);
 }

 if (is_external_interrupt(vect_info)) {
  int irq = vect_info & 0xff;
  set_bit(irq, vcpu->irq_pending);
  set_bit(irq / 32, &vcpu->irq_summary);
 }


 if ((intr_info & 0x700) == 0x200) {
  asm ("int $2");
  ;
  return 1;
 }
 error_code = 0;
 rip = vmcs_readl(GUEST_RIP);
 if (intr_info & 0x800)
  error_code = vmcs_read32(VM_EXIT_INTR_ERROR_CODE);
 if (is_page_fault(intr_info)) {
  cr2 = vmcs_readl(EXIT_QUALIFICATION);

  spin_lock(&vcpu->kvm->lock);

  r = kvm_mmu_page_fault(vcpu, cr2, error_code);
  if (r < 0) {
   spin_unlock(&vcpu->kvm->lock);
   ;
   return r;
  }
  if (!r) {
   spin_unlock(&vcpu->kvm->lock);
   ;
   return 1;
  }

  er = emulate_instruction(vcpu, kvm_run, cr2, error_code);
  spin_unlock(&vcpu->kvm->lock);

  switch (er) {
  case EMULATE_DONE:
   ;
   return 1;
  case EMULATE_DO_MMIO:
   ++kvm_stat.mmio_exits;
   kvm_run->exit_reason = KVM_EXIT_MMIO;
   ;
   return 0;
   case EMULATE_FAIL:
   printk("<7>" "%s: emulate fail\n", __FUNCTION__);
   break;
  default:
   do { } while(0);;
  }
 }

 if (vcpu->rmode.active &&
     handle_rmode_exception(vcpu, intr_info & 0xff,
          error_code)) {
  ;
  return 1;
 }

 if ((intr_info & (0x700 | 0xff)) == ((3 << 8) | 1)) {
  kvm_run->exit_reason = KVM_EXIT_DEBUG;
  ;
  return 0;
 }
 kvm_run->exit_reason = KVM_EXIT_EXCEPTION;
 kvm_run->ex.exception = intr_info & 0xff;
 kvm_run->ex.error_code = error_code;
 ;
 return 0;
}

static int handle_external_interrupt(struct kvm_vcpu *vcpu,
         struct kvm_run *kvm_run)
{
 ++kvm_stat.irq_exits;
 return 1;
}

static int handle_triple_fault(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 kvm_run->exit_reason = KVM_EXIT_SHUTDOWN;
 return 0;
}

static int get_io_count(struct kvm_vcpu *vcpu, u64 *count)
{
 u64 inst;
 gva_t rip;
 int countr_size;
 int i, n;

 if ((vmcs_readl(GUEST_RFLAGS) & 0x00020000)) {
  countr_size = 2;
 } else {
  u32 cs_ar = vmcs_read32(GUEST_CS_AR_BYTES);

  countr_size = (cs_ar & (1 << 13)) ? 8:
         (cs_ar & (1 << 14)) ? 4: 2;
 }

 rip = vmcs_readl(GUEST_RIP);
 if (countr_size != 8)
  rip += vmcs_readl(GUEST_CS_BASE);

 n = kvm_read_guest(vcpu, rip, sizeof(inst), &inst);

 for (i = 0; i < n; i++) {
  switch (((u8*)&inst)[i]) {
  case 0xf0:
  case 0xf2:
  case 0xf3:
  case 0x2e:
  case 0x36:
  case 0x3e:
  case 0x26:
  case 0x64:
  case 0x65:
  case 0x66:
   break;
  case 0x67:
   countr_size = (countr_size == 2) ? 4: (countr_size >> 1);
  default:
   goto done;
  }
 }
 return 0;
done:
 countr_size *= 8;
 *count = vcpu->regs[VCPU_REGS_RCX] & (~0ULL >> (64 - countr_size));
 return 1;
}

static int handle_io(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 u64 exit_qualification;

 ++kvm_stat.io_exits;
 exit_qualification = vmcs_read64(EXIT_QUALIFICATION);
 kvm_run->exit_reason = KVM_EXIT_IO;
 if (exit_qualification & 8)
  kvm_run->io.direction = 0;
 else
  kvm_run->io.direction = 1;
 kvm_run->io.size = (exit_qualification & 7) + 1;
 kvm_run->io.string = (exit_qualification & 16) != 0;
 kvm_run->io.string_down
  = (vmcs_readl(GUEST_RFLAGS) & 0x00000400) != 0;
 kvm_run->io.rep = (exit_qualification & 32) != 0;
 kvm_run->io.port = exit_qualification >> 16;
 if (kvm_run->io.string) {
  if (!get_io_count(vcpu, &kvm_run->io.count))
   return 1;
  kvm_run->io.address = vmcs_readl(GUEST_LINEAR_ADDRESS);
 } else
  kvm_run->io.value = vcpu->regs[VCPU_REGS_RAX];
 return 0;
}

static void vmx_patch_hypercall(struct kvm_vcpu *vcpu, unsigned char *hypercall)
{



 hypercall[0] = 0x0f;
 hypercall[1] = 0x01;
 hypercall[2] = 0xc1;
 hypercall[3] = 0xc3;
}

static int handle_cr(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 u64 exit_qualification;
 int cr;
 int reg;

 exit_qualification = vmcs_read64(EXIT_QUALIFICATION);
 cr = exit_qualification & 15;
 reg = (exit_qualification >> 8) & 15;
 switch ((exit_qualification >> 4) & 3) {
 case 0:
  switch (cr) {
  case 0:
   vcpu_load_rsp_rip(vcpu);
   set_cr0(vcpu, vcpu->regs[reg]);
   skip_emulated_instruction(vcpu);
   return 1;
  case 3:
   vcpu_load_rsp_rip(vcpu);
   set_cr3(vcpu, vcpu->regs[reg]);
   skip_emulated_instruction(vcpu);
   return 1;
  case 4:
   vcpu_load_rsp_rip(vcpu);
   set_cr4(vcpu, vcpu->regs[reg]);
   skip_emulated_instruction(vcpu);
   return 1;
  case 8:
   vcpu_load_rsp_rip(vcpu);
   set_cr8(vcpu, vcpu->regs[reg]);
   skip_emulated_instruction(vcpu);
   return 1;
  };
  break;
 case 1:
  switch (cr) {
  case 3:
   vcpu_load_rsp_rip(vcpu);
   vcpu->regs[reg] = vcpu->cr3;
   vcpu_put_rsp_rip(vcpu);
   skip_emulated_instruction(vcpu);
   return 1;
  case 8:
   printk("<7>" "handle_cr: read CR8 "
          "cpu erratum AA15\n");
   vcpu_load_rsp_rip(vcpu);
   vcpu->regs[reg] = vcpu->cr8;
   vcpu_put_rsp_rip(vcpu);
   skip_emulated_instruction(vcpu);
   return 1;
  }
  break;
 case 3:
  lmsw(vcpu, (exit_qualification >> 16) & 0x0f);

  skip_emulated_instruction(vcpu);
  return 1;
 default:
  break;
 }
 kvm_run->exit_reason = 0;
 printk("<3>" "kvm: unhandled control register: op %d cr %d\n",
        (int)(exit_qualification >> 4) & 3, cr);
 return 0;
}

static int handle_dr(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 u64 exit_qualification;
 unsigned long val;
 int dr, reg;





 exit_qualification = vmcs_read64(EXIT_QUALIFICATION);
 dr = exit_qualification & 7;
 reg = (exit_qualification >> 8) & 15;
 vcpu_load_rsp_rip(vcpu);
 if (exit_qualification & 16) {

  switch (dr) {
  case 6:
   val = 0xffff0ff0;
   break;
  case 7:
   val = 0x400;
   break;
  default:
   val = 0;
  }
  vcpu->regs[reg] = val;
 } else {

 }
 vcpu_put_rsp_rip(vcpu);
 skip_emulated_instruction(vcpu);
 return 1;
}

static int handle_cpuid(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 kvm_run->exit_reason = KVM_EXIT_CPUID;
 return 0;
}

static int handle_rdmsr(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 u32 ecx = vcpu->regs[VCPU_REGS_RCX];
 u64 data;

 if (vmx_get_msr(vcpu, ecx, &data)) {
  vmx_inject_gp(vcpu, 0);
  return 1;
 }


 vcpu->regs[VCPU_REGS_RAX] = data & -1u;
 vcpu->regs[VCPU_REGS_RDX] = (data >> 32) & -1u;
 skip_emulated_instruction(vcpu);
 return 1;
}

static int handle_wrmsr(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 u32 ecx = vcpu->regs[VCPU_REGS_RCX];
 u64 data = (vcpu->regs[VCPU_REGS_RAX] & -1u)
  | ((u64)(vcpu->regs[VCPU_REGS_RDX] & -1u) << 32);

 if (vmx_set_msr(vcpu, ecx, data) != 0) {
  vmx_inject_gp(vcpu, 0);
  return 1;
 }

 skip_emulated_instruction(vcpu);
 return 1;
}

static void post_kvm_run_save(struct kvm_vcpu *vcpu,
         struct kvm_run *kvm_run)
{
 ;
 kvm_run->if_flag = (vmcs_readl(GUEST_RFLAGS) & 0x00000200) != 0;
 kvm_run->cr8 = vcpu->cr8;
 kvm_run->apic_base = vcpu->apic_base;
 kvm_run->ready_for_interrupt_injection = (vcpu->interrupt_window_open &&
        vcpu->irq_summary == 0);
 ;
}

static int handle_interrupt_window(struct kvm_vcpu *vcpu,
       struct kvm_run *kvm_run)
{




 if (kvm_run->request_interrupt_window &&
     !vcpu->irq_summary) {
  kvm_run->exit_reason = KVM_EXIT_IRQ_WINDOW_OPEN;
  ++kvm_stat.irq_window_exits;
  return 0;
 }
 return 1;
}

static int handle_halt(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 skip_emulated_instruction(vcpu);
 if (vcpu->irq_summary)
  return 1;

 kvm_run->exit_reason = KVM_EXIT_HLT;
 ++kvm_stat.halt_exits;
 return 0;
}

static int handle_vmcall(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 skip_emulated_instruction(vcpu);
 return kvm_hypercall(vcpu, kvm_run);
}






static int (*kvm_vmx_exit_handlers[])(struct kvm_vcpu *vcpu,
           struct kvm_run *kvm_run) = {
 [0] = handle_exception,
 [1] = handle_external_interrupt,
 [2] = handle_triple_fault,
 [30] = handle_io,
 [28] = handle_cr,
 [29] = handle_dr,
 [10] = handle_cpuid,
 [31] = handle_rdmsr,
 [32] = handle_wrmsr,
 [7] = handle_interrupt_window,
 [12] = handle_halt,
 [18] = handle_vmcall,
};

static const int kvm_vmx_max_exit_handlers =
 sizeof(kvm_vmx_exit_handlers) / sizeof(*kvm_vmx_exit_handlers);





static int kvm_handle_exit(struct kvm_run *kvm_run, struct kvm_vcpu *vcpu)
{
 u32 vectoring_info = vmcs_read32(IDT_VECTORING_INFO_FIELD);
 u32 exit_reason = vmcs_read32(VM_EXIT_REASON);
 int r;

 ;

 if ( (vectoring_info & 0x80000000) &&
    exit_reason != 0 )
  printk("<4>" "%s: unexpected, valid vectoring info and "
         "exit reason is 0x%x\n", __FUNCTION__, exit_reason);
 kvm_run->instruction_length = vmcs_read32(VM_EXIT_INSTRUCTION_LEN);
 if (exit_reason < kvm_vmx_max_exit_handlers
     && kvm_vmx_exit_handlers[exit_reason]) {
  r = kvm_vmx_exit_handlers[exit_reason](vcpu, kvm_run);
  ;
  return r;
 } else {
  kvm_run->exit_reason = KVM_EXIT_UNKNOWN;
  kvm_run->hw.hardware_exit_reason = exit_reason;
 }
 ;
 return 0;
}







static int dm_request_for_irq_injection(struct kvm_vcpu *vcpu,
       struct kvm_run *kvm_run)
{
 return (!vcpu->irq_summary &&
  kvm_run->request_interrupt_window &&
  vcpu->interrupt_window_open &&
  (vmcs_readl(GUEST_RFLAGS) & 0x00000200));
}

extern int vm_entry_test(struct kvm_vcpu *vcpu);
extern void vm_start(void);

int vmx_vcpu_run(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
{
 u8 fail;
 u16 fs_sel, gs_sel, ldt_sel;
 int fs_gs_ldt_reload_needed;
 int r;

 ;

again:




 fs_sel = read_fs();
 gs_sel = read_gs();
 ldt_sel = read_ldt();
 fs_gs_ldt_reload_needed = (fs_sel & 7) | (gs_sel & 7) | ldt_sel;
 if (!fs_gs_ldt_reload_needed) {
  vmcs_write16(HOST_FS_SELECTOR, fs_sel);
  vmcs_write16(HOST_GS_SELECTOR, gs_sel);
 } else {




  vmcs_write16(HOST_FS_SELECTOR, fs_sel);
  vmcs_write16(HOST_GS_SELECTOR, gs_sel);

 }







 vmcs_writel(HOST_FS_BASE, read_fs_base());
 vmcs_writel(HOST_GS_BASE, read_gs_base());


 if (!vcpu->mmio_read_completed)
  do_interrupt_requests(vcpu, kvm_run);

 if (vcpu->guest_debug.enabled)
  kvm_guest_debug_pre(vcpu);

 fx_save(vcpu->host_fx_image);
 fx_restore(vcpu->guest_fx_image);

 save_msrs(vcpu->host_msrs, vcpu->nmsrs);
 load_msrs(vcpu->guest_msrs, 0);
# 1939 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
 asm (

  "pushf \n\t"
# 1950 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
  "pusha; push %%ecx \n\t"
  ".byte 0x0f, 0x79, 0xd4" "\n\t"


  "cmp $0, %1 \n\t"


  "pushf \n\t"
  ".globl _vm_start \n\t"
  "_vm_start:"
  "mov $(kvm_vmx_return), %%eax \n\t"
  "mov $0x00006c16, %%edx \n\t"
  ".byte 0x0f, 0x79, 0xd0" "\n\t"
  "popf \n\t"
# 1985 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
  "mov %c[cr2](%3), %%eax \n\t"
  "mov %%eax,   %%cr2 \n\t"
  "mov %c[rax](%3), %%eax \n\t"
  "mov %c[rbx](%3), %%ebx \n\t"
  "mov %c[rdx](%3), %%edx \n\t"
  "mov %c[rsi](%3), %%esi \n\t"

  "mov %c[rdi](%3), %%edi \n\t"
  "mov %c[rbp](%3), %%ebp \n\t"
  "mov %c[rcx](%3), %%ecx \n\t"


  "jne launched \n\t"
  ".byte 0x0f, 0x01, 0xc2" "\n\t"
  "jmp kvm_vmx_return \n\t"
  "launched: " ".byte 0x0f, 0x01, 0xc3" "\n\t"
  ".globl kvm_vmx_return \n\t"
  "kvm_vmx_return:"
# 2030 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
  "xchg %3, (%%esp) \n\t"
  "mov %%eax, %c[rax](%3) \n\t"
  "mov %%ebx, %c[rbx](%3) \n\t"
  "pushl (%%esp); popl %c[rcx](%3) \n\t"
  "mov %%edx, %c[rdx](%3) \n\t"
  "mov %%esi, %c[rsi](%3) \n\t"
  "mov %%edi, %c[rdi](%3) \n\t"
  "mov %%ebp, %c[rbp](%3) \n\t"
  "mov %%cr2, %%eax  \n\t"
  "mov %%eax, %c[cr2](%3) \n\t"
  "mov (%%esp), %3 \n\t"

  "pop %%ecx; popa \n\t"

  "setbe %0 \n\t"
  "popf \n\t"
       : "=q" (fail)
       : "r"(vcpu->launched), "d"((unsigned long)HOST_RSP),
  "c"(vcpu),
  [rax]"i"(__builtin_offsetof(struct kvm_vcpu,regs[VCPU_REGS_RAX])),
  [rbx]"i"(__builtin_offsetof(struct kvm_vcpu,regs[VCPU_REGS_RBX])),
  [rcx]"i"(__builtin_offsetof(struct kvm_vcpu,regs[VCPU_REGS_RCX])),
  [rdx]"i"(__builtin_offsetof(struct kvm_vcpu,regs[VCPU_REGS_RDX])),
  [rsi]"i"(__builtin_offsetof(struct kvm_vcpu,regs[VCPU_REGS_RSI])),
  [rdi]"i"(__builtin_offsetof(struct kvm_vcpu,regs[VCPU_REGS_RDI])),
  [rbp]"i"(__builtin_offsetof(struct kvm_vcpu,regs[VCPU_REGS_RBP])),
# 2066 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
  [cr2]"i"(__builtin_offsetof(struct kvm_vcpu,cr2))
       : "cc", "memory" );
# 2103 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
 if (fs_gs_ldt_reload_needed) {
  load_ldt(ldt_sel);
  load_fs(fs_sel);




  local_irq_disable();
  load_gs(gs_sel);



  local_irq_enable();

  reload_tss();
 }
 ++kvm_stat.exits;

 save_msrs(vcpu->guest_msrs, 0);
 load_msrs(vcpu->host_msrs, 0);

 fx_save(vcpu->guest_fx_image);
 fx_restore(vcpu->host_fx_image);
 vcpu->interrupt_window_open = (vmcs_read32(GUEST_INTERRUPTIBILITY_INFO) & 3) == 0;




 asm ("mov %0, %%ds; mov %1, %%es" : : "r"(read_ds()), "r"(read_es()));


 kvm_run->exit_type = 0;
 if (fail) {
  kvm_run->exit_type = 1;
  kvm_run->exit_reason = vmcs_read32(VM_INSTRUCTION_ERROR);
  r = 0;
  printk("<1>" "VM-exit failed: 0x%08lx\n", kvm_run->exit_reason);
 } else {
# 2150 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
  vcpu->launched = 1;
  kvm_run->exit_type = 2;
  r = kvm_handle_exit(kvm_run, vcpu);
  if (r > 0) {



   if (signal_pending(current)) {
    ++kvm_stat.signal_exits;
    post_kvm_run_save(vcpu, kvm_run);
    ;
    return -4;
   }

   if (dm_request_for_irq_injection(vcpu, kvm_run)) {
    ++kvm_stat.request_irq_exits;
    post_kvm_run_save(vcpu, kvm_run);
    ;
    return -4;
   }

   kvm_resched(vcpu);
   goto again;
  }
 }

 post_kvm_run_save(vcpu, kvm_run);
 ;
 return r;
}

static void vmx_flush_tlb(struct kvm_vcpu *vcpu)
{
 vmcs_writel(GUEST_CR3, vmcs_readl(GUEST_CR3));
}

static void vmx_inject_page_fault(struct kvm_vcpu *vcpu,
          unsigned long addr,
          u32 err_code)
{
 u32 vect_info = vmcs_read32(IDT_VECTORING_INFO_FIELD);

 ++kvm_stat.pf_guest;

 if (is_page_fault(vect_info)) {
  printk("<7>" "inject_page_fault: "
         "double fault 0x%lx @ 0x%lx\n",
         addr, vmcs_readl(GUEST_RIP));
  vmcs_write32(VM_ENTRY_EXCEPTION_ERROR_CODE, 0);
  vmcs_write32(VM_ENTRY_INTR_INFO_FIELD,
        8 |
        (3 << 8) |
        0x800 |
        0x80000000);
  return;
 }
 vcpu->cr2 = addr;
 vmcs_write32(VM_ENTRY_EXCEPTION_ERROR_CODE, err_code);
 vmcs_write32(VM_ENTRY_INTR_INFO_FIELD,
       14 |
       (3 << 8) |
       0x800 |
       0x80000000);

}

static void vmx_free_vmcs(struct kvm_vcpu *vcpu)
{
 ;
 if (vcpu->vmcs) {
  on_each_cpu(__vcpu_clear, vcpu, 0, 1);
  free_vmcs(vcpu->vmcs);
  vcpu->vmcs = ((void *)0);
 }
 ;
}

static void vmx_free_vcpu(struct kvm_vcpu *vcpu)
{
 vmx_free_vmcs(vcpu);
}

static int vmx_create_vcpu(struct kvm_vcpu *vcpu)
{
 struct vmcs *vmcs;

 ;

 vcpu->guest_msrs = kmalloc((1UL << 12), ((0x10u) | (0x40u) | (0x80u)));
 if (!vcpu->guest_msrs)
  return -12;

 vcpu->host_msrs = kmalloc((1UL << 12), ((0x10u) | (0x40u) | (0x80u)));
 if (!vcpu->host_msrs)
  goto out_free_guest_msrs;

 vmcs = alloc_vmcs();
 if (!vmcs)
  goto out_free_msrs;

 vmcs_clear(vmcs);
 vcpu->vmcs = vmcs;
 vcpu->launched = 0;

 ;
 return 0;

out_free_msrs:
 kfree(vcpu->host_msrs);
 vcpu->host_msrs = ((void *)0);

out_free_guest_msrs:
 kfree(vcpu->guest_msrs);
 vcpu->guest_msrs = ((void *)0);

 return -12;
}

static struct kvm_arch_ops vmx_arch_ops = {
 .cpu_has_kvm_support = cpu_has_kvm_support,
 .disabled_by_bios = vmx_disabled_by_bios,
 .hardware_setup = hardware_setup,
 .hardware_unsetup = hardware_unsetup,
 .hardware_enable = hardware_enable,
 .hardware_disable = hardware_disable,

 .vcpu_create = vmx_create_vcpu,
 .vcpu_free = vmx_free_vcpu,

 .vcpu_load = vmx_vcpu_load,
 .vcpu_put = vmx_vcpu_put,
 .vcpu_decache = vmx_vcpu_decache,

 .set_guest_debug = set_guest_debug,
 .get_msr = vmx_get_msr,
 .set_msr = vmx_set_msr,
 .get_segment_base = vmx_get_segment_base,
 .get_segment = vmx_get_segment,
 .set_segment = vmx_set_segment,
 .get_cs_db_l_bits = vmx_get_cs_db_l_bits,
 .decache_cr0_cr4_guest_bits = vmx_decache_cr0_cr4_guest_bits,
 .set_cr0 = vmx_set_cr0,
 .set_cr0_no_modeswitch = vmx_set_cr0_no_modeswitch,
 .set_cr3 = vmx_set_cr3,
 .set_cr4 = vmx_set_cr4,



 .get_idt = vmx_get_idt,
 .set_idt = vmx_set_idt,
 .get_gdt = vmx_get_gdt,
 .set_gdt = vmx_set_gdt,
 .cache_regs = vcpu_load_rsp_rip,
 .decache_regs = vcpu_put_rsp_rip,
 .get_rflags = vmx_get_rflags,
 .set_rflags = vmx_set_rflags,

 .tlb_flush = vmx_flush_tlb,
 .inject_page_fault = vmx_inject_page_fault,

 .inject_gp = vmx_inject_gp,

 .run = vmx_vcpu_run,
 .skip_emulated_instruction = skip_emulated_instruction,
 .vcpu_setup = vmx_vcpu_setup,
 .patch_hypercall = vmx_patch_hypercall,
};
# 2325 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
extern void test_size(int pvoid_size,
      int LIST_ENTRY_size);
extern void test_call(char *from_func, int a, int b, int c);
extern void test_nullcheck(void *null_val1);
extern void test_for_phys2virt(void);
extern int check_page_compatible(unsigned long page_size,
         unsigned long page_shift,
         unsigned long page_mask);

int vmx_init(void)
{
 test_call(__FUNCTION__, 10, 20, 30);
 test_size(sizeof(void*), sizeof(LIST_ENTRY));
 test_nullcheck(((void *)0));
 check_page_compatible((1UL << 12), 12, (~((1UL << 12)-1)));

 return kvm_init_arch(&vmx_arch_ops, ((void *)0));
}
# 2351 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
void vmx_exit(void)
{
 ;
 kvm_exit_arch();
 ;
}




