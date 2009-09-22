
#ifndef _FILE_H_
#define _FILE_H_

#include <linux/winkvm.h>

extern struct kvm *kvm;
extern struct file *filp;
extern struct inode *inode;

struct file* _cdecl get_empty_filp(void);
struct inode* _cdecl new_inode(void);
int _cdecl get_unused_fd(void);
void _cdecl fd_install(unsigned int fd, struct file *file);
void _cdecl fput(struct file *file);

void release_file_emulater(void);

#endif
