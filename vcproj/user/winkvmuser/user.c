
// winkvmuser.cpp : コンソール アプリケーションのエントリ ポイントを定義します。
//

#include <windows.h>
#include <winioctl.h>
#include <stdio.h>
#include <tchar.h>

#undef _IOW
#undef _IOR
#undef _IO
#undef _IOWR

#include "kvmctl.h"

#define PAGE_SHIFT  12
#define PAGE_SIZE   (1UL << PAGE_SHIFT)
#define PAGE_MASK   (~(PAGE_SIZE-1))

#define WINKVM_DEVICE_NAME "\\\\.\\winkvm"

/* FIXME: share this number with kvm */
/* FIXME: or dynamically alloc/realloc regions */
#define KVM_MAX_NUM_MEM_REGIONS 4u

void *AllocMemSpace(unsigned long npage, unsigned long pagesize);
void FreeMemSpace(void *ptr, unsigned long npage, unsigned long pagesize);
BOOL MapPageToPhys(HANDLE hnd, PVOID *pageaddr, unsigned long pageshift);
HANDLE OpenWinkvm(void);
BOOL InitTestMap(HANDLE hnd);
void MemmapAndTest(unsigned long dwPageSize);

static BOOL winkvm_test_run(HANDLE hnd, int vcpu_fd);
static void kvm_memory_region_save_params(kvm_context_t kvm, struct kvm_memory_region *mem);
static void kvm_memory_region_clear_params(kvm_context_t kvm, int regnum);

static HANDLE g_hnd;

#pragma pack(1)
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

#pragma pack()

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
			MapPageToPhys(g_hnd, (PVOID)(fault_pfn << PAGE_SHIFT), PAGE_SHIFT);
			ret = EXCEPTION_CONTINUE_SEARCH;
			break;
		default:
			ret = EXCEPTION_EXECUTE_HANDLER;
			break;
	}

	return ret;
}

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

int main(int argc, char *argv[])
{
	unsigned long dwPageSize, pageshift, pagemask;
	SYSTEM_INFO SysInfo;
	kvm_context_t kvm;

	GetSystemInfo(&SysInfo);

	pageshift  = 12;
	dwPageSize = SysInfo.dwPageSize;
	pagemask   = ~(pageshift - 1);

//	MemmapAndTest(hnd, dwPageSize)

	if (dwPageSize != PAGE_SIZE) {
		printf("invalid system page size\n");
		exit(1);
	}

	printf("Systen info:\n");
	printf(" page size: %d\n page shift: %d\n", dwPageSize, pageshift);

	kvm = kvm_init(NULL, NULL);
	kvm_create(kvm, 5 * 1024 * 1024, NULL);

	CloseHandle(kvm->hnd);

	return 1;	
}

void MemmapAndTest(unsigned long dwPageSize)
{
	void *memspace;	
	BYTE *ptr;
	HANDLE hnd;

	hnd = OpenWinkvm();
	g_hnd = hnd;
	InitTestMap(hnd);

	printf("Setting SEH handler\n");

	memspace = AllocMemSpace(1, dwPageSize);

	SetSEHhandler(SEHHandler); {
		printf(" write memory to ... 0x%08lx\n", (unsigned long)memspace);
		ptr = (BYTE*)memspace;
		RtlZeroMemory(ptr, 1 * dwPageSize);
		printf(" write complete!!\n");
	} ResetSEHhandler();

	FreeMemSpace(memspace, 1, dwPageSize);
}

HANDLE OpenWinkvm(void)
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

BOOL InitTestMap(HANDLE hnd)
{
	unsigned long writeval;
	unsigned long retlen;
	BOOL ret = FALSE;

	printf("%s\n", __FUNCTION__);

	ret = DeviceIoControl(hnd, WINKVM_INIT_TESTMAP, &writeval, 
	                      sizeof(unsigned long), NULL, 0, &retlen, NULL);

	if (ret) {
		printf("Success: DeviceIoControl\n");
	} else {
		printf("Failed: DeviceIoControl\n");
	}

	return ret;
}

BOOL MapPageToPhys(HANDLE hnd, PVOID *pageaddr, unsigned long pageshift)
{
	unsigned long writeval;
	unsigned long retlen;
	BOOL ret = FALSE;

	writeval = (((unsigned long)pageaddr) >> pageshift) << pageshift;

	ret = DeviceIoControl(hnd, WINKVM_TESTMAP, &writeval, 
		                  sizeof(unsigned long), NULL, 0, &retlen, NULL);

	if (ret) {
		printf("Success: DeviceIoControl\n");		
	} else {
		printf("Failed: DeviceIoControl\n");
	}
	return ret;
}

void *AllocMemSpace(unsigned long npage, unsigned long pagesize)
{
	BYTE *mem;
	unsigned long memsize = npage * pagesize;
//	BYTE *p;
//	unsigned long pages, i;

	mem = VirtualAlloc(NULL, memsize, MEM_RESERVE, PAGE_NOACCESS);
	if (!mem) {
		printf("Can not reserve memory space\n");
		exit(1);
		return NULL;
	}
	
	printf(" reserved memory space ... 0x%08x\n", (unsigned long)mem);

	return (void*)mem;

	/*
	pages = memsize / pagesize;	

	for (p = mem, i = 0 ; i < pages ; i++, p += pagesize) {		
		printf(" zero memory ... pfn: %d\n", i);
		RtlZeroMemory(p, pagesize);
	}

	VirtualFree(mem, memsize, MEM_RELEASE);
	*/
}

/* returns a VM fd */
int TestCraeateVM(HANDLE hnd)
{
	BOOL ret;
	int fd;
	unsigned long retlen;

	ret = DeviceIoControl(hnd, KVM_CREATE_VM, &fd, 
		                  sizeof(int), NULL, 0, &retlen, NULL);

	if (ret) { 
		printf("Can not get VM ds\n");
		exit(1);
	}

	return fd;
}

void FreeMemSpace(void *ptr, unsigned long npage, unsigned long pagesize)
{
	unsigned long memsize = npage * pagesize;
	VirtualFree(ptr, memsize, MEM_RELEASE);
}

int test_main(void)
{
	int r = -1;

	printf("test kvm_create\n");

	return r;
}

kvm_context_t kvm_init(struct kvm_callbacks *callbacks,
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

int kvm_create(kvm_context_t kvm, unsigned long memory, void **vm_mem)
{
    unsigned long dosmem = 0xa0000;
    unsigned long exmem = 0xc0000;
    HANDLE hnd = kvm->hnd;
	int fd, vcpufd, retlen;
    int zfd;	
    int r;
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

/*     *vm_mem = mmap(0, memory, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0); */
/*     if (*vm_mem == MAP_FAILED) { */
/*         fprintf(stderr, "mmap: %m\n"); */
/*         return -1; */
/*     } */
/*     kvm->physical_memory = *vm_mem; */

/*     zfd = open("/dev/zero", O_RDONLY); */
/*     mmap(*vm_mem + 0xa8000, 0x8000, PROT_READ|PROT_WRITE, */
/*          MAP_PRIVATE|MAP_FIXED, zfd, 0); */
/*     close(zfd); */

/*     r = ioctl(fd, KVM_CREATE_VCPU, 0); */
	create_vcpu.vm_fd    = fd;
	create_vcpu.vcpu_num = 0;

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

	 printf("Execute winkvm test run ... \n");
	 ret = winkvm_test_run(hnd, vcpufd);	 
	 printf("Done\n");

	 return 0;
}

/*
 * memory regions parameters
 */
static void
kvm_memory_region_save_params(kvm_context_t kvm, struct kvm_memory_region *mem)
{
    if (!mem || (mem->slot >= KVM_MAX_NUM_MEM_REGIONS)) {
        fprintf(stderr, "BUG: %s: invalid parameters\n", __FUNCTION__);
        return;
    }
    kvm->mem_regions[mem->slot] = *mem;
}

static void 
kvm_memory_region_clear_params(kvm_context_t kvm, int regnum)
{
    if (regnum >= KVM_MAX_NUM_MEM_REGIONS) {
        fprintf(stderr, "BUG: %s: invalid parameters\n", __FUNCTION__);
        return;
    }
    kvm->mem_regions[regnum].memory_size = 0;
}

static BOOL
winkvm_test_run(HANDLE hnd, int vcpu_fd)	
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

/*
int kvm_run(kvm_context_t kvm, int vcpu)
{
	int r;
	int fd = kvm->vcpu_fd[vcpu];
	struct kvm_run kvm_run;

	kvm_run.emulated = 0;
	kvm_run.mmio_completed = 0

again:
	kvm_run.request_interrupt_window = try_push_interrupts(kvm);
	pre_kvm_run(kvm, &kvm_run);

	r = ioctl(fd, KVM_RUN, &kvm_run);

	post_kvm_run(kvm, &kvm_run);
	kvm_run.emulated = 0;
	kvm_run.mmio_completed = 0;
	if (r == -1 && errno != EINTR) {
		r = -errno;
		printf("kvm_run: %m\n");
		return r;
	}
	if (r == -1) {
		r = handle_io_window(kvm, &kvm_run);
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
*/
