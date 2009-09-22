
// winkvmuser.cpp : コンソール アプリケーションのエントリ ポイントを定義します。
//

#include <windows.h>
#include <winioctl.h>
#include <stdio.h>
#include <tchar.h>

#define PAGE_SHIFT  12
#define PAGE_SIZE   (1UL << PAGE_SHIFT)
#define PAGE_MASK   (~(PAGE_SIZE-1))

#define WINKVM_DEVICE_NAME "\\\\.\\winkvm"

#define KVMIO 0xAE

#define KVM_CREATE_VM          CTL_CODE(KVMIO, 0x900 + 2, METHOD_BUFFERED, FILE_WRITE_ACCESS) /* returns a VM fd */

#define WINKVM_NOPAGE          CTL_CODE(KVMIO, 0x900 + 20, METHOD_BUFFERED, FILE_WRITE_ACCESS)
#define WINKVM_INIT_TESTMAP    CTL_CODE(KVMIO, 0x900 + 30, METHOD_BUFFERED, FILE_WRITE_ACCESS)
#define WINKVM_TESTMAP         CTL_CODE(KVMIO, 0x900 + 31, METHOD_BUFFERED, FILE_WRITE_ACCESS)
#define WINKVM_RELEASE_TESTMAP CTL_CODE(KVMIO, 0x900 + 32, METHOD_BUFFERED, FILE_WRITE_ACCESS)

void *AllocMemSpace(unsigned long npage, unsigned long pagesize);
void FreeMemSpace(void *ptr, unsigned long npage, unsigned long pagesize);
BOOL MapPageToPhys(HANDLE hnd, PVOID *pageaddr, unsigned long pageshift);
HANDLE OpenWinkvm(void);
BOOL InitTestMap(HANDLE hnd);
BOOL TestCreateVM(HANDLE hnd);
void MemmapAndTest(unsigned long dwPageSize);

static HANDLE g_hnd;

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

	printf("Open WinKVM driver\n");	

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

int kvm_create(kvm_context_t kvm, unsigned long memory, void **vm_mem)
{
    unsigned long dosmem = 0xa0000;
    unsigned long exmem = 0xc0000;
    int fd = kvm->fd;
    int zfd;
    int r;
    struct kvm_memory_region low_memory;
    struct kvm_memory_region extended_memory;

    kvm->vcpu_fd[0] = -1;

    fd = ioctl(fd, KVM_CREATE_VM, 0);
    if (fd == -1) {
        fprintf(stderr, "kvm_create_vm: %m\n");
        return -1;
    }
    kvm->vm_fd = fd;

    /* 640K should be enough. */
    r = ioctl(fd, KVM_SET_MEMORY_REGION, &low_memory);
    if (r == -1) {
        fprintf(stderr, "kvm_create_memory_region: %m\n");
        return -1;
    }
    if (extended_memory.memory_size) {
        r = ioctl(fd, KVM_SET_MEMORY_REGION, &extended_memory);
        if (r == -1) {
            fprintf(stderr, "kvm_create_memory_region: %m\n");
            return -1;
        }
    }

    kvm_memory_region_save_params(kvm, &low_memory);
    kvm_memory_region_save_params(kvm, &extended_memory);

    *vm_mem = mmap(0, memory, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
    if (*vm_mem == MAP_FAILED) {
        fprintf(stderr, "mmap: %m\n");
        return -1;
    }
    kvm->physical_memory = *vm_mem;

    zfd = open("/dev/zero", O_RDONLY);
    mmap(*vm_mem + 0xa8000, 0x8000, PROT_READ|PROT_WRITE,
         MAP_PRIVATE|MAP_FIXED, zfd, 0);
    close(zfd);

    r = ioctl(fd, KVM_CREATE_VCPU, 0);
    if (r == -1) {
        fprintf(stderr, "kvm_create_vcpu: %m\n");
        return -1;
    }
    kvm->vcpu_fd[0] = r;
    return 0;

}