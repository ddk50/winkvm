#ifndef __LINUX_KVM_H
#define __LINUX_KVM_H

/*
 * Userspace interface for /dev/kvm - kernel based virtual machine
 *
 * Note: this interface is considered experimental and may change without
 *       notice.
 */

#ifndef __WINKVM__
#include <asm/types.h>
#include <linux/ioctl.h>
#else
#ifndef _MSC_VER
#include <linux/winkvmtypes.h>
#else
#define __user

#define _IOW(x, val, y) \
  CTL_CODE(KVMIO, 0x900 + val, METHOD_BUFFERED, FILE_ANY_ACCESS)

#define _IOR(x, val, y) \
  CTL_CODE(KVMIO, 0x900 + val, METHOD_BUFFERED, FILE_ANY_ACCESS)

#define _IO(x, val) \
  CTL_CODE(KVMIO, 0x900 + val, METHOD_BUFFERED, FILE_ANY_ACCESS)

#define _IOWR(x, val, y) \
  CTL_CODE(KVMIO, 0x900 + val, METHOD_BUFFERED, FILE_ANY_ACCESS)

#endif
#endif

#define KVM_API_VERSION 4

/*
 * Architectural interrupt line count, and the size of the bitmap needed
 * to hold them.
 */
#define KVM_NR_INTERRUPTS 256
#define KVM_IRQ_BITMAP_SIZE_BYTES    ((KVM_NR_INTERRUPTS + 7) / 8)
#define KVM_IRQ_BITMAP_SIZE(type)    (KVM_IRQ_BITMAP_SIZE_BYTES / sizeof(type))

#pragma pack(1)

/* for KVM_CREATE_MEMORY_REGION */
struct kvm_memory_region {
  __u32 slot;
  __u32 flags;
  __u64 guest_phys_addr;
  __u64 memory_size; /* bytes */
};

#ifdef __WINKVM__
struct winkvm_memory_region {
	int vm_fd;  
	struct kvm_memory_region kvm_memory_region;	
};

/* vm_fd only is enough ?? */
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
	int   vm_fd;	
	int   slot;
	__u32 base_gfn;	
	__u32 npages;	
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

#endif

#pragma pack()

/* for kvm_memory_region::flags */
#define KVM_MEM_LOG_DIRTY_PAGES  1UL


#define KVM_EXIT_TYPE_FAIL_ENTRY 1
#define KVM_EXIT_TYPE_VM_EXIT    2

enum kvm_exit_reason {
  KVM_EXIT_UNKNOWN          = 0,
  KVM_EXIT_EXCEPTION        = 1,
  KVM_EXIT_IO               = 2,
  KVM_EXIT_CPUID            = 3,
  KVM_EXIT_DEBUG            = 4,
  KVM_EXIT_HLT              = 5,
  KVM_EXIT_MMIO             = 6,
  KVM_EXIT_IRQ_WINDOW_OPEN  = 7,
  KVM_EXIT_SHUTDOWN         = 8,
};

#pragma pack(1)

/* for KVM_RUN */
struct kvm_run {
#ifdef __WINKVM__  
  int vcpu_fd;
  int _errno;  
  int ioctl_r;  
#endif   
  /* in */
  __u32 emulated;  /* skip current instruction */
  __u32 mmio_completed; /* mmio request completed */
  __u8 request_interrupt_window;
  __u8 padding1[7];

  /* out */
  __u32 exit_type;
  __u32 exit_reason;
  __u32 instruction_length;
  __u8 ready_for_interrupt_injection;
  __u8 if_flag;
  __u16 padding2;

  /* in (pre_kvm_run), out (post_kvm_run) */
  __u64 cr8;
  __u64 apic_base;

  union {
	/* KVM_EXIT_UNKNOWN */
	struct {
	  __u32 hardware_exit_reason;
	} hw;
	/* KVM_EXIT_EXCEPTION */
	struct {
	  __u32 exception;
	  __u32 error_code;
	} ex;
	/* KVM_EXIT_IO */
	struct {
	  #define KVM_EXIT_IO_IN  0
	  #define KVM_EXIT_IO_OUT 1
	  __u8 direction;
	  __u8 size; /* bytes */
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
	/*
	struct {
	} debug;
	*/ /* ddk */	
	/* KVM_EXIT_MMIO */
	struct {
	  __u64 phys_addr;
	  __u8  data[8];
	  __u32 len;
	  __u8  is_write;
	} mmio;
  };
};

/* for KVM_GET_REGS and KVM_SET_REGS */
struct kvm_regs {
#ifdef __WINKVM__  
  int vcpu_fd;  
#endif
  /* out (KVM_GET_REGS) / in (KVM_SET_REGS) */
  __u64 rax, rbx, rcx, rdx;
  __u64 rsi, rdi, rsp, rbp;
  __u64 r8,  r9,  r10, r11;
  __u64 r12, r13, r14, r15;
  __u64 rip, rflags;
};

struct kvm_segment {
  __u64 base;
  __u32 limit;
  __u16 selector;
  __u8  type;
  __u8  present, dpl, db, s, l, g, avl;
  __u8  unusable;
  __u8  padding;
};

struct kvm_dtable {
  __u64 base;
  __u16 limit;
  __u16 padding[3];
};

/* for KVM_GET_SREGS and KVM_SET_SREGS */
struct kvm_sregs {
#ifdef __WINKVM__  
  int vcpu_fd;  
#endif
  /* out (KVM_GET_SREGS) / in (KVM_SET_SREGS) */
  struct kvm_segment cs, ds, es, fs, gs, ss;
  struct kvm_segment tr, ldt;
  struct kvm_dtable gdt, idt;
  __u64 cr0, cr2, cr3, cr4, cr8;
  __u64 efer;
  __u64 apic_base;
  __u64 interrupt_bitmap[KVM_IRQ_BITMAP_SIZE(__u64)];
};

struct kvm_msr_entry {
  __u32 index;
  __u32 reserved;
  __u64 data;
};

/* for KVM_GET_MSRS and KVM_SET_MSRS */
struct kvm_msrs {
  __u32 nmsrs; /* number of msrs in entries */
  __u32 pad;

  struct kvm_msr_entry entries[0];
};

/* for KVM_GET_MSR_INDEX_LIST */
struct kvm_msr_list {
  __u32 nmsrs; /* number of msrs in entries */
  __u32 indices[0];
};

/* for KVM_TRANSLATE */
struct kvm_translation {
#ifdef __WINKVM__
  int vcpu_fd;	
#endif
  /* in */
  __u64 linear_address;

  /* out */
  __u64 physical_address;
  __u8  valid;
  __u8  writeable;
  __u8  usermode;
  __u8  pad[5];
};

/* for KVM_INTERRUPT */
struct kvm_interrupt {
  /* in */
#ifdef __WINKVM__  
  int vcpu_fd;  
#endif  
  __u32 irq;
};

struct kvm_breakpoint {
  __u32 enabled;
  __u32 padding;
  __u64 address;
};

/* for KVM_DEBUG_GUEST */
struct kvm_debug_guest {
  /* int */
  __u32 enabled;
  __u32 pad;
  struct kvm_breakpoint breakpoints[4];
  __u32 singlestep;
};

/* for KVM_GET_DIRTY_LOG and KVM_GET_MEM_MAP */
struct kvm_dirty_log {
  __u32 slot;
  __u32 padding;
  union {
	void __user *dirty_bitmap; /* one bit per page */
	__u64 __padding;	
  };
};

#pragma pack()

#define KVMIO 0xAE

/*
 * ioctls for /dev/kvm fds:
 */
#define KVM_GET_API_VERSION       _IO(KVMIO, 1)
#define KVM_CREATE_VM             _IO(KVMIO, 2) /* returns a VM fd */
#define KVM_GET_MSR_INDEX_LIST    _IOWR(KVMIO, 15, struct kvm_msr_list)

/*
 * ioctls for VM fds
 */
#define KVM_SET_MEMORY_REGION     _IOW(KVMIO, 10, struct kvm_memory_region)
/*
 * KVM_CREATE_VCPU receives as a parameter the vcpu slot, and returns
 * a vcpu fd.
 */
#define KVM_CREATE_VCPU           _IOW(KVMIO, 11, int)
#define KVM_GET_DIRTY_LOG         _IOW(KVMIO, 12, struct kvm_dirty_log)
#define KVM_GET_MEM_MAP           _IOW(KVMIO, 16, struct kvm_dirty_log)

/*
 * ioctls for vcpu fds
 */
#ifndef __WINKVM__
#define KVM_RUN                   _IOWR(KVMIO, 2, struct kvm_run)
#else
#define KVM_RUN                   _IOWR(KVMIO, 17, struct kvm_run)
#endif
#define KVM_GET_REGS              _IOR(KVMIO, 3, struct kvm_regs)
#define KVM_SET_REGS              _IOW(KVMIO, 4, struct kvm_regs)
#define KVM_GET_SREGS             _IOR(KVMIO, 5, struct kvm_sregs)
#define KVM_SET_SREGS             _IOW(KVMIO, 6, struct kvm_sregs)
#define KVM_TRANSLATE             _IOWR(KVMIO, 7, struct kvm_translation)
#define KVM_INTERRUPT             _IOW(KVMIO, 8, struct kvm_interrupt)
#define KVM_DEBUG_GUEST           _IOW(KVMIO, 9, struct kvm_debug_guest)
#define KVM_GET_MSRS              _IOWR(KVMIO, 13, struct kvm_msrs)
#define KVM_SET_MSRS              _IOW(KVMIO, 14, struct kvm_msrs)

/*
 * for WinKVM 
 */
#define WINKVM_GET_HUGE_NONPAGEAREA _IOW(KVMIO, 19, unsigned long)
#define WINKVM_NOPAGE          _IOW(KVMIO, 20, unsigned long)
#define WINKVM_INIT_TESTMAP    _IO(KVMIO, 30)
#define WINKVM_TESTMAP         _IOW(KVMIO, 31, unsigned long)
#define WINKVM_RELEASE_TESTMAP _IO(KVMIO, 32)
#define WINKVM_EXECUTE_TEST    _IO(KVMIO, 33)
#define WINKVM_PUT_VCPU        _IO(KVMIO, 34)
#define WINKVM_READ_GUEST      _IO(KVMIO, 35)
#define WINKVM_WRITE_GUEST     _IO(KVMIO, 36)
#define WINKVM_MAPMEM_INITIALIZE  _IOWR(KVMIO, 37, struct winkvm_mapmem_initialize)
#define WINKVM_MAPMEM_GETPVMAP    _IOWR(KVMIO, 38, struct winkvm_getpvmap)
#define WINKVM_UNMAPMEM_GETPVMAP  _IOWR(KVMIO, 39, struct winkvm_getpvmap)

#endif

