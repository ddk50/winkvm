
#ifndef _FILE_H_
#define _FILE_H_

#include <linux/winkvm.h>

#include "extension.h"

void init_file_emulater(PWINKVM_DEVICE_EXTENSION extn);
void release_file_emulater(PWINKVM_DEVICE_EXTENSION extn);

struct file* _cdecl get_empty_filp(void);
struct inode* _cdecl new_inode(void);
int _cdecl get_unused_fd(void);
void _cdecl fd_install(int fd, struct file *file, enum private_data_type type);
void _cdecl fput(struct file *file);

struct kvm *get_kvm(int fd);
struct kvm_vcpu *get_vcpu(int fd);

#endif
