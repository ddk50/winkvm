
#ifndef KVM_COMMON_H
#define KVM_COMMON_H

#define KVM_API_VERSION 12

extern int kvm_abi;

/* for KVM_TRACE_ENABLE */
struct kvm_user_trace_setup {
    __u32 buf_size; /* sub_buffer size of each per-cpu */
    __u32 buf_nr; /* the number of sub_buffers of each per-cpu */
};

/* for KVM_CREATE_MEMORY_REGION */
struct kvm_memory_region {
    __u32 slot;
    __u32 flags;
    __u64 guest_phys_addr;
    __u64 memory_size; /* bytes */
};

/* for KVM_SET_USER_MEMORY_REGION */
struct kvm_userspace_memory_region {
    __u32 slot;
    __u32 flags;
    __u64 guest_phys_addr;
    __u64 memory_size; /* bytes */
    __u64 userspace_addr; /* start of the userspace allocated memory */
};

/* for kvm_memory_region::flags */
#define KVM_MEM_LOG_DIRTY_PAGES  1UL

/* for KVM_IRQ_LINE */
struct kvm_irq_level {
    /*
     * ACPI gsi notion of irq.
     * For IA-64 (APIC model) IOAPIC0: irq 0-23; IOAPIC1: irq 24-47..
     * For X86 (standard AT mode) PIC0/1: irq 0-15. IOAPIC0: 0-23..
     */
    union {
        __u32 irq;
        __s32 status;
    };
    __u32 level;
};


struct kvm_irqchip {
    __u32 chip_id;
    __u32 pad;
        union {
        char dummy[512];  /* reserving space */
#ifdef __KVM_HAVE_PIT
        struct kvm_pic_state pic;
#endif
#ifdef __KVM_HAVE_IOAPIC
        struct kvm_ioapic_state ioapic;
#endif
    } chip;
};

/* for KVM_RUN, returned by mmap(vcpu_fd, offset=0) */
struct kvm_run {
    /* in */
    __u8 request_interrupt_window;
    __u8 padding1[7];

    /* out */
    __u32 exit_reason;
    __u8 ready_for_interrupt_injection;
    __u8 if_flag;
    __u8 padding2[2];

    /* in (pre_kvm_run), out (post_kvm_run) */
    __u64 cr8;
    __u64 apic_base;

    union {
        /* KVM_EXIT_UNKNOWN */
        struct {
            __u64 hardware_exit_reason;
        } hw;
        /* KVM_EXIT_FAIL_ENTRY */
        struct {
            __u64 hardware_entry_failure_reason;
        } fail_entry;
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
            __u16 port;
            __u32 count;
            __u64 data_offset; /* relative to kvm_run start */
        } io;
        struct {
            struct kvm_debug_exit_arch arch;
        } debug;
        /* KVM_EXIT_MMIO */
        struct {
            __u64 phys_addr;
            __u8  data[8];
            __u32 len;
            __u8  is_write;
        } mmio;
        /* KVM_EXIT_HYPERCALL */
        struct {
            __u64 nr;
            __u64 args[6];
            __u64 ret;
            __u32 longmode;
            __u32 pad;
        } hypercall;
        /* KVM_EXIT_TPR_ACCESS */
        struct {
            __u64 rip;
            __u32 is_write;
            __u32 pad;
        } tpr_access;
        /* KVM_EXIT_S390_SIEIC */
        struct {
            __u8 icptcode;
            __u64 mask; /* psw upper half */
            __u64 addr; /* psw lower half */
            __u16 ipa;
            __u32 ipb;
        } s390_sieic;
        /* KVM_EXIT_S390_RESET */
#define KVM_S390_RESET_POR       1
#define KVM_S390_RESET_CLEAR     2
#define KVM_S390_RESET_SUBSYSTEM 4
#define KVM_S390_RESET_CPU_INIT  8
#define KVM_S390_RESET_IPL       16
        __u64 s390_reset_flags;
        /* KVM_EXIT_DCR */
        struct {
            __u32 dcrn;
            __u32 data;
            __u8  is_write;
        } dcr;
        /* Fix the size of the union. */
        char padding[256];
    };
};



struct kvm_context {
    /// Filedescriptor to /dev/kvm
    int fd;
    int vm_fd;
    int vcpu_fd[MAX_VCPUS];
    struct kvm_run *run[MAX_VCPUS];
    /// Callbacks that KVM uses to emulate various unvirtualizable functionality
    struct kvm_callbacks *callbacks;
    void *opaque;
    /// is dirty pages logging enabled for all regions or not
    int dirty_pages_log_all;
    /// do not create in-kernel irqchip if set
    int no_irqchip_creation;
    /// in-kernel irqchip status
    int irqchip_in_kernel;
    /// ioctl to use to inject interrupts
    int irqchip_inject_ioctl;
    /// do not create in-kernel pit if set
    int no_pit_creation;
    /// in-kernel pit status
    int pit_in_kernel;
    /// in-kernel coalesced mmio
    int coalesced_mmio;
#ifdef KVM_CAP_IRQ_ROUTING
    struct kvm_irq_routing *irq_routes;
    int nr_allocated_irq_routes;
#endif
    int max_used_gsi;
};

int kvm_alloc_kernel_memory(kvm_context_t kvm, unsigned long memory,
                                void **vm_mem);
int kvm_alloc_userspace_memory(kvm_context_t kvm, unsigned long memory,
                                void **vm_mem);

int kvm_arch_create(kvm_context_t kvm, unsigned long phys_mem_bytes,
                        void **vm_mem);
int kvm_arch_run(struct kvm_run *run, kvm_context_t kvm, int vcpu);


void kvm_show_code(kvm_context_t kvm, int vcpu);

int handle_halt(kvm_context_t kvm, int vcpu);
int handle_shutdown(kvm_context_t kvm, void *env);
void post_kvm_run(kvm_context_t kvm, void *env);
int pre_kvm_run(kvm_context_t kvm, void *env);
int handle_io_window(kvm_context_t kvm);
int handle_debug(kvm_context_t kvm, int vcpu, void *env);
int try_push_interrupts(kvm_context_t kvm);

#endif
