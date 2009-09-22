
#ifndef _KVMDEFINED_H_
#define _KVMDEFINED_H_

#include <linux/kvm.h>

/* start linux device driver */
extern int _cdecl vmx_init(void);
extern void _cdecl vmx_exit(void);
/* end linux device driver */

extern int _cdecl kvm_dev_ioctl_create_vm(void);
extern int _cdecl kvm_vm_ioctl_set_memory_region(struct kvm *kvm, struct kvm_memory_region *mem);
extern int _cdecl kvm_vm_ioctl_create_vcpu(struct kvm *kvm, int n);
extern int _cdecl kvm_dev_ioctl_create_vm(void);

#endif
