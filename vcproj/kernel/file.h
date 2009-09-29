
#ifndef _FILE_H_
#define _FILE_H_

#include <linux/winkvm.h>

struct file* _cdecl get_empty_filp(void);
struct inode* _cdecl new_inode(void);
int _cdecl get_unused_fd(void);
void _cdecl fd_install(unsigned int fd, struct file *file);
void _cdecl fput(struct file *file);

void init_file_emulater(void);
void release_file_emulater(void);

struct kvm *get_kvm(int fd);
struct kvm_vcpu *get_vcpu(int fd);

#endif
