
#include "init.h"
#include "kernel.h"
#include "file.h"

/* FIXME: Can not allocate FD slot */
#define MAX_FD_SLOT 50

struct fd_emulater_slot {
	/* struct kvm *kvm = NULL; */
	int used;
	struct file *file;
} fd_slot[MAX_FD_SLOT];

static FAST_MUTEX fd_slot_mutex;
const int fd_slot_num = sizeof(*fd_slot) / sizeof(struct fd_emulater_slot);

static int VALID_FD(int fd);

void init_file_emulater(void)
{
	int i;
	FUNCTION_ENTER();
	for (i = 0 ; i < MAX_FD_SLOT ; i++) {
		fd_slot[i].used = 0;
	}
	ExInitializeFastMutex(&fd_slot_mutex);
	FUNCTION_EXIT();
}

void release_file_emulater(void)
{
	int i;
	FUNCTION_ENTER();

	for (i = 0 ; i < MAX_FD_SLOT ; i++) {
		if (fd_slot[i].file) {
			if (fd_slot[i].file->__inode)
				ExFreePoolWithTag(fd_slot[i].file->__inode, MEM_TAG);
			ExFreePoolWithTag(fd_slot[i].file, MEM_TAG);
		}
	}

	RtlZeroMemory(fd_slot, sizeof(fd_slot));
	FUNCTION_EXIT();
	return;
}

static int VALID_FD(int fd)
{
	if (MAX_FD_SLOT > fd)
		return 1;
	else
		return 0;	
}

struct kvm *get_kvm(int fd)
{
	SAFE_ASSERT(VALID_FD(fd));
	SAFE_ASSERT(fd_slot[fd].file->__private_data_type == WINKVM_KVM);
	return (struct kvm*)(fd_slot[fd].file->private_data);
}

struct kvm_vcpu *get_vcpu(int fd)
{
	SAFE_ASSERT(VALID_FD(fd));
	SAFE_ASSERT(fd_slot[fd].file->__private_data_type == WINKVM_VCPU);
	return (struct kvm_vcpu*)(fd_slot[fd].file->private_data);
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
	SAFE_ASSERT(fp);
	RtlZeroMemory(fp, sizeof(struct file));
	FUNCTION_EXIT();
	return fp;
}

struct inode* _cdecl new_inode(void)
{
	struct inode *i = NULL;
	FUNCTION_ENTER();
	i = ExAllocatePoolWithTag(NonPagedPool, 
		                      sizeof(struct inode),
							  MEM_TAG);

	SAFE_ASSERT(i);	
	RtlZeroMemory(i, sizeof(struct inode));
	FUNCTION_EXIT();
	return i;
}

int _cdecl get_unused_fd(void)
{
	int new_fd = -1;

	FUNCTION_ENTER();

	ExAcquireFastMutex(&fd_slot_mutex); {
		int i;	   
		for (i = 0 ; i < MAX_FD_SLOT ; i++) {
			if (!fd_slot[i].used) {
				fd_slot[i].used = 1;
				new_fd = i;
				break;
			}
		}
	} ExReleaseFastMutex(&fd_slot_mutex);

	SAFE_ASSERT(new_fd != -1);

	FUNCTION_EXIT();

	return new_fd;
}

void _cdecl fd_install(unsigned int fd, struct file *file)
{	
	SAFE_ASSERT(VALID_FD(fd));
	SAFE_ASSERT(fd_slot[fd].used);

	fd_slot[fd].file = file;
}

void _cdecl fput(struct file *file)
{
	FUNCTION_ENTER();
	atomic_dec_and_test(&file->f_count);
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