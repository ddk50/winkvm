
#include <windows.h>
#include <winioctl.h>
#include <stdio.h>
#include <tchar.h>

#undef _IOW
#undef _IOR
#undef _IO
#undef _IOWR

#include "kvmctl.h"
#include "winkvmerrno.h"

#define WINKVM_DEVICE_NAME "\\\\.\\winkvm"

#define KVM_MAX_NUM_MEM_REGIONS 4u

static int handle_mmio(kvm_context_t kvm, struct kvm_run *kvm_run);
static int handle_io_window(kvm_context_t kvm, struct kvm_run *kvm_run);
static int handle_halt(kvm_context_t kvm, struct kvm_run *kvm_run, int vcpu);
static int handle_shutdown(kvm_context_t kvm, struct kvm_run *kvm_run,
						   int vcpu);

static void post_kvm_run(kvm_context_t kvm, struct kvm_run *kvm_run);
static void pre_kvm_run(kvm_context_t kvm, struct kvm_run *kvm_run);
static int more_io(struct kvm_run *run, int first_time);

int try_push_interrupts(kvm_context_t kvm);

/**
 * \brief The KVM context
 *
 * The verbose KVM context
 */
struct kvm_context {
    /// Filedescriptor to /dev/kvm
    //int fd;
	HANDLE hnd;
    int vm_fd;
    int vcpu_fd[1];
    /// Callbacks that KVM uses to emulate various unvirtualizable functionality
    struct kvm_callbacks *callbacks;
    void *opaque;
    /// A pointer to the memory used as the physical memory for the guest
    void *physical_memory;
    /// is dirty pages logging enabled for all regions or not
    int dirty_pages_log_all;
    /// memory regions parameters
    struct kvm_memory_region mem_regions[KVM_MAX_NUM_MEM_REGIONS];
};

struct translation_cache {
    unsigned long linear;
    void *physical;
};

static void translation_cache_init(struct translation_cache *tr)
{
    tr->physical = 0;
}

static int translate(kvm_context_t kvm, int vcpu, struct translation_cache *tr,
					 unsigned long linear, void **physical)
{
	/*
    unsigned long page = linear & ~(PAGE_SIZE-1);
    unsigned long offset = linear & (PAGE_SIZE-1);

    if (!(tr->physical && tr->linear == page)) {
        struct kvm_translation kvm_tr;
        int r;

        kvm_tr.linear_address = page;

        r = ioctl(kvm->vcpu_fd[vcpu], KVM_TRANSLATE, &kvm_tr);
        if (r == -1)
            return -errno;

        if (!kvm_tr.valid)
            return -WINKVM_EFAULT;

        tr->linear = page;
        tr->physical = kvm->physical_memory + kvm_tr.physical_address;
    }
    *physical = tr->physical + offset;
    return 0;
	*/
	return 0;
}

void kvm_finalize(kvm_context_t kvm)
{
	/*
	if (kvm->vcpu_fd[0] != -1)
		close(kvm->vcpu_fd[0]);
	if (kvm->vm_fd != -1)
		close(kvm->vm_fd);

	close(kvm->fd);
    free(kvm);
	*/
	CloseHandle(kvm->hnd);
}

/*
 * memory regions parameters
 */
static void kvm_memory_region_save_params(kvm_context_t kvm, struct kvm_memory_region *mem)
{
    if (!mem || (mem->slot >= KVM_MAX_NUM_MEM_REGIONS)) {
        fprintf(stderr, "BUG: %s: invalid parameters\n", __FUNCTION__);
        return;
    }
    kvm->mem_regions[mem->slot] = *mem;
}

static void kvm_memory_region_clear_params(kvm_context_t kvm, int regnum)
{
    if (regnum >= KVM_MAX_NUM_MEM_REGIONS) {
        fprintf(stderr, "BUG: %s: invalid parameters\n", __FUNCTION__);
        return;
    }
    kvm->mem_regions[regnum].memory_size = 0;
}

int kvm_create(kvm_context_t kvm, unsigned long memory, void **vm_mem)
{
    unsigned long dosmem = 0xa0000;
    unsigned long exmem = 0xc0000;
    HANDLE hnd = kvm->hnd;
	int fd, vcpufd, retlen;
//    int zfd;	
//    int r;
	struct winkvm_memory_region low_memory;
	struct winkvm_memory_region extended_memory;
	struct winkvm_create_vcpu create_vcpu;
	BOOL ret;

	memset(&low_memory, 0, sizeof(struct winkvm_memory_region));
	memset(&extended_memory, 0, sizeof(struct winkvm_memory_region));

	low_memory.kvm_memory_region.slot = 3;
	low_memory.kvm_memory_region.memory_size = memory  < dosmem ? memory : dosmem;
	low_memory.kvm_memory_region.guest_phys_addr = 0;

	extended_memory.kvm_memory_region.slot = 0;
	extended_memory.kvm_memory_region.memory_size = memory < exmem ? 0 : memory - exmem;
	extended_memory.kvm_memory_region.guest_phys_addr = exmem;
	
    kvm->vcpu_fd[0] = -1;

	printf("Create VM ... \n");
	ret = DeviceIoControl(hnd,			  
						  KVM_CREATE_VM,
						  NULL,
						  0,
						  &fd,
						  sizeof(fd),
						  &retlen,					  
						  NULL); 
	
	//    fd = ioctl(fd, KVM_CREATE_VM, 0);	
    if (!ret && fd == -1) {	  
        fprintf(stderr, "winkvm_create_vm: %m\n");		
        return -1;		
    }
    kvm->vm_fd = fd;	
	printf(" Done\n");

	printf("Set Memory Region ... \n");
	low_memory.vm_fd = fd;

	printf(" VM_FD : %d\n", low_memory.vm_fd);
	printf(" MEMORY REGION (flag) : 0x%08x\n", low_memory.kvm_memory_region.flags);
	printf(" MEMORY REGION (memory_size) : %d [bytes]\n", low_memory.kvm_memory_region.memory_size); 
	printf(" MEMORY REGION (slot) : %d\n", low_memory.kvm_memory_region.slot);
	printf(" MEMORY REGION (guest_phys_addr) : 0x%08lx\n", low_memory.kvm_memory_region.guest_phys_addr);

    /* 640K should be enough. */
	//    r = ioctl(fd, KVM_SET_MEMORY_REGION, &low_memory);
	ret = DeviceIoControl(hnd,						  
						  KVM_SET_MEMORY_REGION,						  
						  &low_memory,
						  sizeof(struct winkvm_memory_region),
						  &low_memory,
						  sizeof(struct winkvm_memory_region),
						  &retlen,						  
						  NULL);
    if (!ret) {
        fprintf(stderr, "kvm_create_memory_region: %m\n");
        return -1;		
    }

	printf(" Done\n");

    if (extended_memory.kvm_memory_region.memory_size) {
//        r = ioctl(fd, KVM_SET_MEMORY_REGION, &extended_memory);

		printf("Set Another memory region ... \n");
		printf(" MEMORY REGION (flag) : 0x%08x\n", extended_memory.kvm_memory_region.flags);
		printf(" MEMORY REGION (memory_size) : %d\n", extended_memory.kvm_memory_region.memory_size);		   
		printf(" MEMORY REGION (slot) : %d\n", extended_memory.kvm_memory_region.slot);
		printf(" MEMORY REGION (guest_phys_addr) : 0x%08lx\n", extended_memory.kvm_memory_region.guest_phys_addr);

		ret = DeviceIoControl(hnd,
							  KVM_SET_MEMORY_REGION,
							  &extended_memory,
							  sizeof(struct winkvm_memory_region),
							  &extended_memory,
							  sizeof(struct winkvm_memory_region),
							  &retlen,
							  NULL);
        if (!ret) {			
            fprintf(stderr, "kvm_create_memory_region: %m\n");
            return -1; 
        }
		printf(" Done\n");
    }

	kvm_memory_region_save_params(kvm, &low_memory.kvm_memory_region);
	kvm_memory_region_save_params(kvm, &extended_memory.kvm_memory_region);

	create_vcpu.vm_fd    = fd;
	create_vcpu.vcpu_fd  = 0;

	vcpufd = -1;
	printf("Create VCPU ... \n");
	ret = DeviceIoControl(hnd,
		                  KVM_CREATE_VCPU,
						  &create_vcpu,
						  sizeof(create_vcpu),
						  &vcpufd,
						  sizeof(vcpufd),
						  &retlen,
						  NULL);
     if (vcpufd == -1) {	   
         fprintf(stderr, " kvm_create_vcpu: %m\n");
         return -1;
     }
	 printf(" vcpu fd : %d\n", vcpufd);
	 printf(" Done\n");
     kvm->vcpu_fd[0] = vcpufd;
	 return 0;
}

void *kvm_create_phys_mem(kvm_context_t kvm, unsigned long phys_start,
						  unsigned long len, int slot, int log, int writable)
{
    void *ptr;
//    int r;
    int fd = kvm->vm_fd;
//    int prot = PROT_READ;
	BOOL ret;
	int retlen;
	struct winkvm_memory_region memory;

	/*
    struct kvm_memory_region memory = {
        .slot = slot,
        .memory_size = len,
        .guest_phys_addr = phys_start,
        .flags = log ? KVM_MEM_LOG_DIRTY_PAGES : 0,
    };
	*/

    /* r = ioctl(fd, KVM_SET_MEMORY_REGION, &memory); */
    /* if (r == -1)
        return 0;
		*/

	memory.vm_fd = fd;
	memory.kvm_memory_region.slot            = slot;
	memory.kvm_memory_region.memory_size     = len;
	memory.kvm_memory_region.guest_phys_addr = phys_start;
	memory.kvm_memory_region.flags           = log ? KVM_MEM_LOG_DIRTY_PAGES : 0;

	ret = DeviceIoControl(kvm->hnd,
		                  KVM_SET_MEMORY_REGION,
						  &memory,
						  sizeof(struct winkvm_memory_region),
						  &memory,
						  sizeof(struct winkvm_memory_region),
						  &retlen,
						  NULL);
	if (!ret) {
		return 0;
	}

    kvm_memory_region_save_params(kvm, &(memory.kvm_memory_region));

//    if (writable)
//        prot |= PROT_WRITE;

//    ptr = mmap(0, len, prot, MAP_SHARED, fd, phys_start);
	ptr = VirtualAlloc(NULL, len, MEM_RESERVE, PAGE_NOACCESS);
    if (ptr == NULL)
        return 0;

    return ptr;
}

static int handle_io(kvm_context_t kvm, struct kvm_run *run, int vcpu)
{
	uint16_t addr = run->io.port;
	struct kvm_regs regs;
	int first_time = 1;
	int delta;
	struct translation_cache tr;
	int _in = (run->io.direction == KVM_EXIT_IO_IN);
	int r;

	translation_cache_init(&tr);

	if (run->io.string || _in) {
		kvm_get_regs(kvm, vcpu, &regs);
//		r = ioctl(kvm->vcpu_fd[vcpu], KVM_GET_REGS, &regs);
		if (r == -1)
			return -errno;
	}

	delta = run->io.string_down ? -run->io.size : run->io.size;

	while (more_io(run, first_time)) {
		void *value_addr;

		if (!run->io.string) {
			if (_in)
				value_addr = &regs.rax;
			else
				value_addr = &run->io.value;
		} else {
			r = translate(kvm, vcpu, &tr, run->io.address, &value_addr);
			if (r) {
				fprintf(stderr, "failed translating I/O address %llx\n",
					run->io.address);
				return r;
			}
		}

		switch (run->io.direction) {		  
		case KVM_EXIT_IO_IN: {
			switch (run->io.size) {
			case 1: {
				uint8_t value;
				r = kvm->callbacks->inb(kvm->opaque, addr, &value);
				*(uint8_t *)value_addr = value;
				break;
			}
			case 2: {
				uint16_t value;
				r = kvm->callbacks->inw(kvm->opaque, addr, &value);
				*(uint16_t *)value_addr = value;
				break;
			}
			case 4: {
				uint32_t value;
				r = kvm->callbacks->inl(kvm->opaque, addr, &value);
				*(uint32_t *)value_addr = value;
				break;
			}
			default:
				fprintf(stderr, "bad I/O size %d\n", run->io.size);
				return -WINKVM_EMSGSIZE;
			}
			break;
		}
		case KVM_EXIT_IO_OUT:
			switch (run->io.size) {
			case 1:
				r = kvm->callbacks->outb(kvm->opaque, addr,
						     *(uint8_t *)value_addr);
				break;
			case 2:
				r = kvm->callbacks->outw(kvm->opaque, addr,
						     *(uint16_t *)value_addr);
				break;
			case 4:
				r = kvm->callbacks->outl(kvm->opaque, addr,
						     *(uint32_t *)value_addr);
				break;
			default:
				fprintf(stderr, "bad I/O size %d\n", run->io.size);
				return -WINKVM_EMSGSIZE;
			}
			break;
		default:
			fprintf(stderr, "bad I/O direction %d\n", run->io.direction);
			return -WINKVM_EPROTO;
		}
		if (run->io.string) {
			run->io.address += delta;
			switch (run->io.direction) {
			case KVM_EXIT_IO_IN:  regs.rdi += delta; break;
			case KVM_EXIT_IO_OUT: regs.rsi += delta; break;
			}
			if (run->io.rep) {
				--regs.rcx;
				--run->io.count;
			}
		}
		first_time = 0;
		if (r) {
			int savedret = r;
//			r = ioctl(kvm->vcpu_fd[vcpu], KVM_SET_REGS, &regs);
			r = kvm_set_regs(kvm, vcpu, &regs);
			if (r == -1)
				return -errno;

			return savedret;
		}
	}

	if (run->io.string || _in) {
		//r = ioctl(kvm->vcpu_fd[vcpu], KVM_SET_REGS, &regs);
		r = kvm_set_regs(kvm, vcpu, &regs);
		if (r == -1)
			return -errno;

	}

	run->emulated = 1;
	return 0;
}

int handle_debug(kvm_context_t kvm, struct kvm_run *run, int vcpu)
{
//	BOOL ret;
    return kvm->callbacks->debug(kvm->opaque, vcpu);
}

int kvm_get_regs(kvm_context_t kvm, int vcpu, struct kvm_regs *regs)
{
	BOOL ret;
	unsigned long retlen;
	int fd = kvm->vcpu_fd[vcpu];
	ret = DeviceIoControl(kvm->hnd,
		                  KVM_GET_REGS,
						  &fd,
						  sizeof(int),
						  regs,
						  sizeof(struct kvm_regs),
						  &retlen,
						  NULL);
	if (ret)
		return 1;
	else 
		return 0;
//    return ioctl(kvm->vcpu_fd[vcpu], KVM_GET_REGS, regs);
}

int kvm_set_regs(kvm_context_t kvm, int vcpu, struct kvm_regs *regs)
{
	BOOL ret;
	int fd = kvm->vcpu_fd[vcpu];
	unsigned long retlen;	
	regs->vcpu_fd = fd;
	ret = DeviceIoControl(kvm->hnd,
		                  KVM_SET_REGS,
						  regs,
						  sizeof(struct kvm_regs),
						  NULL,
						  0,
						  &retlen,
						  NULL);
	if (ret)
		return 1;
	else
		return 0;
//    return ioctl(kvm->vcpu_fd[vcpu], KVM_SET_REGS, regs);
}

int kvm_get_sregs(kvm_context_t kvm, int vcpu, struct kvm_sregs *sregs)
{
	BOOL ret;
	unsigned long retlen;
	int vcpu_fd = kvm->vcpu_fd[vcpu];
	ret = DeviceIoControl(kvm->hnd,
		                  KVM_GET_SREGS,
						  &vcpu_fd,
						  sizeof(int),
						  sregs,
						  sizeof(struct kvm_sregs),
						  &retlen,
						  NULL);
	if (ret)
		return 1;
	else
		return 0;
//    return ioctl(kvm->vcpu_fd[vcpu], KVM_GET_SREGS, sregs);
}

int kvm_set_sregs(kvm_context_t kvm, int vcpu, struct kvm_sregs *sregs)
{
	BOOL ret;
	unsigned long retlen;
	int vcpu_fd = kvm->vcpu_fd[vcpu];
	ret = DeviceIoControl(kvm->hnd,
		                  KVM_SET_SREGS,
						  sregs,
						  sizeof(struct kvm_sregs),
						  NULL,
						  0,
						  &retlen,
						  NULL);
	if (ret)
		return 1;
	else
		return 0;
//    return ioctl(kvm->vcpu_fd[vcpu], KVM_SET_SREGS, sregs);
}

static int more_io(struct kvm_run *run, int first_time)
{
    if (!run->io.rep)
        return first_time;
    else
        return run->io.count != 0;
}

static int test_try_push_interrupts(void *opaque)
{
}

static void test_post_kvm_run(void *opaque, struct kvm_run *kvm_run)
{
}

static void test_pre_kvm_run(void *opaque, struct kvm_run *kvm_run)
{
}

static HANDLE OpenWinkvm(void)
{
	HANDLE hnd;

	printf("Testing winkvm driver...\n");
	printf(" Testing Create Driver\n");

	hnd = CreateFile(_T(WINKVM_DEVICE_NAME), GENERIC_WRITE,
		             FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL);

	if (hnd == INVALID_HANDLE_VALUE ) {
		printf("Error: CreateFile\n");
		exit(1);
		return INVALID_HANDLE_VALUE;
	} else {
		printf("Success: CreateFile\n");
	}

	return hnd;
}

__declspec(dllexport) 
kvm_context_t __cdecl kvm_init(struct kvm_callbacks *callbacks,
							   void *opaque)
{
	HANDLE hnd;
	kvm_context_t kvm;

	hnd = OpenWinkvm();

	kvm = malloc(sizeof(*kvm));
	kvm->hnd = hnd;
	kvm->vm_fd = -1;
	kvm->callbacks = callbacks;
	kvm->opaque = opaque;	
	kvm->dirty_pages_log_all = 1;
	memset(&kvm->mem_regions, 0, sizeof(kvm->mem_regions));

	return kvm;	
}

static BOOL winkvm_test_run(HANDLE hnd, int vcpu_fd)	
{
	BOOL ret = FALSE;
	unsigned long retlen = 0;	

	printf("%s\n", __FUNCTION__);	
	
	ret = DeviceIoControl(hnd,
						  WINKVM_EXECUTE_TEST,
						  &vcpu_fd,						  
						  sizeof(vcpu_fd),
						  NULL,
						  0,
						  &retlen,
						  NULL);
	if (ret) {
		printf(" Success: DeviceIoControl\n");
	} else {
		printf(" Failed: DeviceIoControl\n");		
	}
	
	return ret;
}

static void print_seg(FILE *file, const char *name, struct kvm_segment *seg)
{
	fprintf(stderr,
		"%s %04x (%08llx/%08x p %d dpl %d db %d s %d type %x l %d"
		" g %d avl %d)\n",
		name, seg->selector, seg->base, seg->limit, seg->present,
		seg->dpl, seg->db, seg->s, seg->type, seg->l, seg->g,
		seg->avl);
}

static void print_dt(FILE *file, const char *name, struct kvm_dtable *dt)
{
	fprintf(stderr, "%s %llx/%x\n", name, dt->base, dt->limit);
}

void kvm_show_regs(kvm_context_t kvm, int vcpu)
{
    int fd = kvm->vcpu_fd[vcpu];
    struct kvm_regs regs;
    struct kvm_sregs sregs;
//  int r;
	unsigned long retlen = 0;
	BOOL ret;

//    r = ioctl(fd, KVM_GET_REGS, &regs);	
	ret = DeviceIoControl(kvm->hnd,
		                  KVM_GET_REGS,
						  &fd,
						  sizeof(int),
						  &regs,
						  sizeof(struct kvm_regs),
						  &retlen,
						  NULL);
    if (!ret) {
        perror("KVM_GET_REGS");
        return;
    }
    fprintf(stderr,
        "rax %016llx rbx %016llx rcx %016llx rdx %016llx\n"
        "rsi %016llx rdi %016llx rsp %016llx rbp %016llx\n"
        "r8  %016llx r9  %016llx r10 %016llx r11 %016llx\n"
        "r12 %016llx r13 %016llx r14 %016llx r15 %016llx\n"
        "rip %016llx rflags %08llx\n",
        regs.rax, regs.rbx, regs.rcx, regs.rdx,
        regs.rsi, regs.rdi, regs.rsp, regs.rbp,
        regs.r8,  regs.r9,  regs.r10, regs.r11,
        regs.r12, regs.r13, regs.r14, regs.r15,
        regs.rip, regs.rflags);
//    r = ioctl(fd, KVM_GET_SREGS, &sregs);
	ret = DeviceIoControl(kvm->hnd,
		                  KVM_GET_REGS,
						  &fd,
						  sizeof(int),
						  &sregs,
						  sizeof(struct kvm_sregs),
						  &retlen,
						  NULL);
    if (!ret) {
        perror("KVM_GET_SREGS");
        return;
    }
    print_seg(stderr, "cs", &sregs.cs);
    print_seg(stderr, "ds", &sregs.ds);
    print_seg(stderr, "es", &sregs.es);
    print_seg(stderr, "ss", &sregs.ss);
    print_seg(stderr, "fs", &sregs.fs);
    print_seg(stderr, "gs", &sregs.gs);
    print_seg(stderr, "tr", &sregs.tr);
    print_seg(stderr, "ldt", &sregs.ldt);
    print_dt(stderr, "gdt", &sregs.gdt);
    print_dt(stderr, "idt", &sregs.idt);
    fprintf(stderr, "cr0 %llx cr2 %llx cr3 %llx cr4 %llx cr8 %llx"
        " efer %llx\n",
        sregs.cr0, sregs.cr2, sregs.cr3, sregs.cr4, sregs.cr8,
        sregs.efer);
}

static int handle_cpuid(kvm_context_t kvm, struct kvm_run *run, int vcpu)
{
    struct kvm_regs regs;
    uint32_t orig_eax;
    uint64_t rax, rbx, rcx, rdx;
    int r;

    kvm_get_regs(kvm, vcpu, &regs);
    orig_eax = (uint32_t)regs.rax;
    rax = regs.rax;
    rbx = regs.rbx;
    rcx = regs.rcx;
    rdx = regs.rdx;
    r = kvm->callbacks->cpuid(kvm->opaque, &rax, &rbx, &rcx, &rdx);
    regs.rax = rax;
    regs.rbx = rbx;
    regs.rcx = rcx;
    regs.rdx = rdx;
    if (orig_eax == 1)
        regs.rdx &= ~(1ull << 12); /* disable mtrr support */
    kvm_set_regs(kvm, vcpu, &regs);
    run->emulated = 1;
    return r;
}

__declspec(dllexport)
int __cdecl kvm_run(kvm_context_t kvm, int vcpu)
{
	int r;
	int fd = kvm->vcpu_fd[vcpu];
	struct kvm_run kvm_run;
	int retlen;
	BOOL ret = FALSE;

	kvm_run.emulated = 0;
	kvm_run.mmio_completed = 0;	
	kvm_run.vcpu_fd = fd;

again:
	kvm_run.request_interrupt_window = try_push_interrupts(kvm);
	pre_kvm_run(kvm, &kvm_run);

/*	r = ioctl(fd, KVM_RUN, &kvm_run); */
	ret = DeviceIoControl(kvm->hnd,
						  KVM_RUN,
						  &kvm_run,
						  sizeof(struct kvm_run),
						  NULL,
						  0,
						  &retlen,
						  NULL);
	if (ret) {
		printf("KVM_RUN: success\n");
	} else {
		printf("KVM_RUN: failed\n");
		return 0;
	}

	post_kvm_run(kvm, &kvm_run);
	kvm_run.emulated = 0;
	kvm_run.mmio_completed = 0;
//	if (r == -1 && errno != EINTR) {
//	if (!ret) {
//		r = -errno;
//		printf("kvm_run: %m\n");
//		return r;
//		return -1;
//	}
	/* fixme!! */
	if (!ret) {
		r = handle_io_window(kvm, &kvm_run);
		goto more;
	}
	switch (kvm_run.exit_type) {
	case KVM_EXIT_TYPE_FAIL_ENTRY:
		fprintf(stderr, "kvm_run: failed entry, reason %u\n", 
			kvm_run.exit_reason & 0xffff);
//		return -ENOEXEC;
		return -1;
		break;
	case KVM_EXIT_TYPE_VM_EXIT:
		switch (kvm_run.exit_reason) {
		case KVM_EXIT_UNKNOWN:
			fprintf(stderr, "unhandled vm exit:  0x%x\n", 
			       kvm_run.hw.hardware_exit_reason);
			kvm_show_regs(kvm, vcpu);
			abort();
			break;
		case KVM_EXIT_EXCEPTION:
			fprintf(stderr, "exception %d (%x)\n", 
			       kvm_run.ex.exception,
			       kvm_run.ex.error_code);
			kvm_show_regs(kvm, vcpu);
			abort();
			break;
		case KVM_EXIT_IO:
			r = handle_io(kvm, &kvm_run, vcpu);
			break;
		case KVM_EXIT_CPUID:
			r = handle_cpuid(kvm, &kvm_run, vcpu);
			break;
		case KVM_EXIT_DEBUG:
			r = handle_debug(kvm, &kvm_run, vcpu);
			break;
		case KVM_EXIT_MMIO:
			r = handle_mmio(kvm, &kvm_run);
			break;
		case KVM_EXIT_HLT:
			r = handle_halt(kvm, &kvm_run, vcpu);
			break;
		case KVM_EXIT_IRQ_WINDOW_OPEN:
			break;
		case KVM_EXIT_SHUTDOWN:
			r = handle_shutdown(kvm, &kvm_run, vcpu);
			break;
		default:
			fprintf(stderr, "unhandled vm exit: 0x%x\n", kvm_run.exit_reason);
			kvm_show_regs(kvm, vcpu);
			abort();
			break;
		}
	}
more:
	if (!r)
		goto again;
	return r;
}

static int handle_mmio(kvm_context_t kvm, struct kvm_run *kvm_run)
{
    unsigned long addr = (unsigned long)(kvm_run->mmio.phys_addr);
    void *data = kvm_run->mmio.data;
    int r = -1;

    if (kvm_run->mmio.is_write) {
        switch (kvm_run->mmio.len) {
        case 1:
            r = kvm->callbacks->writeb(kvm->opaque, addr, *(uint8_t *)data);
            break;
        case 2:
            r = kvm->callbacks->writew(kvm->opaque, addr, *(uint16_t *)data);
            break;
        case 4:
            r = kvm->callbacks->writel(kvm->opaque, addr, *(uint32_t *)data);
            break;
        case 8:
            r = kvm->callbacks->writeq(kvm->opaque, addr, *(uint64_t *)data);
            break;
        }
    } else {
        switch (kvm_run->mmio.len) {
        case 1:
            r = kvm->callbacks->readb(kvm->opaque, addr, (uint8_t *)data);
            break;
        case 2:
            r = kvm->callbacks->readw(kvm->opaque, addr, (uint16_t *)data);
            break;
        case 4:
            r = kvm->callbacks->readl(kvm->opaque, addr, (uint32_t *)data);
            break;
        case 8:
            r = kvm->callbacks->readq(kvm->opaque, addr, (uint64_t *)data);
            break;
        }
        kvm_run->mmio_completed = 1;
    }
    return r;
}

static int handle_io_window(kvm_context_t kvm, struct kvm_run *kvm_run)
{
    return kvm->callbacks->io_window(kvm->opaque);
}

static int handle_halt(kvm_context_t kvm, struct kvm_run *kvm_run, int vcpu)
{
    return kvm->callbacks->halt(kvm->opaque, vcpu);
}

static int handle_shutdown(kvm_context_t kvm, struct kvm_run *kvm_run,
						   int vcpu)
{
    return kvm->callbacks->shutdown(kvm->opaque, vcpu);
}

int try_push_interrupts(kvm_context_t kvm)
{
    return kvm->callbacks->try_push_interrupts(kvm->opaque);
}

static void post_kvm_run(kvm_context_t kvm, struct kvm_run *kvm_run)
{
    kvm->callbacks->post_kvm_run(kvm->opaque, kvm_run);
}

static void pre_kvm_run(kvm_context_t kvm, struct kvm_run *kvm_run)
{
    kvm->callbacks->pre_kvm_run(kvm->opaque, kvm_run);
}
