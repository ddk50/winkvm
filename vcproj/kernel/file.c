
#include "init.h"
#include "kernel.h"
#include "file.h"

struct kvm *kvm = NULL;
struct file *filp = NULL;
struct inode *inode = NULL;

void release_file_emulater(void)
{
	FUNCTION_ENTER();

	if (kvm)
		ExFreePoolWithTag(kvm, MEM_TAG);

	if (filp)
		ExFreePoolWithTag(filp, MEM_TAG);

	if (inode)
		ExFreePoolWithTag(inode, MEM_TAG);

	FUNCTION_EXIT();
	return;
}

/* FIXME: These methods are corrupt, if caller use 
   the methods 2 times and above!!! */
struct file* _cdecl get_empty_filp(void)
{
	struct file *fp = NULL;
	FUNCTION_ENTER();
	fp = ExAllocatePoolWithTag(NonPagedPool, 
		                       sizeof(struct file),
							   MEM_TAG);

	SAFE_ASSERT(!fp);
	filp = fp;
	FUNCTION_EXIT();
	return fp;
}

struct inode* _cdecl new_inode(void)
{
	struct inode *i;
	FUNCTION_ENTER();
	i = ExAllocatePoolWithTag(NonPagedPool, 
		                      sizeof(struct inode),
							  MEM_TAG);

	SAFE_ASSERT(!i);
	inode = i;
	FUNCTION_EXIT();
	return i;
}

int _cdecl get_unused_fd(void)
{
	FUNCTION_ENTER();
	FUNCTION_EXIT();
	/* FIXME: sloopy */
	return 4274;
}

void _cdecl fd_install(unsigned int fd, struct file *file)
{
	filp = file;
}

void _cdecl fput(struct file *file)
{
	FUNCTION_ENTER();
	SAFE_ASSERT(0);
	FUNCTION_EXIT();
	return;
}

void _cdecl iput(struct inode *inode)
{
	FUNCTION_ENTER();
	SAFE_ASSERT(0);		
	FUNCTION_EXIT();
	return;
}