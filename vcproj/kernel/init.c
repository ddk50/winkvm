/*
 * init.c
 * This file has the main routines of WinKVM
 *
 * Copyright (C) Kazushi Takahashi <kazushi@rvm.jp>, 2009 - 2010
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

#include <linux/winkvmint.h>
#include <linux/winkvmgfp.h>
#include <asm-generic/errno.h> /* fix me!! */

#include "slab.h"
#include "smp.h"
#include "init.h"
#include "kernel.h"
#include "kvmdefined.h"
#include "file.h"

#include "MapMem.h"
#include "extension.h"

#include <linux/kvm.h>

PDRIVER_OBJECT DriverObject;

/* this buffer should be take in DriverObject->DriverExtension */
static int current_vcpu = -1;
static FAST_MUTEX writer_mutex;
static FAST_MUTEX reader_mutex;

/* initalizer function table */
static void (*initfunc[])(PWINKVM_DEVICE_EXTENSION) = {
	&init_smp_emulater,
	&init_slab_emulater,
	&init_file_emulater,
};

static void (*releasefunc[])(PWINKVM_DEVICE_EXTENSION) = {
	&release_smp_emulater,
	&release_slab_emulater,
	&release_file_emulater,
};

NTSTATUS 
DriverEntry(IN OUT PDRIVER_OBJECT  DriverObjaect,
			IN PUNICODE_STRING RegistryPath);

NTSTATUS 
__winkvmstab_close(IN PDEVICE_OBJECT DeviceObject,
				   IN PIRP Irp);

void 
__winkvmstab_release(IN PDRIVER_OBJECT DriverObject);

NTSTATUS 
__winkvmstab_create(IN PDEVICE_OBJECT DeviceObject,
					IN PIRP Irp);

NTSTATUS 
__winkvmstab_ioctl(IN PDEVICE_OBJECT DeviceObject,
				   IN PIRP Irp);

NTSTATUS
ConvertRetval(IN int ret);

/* driver entry */
NTSTATUS 
DriverEntry(IN OUT PDRIVER_OBJECT  DriverObject,
			IN PUNICODE_STRING RegistryPath)
{
	PDEVICE_OBJECT             deviceObject = NULL;
	NTSTATUS                   status;
	UNICODE_STRING             NtNameString;
	UNICODE_STRING             Win32NameString;
	PWINKVM_DEVICE_EXTENSION   extension; /* for extension */

	/*	
	  KAFFINITY aps;
	  ULONG cpus = KeQueryActiveProcessorCountCompatible(&aps);
	*/

	printk(KERN_ALERT "Start driver entry!\n");

	RtlInitUnicodeString(&NtNameString, NT_DEVICE_NAME);

	status = IoCreateDevice(
		DriverObject, 
		sizeof(WINKVM_DEVICE_EXTENSION),
		&NtNameString,
		FILE_DEVICE_UNKNOWN,
		0,
		FALSE,
		&deviceObject);

	if (NT_SUCCESS(status)) {
		DriverObject->MajorFunction[IRP_MJ_CREATE]  = __winkvmstab_create;
		DriverObject->MajorFunction[IRP_MJ_CLOSE]   = __winkvmstab_close;
		DriverObject->MajorFunction[IRP_MJ_DEVICE_CONTROL] = __winkvmstab_ioctl;
		DriverObject->DriverUnload = __winkvmstab_release;

		/*
		 * Initalizing Driver extension's
		 */
		extension = (PWINKVM_DEVICE_EXTENSION)deviceObject->DeviceExtension;
		RtlZeroMemory(extension, sizeof(WINKVM_DEVICE_EXTENSION));

		RtlInitUnicodeString(&Win32NameString, DOS_DEVICE_NAME);
		status = IoCreateSymbolicLink(&Win32NameString, &NtNameString);

		if (!NT_SUCCESS(status)) {
			printk(KERN_ALERT "Couldn't create the symbolic link\n");
			IoDeleteDevice(DriverObject->DeviceObject);
		}
	} else {
		IoDeleteDevice(DriverObject->DeviceObject);
		goto err;
	}

	/*
	if (cpus > 1) {
		printk(KERN_ALERT "cpus more than 1\n");
		status = STATUS_INVALID_DEVICE_STATE;
		goto err;
	}
	*/

	ExInitializeFastMutex(&writer_mutex);
	ExInitializeFastMutex(&reader_mutex);

	printk(KERN_ALERT 
		"WinKVM Compiled Date: %s %s\n"
		"All initialized!\n", __DATE__, __TIME__);

	check_function_pointer_test();

    return status;

err:
	printk(KERN_ALERT "Couldn't create the driver\n");
	return status;
}


void 
__winkvmstab_release(IN PDRIVER_OBJECT DriverObject)
{
	PDEVICE_OBJECT             deviceObject = DriverObject->DeviceObject;
	UNICODE_STRING             Win32NameString;
	PWINKVM_DEVICE_EXTENSION   extension;

	FUNCTION_ENTER();
	
	extension = (PWINKVM_DEVICE_EXTENSION)deviceObject->DeviceExtension;

	if (deviceObject != NULL)
		IoDeleteDevice(DriverObject->DeviceObject);

	RtlInitUnicodeString(&Win32NameString, DOS_DEVICE_NAME);
	IoDeleteSymbolicLink(&Win32NameString);

	FUNCTION_EXIT();

    return;
} /* winkvm release */

NTSTATUS 
__winkvmstab_close(IN PDEVICE_OBJECT DeviceObject,
				   IN PIRP Irp)
{
	PWINKVM_DEVICE_EXTENSION extension = DeviceObject->DeviceExtension;
	struct fd_slot *fds;	
	int i;

	FUNCTION_ENTER();

	/* vcpu‚Ækvm‚É‚Í‚»‚ê‚¼‚ê“Æ—§‚µ‚½file‚Æinode‚ª“n‚³‚ê‚é */
	for (i = 0 ; i < MAX_FD_SLOT ; ++i) {
		fds = &extension->fd_slot[i];
		if (fds->used && fds->type == WINKVM_VCPU) {
			fds->file->f_op->release(fds->inode, fds->file);
			RtlZeroMemory(fds, sizeof(struct fd_slot));
		}
	}

	for (i = 0 ; i < MAX_FD_SLOT ; ++i) {
		fds = &extension->fd_slot[i];
		if (fds->used && fds->type == WINKVM_KVM) {
			/* fds->inode is NULL */
			/* fds->file has the value that seems correct */
			fds->file->f_op->release(fds->inode, fds->file); 
			RtlZeroMemory(fds, sizeof(struct fd_slot));
		}
	}

	/* currently, only support Intel VT-x only */
	vmx_exit();

	for (i = 0 ; i < sizeof(releasefunc) / sizeof(*releasefunc) ; i++)
		releasefunc[i](extension);

	Irp->IoStatus.Status = STATUS_SUCCESS;
	Irp->IoStatus.Information = 0;

	IoCompleteRequest(Irp, IO_NO_INCREMENT);

	FUNCTION_EXIT();

	return STATUS_SUCCESS;
} /* winkvm close */

NTSTATUS 
__winkvmstab_create(IN PDEVICE_OBJECT DeviceObject,
					IN PIRP Irp)
{
	PWINKVM_DEVICE_EXTENSION extension = DeviceObject->DeviceExtension;
	int i;

	FUNCTION_ENTER();

	for (i = 0 ; i < sizeof(initfunc) / sizeof(*initfunc) ; i++)
		initfunc[i](extension);

	/* currently, only support Intel VT-x only */
	vmx_init();

	Irp->IoStatus.Status = STATUS_SUCCESS;
	Irp->IoStatus.Information = 0;

	IoCompleteRequest(Irp, IO_NO_INCREMENT);

	FUNCTION_EXIT();

	return STATUS_SUCCESS;
} /* winkvm create */


NTSTATUS 
__winkvmstab_ioctl(IN PDEVICE_OBJECT DeviceObject,
				   IN PIRP Irp)
{
	NTSTATUS                  ntStatus;
	PIO_STACK_LOCATION        irpSp;
	PCHAR                     inBuf;
	PCHAR                     outBuf;
	ULONG                     inBufLen;
	ULONG                     outBufLen;
	PWINKVM_DEVICE_EXTENSION  extension;

	FUNCTION_ENTER();

    irpSp = IoGetCurrentIrpStackLocation(Irp);

    inBufLen = irpSp->Parameters.DeviceIoControl.InputBufferLength;
    outBufLen = irpSp->Parameters.DeviceIoControl.OutputBufferLength; 

	inBuf = (PCHAR)Irp->AssociatedIrp.SystemBuffer;
	outBuf = (PCHAR)Irp->AssociatedIrp.SystemBuffer;

	extension = DeviceObject->DeviceExtension;
   
	switch (irpSp->Parameters.DeviceIoControl.IoControlCode) {
		/* IOCTL */
		case KVM_GET_API_VERSION:
			{
				function_enter(DBG_IOCTL, "KVM_GET_API_VERSION"); {
					ntStatus = STATUS_SUCCESS;
				} function_exit(DBG_IOCTL, "KVM_GET_API_VERSION");
				break;
			} /* end KVM_GET_API_VERSION */

		case KVM_CREATE_VM:
			{
				int ret;
				function_enter(DBG_IOCTL, "KVM_CREATE_VM"); {
					ret = kvm_dev_ioctl_create_vm();
					RtlCopyMemory(outBuf, &ret, sizeof(ret));			
					Irp->IoStatus.Information = sizeof(ret);	   
					ntStatus = ConvertRetval(ret);
				} function_exit(DBG_IOCTL, "KVM_CREATE_VM");
				break;
			} /* end KVM_CREATE_VM */

		case KVM_GET_MSR_INDEX_LIST:
			{
				struct kvm_msr_list msr_list;
				__u32 *indices;

				function_enter(DBG_IOCTL, "KVM_GET_MSR_INDEX_LIST");
				ntStatus = STATUS_INVALID_DEVICE_REQUEST;
				RtlCopyMemory(&msr_list, inBuf, sizeof(msr_list));
				if (msr_list.nmsrs <= 0) {				
					/* call for getting the number of msrlist size */
					msr_list.nmsrs = num_msrs_to_save + get_emulated_msrs_array_size();
					RtlCopyMemory(outBuf, &msr_list, sizeof(msr_list));
					Irp->IoStatus.Information = sizeof(msr_list);
					ntStatus = STATUS_SUCCESS;
				} else {
					indices = (__u32*)((u8*)outBuf + sizeof(msr_list.nmsrs));
					RtlCopyMemory(indices, &msrs_to_save, num_msrs_to_save * sizeof(u32));
					indices = (__u32*)((u8*)indices + num_msrs_to_save * sizeof(u32));
					RtlCopyMemory(indices, &emulated_msrs, get_emulated_msrs_array_size() * sizeof(u32));
					Irp->IoStatus.Information = sizeof(msr_list.nmsrs) + 
						(num_msrs_to_save * sizeof(u32)) + (get_emulated_msrs_array_size() * sizeof(u32));
					ntStatus = STATUS_SUCCESS;
				}
				function_exit(DBG_IOCTL, "KVM_GET_MSR_INDEX_LIST");
				break;
			} /* end KVM_GET_MSR_INDEX_LIST */

		case KVM_CREATE_VCPU:
			{	
				int ret;
				struct winkvm_create_vcpu vcpu;
				function_enter(DBG_IOCTL, "KVM_CREATE_VCPU");
				RtlCopyMemory(&vcpu, inBuf, sizeof(vcpu));
				{
					ret = kvm_vm_ioctl_create_vcpu(get_kvm(vcpu.vm_fd), vcpu.vcpu_fd);
					/* return vcpu value */
				} RtlCopyMemory(outBuf, &ret, sizeof(ret));
				Irp->IoStatus.Information = sizeof(ret);
				ntStatus = ConvertRetval(ret);
				function_exit(DBG_IOCTL, "KVM_CREATE_VCPU");
				break;
			} /* end KVM_CREATE_VCPU */

		case KVM_SET_MEMORY_REGION:
			{
				struct winkvm_memory_region winkvm_mem;
				struct kvm_memory_region *kvm_mem;
				int ret;

				function_enter(DBG_IOCTL, "KVM_SET_MEMORY_REGION");
				RtlCopyMemory(&winkvm_mem, inBuf, sizeof(winkvm_mem)); 
				{
					kvm_mem = &winkvm_mem.kvm_memory_region;
					ret = kvm_vm_ioctl_set_memory_region(get_kvm(winkvm_mem.vm_fd), kvm_mem);
				} RtlCopyMemory(outBuf, &winkvm_mem, sizeof(winkvm_mem));
				Irp->IoStatus.Information = sizeof(winkvm_mem);
				ntStatus = ConvertRetval(ret);
				function_exit(DBG_IOCTL, "KVM_SET_MEMORY_REGION");

				break;
			} /* end KVM_SET_MEMORY_REGION */

		case KVM_GET_DIRTY_LOG:
			{
				struct kvm_dirty_log log;
				int ret;

				function_enter(DBG_IOCTL, "KVM_GET_DIRTY_LOG");

				RtlCopyMemory(&log, inBuf, sizeof(log));
				{
					ret = kvm_vm_ioctl_get_dirty_log(get_kvm(log.vm_fd), &log);
				} RtlCopyMemory(outBuf, &log, sizeof(log));
				Irp->IoStatus.Information = sizeof(log);
				ntStatus = ConvertRetval(ret);

				function_exit(DBG_IOCTL, "KVM_GET_DIRTY_LOG");
				break;
			} /* end KVM_GET_DIRTY_LOG */

		case KVM_GET_REGS: 
			{
				struct kvm_regs kvm_regs;
				struct kvm_vcpu *vcpu = NULL;
				int vcpu_fd, r;

				function_enter(DBG_IOCTL, "KVM_GET_REGS");
				RtlCopyMemory(&vcpu_fd, inBuf, sizeof(vcpu_fd));
				vcpu = get_vcpu(vcpu_fd);
				if (!vcpu) {
					ntStatus = STATUS_INVALID_DEVICE_REQUEST;
					Irp->IoStatus.Information = 0;
					break;
				}
				r = kvm_vcpu_ioctl_get_regs(get_vcpu(vcpu_fd), &kvm_regs);
				RtlCopyMemory(outBuf, &kvm_regs, sizeof(struct kvm_regs));
				Irp->IoStatus.Information = sizeof(struct kvm_regs);
				ntStatus = ConvertRetval(r);
				function_exit(DBG_IOCTL, "KVM_GET_REGS");
				break;
			} /* end KVM_GET_REGS */

		case KVM_SET_REGS: 
			{
				struct kvm_regs kvm_regs;
				struct kvm_vcpu *vcpu = NULL;
				int r;

				function_enter(DBG_IOCTL, "KVM_SET_REGS");
				RtlCopyMemory(&kvm_regs, inBuf, sizeof(kvm_regs));
				vcpu = get_vcpu(kvm_regs.vcpu_fd);
				if (!vcpu) {
					ntStatus = STATUS_INVALID_DEVICE_REQUEST;
					Irp->IoStatus.Information = 0;
					break;
				}
				r = kvm_vcpu_ioctl_set_regs(vcpu, &kvm_regs);
				Irp->IoStatus.Information = 0;
				ntStatus = ConvertRetval(r);
				function_exit(DBG_IOCTL, "KVM_SET_REGS");
				break;
			} /* end KVM_SET_REGS */

		case KVM_GET_SREGS:
			{
				struct kvm_sregs kvm_sregs;
				struct kvm_vcpu *vcpu = NULL;
				int vcpu_fd;
				int r;

				function_enter(DBG_IOCTL, "KVM_GET_SegREGS");
				RtlCopyMemory(&vcpu_fd, inBuf, sizeof(vcpu_fd));			

				vcpu = get_vcpu(vcpu_fd);
				if (!vcpu) {
					ntStatus = STATUS_INVALID_DEVICE_REQUEST;
					Irp->IoStatus.Information = 0;
					function_exit(DBG_IOCTL, "KVM_GET_SegREGS");
					break;
				}

				r = kvm_vcpu_ioctl_get_sregs(vcpu, &kvm_sregs);			
				Irp->IoStatus.Information = sizeof(kvm_sregs);
				RtlCopyMemory(outBuf, &kvm_sregs, sizeof(kvm_sregs));
				ntStatus = ConvertRetval(r);
				function_exit(DBG_IOCTL, "KVM_GET_SegREGS");
				break;
			} /* end KVM_GET_SREGS */

		case KVM_SET_SREGS:
			{
				struct kvm_sregs kvm_sregs;
				struct kvm_vcpu *vcpu = NULL;
				int r;

				function_enter(DBG_IOCTL, "KVM_SET_SegREGS");
				RtlCopyMemory(&kvm_sregs, inBuf, sizeof(kvm_sregs));
				{
					vcpu = get_vcpu(kvm_sregs.vcpu_fd);
					if (!vcpu) {
						ntStatus = STATUS_INVALID_DEVICE_REQUEST;
						Irp->IoStatus.Information = 0;
						function_exit(DBG_IOCTL, "KVM_SET_SegREGS");
						break;
					}
					r = kvm_vcpu_ioctl_set_sregs(vcpu, &kvm_sregs);
				};
				Irp->IoStatus.Information = 0;
				ntStatus = ConvertRetval(r);
				function_exit(DBG_IOCTL, "KVM_SET_SegREGS");
				break;
			} /* end KVM_SET_SREGS */

		case KVM_TRANSLATE:
			{
				struct kvm_translation tr;
				struct kvm_vcpu *vcpu = NULL;
				int r;

				function_enter(DBG_IOCTL, "KVM_TRANSLATE");
				RtlCopyMemory(&tr, inBuf, sizeof(tr));
				{
					vcpu = get_vcpu(tr.vcpu_fd);
					if (!vcpu) {
						ntStatus = STATUS_INVALID_DEVICE_REQUEST;
						Irp->IoStatus.Information = 0;
						function_exit(DBG_IOCTL, "KVM_TRANSLATE");
						break;
					}
					r = kvm_vcpu_ioctl_translate(vcpu, &tr);

					Irp->IoStatus.Information = sizeof(tr);
				} RtlCopyMemory(outBuf, &tr, sizeof(tr));
				ntStatus = ConvertRetval(r);
				function_exit(DBG_IOCTL, "KVM_TRANSLATE");
				break;
			} /* end KVM_TRANSLATE */

		case KVM_INTERRUPT: 
			{
				struct kvm_interrupt irq;
				struct kvm_vcpu *vcpu = NULL;
				int r = 0;

				function_enter(DBG_IOCTL, "KVM_TRANSLATE");
				RtlCopyMemory(&irq, inBuf, sizeof(irq));

				vcpu = get_vcpu(irq.vcpu_fd);
				if (vcpu) {
					r = kvm_vcpu_ioctl_interrupt(vcpu, &irq);
					Irp->IoStatus.Information = 0;
					ntStatus = ConvertRetval(r);
				} else {
					Irp->IoStatus.Information = 0;
					ntStatus = STATUS_INVALID_DEVICE_REQUEST;
				}
				function_exit(DBG_IOCTL, "KVM_TRANSLATE");
				break;
			} /* end KVM_INTERRUPT */

		case KVM_GET_MSRS:
			{
				function_enter(DBG_IOCTL, "KVM_GET_MSRS");
				function_exit(DBG_IOCTL, "KVM_GET_MSRS");
				break;
			} /* end KVM_GET_MSRS */

		case KVM_SET_MSRS:
			{
				int r;
				struct kvm_msrs *umsrs = (struct kvm_msrs*)outBuf;
				function_enter(DBG_IOCTL, "KVM_SET_MSRS");
				r = msr_io(get_vcpu(umsrs->vcpu_fd), umsrs, do_set_msr, 0);
				Irp->IoStatus.Information = 0;
				ntStatus = ConvertRetval(r);				
				function_exit(DBG_IOCTL, "KVM_SET_MSRS");
				break;
			} /* end KVM_SET_MSRS */

		case KVM_RUN:
			{		
				unsigned int resultvar;
				struct kvm_run kvm_run;
				struct kvm_vcpu *vcpu;

				function_enter(DBG_IOCTL, "KVM_RUN");
				RtlCopyMemory(&kvm_run, inBuf, sizeof(kvm_run));
				kvm_run._errno = 0;

				vcpu = get_vcpu(kvm_run.vcpu_fd);
				SAFE_ASSERT(vcpu);

				if (vcpu) {
					resultvar = kvm_vcpu_ioctl_run(vcpu, &kvm_run);
					if (INTERNAL_SYSCALL_ERROR_P(resultvar, )) {
						kvm_run._errno = INTERNAL_SYSCALL_ERRNO(resultvar, );
						resultvar = 0xffffffff;
					} 
					kvm_run.ioctl_r = (int)resultvar;
					RtlCopyMemory(outBuf, &kvm_run, sizeof(kvm_run));
					Irp->IoStatus.Information = sizeof(kvm_run);
					ntStatus = STATUS_SUCCESS;
				} else {
					Irp->IoStatus.Information = 0;
					ntStatus = STATUS_INVALID_DEVICE_REQUEST;
				}
				function_exit(DBG_IOCTL, "KVM_RUN");
				break;
			} /* end KVM_RUN */

			/* Specific ioctl handlers for WinKVM as follow: */
		case WINKVM_READ_GUEST:
			{
				struct winkvm_transfer_mem trans_mem;
				struct kvm_vcpu *vcpu;
				int ret;

				function_enter(DBG_IOCTL, "WINKVM_READ_GUEST");

				ExAcquireFastMutex(&reader_mutex);

				RtlCopyMemory(&trans_mem, inBuf, sizeof(trans_mem));
				vcpu = get_vcpu(trans_mem.vcpu_fd);
				SAFE_ASSERT(vcpu);

				if (vcpu) {
					ret = kvm_read_guest(vcpu, trans_mem.gva, trans_mem.size, outBuf);
					ntStatus = ConvertRetval(ret);
					Irp->IoStatus.Information = ret;
				} else {
					Irp->IoStatus.Information = 0;
					ntStatus = STATUS_INVALID_DEVICE_REQUEST;
				}

				ExReleaseFastMutex(&reader_mutex);

				function_exit(DBG_IOCTL, "WINKVM_READ_GUEST");
				break;
			} /* end WINKVM_READ_GUEST */

		case WINKVM_WRITE_GUEST:
			{
				struct winkvm_transfer_mem *trans_mem;
				struct kvm_vcpu *vcpu;
				int ret;

				function_enter(DBG_IOCTL, "WINKVM_WRITE_GUEST");

				ExAcquireFastMutex(&writer_mutex);

				trans_mem = (struct winkvm_transfer_mem*)inBuf;
				vcpu = get_vcpu(trans_mem->vcpu_fd);

				SAFE_ASSERT(inBufLen == 
					(trans_mem->size + sizeof(struct winkvm_transfer_mem)));

				if (vcpu) {
					ret = kvm_write_guest(vcpu, trans_mem->gva, 
						trans_mem->size, trans_mem->payload);
					RtlCopyMemory(outBuf, &ret, sizeof(ret));
					Irp->IoStatus.Information = sizeof(ret);
					ntStatus = ConvertRetval(ret);
				} else {
					Irp->IoStatus.Information = 0;
					ntStatus = STATUS_INVALID_DEVICE_REQUEST;
				}

				ExReleaseFastMutex(&writer_mutex);

				function_exit(DBG_IOCTL, "WINKVM_WRITE_GUEST");

				break;
			} /* end WINKVM_WRITE_GUEST */

		case WINKVM_MAPMEM_INITIALIZE:
			{
				struct winkvm_mapmem_initialize init;
				MAPMEM *mapMemInfo;

				function_enter(DBG_IOCTL, "WINKVM_MAPMEM_INITIALIZE");

				RtlCopyMemory(&init, inBuf, sizeof(init)); 
				{
					if (init.slot >= MAX_MEMMAP_SLOT) {
						ntStatus = STATUS_UNSUCCESSFUL;
						function_exit(DBG_IOCTL, "WINKVM_MAPMEM_INITIALIZE");
						break;
					}

					mapMemInfo = &extension->mapMemInfo[init.slot];
					if (mapMemInfo->npages > 0) {
						printk(KERN_ALERT 
							"%d slot has been already mapped memory region\n"
							"So, try to free memory mapping region\n",
							init.slot);
						CloseUserMapping(mapMemInfo->npages, init.slot, mapMemInfo);						
					}

					ntStatus = CreateUserMapping(init.npages, init.slot, mapMemInfo);
					if (!NT_SUCCESS(ntStatus)) {
						init.mapUserVA       = NULL;
						init.npages          = 0;
						mapMemInfo->npages   = 0;
						mapMemInfo->base_gfn = 0;
					} else {
						init.mapUserVA       = (__u8*)mapMemInfo->userVAaddress;
						mapMemInfo->npages   = init.npages;
						mapMemInfo->base_gfn = init.base_gfn;
						printk(KERN_ALERT 
							"slot [%d] memory mapping: 0x%x (PN) ... 0x%x (PN) (%d [pages])\n", 
							init.slot,
							mapMemInfo->base_gfn,
							mapMemInfo->base_gfn + mapMemInfo->npages,
							mapMemInfo->npages);
					}
				} RtlCopyMemory(outBuf, &init, sizeof(init));

				Irp->IoStatus.Information = sizeof(init);
				function_exit(DBG_IOCTL, "WINKVM_MAPMEM_INITIALIZE");
				break;
			} /* end WINKVM_MAPMEM_INITIALIZE */

		case WINKVM_MAPMEM_RELEASE:
			{
				struct winkvm_getpvmap  pvmap;

				function_enter(DBG_IOCTL, "WINKVM_MAPMEM_RELEASE");

				RtlCopyMemory(&pvmap, inBuf, sizeof(pvmap)); {
					if (pvmap.slot >= MAX_MEMMAP_SLOT) {
						ntStatus = STATUS_UNSUCCESSFUL;
						function_exit(DBG_IOCTL, "WINKVM_MAPMEM_RELEASE");
						break;
					}
					CloseUserMapping(
						extension->mapMemInfo[pvmap.slot].npages,
						pvmap.slot,
						&extension->mapMemInfo[pvmap.slot]);
				} RtlCopyMemory(outBuf, &pvmap, sizeof(pvmap));
				Irp->IoStatus.Information = sizeof(pvmap);

				ntStatus = STATUS_SUCCESS;
				function_exit(DBG_IOCTL, "WINKVM_MAPMEM_RELEASE");
				break;
			} /* end WINKVM_MAPMEM_RELEASE */

		default:
			ntStatus = STATUS_UNSUCCESSFUL;
			printk(KERN_ALERT "ERROR: unreconginzed IOCTL: %x\n", 
				irpSp->Parameters.DeviceIoControl.IoControlCode);
			break;
	}

	// We're done with I/O request.  Record the status of the I/O action.
	Irp->IoStatus.Status = ntStatus;
	
	// Don't boost priority when returning since this took little time.
	IoCompleteRequest(Irp, IO_NO_INCREMENT);

	FUNCTION_EXIT();

	return ntStatus;
}

NTSTATUS 
ConvertRetval(IN int ret)
{
	NTSTATUS ntStatus;

	if (ret < 0) {
		ntStatus = STATUS_INVALID_DEVICE_REQUEST;
	} else {
		ntStatus = STATUS_SUCCESS;
	}

	return ntStatus;
}

/* trampline */
__declspec( naked ) 
void _cdecl kvm_vmx_fake_return(void)
{
	__asm {
		pushfd
		pushad
	};

	printk("VM-exit\n");

	__asm {
		popad
		popfd
	};
}
