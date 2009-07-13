
#include "config.h"
#include "config-host.h"

#ifdef USE_KVM

#include "exec.h"

#include "qemu-kvm.h"
#include <kvmctl.h>
#include <string.h>

#define MSR_IA32_TSC		0x10

extern void perror(const char *s);

int kvm_allowed = 1;
kvm_context_t kvm_context;
static struct kvm_msr_list *kvm_msr_list;
static int kvm_has_msr_star;

#define NR_CPU 16
static CPUState *saved_env[NR_CPU];

static void set_msr_entry(struct kvm_msr_entry *entry, uint32_t index, 
                          uint64_t data)
{
    entry->index = index;
    entry->data  = data;
}

/* returns 0 on success, non-0 on failure */
static int get_msr_entry(struct kvm_msr_entry *entry, CPUState *env)
{
        switch (entry->index) {
        case MSR_IA32_SYSENTER_CS:  
            env->sysenter_cs  = entry->data;
            break;
        case MSR_IA32_SYSENTER_ESP:
            env->sysenter_esp = entry->data;
            break;
        case MSR_IA32_SYSENTER_EIP:
            env->sysenter_eip = entry->data;
            break;
        case MSR_STAR:
            env->star         = entry->data;
            break;
#ifdef TARGET_X86_64
        case MSR_CSTAR:
            env->cstar        = entry->data;
            break;
        case MSR_KERNELGSBASE:
            env->kernelgsbase = entry->data;
            break;
        case MSR_FMASK:
            env->fmask        = entry->data;
            break;
        case MSR_LSTAR:
            env->lstar        = entry->data;
            break;
#endif
        case MSR_IA32_TSC:
            env->tsc          = entry->data;
            break;
        default:
            printf("Warning unknown msr index 0x%x\n", entry->index);
            return 1;
        }
        return 0;
}

#ifdef TARGET_X86_64
#define MSR_COUNT 9
#else
#define MSR_COUNT 5
#endif

static void set_v8086_seg(struct kvm_segment *lhs, const SegmentCache *rhs)
{
    lhs->selector = rhs->selector;
    lhs->base = rhs->base;
    lhs->limit = rhs->limit;
    lhs->type = 3;
    lhs->present = 1;
    lhs->dpl = 3;
    lhs->db = 0;
    lhs->s = 1;
    lhs->l = 0;
    lhs->g = 0;
    lhs->avl = 0;
    lhs->unusable = 0;
}

static void set_seg(struct kvm_segment *lhs, const SegmentCache *rhs)
{
    unsigned flags = rhs->flags;
    lhs->selector = rhs->selector;
    lhs->base = rhs->base;
    lhs->limit = rhs->limit;
    lhs->type = (flags >> DESC_TYPE_SHIFT) & 15;
    lhs->present = (flags & DESC_P_MASK) != 0;
    lhs->dpl = rhs->selector & 3;
    lhs->db = (flags >> DESC_B_SHIFT) & 1;
    lhs->s = (flags & DESC_S_MASK) != 0;
    lhs->l = (flags >> DESC_L_SHIFT) & 1;
    lhs->g = (flags & DESC_G_MASK) != 0;
    lhs->avl = (flags & DESC_AVL_MASK) != 0;
    lhs->unusable = 0;
}

static void get_seg(SegmentCache *lhs, const struct kvm_segment *rhs)
{
    lhs->selector = rhs->selector;
    lhs->base = rhs->base;
    lhs->limit = rhs->limit;
    lhs->flags =
	(rhs->type << DESC_TYPE_SHIFT)
	| (rhs->present * DESC_P_MASK)
	| (rhs->dpl << DESC_DPL_SHIFT)
	| (rhs->db << DESC_B_SHIFT)
	| (rhs->s * DESC_S_MASK)
	| (rhs->l << DESC_L_SHIFT)
	| (rhs->g * DESC_G_MASK)
	| (rhs->avl * DESC_AVL_MASK);
}

/* the reset values of qemu are not compatible to SVM
 * this function is used to fix the segment descriptor values */
static void fix_realmode_dataseg(struct kvm_segment *seg)
{
	seg->type = 0x02;
	seg->present = 1;
	seg->s = 1;
}

static void load_regs(CPUState *env)
{
    struct kvm_regs regs;
    struct kvm_sregs sregs;
    struct kvm_msr_entry msrs[MSR_COUNT];
    int rc, n;

    /* hack: save env */
    if (!saved_env[0])
	saved_env[0] = env;

    regs.rax = env->regs[R_EAX];
    regs.rbx = env->regs[R_EBX];
    regs.rcx = env->regs[R_ECX];
    regs.rdx = env->regs[R_EDX];
    regs.rsi = env->regs[R_ESI];
    regs.rdi = env->regs[R_EDI];
    regs.rsp = env->regs[R_ESP];
    regs.rbp = env->regs[R_EBP];
#ifdef TARGET_X86_64
    regs.r8 = env->regs[8];
    regs.r9 = env->regs[9];
    regs.r10 = env->regs[10];
    regs.r11 = env->regs[11];
    regs.r12 = env->regs[12];
    regs.r13 = env->regs[13];
    regs.r14 = env->regs[14];
    regs.r15 = env->regs[15];
#endif
    
    regs.rflags = env->eflags;
    regs.rip = env->eip;

    kvm_set_regs(kvm_context, 0, &regs);

    memcpy(sregs.interrupt_bitmap, env->kvm_interrupt_bitmap, sizeof(sregs.interrupt_bitmap));

    if ((env->eflags & VM_MASK)) {
	    set_v8086_seg(&sregs.cs, &env->segs[R_CS]);
	    set_v8086_seg(&sregs.ds, &env->segs[R_DS]);
	    set_v8086_seg(&sregs.es, &env->segs[R_ES]);
	    set_v8086_seg(&sregs.fs, &env->segs[R_FS]);
	    set_v8086_seg(&sregs.gs, &env->segs[R_GS]);
	    set_v8086_seg(&sregs.ss, &env->segs[R_SS]);
    } else {
	    set_seg(&sregs.cs, &env->segs[R_CS]);
	    set_seg(&sregs.ds, &env->segs[R_DS]);
	    set_seg(&sregs.es, &env->segs[R_ES]);
	    set_seg(&sregs.fs, &env->segs[R_FS]);
	    set_seg(&sregs.gs, &env->segs[R_GS]);
	    set_seg(&sregs.ss, &env->segs[R_SS]);

	    if (env->cr[0] & CR0_PE_MASK) {
		/* force ss cpl to cs cpl */
		sregs.ss.selector = (sregs.ss.selector & ~3) | 
			(sregs.cs.selector & 3);
		sregs.ss.dpl = sregs.ss.selector & 3;
	    }

	    if (!(env->cr[0] & CR0_PG_MASK)) {
		    fix_realmode_dataseg(&sregs.ds);
		    fix_realmode_dataseg(&sregs.es);
		    fix_realmode_dataseg(&sregs.fs);
		    fix_realmode_dataseg(&sregs.gs);
		    fix_realmode_dataseg(&sregs.ss);
	    }
    }

    set_seg(&sregs.tr, &env->tr);
    set_seg(&sregs.ldt, &env->ldt);

    sregs.idt.limit = env->idt.limit;
    sregs.idt.base = env->idt.base;
    sregs.gdt.limit = env->gdt.limit;
    sregs.gdt.base = env->gdt.base;

    sregs.cr0 = env->cr[0];
    sregs.cr2 = env->cr[2];
    sregs.cr3 = env->cr[3];
    sregs.cr4 = env->cr[4];

    sregs.apic_base = cpu_get_apic_base(env);
    sregs.efer = env->efer;
    sregs.cr8 = cpu_get_apic_tpr(env);

    kvm_set_sregs(kvm_context, 0, &sregs);

    /* msrs */
    n = 0;
    set_msr_entry(&msrs[n++], MSR_IA32_SYSENTER_CS,  env->sysenter_cs);
    set_msr_entry(&msrs[n++], MSR_IA32_SYSENTER_ESP, env->sysenter_esp);
    set_msr_entry(&msrs[n++], MSR_IA32_SYSENTER_EIP, env->sysenter_eip);
    if (kvm_has_msr_star)
	set_msr_entry(&msrs[n++], MSR_STAR,              env->star);
    set_msr_entry(&msrs[n++], MSR_IA32_TSC, env->tsc);
#ifdef TARGET_X86_64
    set_msr_entry(&msrs[n++], MSR_CSTAR,             env->cstar);
    set_msr_entry(&msrs[n++], MSR_KERNELGSBASE,      env->kernelgsbase);
    set_msr_entry(&msrs[n++], MSR_FMASK,             env->fmask);
    set_msr_entry(&msrs[n++], MSR_LSTAR  ,           env->lstar);
#endif

    rc = kvm_set_msrs(kvm_context, 0, msrs, n);
    if (rc == -1)
        perror("kvm_set_msrs FAILED");
}


static void save_regs(CPUState *env)
{
    struct kvm_regs regs;
    struct kvm_sregs sregs;
    struct kvm_msr_entry msrs[MSR_COUNT];
    uint32_t hflags;
    uint32_t i, n, rc;

    kvm_get_regs(kvm_context, 0, &regs);

    env->regs[R_EAX] = regs.rax;
    env->regs[R_EBX] = regs.rbx;
    env->regs[R_ECX] = regs.rcx;
    env->regs[R_EDX] = regs.rdx;
    env->regs[R_ESI] = regs.rsi;
    env->regs[R_EDI] = regs.rdi;
    env->regs[R_ESP] = regs.rsp;
    env->regs[R_EBP] = regs.rbp;
#ifdef TARGET_X86_64
    env->regs[8] = regs.r8;
    env->regs[9] = regs.r9;
    env->regs[10] = regs.r10;
    env->regs[11] = regs.r11;
    env->regs[12] = regs.r12;
    env->regs[13] = regs.r13;
    env->regs[14] = regs.r14;
    env->regs[15] = regs.r15;
#endif

    env->eflags = regs.rflags;
    env->eip = regs.rip;

    kvm_get_sregs(kvm_context, 0, &sregs);

    memcpy(env->kvm_interrupt_bitmap, sregs.interrupt_bitmap, sizeof(env->kvm_interrupt_bitmap));

    get_seg(&env->segs[R_CS], &sregs.cs);
    get_seg(&env->segs[R_DS], &sregs.ds);
    get_seg(&env->segs[R_ES], &sregs.es);
    get_seg(&env->segs[R_FS], &sregs.fs);
    get_seg(&env->segs[R_GS], &sregs.gs);
    get_seg(&env->segs[R_SS], &sregs.ss);

    get_seg(&env->tr, &sregs.tr);
    get_seg(&env->ldt, &sregs.ldt);
    
    env->idt.limit = sregs.idt.limit;
    env->idt.base = sregs.idt.base;
    env->gdt.limit = sregs.gdt.limit;
    env->gdt.base = sregs.gdt.base;

    env->cr[0] = sregs.cr0;
    env->cr[2] = sregs.cr2;
    env->cr[3] = sregs.cr3;
    env->cr[4] = sregs.cr4;

    cpu_set_apic_base(env, sregs.apic_base);

    env->efer = sregs.efer;
    //cpu_set_apic_tpr(env, sregs.cr8);

#define HFLAG_COPY_MASK ~( \
			HF_CPL_MASK | HF_PE_MASK | HF_MP_MASK | HF_EM_MASK | \
			HF_TS_MASK | HF_TF_MASK | HF_VM_MASK | HF_IOPL_MASK | \
			HF_OSFXSR_MASK | HF_LMA_MASK | HF_CS32_MASK | \
			HF_SS32_MASK | HF_CS64_MASK | HF_ADDSEG_MASK)



    hflags = (env->segs[R_CS].flags >> DESC_DPL_SHIFT) & HF_CPL_MASK;
    hflags |= (env->cr[0] & CR0_PE_MASK) << (HF_PE_SHIFT - CR0_PE_SHIFT);
    hflags |= (env->cr[0] << (HF_MP_SHIFT - CR0_MP_SHIFT)) & 
	    (HF_MP_MASK | HF_EM_MASK | HF_TS_MASK);
    hflags |= (env->eflags & (HF_TF_MASK | HF_VM_MASK | HF_IOPL_MASK)); 
    hflags |= (env->cr[4] & CR4_OSFXSR_MASK) << 
	    (HF_OSFXSR_SHIFT - CR4_OSFXSR_SHIFT);

    if (env->efer & MSR_EFER_LMA) {
        hflags |= HF_LMA_MASK;
    }

    if ((hflags & HF_LMA_MASK) && (env->segs[R_CS].flags & DESC_L_MASK)) {
        hflags |= HF_CS32_MASK | HF_SS32_MASK | HF_CS64_MASK;
    } else {
        hflags |= (env->segs[R_CS].flags & DESC_B_MASK) >> 
		(DESC_B_SHIFT - HF_CS32_SHIFT);
        hflags |= (env->segs[R_SS].flags & DESC_B_MASK) >> 
		(DESC_B_SHIFT - HF_SS32_SHIFT);
        if (!(env->cr[0] & CR0_PE_MASK) || 
                   (env->eflags & VM_MASK) ||
                   !(hflags & HF_CS32_MASK)) {
                hflags |= HF_ADDSEG_MASK;
            } else {
                hflags |= ((env->segs[R_DS].base | 
                                env->segs[R_ES].base |
                                env->segs[R_SS].base) != 0) << 
                    HF_ADDSEG_SHIFT;
            }
    }
    env->hflags = (env->hflags & HFLAG_COPY_MASK) | hflags;
    CC_SRC = env->eflags & (CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C);
    DF = 1 - (2 * ((env->eflags >> 10) & 1));
    CC_OP = CC_OP_EFLAGS;
    env->eflags &= ~(DF_MASK | CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C);

    tlb_flush(env, 1);

    /* msrs */    
    n = 0;
    msrs[n++].index = MSR_IA32_SYSENTER_CS;
    msrs[n++].index = MSR_IA32_SYSENTER_ESP;
    msrs[n++].index = MSR_IA32_SYSENTER_EIP;
    if (kvm_has_msr_star)
	msrs[n++].index = MSR_STAR;
    msrs[n++].index = MSR_IA32_TSC;
#ifdef TARGET_X86_64
    msrs[n++].index = MSR_CSTAR;
    msrs[n++].index = MSR_KERNELGSBASE;
    msrs[n++].index = MSR_FMASK;
    msrs[n++].index = MSR_LSTAR;
#endif
    rc = kvm_get_msrs(kvm_context, 0, msrs, n);
    if (rc == -1) {
        perror("kvm_get_msrs FAILED");
    }
    else {
        n = rc; /* actual number of MSRs */
        for (i=0 ; i<n; i++) {
            if (get_msr_entry(&msrs[i], env))
                return;
        }
    }
}

#include <signal.h>


static int try_push_interrupts(void *opaque)
{
    CPUState **envs = opaque, *env;
    env = envs[0];

    if (env->ready_for_interrupt_injection &&
        (env->interrupt_request & CPU_INTERRUPT_HARD) &&
        (env->eflags & IF_MASK)) {
            env->interrupt_request &= ~CPU_INTERRUPT_HARD;
            // for now using cpu 0
            kvm_inject_irq(kvm_context, 0, cpu_get_pic_interrupt(env));
    }

    return (env->interrupt_request & CPU_INTERRUPT_HARD) != 0;
}

static void post_kvm_run(void *opaque, struct kvm_run *kvm_run)
{
    CPUState **envs = opaque, *env;
    env = envs[0];

    env->eflags = (kvm_run->if_flag) ? env->eflags | IF_MASK:env->eflags & ~IF_MASK;
    env->ready_for_interrupt_injection = kvm_run->ready_for_interrupt_injection;
    //cpu_set_apic_tpr(env, kvm_run->cr8);
    cpu_set_apic_base(env, kvm_run->apic_base);
}

static void pre_kvm_run(void *opaque, struct kvm_run *kvm_run)
{
    CPUState **envs = opaque, *env;
    env = envs[0];

    kvm_run->cr8 = cpu_get_apic_tpr(env);
}

void kvm_load_registers(CPUState *env)
{
    load_regs(env);
}

void kvm_save_registers(CPUState *env)
{
    save_regs(env);
}

int kvm_cpu_exec(CPUState *env)
{
    int r;
    int pending = (!env->ready_for_interrupt_injection ||
                   ((env->interrupt_request & CPU_INTERRUPT_HARD) &&
		   (env->eflags & IF_MASK)));

    if (!pending && (env->interrupt_request & CPU_INTERRUPT_EXIT)) {
        env->interrupt_request &= ~CPU_INTERRUPT_EXIT;
        env->exception_index = EXCP_INTERRUPT;
        cpu_loop_exit();
    }

    
    if (!saved_env[0])
	saved_env[0] = env;

    r = kvm_run(kvm_context, 0);
    if (r < 0) {
        printf("kvm_run returned %d\n", r);
        exit(1);
    }

    return 0;
}


static int kvm_cpuid(void *opaque, uint64_t *rax, uint64_t *rbx, 
		      uint64_t *rcx, uint64_t *rdx)
{
    CPUState **envs = opaque;
    CPUState *saved_env;
    uint32_t eax = *rax;

    saved_env = env;
    env = envs[0];

    env->regs[R_EAX] = *rax;
    env->regs[R_EBX] = *rbx;
    env->regs[R_ECX] = *rcx;
    env->regs[R_EDX] = *rdx;
    helper_cpuid();
    *rdx = env->regs[R_EDX];
    *rcx = env->regs[R_ECX];
    *rbx = env->regs[R_EBX];
    *rax = env->regs[R_EAX];
    // don't report long mode/syscall/nx if no native support
    if (eax == 0x80000001) {
	unsigned long h_eax = eax, h_edx;


	// push/pop hack to workaround gcc 3 register pressure trouble
	asm (
#ifdef __x86_64__
	     "push %%rbx; push %%rcx; cpuid; pop %%rcx; pop %%rbx"
#else
	     "push %%ebx; push %%ecx; cpuid; pop %%ecx; pop %%ebx"
#endif
	     : "+a"(h_eax), "=d"(h_edx));

	// long mode
	if ((h_edx & 0x20000000) == 0)
	    *rdx &= ~0x20000000ull;
	// syscall
	if ((h_edx & 0x00000800) == 0)
	    *rdx &= ~0x00000800ull;
	// nx
	if ((h_edx & 0x00100000) == 0)
	    *rdx &= ~0x00100000ull;
    }
    // sysenter isn't supported on compatibility mode on AMD.  and syscall
    // isn't supported in compatibility mode on Intel.  so advertise the
    // actuall cpu, and say goodbye to migration between different vendors
    // is you use compatibility mode.
    if (eax == 0) {
	uint32_t bcd[3];
	asm (
#ifdef __x86_64__
	     "push %%rax; push %%rbx; push %%rcx; push %%rdx \n\t"
	     "mov $0, %%eax \n\t"
	     "cpuid \n\t"
	     "mov (%%rsp), %%rax \n\t"
	     "mov %%ebx, (%%rax) \n\t"
	     "mov %%ecx, 4(%%rax) \n\t"
	     "mov %%edx, 8(%%rax) \n\t"
	     "pop %%rdx; pop %%rcx; pop %%rbx; pop %%rax"
#else
	     "push %%eax; push %%ebx; push %%ecx; push %%edx \n\t"
	     "mov $0, %%eax \n\t"
	     "cpuid \n\t"
	     "mov (%%esp), %%eax \n\t"
	     "mov %%ebx, (%%eax) \n\t"
	     "mov %%ecx, 4(%%eax) \n\t"
	     "mov %%edx, 8(%%eax) \n\t"
	     "pop %%edx; pop %%ecx; pop %%ebx; pop %%eax"
#endif
	     : : "d"(bcd) : "memory");
	*rbx = bcd[0];
	*rcx = bcd[1];
	*rdx = bcd[2];
    }
    env = saved_env;
    return 0;
}

static int kvm_debug(void *opaque, int vcpu)
{
    CPUState **envs = opaque;

    env = envs[0];
    env->exception_index = EXCP_DEBUG;
    return 1;
}

static int kvm_inb(void *opaque, uint16_t addr, uint8_t *data)
{
    *data = cpu_inb(0, addr);
    return 0;
}

static int kvm_inw(void *opaque, uint16_t addr, uint16_t *data)
{
    *data = cpu_inw(0, addr);
    return 0;
}

static int kvm_inl(void *opaque, uint16_t addr, uint32_t *data)
{
    *data = cpu_inl(0, addr);
    return 0;
}

#define PM_IO_BASE 0xb000

static int kvm_outb(void *opaque, uint16_t addr, uint8_t data)
{
    if (addr == 0xb2) {
	switch (data) {
	case 0: {
	    cpu_outb(0, 0xb3, 0);
	    break;
	}
	case 0xf0: {
	    unsigned x;

	    /* enable acpi */
	    x = cpu_inw(0, PM_IO_BASE + 4);
	    x &= ~1;
	    cpu_outw(0, PM_IO_BASE + 4, x);
	    break;
	}
	case 0xf1: {
	    unsigned x;

	    /* enable acpi */
	    x = cpu_inw(0, PM_IO_BASE + 4);
	    x |= 1;
	    cpu_outw(0, PM_IO_BASE + 4, x);
	    break;
	}
	default:
	    break;
	}
	return 0;
    }
    cpu_outb(0, addr, data);
    return 0;
}

static int kvm_outw(void *opaque, uint16_t addr, uint16_t data)
{
    cpu_outw(0, addr, data);
    return 0;
}

static int kvm_outl(void *opaque, uint16_t addr, uint32_t data)
{
    cpu_outl(0, addr, data);
    return 0;
}

static int kvm_readb(void *opaque, uint64_t addr, uint8_t *data)
{
    *data = ldub_phys(addr);
    return 0;
}
 
static int kvm_readw(void *opaque, uint64_t addr, uint16_t *data)
{
    *data = lduw_phys(addr);
    return 0;
}

static int kvm_readl(void *opaque, uint64_t addr, uint32_t *data)
{
    *data = ldl_phys(addr);
    return 0;
}

static int kvm_readq(void *opaque, uint64_t addr, uint64_t *data)
{
    *data = ldq_phys(addr);
    return 0;
}

static int kvm_writeb(void *opaque, uint64_t addr, uint8_t data)
{
    stb_phys(addr, data);
    return 0;
}

static int kvm_writew(void *opaque, uint64_t addr, uint16_t data)
{
    stw_phys(addr, data);
    return 0;
}

static int kvm_writel(void *opaque, uint64_t addr, uint32_t data)
{
    stl_phys(addr, data);
    return 0;
}

static int kvm_writeq(void *opaque, uint64_t addr, uint64_t data)
{
    stq_phys(addr, data);
    return 0;
}

static int kvm_io_window(void *opaque)
{
    return 1;
}

 
static int kvm_halt(void *opaque, int vcpu)
{
    CPUState **envs = opaque, *env;

    env = envs[0];
    if (!((env->interrupt_request & CPU_INTERRUPT_HARD) &&
	  (env->eflags & IF_MASK))) {
	    env->hflags |= HF_HALTED_MASK;
	    env->exception_index = EXCP_HLT;
    }

    return 1;
}

static int kvm_shutdown(void *opaque, int vcpu)
{
    qemu_system_reset_request();
    return 1;
}
 
static struct kvm_callbacks qemu_kvm_ops = {
    .cpuid = kvm_cpuid,
    .debug = kvm_debug,
    .inb   = kvm_inb,
    .inw   = kvm_inw,
    .inl   = kvm_inl,
    .outb  = kvm_outb,
    .outw  = kvm_outw,
    .outl  = kvm_outl,
    .readb = kvm_readb,
    .readw = kvm_readw,
    .readl = kvm_readl,
    .readq = kvm_readq,
    .writeb = kvm_writeb,
    .writew = kvm_writew,
    .writel = kvm_writel,
    .writeq = kvm_writeq,
    .halt  = kvm_halt,
    .shutdown = kvm_shutdown,
    .io_window = kvm_io_window,
    .try_push_interrupts = try_push_interrupts,
    .post_kvm_run = post_kvm_run,
    .pre_kvm_run = pre_kvm_run,
};

int kvm_qemu_init()
{
    /* Try to initialize kvm */
    kvm_context = kvm_init(&qemu_kvm_ops, saved_env);
    if (!kvm_context) {
      	return -1;
    }

    return 0;
}

int kvm_qemu_create_context(void)
{
    int i;

    if (kvm_create(kvm_context, phys_ram_size, (void**)&phys_ram_base) < 0) {
	kvm_qemu_destroy();
	return -1;
    }
    kvm_msr_list = kvm_get_msr_list(kvm_context);
    if (!kvm_msr_list) {
	kvm_qemu_destroy();
	return -1;
    }
    for (i = 0; i < kvm_msr_list->nmsrs; ++i)
	if (kvm_msr_list->indices[i] == MSR_STAR)
	    kvm_has_msr_star = 1;
    return 0;
}

void kvm_qemu_destroy(void)
{
    kvm_finalize(kvm_context);
}

int kvm_update_debugger(CPUState *env)
{
    struct kvm_debug_guest dbg;
    int i;

    dbg.enabled = 0;
    if (env->nb_breakpoints || env->singlestep_enabled) {
	dbg.enabled = 1;
	for (i = 0; i < 4 && i < env->nb_breakpoints; ++i) {
	    dbg.breakpoints[i].enabled = 1;
	    dbg.breakpoints[i].address = env->breakpoints[i];
	}
	dbg.singlestep = env->singlestep_enabled;
    }
    return kvm_guest_debug(kvm_context, 0, &dbg);
}


/*
 * dirty pages logging
 */
/* FIXME: use unsigned long pointer instead of unsigned char */
unsigned char *kvm_dirty_bitmap = NULL;
int kvm_physical_memory_set_dirty_tracking(int enable)
{
    int r = 0;

    if (!kvm_allowed)
        return 0;

    if (enable) {
        if (!kvm_dirty_bitmap) {
            unsigned bitmap_size = BITMAP_SIZE(phys_ram_size);
            kvm_dirty_bitmap = qemu_malloc(bitmap_size);
            if (kvm_dirty_bitmap == NULL) {
                perror("Failed to allocate dirty pages bitmap");
                r=-1;
            }
            else {
                r = kvm_dirty_pages_log_enable_all(kvm_context);
            }
        }
    }
    else {
        if (kvm_dirty_bitmap) {
            r = kvm_dirty_pages_log_reset(kvm_context);
            qemu_free(kvm_dirty_bitmap);
            kvm_dirty_bitmap = NULL;
        }
    }
    return r;
}

/* get kvm's dirty pages bitmap and update qemu's */
int kvm_get_dirty_pages_log_slot(int slot, 
                                 unsigned char *bitmap,
                                 unsigned int offset,
                                 unsigned int len)
{
    int r;
    unsigned int i, j, n=0;
    unsigned char c;
    unsigned page_number, addr, addr1;

    memset(bitmap, 0, len);
    r = kvm_get_dirty_pages(kvm_context, slot, bitmap);
    if (r)
        return r;

    /* 
     * bitmap-traveling is faster than memory-traveling (for addr...) 
     * especially when most of the memory is not dirty.
     */
    for (i=0; i<len; i++) {
        c = bitmap[i];
        while (c>0) {
            j = ffsl(c) - 1;
            c &= ~(1u<<j);
            page_number = i * 8 + j;
            addr1 = page_number * TARGET_PAGE_SIZE;
            addr  = offset + addr1;
            cpu_physical_memory_set_dirty(addr);
            n++;
        }
    }
    return 0;
}

/* 
 * get kvm's dirty pages bitmap and update qemu's
 * we only care about physical ram, which resides in slots 0 and 3
 */
int kvm_update_dirty_pages_log(void)
{
    int r = 0, len;

    len = BITMAP_SIZE(0xa0000);
    r =      kvm_get_dirty_pages_log_slot(3, kvm_dirty_bitmap, 0      , len);
    len = BITMAP_SIZE(phys_ram_size - 0xc0000);
    r = r || kvm_get_dirty_pages_log_slot(0, kvm_dirty_bitmap, 0xc0000, len);
    return r;
}

int kvm_get_phys_ram_page_bitmap(unsigned char *bitmap)
{
    int r=0, len, offset;
    
    len = BITMAP_SIZE(phys_ram_size);
    memset(bitmap, 0, len);

    r = kvm_get_mem_map(kvm_context, 3, bitmap);
    if (r)
        goto out;

    offset = BITMAP_SIZE(0xc0000);
    r = kvm_get_mem_map(kvm_context, 0, bitmap + offset);

 out:
    return r;
}
#endif
