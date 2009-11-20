
#include <windows.h>
#include <winioctl.h>
#include <stdio.h>
#include <tchar.h>
#include <asm-generic/errno.h> /* !FIXME! */

#undef _IOW
#undef _IOR
#undef _IO
#undef _IOWR

#include "winkvmerrno.h"
#include "kvmctl.h"

#define PAGE_SHIFT  12
#define PAGE_SIZE   (1UL << PAGE_SHIFT)
#define PAGE_MASK   (~(PAGE_SIZE-1))

#define WINKVM_DEVICE_NAME "\\\\.\\winkvm"
#define KVM_MAX_NUM_MEM_REGIONS 4u

/* install SEH handler */
#define SetSEHhandler(handler) \
	do { \
	   __asm mov eax, handler \
	   __asm push eax \
	   __asm push fs:[0] \
	   __asm mov fs:[0], esp \
	} while(0);\

/* uninstall SEH handler */
#define ResetSEHhandler() \
	do { \
	   __asm mov eax, [esp] \
	   __asm mov fs:[0], eax \
	   __asm add esp, 8 \
	} while(0);\

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

struct kvm_context *kvm_context = NULL;

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
    unsigned long page = linear & ~(PAGE_SIZE-1);
    unsigned long offset = linear & (PAGE_SIZE-1);
	unsigned long retlen;
	BOOL ret;

    if (!(tr->physical && tr->linear == page)) {
        struct kvm_translation kvm_tr;
//        int r;

        kvm_tr.linear_address = page;
		kvm_tr.vcpu_fd = kvm->vcpu_fd[vcpu];

//        r = ioctl(kvm->vcpu_fd[vcpu], KVM_TRANSLATE, &kvm_tr);
		ret = DeviceIoControl(kvm->hnd,
			                  KVM_TRANSLATE,
							  &kvm_tr,
							  sizeof(kvm_tr),
							  &kvm_tr,
							  sizeof(kvm_tr),
							  &retlen,
							  NULL);

//        if (r == -1)
//            return -errno;
		if (!ret)
			return -1;

        if (!kvm_tr.valid)
			return -1;
//            return -WINKVM_EFAULT;
		printf("translate: 0x%08lx -> 0x%08lx\n", 
			kvm_tr.linear_address,
			kvm_tr.physical_address);

        tr->linear = page;
        tr->physical = (void*)((unsigned long)kvm->physical_memory + kvm_tr.physical_address);
    }
    *physical = (void*)((unsigned long)tr->physical + offset);
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
	kvm_context = NULL;
	CloseHandle(kvm->hnd);

	ResetSEHhandler();
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
	int fd, retlen, vcpufd;
//    int zfd;	
//    int r;
	struct winkvm_memory_region low_memory;
	struct winkvm_memory_region extended_memory;
	struct winkvm_create_vcpu create_vcpu;
	BOOL ret;
	
	kvm_context = kvm;

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
		printf(" MEMORY REGION (memory_size) : %d [bytes]\n", extended_memory.kvm_memory_region.memory_size);		   
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

	*vm_mem = VirtualAlloc(NULL, memory, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
	if (*vm_mem == NULL) {
		fprintf(stderr, "VirtualAlloc error\n");
		return -1;
	}
	kvm->physical_memory = *vm_mem;

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

	printf(" VM_FD : %d\n", memory.vm_fd);
	printf(" MEMORY REGION (flag) : 0x%08x\n", memory.kvm_memory_region.flags);
	printf(" MEMORY REGION (memory_size) : %d [bytes]\n", memory.kvm_memory_region.memory_size); 
	printf(" MEMORY REGION (slot) : %d\n", memory.kvm_memory_region.slot);
	printf(" MEMORY REGION (guest_phys_addr) : 0x%08lx\n", memory.kvm_memory_region.guest_phys_addr);

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
	ptr = VirtualAlloc(NULL, len, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
    if (ptr == NULL)
        return 0;

	fprintf(stderr, "Reserve memory: 0x%p\n", ptr);

    return ptr;
}

void __cdecl kvm_destroy_phys_mem(kvm_context_t kvm, unsigned long phys_start, 
								  unsigned long len)
{
	printf(" %s implement me\n", __FUNCTION__);
	return;
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
	int gm_access = 0;

	translation_cache_init(&tr);

	if (run->io.string || _in) {
		r = kvm_get_regs(kvm, vcpu, &regs);
//		r = ioctl(kvm->vcpu_fd[vcpu], KVM_GET_REGS, &regs);
		if (r == -1) {
			fprintf(stderr, "Can not get reginfo\n");
			return -1;
		}
	}

	delta = run->io.string_down ? -run->io.size : run->io.size;

	while (more_io(run, first_time)) {
		void *value_addr;
		if (!run->io.string) {
			gm_access = 0;
			if (_in)
				value_addr = &regs.rax;
			else
				value_addr = &run->io.value;
		} else {
			gm_access = 1;
			//r = translate(kvm, vcpu, &tr, run->io.address, &value_addr);
			/*
			fprintf(stderr, "translating I/O address %llx\n", 
				run->io.address);
			if (r) {
				fprintf(stderr, "failed translating I/O address %llx\n",
					    run->io.address);
				return r;
			}
			*/
		}

		switch (run->io.direction) {		  
		case KVM_EXIT_IO_IN: {
			switch (run->io.size) {
			case 1: {
				uint8_t value;
				r = kvm->callbacks->inb(kvm->opaque, addr, &value);
				if (gm_access)
					winkvm_write_guest(kvm, (__u32)run->io.address, sizeof(uint8_t), &value);
				else
					*(uint8_t *)value_addr = value;
				break;
			}
			case 2: {
				uint16_t value;
				r = kvm->callbacks->inw(kvm->opaque, addr, &value);
				if (gm_access)
					winkvm_write_guest(kvm, (__u32)run->io.address, sizeof(uint16_t), &value);
				else
					*(uint16_t *)value_addr = value;
				break;
			}
			case 4: {
				uint32_t value;
				r = kvm->callbacks->inl(kvm->opaque, addr, &value);
				if (gm_access)
					winkvm_write_guest(kvm, (__u32)run->io.address, sizeof(uint32_t), &value);
				else
					*(uint16_t *)value_addr = value;
				break;
			}
			default:
				fprintf(stderr, "bad I/O size %d\n", run->io.size);
				return -1;
			}
			break;
		}
		case KVM_EXIT_IO_OUT:
			switch (run->io.size) {				
			case 1: 
				{
					uint8_t data;
					if (gm_access)
						winkvm_read_guest(kvm, (__u32)run->io.address, sizeof(uint8_t), &data);
					else
						data = *(uint8_t *)value_addr;
					r = kvm->callbacks->outb(kvm->opaque, addr, data);
					break;
				}
			case 2:
				{
					uint16_t data;
					if (gm_access)
						winkvm_read_guest(kvm, (__u32)run->io.address, sizeof(uint16_t), &data);
					else
						data = *(uint8_t *)value_addr;
					r = kvm->callbacks->outw(kvm->opaque, addr, data);
					break;
				}
			case 4:
				{
					uint32_t data;
					if (gm_access)
						winkvm_read_guest(kvm, (__u32)run->io.address, sizeof(uint32_t), &data);
					else
						data = *(uint32_t *)value_addr;
					r = kvm->callbacks->outl(kvm->opaque, addr, data);
					break;
				}
			default:
				fprintf(stderr, "bad I/O size %d\n", run->io.size);
				return -1;
			}
			break;
		default:
			fprintf(stderr, "bad I/O direction %d\n", run->io.direction);
			return -1;
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
				return -1;

			return savedret;
		}
	}

	if (run->io.string || _in) {
		//r = ioctl(kvm->vcpu_fd[vcpu], KVM_SET_REGS, &regs);
		r = kvm_set_regs(kvm, vcpu, &regs);
		if (r == -1)
			return -1;

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

/* This Handler shows how SEH can modify global variables
   and/or registers of the faulting routine to "fix" an error
   It also shows that more than one error can be handled in a single
   exception handler */
int SEHHandler(struct _EXCEPTION_RECORD *ExceptionRecord, 
			   void *EstablisherFrame, struct _CONTEXT *ContextRecord, 
			   void *DispatcherContext)
{
	void *fault_addr;
	unsigned long fault_pfn;
	int ret = EXCEPTION_EXECUTE_HANDLER;

	printf("You've raised exception number #%x\n", ExceptionRecord->ExceptionCode);

	if (ExceptionRecord->ExceptionFlags & 1) {
		printf("non-continuable error\n");
		exit(1);
	}

	switch (ExceptionRecord->ExceptionCode) {
		case STATUS_INTEGER_DIVIDE_BY_ZERO:
			fault_addr = (void*)(ExceptionRecord->ExceptionInformation[1]);
			printf("Divide by zero at addr = 0x%08x\n", (unsigned long)fault_addr);
			ret = EXCEPTION_CONTINUE_SEARCH;
			break;
		case EXCEPTION_ACCESS_VIOLATION:
			fault_addr = (void*)(ExceptionRecord->ExceptionInformation[1]);
			fault_pfn = ((unsigned long)fault_addr) >> PAGE_SHIFT;
			printf("ACCESS VIOLATION at addr = 0x%08x (pfn: 0x%08lx)\n", fault_addr, fault_pfn);
//			MapPageToPhys(g_hnd, (PVOID)(fault_pfn << PAGE_SHIFT), PAGE_SHIFT);
			ret = EXCEPTION_CONTINUE_SEARCH;
			break;
		default:
			ret = EXCEPTION_EXECUTE_HANDLER;
			break;
	}

	return ret;
}

kvm_context_t __cdecl kvm_init(struct kvm_callbacks *callbacks,
							   void *opaque)
{
	unsigned long dwPageSize, pageshift, pagemask;
	SYSTEM_INFO SysInfo;
	HANDLE hnd;
	kvm_context_t kvm;

	hnd = OpenWinkvm();

	kvm = malloc(sizeof(struct kvm_context));
	kvm->hnd = hnd;
	kvm->vm_fd = -1;
	kvm->callbacks = callbacks;
	kvm->opaque = opaque;	
	kvm->dirty_pages_log_all = 1;
	memset(&kvm->mem_regions, 0, sizeof(kvm->mem_regions));
	kvm_context = kvm;

	GetSystemInfo(&SysInfo);

	pageshift  = 12;
	dwPageSize = SysInfo.dwPageSize;
	pagemask   = ~(pageshift - 1);

	if (dwPageSize != PAGE_SIZE) {
		printf("invalid system page size\n");
		exit(1);
	}

	/*
	printf("Systen info:\n");
	printf(" page size: %d\n page shift: %d\n", dwPageSize, pageshift);
	printf(" installing SEH handler ... ");
	SetSEHhandler(SEHHandler);
	printf(" Done\n");
	*/

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
	fprintf(stderr, "%s %04x (%08llx/%08x p %d dpl %d db %d s %d type %x l %d"
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

int __cdecl kvm_run(kvm_context_t kvm, int vcpu)
{
	int r = 0;
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
						  sizeof(kvm_run),
						  &kvm_run,
						  sizeof(kvm_run),
						  &retlen,
						  NULL);

	if (retlen != sizeof(kvm_run)) {
		printf("kvm_run: invalid return value\n");
		return r;
	}

	post_kvm_run(kvm, &kvm_run);
	kvm_run.emulated = 0;
	kvm_run.mmio_completed = 0;

	if (!ret) {
		printf("kvm_run: failed\n");
		return -1;
	}
/*
	if (kvm_run.ioctl_r == -1 && kvm_run._errno != EINTR) {
		r = -(kvm_run._errno);
		printf("kvm_run: %d\n", kvm_run._errno);
		return r;
	}
	if (kvm_run.ioctl_r == -1) {
		r = handle_io_window(kvm, &kvm_run);
		goto more;
	}
	*/
	if (kvm_run.ioctl_r == -EINTR) {
		r = handle_io_window(kvm, &kvm_run);
		r = 1;
		goto more;
	}
	switch (kvm_run.exit_type) {
	case KVM_EXIT_TYPE_FAIL_ENTRY:
		fprintf(stderr, "kvm_run: failed entry, reason %u\n", 
			kvm_run.exit_reason & 0xffff);
		return -ENOEXEC;
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
			{
				r = kvm->callbacks->writeb(kvm->opaque, addr, *(uint8_t *)data);
				break;
			}
        case 2:
			{
				r = kvm->callbacks->writew(kvm->opaque, addr, *(uint16_t *)data);
				break;
			}
        case 4:
			{
				r = kvm->callbacks->writel(kvm->opaque, addr, *(uint32_t *)data);
				break;
			}
        case 8:
			{
				r = kvm->callbacks->writeq(kvm->opaque, addr, *(uint64_t *)data);
				break;
			}
        }
    } else {
        switch (kvm_run->mmio.len) {
        case 1:
			{
				r = kvm->callbacks->readb(kvm->opaque, addr, (uint8_t *)data);
				break;
			}
        case 2:
			{
				r = kvm->callbacks->readw(kvm->opaque, addr, (uint16_t *)data);
				break;
			}			
        case 4:
			{
				r = kvm->callbacks->readl(kvm->opaque, addr, (uint32_t *)data);
				break;
			}
        case 8:
			{
				r = kvm->callbacks->readq(kvm->opaque, addr, (uint64_t *)data);
				break;
			}
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

void __cdecl kvmctl_msgbox(const char *msg)
{
	MessageBoxA(NULL, msg, "kvmctl", MB_OK);
}

int __cdecl kvm_dump_vcpu(kvm_context_t kvm, int vcpu)
{
	printf(" %s implement me\n", __FUNCTION__);
	return 1;
}

struct kvm_msr_list* __cdecl kvm_get_msr_list(kvm_context_t kvm)
{
	struct kvm_msr_list sizer, *msrs;
	unsigned long retlen;
	BOOL ret;
//	int r, e;

	printf("Call %s\n", __FUNCTION__);

	sizer.nmsrs = 0;
//    r = ioctl(kvm->fd, KVM_GET_MSR_INDEX_LIST, &sizer);
	ret = DeviceIoControl(kvm->hnd,
						  KVM_GET_MSR_INDEX_LIST,
						  &sizer,
						  sizeof(sizer),
						  NULL,
						  0,
						  &retlen,
						  NULL);
//    if (r == -1 && errno != E2BIG)
//		return 0;
	if (!ret) {
		fprintf(stderr, "Could not get number of index list\n");
		return 0;
	}

	fprintf(stderr, "num of msrs: %d\n", sizer.nmsrs);

	/* FIXME!! */  
	msrs = malloc(sizeof *msrs + sizer.nmsrs * sizeof *msrs->indices);
	if (!msrs) {
//		errno = ENOMEM;
		fprintf(stderr, "Can not msrs allocate memory\n");
		return 0;
    }

	fprintf(stderr, "alloc size: %d\n", 
		(sizeof *msrs + sizer.nmsrs * sizeof *msrs->indices));

    msrs->nmsrs = sizer.nmsrs;
//  r = ioctl(kvm->fd, KVM_GET_MSR_INDEX_LIST, msrs);
	ret = DeviceIoControl(kvm->hnd,
						  KVM_GET_MSR_INDEX_LIST,
						  msrs,
						  (sizeof *msrs + sizer.nmsrs * sizeof *msrs->indices),
						  msrs,
						  (sizeof *msrs + sizer.nmsrs * sizeof *msrs->indices),
						  &retlen,
						  NULL);

    if (!ret) {
//		e = errno;
		free(msrs);
//		errno = e;
		fprintf(stderr, "KVM_GET_MSR_INDEX_LIST was failed\n");
		return 0;
    }

	fprintf(stderr, "msr list size %d [bytes] was returned\n", retlen);

    return msrs;
}

int __cdecl kvm_get_msrs(kvm_context_t kvm, int vcpu, struct kvm_msr_entry *msrs, int n)
{
//	printf(" %s implement me\n", __FUNCTION__);
/*
	struct kvm_msrs *kmsrs = malloc(sizeof *kmsrs + n * sizeof *msrs);
    int r, e;
	BOOL ret;

    if (!kmsrs) {
//		errno = ENOMEM;
		return -1;
    }

    kmsrs->nmsrs = n;
    memcpy(kmsrs->entries, msrs, n * sizeof *msrs);

	ret = DeviceIoControl(kvm->hnd,
		                  KVM_GET_REGS,
						  &fd,
						  sizeof(int),
						  regs,
						  sizeof(struct kvm_regs),
						  &retlen,
						  NULL);

    //r = ioctl(kvm->vcpu_fd[vcpu], KVM_GET_MSRS, kmsrs);

    e = errno;
    memcpy(msrs, kmsrs->entries, n * sizeof *msrs);
    free(kmsrs);
    errno = e;
    return r;
	*/
	return -1;
}

int __cdecl kvm_set_msrs(kvm_context_t kvm, int vcpu, struct kvm_msr_entry *msrs, int n)
{
	printf(" %s implement me\n", __FUNCTION__);
	/*
	struct kvm_msrs *kmsrs = malloc(sizeof *kmsrs + n * sizeof *msrs);
    int r, e;
	BOOL ret;

    if (!kmsrs) {
//		errno = ENOMEM;
		return -1;
    }

    kmsrs->nmsrs = n;
    memcpy(kmsrs->entries, msrs, n * sizeof *msrs);
//    r = ioctl(kvm->vcpu_fd[vcpu], KVM_SET_MSRS, kmsrs);	
    e = errno;
    free(kmsrs);
    errno = e;
    return r;
	*/
	return -1;
}

int __cdecl kvm_get_mem_map(kvm_context_t kvm, int slot, void *bitmap)
{
	printf(" %s implement me\n", __FUNCTION__);
	return -1;
}

int __cdecl kvm_dirty_pages_log_enable_all(kvm_context_t kvm)
{
	printf(" %s implement me\n", __FUNCTION__);
	return -1;
}

int __cdecl kvm_dirty_pages_log_reset(kvm_context_t kvm)
{
	printf(" %s implement me\n", __FUNCTION__);
	return -1;
}

int __cdecl kvm_get_dirty_pages(kvm_context_t kvm, int slot, void *buf)
{
	printf(" %s implement me\n", __FUNCTION__);
	return -1;
}

int __cdecl kvm_inject_irq(kvm_context_t kvm, int vcpu, unsigned irq)
{
	struct kvm_interrupt intr;
	BOOL ret;
	DWORD retlen;

	intr.irq = irq;
	intr.vcpu_fd = kvm->vcpu_fd[vcpu];

	ret = DeviceIoControl(kvm->hnd,
		                  KVM_INTERRUPT,
						  &intr,
						  sizeof(intr),
						  NULL,
						  0,
						  &retlen,
						  NULL);
//	return ioctl(kvm->vcpu_fd[vcpu], KVM_INTERRUPT, &intr);
	
	if (ret)
		return 1;
	else
		return -1;
}

int __cdecl kvm_guest_debug(kvm_context_t kvm, int vcpu, struct kvm_debug_guest *dbg)
{
	printf(" %s implement me\n", __FUNCTION__);
	return -1;
}

static struct winkvm_transfer_mem *trans_mem = NULL;
static unsigned long tbuf_size = 0;

int _cdecl winkvm_read_guest(kvm_context_t kvm, unsigned long addr, 
							 unsigned long size, void *dest)
{
	int copyed_bytes = 0;
	BOOL ret;

	if (kvm == NULL) {
		kvm = kvm_context;
	}

	if (size > tbuf_size) {
		/* 512 bytes buffer */
		trans_mem = realloc(trans_mem, 
			                sizeof(struct winkvm_transfer_mem) + size);
		if (!trans_mem) {
			fprintf(stderr, "Could not allocate read buffer\n");
			return 0;
		}
		tbuf_size = size;
	}

	trans_mem->vcpu_fd = kvm->vcpu_fd[0];
	trans_mem->size    = size;
	trans_mem->gva     = addr;

	ret = DeviceIoControl(kvm->hnd,
		                  WINKVM_READ_GUEST,
						  trans_mem,
						  sizeof(struct winkvm_transfer_mem),
						  trans_mem->payload,
						  size,
						  &copyed_bytes,
						  NULL);

	if (!ret) {
		fprintf(stderr, "Could not copy to guest area\n");
	}

	return copyed_bytes;
}

int _cdecl test_write_guest(kvm_context_t kvm, unsigned long addr,
							unsigned long size, void *data)
{
	return 1;
}

int _cdecl winkvm_write_guest(kvm_context_t kvm, unsigned long addr, 
							  unsigned long size, void *data)
{
	DWORD retlen = 0;
	int copyed_bytes = 0;
	BOOL ret = FALSE;

	if (kvm == NULL) {
		kvm = kvm_context;
	}

//	fprintf(stderr, "winkvm_write_guest start\n");
//	fprintf(stderr, "kara\n");

	if (size > tbuf_size) {
		/* 512 bytes buffer */	
		trans_mem = realloc(trans_mem,
			                sizeof(struct winkvm_transfer_mem) + size);
		if (!trans_mem) {
			fprintf(stderr, "Could not allocate read buffer\n");
			fprintf(stderr, "winkvm_write_guest end\n");	
			return 0;
		}
	    tbuf_size = size;
	}

	trans_mem->vcpu_fd = kvm->vcpu_fd[0];
	trans_mem->size    = size;
	trans_mem->gva     = addr;
	memcpy(trans_mem->payload, data, size);

//	printf("write guest: gva: 0x%08lx, size: %d\n", 
//		trans_mem->gva, trans_mem->size);

	ret = DeviceIoControl(kvm->hnd,
		                  WINKVM_WRITE_GUEST,
						  trans_mem,
						  sizeof(struct winkvm_transfer_mem) + size,
						  &copyed_bytes,
						  sizeof(copyed_bytes),
						  &retlen,
						  NULL);

	if (!ret) {
		fprintf(stderr, "Could not copy to guest area\n");
	}

//	fprintf(stderr, "winkvm_write_guest end\n");	

	return copyed_bytes;
}
