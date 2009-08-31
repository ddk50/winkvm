
#ifndef _KVM_H_
#define _KVM_H_

#define KVM_EXIT_UNKNOWN          0
#define KVM_EXIT_EXCEPTION        1
#define KVM_EXIT_IO               2
#define KVM_EXIT_HYPERCALL        3
#define KVM_EXIT_DEBUG            4
#define KVM_EXIT_HLT              5
#define KVM_EXIT_MMIO             6
#define KVM_EXIT_IRQ_WINDOW_OPEN  7
#define KVM_EXIT_SHUTDOWN         8
#define KVM_EXIT_FAIL_ENTRY       9
#define KVM_EXIT_INTR             10
#define KVM_EXIT_SET_TPR          11
#define KVM_EXIT_TPR_ACCESS       12
#define KVM_EXIT_S390_SIEIC       13
#define KVM_EXIT_S390_RESET       14
#define KVM_EXIT_DCR              15
#define KVM_EXIT_NMI              16

#define KVM_TYPE 40000

#define _IOW(x, val, y) \
	CTL_CODE(KVM_TYPE, (

#define _IOR(x, val, y)
#define _IO(x, val)
#define _IOWR(x, val, y)

#define KVM_GET_API_VERSION \
	CTL_CODE(KVMIO, 0x900, METHOD_BUFFERED, FILE_WRITE_ACCESS)

#define KVM_CREATE_VM \
	CTL_CODE(KVMIO, 0x901, METHOD_BUFFERED, FILE_WRITE_ACCESS)

#define KVM_GET_MSR_INDEX_LIST \
	CTL_CODE(KVMIO, 0x902, METHOD_BUFFERED, FILE_WRITE_ACCESS)

#define KVM_S390_ENABLE_SIE \
	CTL_CODE(KVMIO, 0x903, METHOD_BUFFERED, FILE_WRITE_ACCESS)

#define KVM_CHECK_EXTENSION \
	CTL_CODE(KVMIO, 0x904, METHOD_BUFFERED, FILE_WRITE_ACCESS)

extern int _cdecl trampline_test(int a, int b, int c);
extern int _cdecl hello_init(void);
extern void _cdecl hello_exit(void);

#endif
