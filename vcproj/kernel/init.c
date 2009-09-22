/*
 * init.c
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

#include <linux/winkvmint.h>
#include <linux/winkvmgfp.h>

#include "slab.h"
#include "smp.h"
#include "init.h"
#include "kernel.h"
#include "kvmdefined.h"

#include <linux/kvm.h>

PDRIVER_OBJECT DriverObject;

NTSTATUS DriverEntry(IN OUT PDRIVER_OBJECT  DriverObject,
					 IN PUNICODE_STRING RegistryPath);

NTSTATUS __winkvmstab_close(IN PDEVICE_OBJECT DeviceObject,
							IN PIRP Irp);

NTSTATUS __winkvmstab_create(IN PDEVICE_OBJECT DeviceObject,
							 IN PIRP Irp);

NTSTATUS __winkvmstab_ioctl(IN PDEVICE_OBJECT DeviceObject,
							IN PIRP Irp);

NTSTATUS MapPageToUser(IN PDEVICE_OBJECT DeviceObject,
					   IN PVOID UserSpaceAddress,
					   IN PVOID KernelSpaceAddress);

void __winkvmstab_release(IN PDRIVER_OBJECT DriverObject);
static NTSTATUS CovertRetval(int ret);

static void *maptest_page = NULL;

/* driver entry */
NTSTATUS DriverEntry(IN OUT PDRIVER_OBJECT  DriverObject,
					 IN PUNICODE_STRING RegistryPath)
{
	PDEVICE_OBJECT deviceObject = NULL;
	NTSTATUS status;
	UNICODE_STRING NtNameString;
	UNICODE_STRING Win32NameString;
//	KAFFINITY aps;
//	ULONG cpus = KeQueryActiveProcessorCountCompatible(&aps);

	printk(KERN_ALERT "Start driver entry!\n");

	RtlInitUnicodeString(&NtNameString, NT_DEVICE_NAME);

	status = IoCreateDevice(DriverObject, 
		                    0,
							&NtNameString,
							FILE_DEVICE_UNKNOWN,
							0,
							FALSE,
							&deviceObject);

	if (NT_SUCCESS(status)) {
		DriverObject->MajorFunction[IRP_MJ_CREATE] = __winkvmstab_create;
		DriverObject->MajorFunction[IRP_MJ_CLOSE]  = __winkvmstab_close;
		DriverObject->MajorFunction[IRP_MJ_DEVICE_CONTROL] = __winkvmstab_ioctl;
		DriverObject->DriverUnload = __winkvmstab_release;
		
		RtlInitUnicodeString(&Win32NameString, DOS_DEVICE_NAME);
		status = IoCreateSymbolicLink(&Win32NameString, &NtNameString);
	}


	if (!NT_SUCCESS(status)) {
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

	init_smp_emulater();
	init_slab_emulater();

	printk(KERN_ALERT "All initialized!\n");
	printk("call vmx_init()\n");

	vmx_init();

    return status;

err:
	printk(KERN_ALERT "Couldn't create the driver\n");
	return status;
}

/* winkvm release */
void __winkvmstab_release(IN PDRIVER_OBJECT DriverObject)
{
	PDEVICE_OBJECT deviceObject = DriverObject->DeviceObject;
	UNICODE_STRING Win32NameString;

	printk("call vmx_exit()\n");
	vmx_exit();

	RtlInitUnicodeString(&Win32NameString, DOS_DEVICE_NAME);
	IoDeleteSymbolicLink(&Win32NameString);

	if (deviceObject != NULL) {
		IoDeleteDevice(DriverObject->DeviceObject);
	}

	release_smp_emulater();
	release_slab_emulater();

    return;
}

NTSTATUS __winkvmstab_close(IN PDEVICE_OBJECT DeviceObject,
							IN PIRP Irp)
{
	printk("%s\n", __FUNCTION__);

	Irp->IoStatus.Status = STATUS_SUCCESS;
	Irp->IoStatus.Information = 0;

	IoCompleteRequest(Irp, IO_NO_INCREMENT);

	return STATUS_SUCCESS;
}

NTSTATUS __winkvmstab_create(IN PDEVICE_OBJECT DeviceObject,
							 IN PIRP Irp)
{
	printk("%s\n", __FUNCTION__);

	Irp->IoStatus.Status = STATUS_SUCCESS;
	Irp->IoStatus.Information = 0;

//	Irp->AssociatedIrp.SystemBuffer = NULL;

	IoCompleteRequest(Irp, IO_NO_INCREMENT);

	return STATUS_SUCCESS;
}

NTSTATUS __winkvmstab_ioctl(IN PDEVICE_OBJECT DeviceObject,
							IN PIRP Irp)
{
	NTSTATUS ntStatus;
	PIO_STACK_LOCATION irpSp;
	PCHAR inBuf, outBuf;
	ULONG inBufLen, outBufLen;
	unsigned long vaddr;	

	printk("%s\n", __FUNCTION__);

    irpSp = IoGetCurrentIrpStackLocation(Irp);

    inBufLen = irpSp->Parameters.DeviceIoControl.InputBufferLength;
    outBufLen = irpSp->Parameters.DeviceIoControl.OutputBufferLength; 

	inBuf = (PCHAR)Irp->AssociatedIrp.SystemBuffer;
	outBuf = (PCHAR)Irp->AssociatedIrp.SystemBuffer;
   
	switch (irpSp->Parameters.DeviceIoControl.IoControlCode) {
	case KVM_GET_API_VERSION:
		{
			ntStatus = STATUS_SUCCESS;
			break;
		}

	case KVM_CREATE_VM: 
		{
			int vcpu = 0;
			int ret;
			RtlCopyMemory(&vcpu, inBuf, inBufLen);
			ret = kvm_vm_ioctl_create_vcpu(DeviceObject->DeviceExtension, vcpu);
			ntStatus = CovertRetval(ret);
			break;
		}

	case WINKVM_NOPAGE:
		{
			ntStatus = STATUS_SUCCESS;
			break;
		}

	case WINKVM_INIT_TESTMAP:
		{
			printk(KERN_ALERT "WINKVM_INIT_TESTMAP\n");
			maptest_page = KeGetPageMemory(PAGE_SIZE); /* alloc a page */		
			if (maptest_page == NULL) {
				ntStatus = STATUS_INVALID_DEVICE_REQUEST;
				break;
			}
			printk(KERN_ALERT "TESTMAP PAGE ... 0x%08lx\n", 
				(unsigned long)maptest_page);
			ntStatus = STATUS_SUCCESS;
			break;
		}

	case WINKVM_TESTMAP:
		{
			printk(KERN_ALERT "WINKVM_TESTMAP");
			RtlCopyMemory(&vaddr, inBuf, inBufLen);
			printk(KERN_ALERT "Test Mapping .. 0x%08x\n", vaddr);
			if (maptest_page == NULL) {
				ntStatus = STATUS_INVALID_DEVICE_REQUEST;
				break;
			}
			ntStatus = MapPageToUser(DeviceObject, (PVOID)vaddr, maptest_page);
			break;
		}

	case WINKVM_RELEASE_TESTMAP:
		{
			printk(KERN_ALERT "WINKVM_RELEASE_TESTMAP\n");
			if (maptest_page != NULL) {
				KeFreePageMemory(maptest_page, PAGE_SIZE);
			}
			ntStatus = STATUS_SUCCESS;
			break;
		}

	default:
		ntStatus = STATUS_INVALID_DEVICE_REQUEST;
		printk(KERN_ALERT "ERROR: unreconginzed IOCTL: %x\n", 
			irpSp->Parameters.DeviceIoControl.IoControlCode);
		break;
	}

	// We're done with I/O request.  Record the status of the I/O action.
	Irp->IoStatus.Status = ntStatus;
	
	// Don't boost priority when returning since this took little time.
	IoCompleteRequest(Irp, IO_NO_INCREMENT);

	return ntStatus;
}

NTSTATUS MapPageToUser(IN PDEVICE_OBJECT DeviceObject,
					   IN PVOID UserSpaceAddress,
					   IN PVOID KernelSpaceAddress)
{
	NTSTATUS ntStatus = STATUS_INVALID_DEVICE_REQUEST;
	PMDL mdl = NULL;
	PVOID ret = NULL;

	mdl = IoAllocateMdl(KernelSpaceAddress, PAGE_SIZE, FALSE, FALSE, NULL);
	SAFE_ASSERT(mdl != NULL);
	if (!mdl) {		
		ntStatus = STATUS_INVALID_DEVICE_REQUEST;
		printk(KERN_ALERT "Mapping failed\n");
		goto ret;
	}

	MmInitializeMdl(mdl, KernelSpaceAddress, PAGE_SIZE);	
	MmBuildMdlForNonPagedPool(mdl);
	printk(KERN_ALERT "BuildMdlForNonPage\n");

	ret = MmMapLockedPagesSpecifyCache(mdl, UserMode, 
		                               MmNonCached, UserSpaceAddress, 
									   FALSE, HighPagePriority);
	SAFE_ASSERT(ret == UserSpaceAddress);
	
	printk(KERN_ALERT "Mapping done\n");
ret:
	return ntStatus;
}

static NTSTATUS CovertRetval(int ret)
{
	NTSTATUS ntStatus;

	if (ret < 0) {
		ntStatus = STATUS_INVALID_DEVICE_REQUEST;
	} else {
		ntStatus = STATUS_SUCCESS;
	}

	return ntStatus;
}