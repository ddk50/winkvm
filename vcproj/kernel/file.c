/*
 * file.c
 * This file has the main routines of WinKVM
 *
 * Copyright (C) Kazushi Takahashi <kazushi@rvm.jp>, 2009
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#include <linux/winkvm.h>

#include "extension.h"
#include "init.h"
#include "kernel.h"
#include "file.h"

/* ToDo: use extern value */
static PWINKVM_DEVICE_EXTENSION extension = NULL;

static int VALID_FD(int fd);

void
__INIT(init_file_emulater(IN WINKVM_DEVICE_EXTENSION *extn))
{
	int i;
	FUNCTION_ENTER();

	RtlZeroMemory(&extn->inode_slot, sizeof(extn->inode_slot));
	RtlZeroMemory(&extn->file_slot, sizeof(extn->file_slot));
	RtlZeroMemory(&extn->fd_slot, sizeof(extn->fd_slot));

	for (i = 0 ; i < MAX_INODE_SLOT ; i++)
		extn->inode_slot[i].inode.__slot_number = -1;

	for (i = 0 ; i < MAX_FILE_SLOT ; i++) 
		extn->file_slot[i].file.__slot_number = -1;

	ExInitializeFastMutex(&extn->fd_slot_mutex);
	extension = extn;
	FUNCTION_EXIT();
}

void 
__RELEASE(release_file_emulater(IN WINKVM_DEVICE_EXTENSION *extn))
{
	int i;
	FUNCTION_ENTER();

	RtlZeroMemory(&extn->inode_slot, sizeof(extn->inode_slot));
	RtlZeroMemory(&extn->file_slot, sizeof(extn->file_slot));
	RtlZeroMemory(&extn->fd_slot, sizeof(extn->fd_slot));

	for (i = 0 ; i < MAX_INODE_SLOT ; i++)
		extn->inode_slot[i].inode.__slot_number = -1;

	for (i = 0 ; i < MAX_FILE_SLOT ; i++) 
		extn->file_slot[i].file.__slot_number = -1;

	extension = NULL;
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
	SAFE_ASSERT(extension->fd_slot[fd].file->__private_data_type == WINKVM_KVM);
	return (struct kvm*)(extension->fd_slot[fd].file->private_data);
}

struct kvm_vcpu *get_vcpu(int fd)
{
	SAFE_ASSERT(VALID_FD(fd));
	SAFE_ASSERT(extension->fd_slot[fd].file->__private_data_type == WINKVM_VCPU);
	return (struct kvm_vcpu*)(extension->fd_slot[fd].file->private_data);
}

/* FIXME: These methods are corrupt, if caller use 
   the methods 2 times and above!!! */
struct file* _cdecl get_empty_filp(void)
{
	struct file *fp = NULL;
	int i;

	FUNCTION_ENTER();

	ExAcquireFastMutex(&extension->fd_slot_mutex); 
	{
		for (i = 0 ; i < MAX_FILE_SLOT ; i++) {
			if (!extension->file_slot[i].used) {
				fp = &extension->file_slot[i].file;
				extension->file_slot[i].used = 1;
				extension->file_slot[i].file.__slot_number = i;
				break;
			}
		}
	} ExReleaseFastMutex(&extension->fd_slot_mutex);

	SAFE_ASSERT(fp != NULL);
	FUNCTION_EXIT();
	return fp;
}

struct inode* _cdecl new_inode(void)
{
	struct inode *ip = NULL;
	int i;

	FUNCTION_ENTER();

	ExAcquireFastMutex(&extension->fd_slot_mutex); 
	{
		for (i = 0 ; i < MAX_INODE_SLOT ; i++) {
			if (!extension->inode_slot[i].used) {
				ip = &extension->inode_slot[i].inode;
				extension->inode_slot[i].used = 1;
				extension->inode_slot[i].inode.__slot_number = i;
				break;
			}
		}
	} ExReleaseFastMutex(&extension->fd_slot_mutex);

	SAFE_ASSERT(ip != NULL);	
	FUNCTION_EXIT();
	return ip;
}

int _cdecl get_unused_fd(void)
{
	int new_fd = -1;
	int i;

	FUNCTION_ENTER();

	ExAcquireFastMutex(&extension->fd_slot_mutex); 
	{
		for (i = 0 ; i < MAX_FD_SLOT ; i++) {
			if (!extension->fd_slot[i].used) {
				extension->fd_slot[i].used = 1;
				new_fd = i;
				printk(KERN_ALERT "new fd was allocated: %d\n", new_fd);
				break;
			}
		}
	} ExReleaseFastMutex(&extension->fd_slot_mutex);

	SAFE_ASSERT(new_fd != -1);
	FUNCTION_EXIT();

	return new_fd;
}

void _cdecl fd_install(int fd, struct file *file, enum private_data_type type)
{	
	SAFE_ASSERT(VALID_FD(fd));
	SAFE_ASSERT(extension->fd_slot[fd].used != 0);
	extension->fd_slot[fd].file = file;
	extension->fd_slot[fd].type = type;
}

void _cdecl fput(struct file *file)
{	
	FUNCTION_ENTER();	
	SAFE_ASSERT(file->__slot_number != -1);

	ExAcquireFastMutex(&extension->fd_slot_mutex); 
	{
		extension->file_slot[file->__slot_number].used = 0;
//		RtlZeroMemory(file, sizeof(struct file));
//		file->__slot_number = -1;
		atomic_dec_and_test(&file->f_count);
	} ExReleaseFastMutex(&extension->fd_slot_mutex);

	FUNCTION_EXIT();
	return;
}

void _cdecl iput(struct inode *inode)
{
	FUNCTION_ENTER();
	SAFE_ASSERT(inode->__slot_number != -1);

	ExAcquireFastMutex(&extension->fd_slot_mutex); 
	{
		extension->inode_slot[inode->__slot_number].used = 0;		
//		RtlZeroMemory(inode, sizeof(struct inode));
//		inode->__slot_number = -1;
		atomic_dec_and_test(&inode->i_count);
	} ExReleaseFastMutex(&extension->fd_slot_mutex);

	SAFE_ASSERT(0);
	FUNCTION_EXIT();
	return;
}