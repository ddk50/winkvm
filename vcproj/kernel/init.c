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
#include "file.h"

#include <linux/kvm.h>

PDRIVER_OBJECT DriverObject;

static void *maptest_page = NULL;

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
__winkvmstab_execute_guestcode(IN PDEVICE_OBJECT DeviceObject,							   
							   IN PIRP Irp,							   
							   IN struct kvm_vcpu *vcpu);

NTSTATUS 
MapPageToUser(IN PDEVICE_OBJECT DeviceObject,
			  IN PVOID UserSpaceAddress,
			  IN PVOID KernelSpaceAddress);

NTSTATUS 
ConvertRetval(IN int ret);

/* driver entry */
NTSTATUS 
DriverEntry(IN OUT PDRIVER_OBJECT  DriverObject,
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
	init_file_emulater();

	printk(KERN_ALERT "All initialized!\n");
	printk("call vmx_init()\n");

	check_function_pointer_test();
	vmx_init();   

    return status;

err:
	printk(KERN_ALERT "Couldn't create the driver\n");
	return status;
}

/* winkvm release */
void 
__winkvmstab_release(IN PDRIVER_OBJECT DriverObject)
{
	PDEVICE_OBJECT deviceObject = DriverObject->DeviceObject;
	UNICODE_STRING Win32NameString;

	FUNCTION_ENTER();

	vmx_exit();

	RtlInitUnicodeString(&Win32NameString, DOS_DEVICE_NAME);
	IoDeleteSymbolicLink(&Win32NameString);

	if (deviceObject != NULL) {
		IoDeleteDevice(DriverObject->DeviceObject);
	}

	release_smp_emulater();
	release_slab_emulater();
	release_file_emulater();

	FUNCTION_EXIT();

    return;
}

NTSTATUS 
__winkvmstab_close(IN PDEVICE_OBJECT DeviceObject,
				   IN PIRP Irp)
{
	FUNCTION_ENTER();

	Irp->IoStatus.Status = STATUS_SUCCESS;
	Irp->IoStatus.Information = 0;

	IoCompleteRequest(Irp, IO_NO_INCREMENT);

	FUNCTION_EXIT();

	return STATUS_SUCCESS;
}

NTSTATUS 
__winkvmstab_create(IN PDEVICE_OBJECT DeviceObject,
					IN PIRP Irp)
{
	FUNCTION_ENTER();

	Irp->IoStatus.Status = STATUS_SUCCESS;
	Irp->IoStatus.Information = 0;

//	Irp->AssociatedIrp.SystemBuffer = NULL;

	IoCompleteRequest(Irp, IO_NO_INCREMENT);

	FUNCTION_EXIT();

	return STATUS_SUCCESS;
}

#define MAX_PATH        256
#define GUEST_IMG_PATH  L"\\DosDevices\\C:\\bootstrap.bin"
#define GUEST_IMG_SIZE  65536

NTSTATUS
__winkvmstab_execute_guestcode(IN PDEVICE_OBJECT DeviceObject,
							   IN PIRP Irp,
							   IN struct kvm_vcpu *vcpu)
{
	OBJECT_ATTRIBUTES objAttr;
	IO_STATUS_BLOCK   ioStatusBlock;
	UNICODE_STRING    uniStr;
	HANDLE            fHandle;
	LARGE_INTEGER     byteOffset;
	unsigned char     *buf;
	int               copied;
	int               r;
	NTSTATUS          ret = STATUS_INVALID_DEVICE_REQUEST;
	struct kvm_run    kvm_run;

	FUNCTION_ENTER();

	buf = ExAllocatePoolWithTag(NonPagedPool, GUEST_IMG_SIZE, MEM_TAG);
	SAFE_ASSERT(buf);
	if (!buf)
		goto ret;

	RtlInitUnicodeString(&uniStr, GUEST_IMG_PATH);
	InitializeObjectAttributes(&objAttr, &uniStr,
							   OBJ_CASE_INSENSITIVE | OBJ_KERNEL_HANDLE, NULL, NULL);	

	printk(KERN_ALERT "Try to open file ... \n");
	
	SAFE_ASSERT(KeGetCurrentIrql() == PASSIVE_LEVEL);
	
	ret = ZwOpenFile(&fHandle,
		             GENERIC_READ,
					 &objAttr,
					 &ioStatusBlock,
					 0,
					 FILE_NON_DIRECTORY_FILE);	

	if (!NT_SUCCESS(ret)) {
		printk(KERN_ALERT " Could not open test binary file\n");
		goto free_ret;
	}
	printk(KERN_ALERT "Done\n");

	printk(KERN_ALERT "Read Guest Image ... \n");
	byteOffset.u.HighPart = byteOffset.u.LowPart = 0;	
	ret = ZwReadFile(fHandle, 
		             NULL, 
					 NULL, 
					 NULL, 
					 &ioStatusBlock, 
		             buf, 
					 GUEST_IMG_SIZE, 
					 &byteOffset, 
					 NULL);

	if (!NT_SUCCESS(ret)){
		printk(KERN_ALERT " Could not read test binary\n");
		goto close_free_ret;
	}

	printk(KERN_ALERT " Read bytes: High: %d, Low: %d\n", 
		               byteOffset.u.HighPart,		   
					   byteOffset.u.LowPart);

	printk(KERN_ALERT "Done\n");	
	
	printk(KERN_ALERT "Write to guest ... \n");	
	copied = kvm_write_guest(vcpu, 0xf0000, GUEST_IMG_SIZE, buf);	
	printk(KERN_ALERT "Done copied: %d\n", copied);	

	RtlZeroMemory(buf, GUEST_IMG_SIZE);
	kvm_read_guest(vcpu, 0xf0000, GUEST_IMG_SIZE, buf);	

	printk(KERN_ALERT "Read to run!!\n");
	RtlZeroMemory(&kvm_run, sizeof(kvm_run));

	printk(KERN_ALERT "Run!!\n");
	r = kvm_vcpu_ioctl_run(vcpu, &kvm_run);
	if (r < 0) {
		printk(KERN_ALERT "kvm_vcpu_ioctl_run was failed!!\n");
	} else {	  
		printk(KERN_ALERT "kvm_vcpu_ioctl_run was success!!\n");
	}

close_free_ret:
	ZwClose(fHandle);	

free_ret:
	ExFreePoolWithTag(buf, MEM_TAG);

ret:
	FUNCTION_EXIT();
	return ret;
}

NTSTATUS 
__winkvmstab_ioctl(IN PDEVICE_OBJECT DeviceObject,
				   IN PIRP Irp)
{
	NTSTATUS ntStatus;
	PIO_STACK_LOCATION irpSp;
	PCHAR inBuf, outBuf;
	ULONG inBufLen, outBufLen;
	unsigned long vaddr;	

	FUNCTION_ENTER();

    irpSp = IoGetCurrentIrpStackLocation(Irp);

    inBufLen = irpSp->Parameters.DeviceIoControl.InputBufferLength;
    outBufLen = irpSp->Parameters.DeviceIoControl.OutputBufferLength; 

	inBuf = (PCHAR)Irp->AssociatedIrp.SystemBuffer;
	outBuf = (PCHAR)Irp->AssociatedIrp.SystemBuffer;
   
	switch (irpSp->Parameters.DeviceIoControl.IoControlCode) {
	case KVM_GET_API_VERSION:
		{
			printk(KERN_ALERT "Call KVM_GET_API_VERSION\n");
			ntStatus = STATUS_SUCCESS;
			break;
		}
	case KVM_CREATE_VM: 
		{
			int ret;
			printk(KERN_ALERT "Call KVM_CREATE_VM\n");
			ret = kvm_dev_ioctl_create_vm();
			RtlCopyMemory(outBuf, &ret, sizeof(ret));			
			Irp->IoStatus.Information = sizeof(ret);	   
			ntStatus = ConvertRetval(ret);
			break;
		}		
	case KVM_CREATE_VCPU:
		{	
			int ret;
			struct winkvm_create_vcpu vcpu;
			printk(KERN_ALERT "Call KVM_CREATE_VCPU\n");
			RtlCopyMemory(&vcpu, inBuf, sizeof(vcpu));
			ret = kvm_vm_ioctl_create_vcpu(get_kvm(vcpu.vm_fd), vcpu.vcpu_num);

			/* return vcpu value */
			RtlCopyMemory(outBuf, &ret, sizeof(ret));
			Irp->IoStatus.Information = sizeof(ret);
			ntStatus = ConvertRetval(ret);
			break;
		}
	case KVM_SET_MEMORY_REGION:
		{
			struct winkvm_memory_region winkvm_mem;
			struct kvm_memory_region *kvm_mem;
			int ret;

			printk(KERN_ALERT "Call KVM_SET_MEMORY_REGION\n");
			RtlCopyMemory(&winkvm_mem, inBuf, sizeof(winkvm_mem));

			kvm_mem = &winkvm_mem.kvm_memory_region;

			printk(KERN_ALERT "VM_FD : 0x%08x\n", winkvm_mem.vm_fd);
			printk(KERN_ALERT "MEMORY REGION (flag) : 0x%08x\n", kvm_mem->flags);
			printk(KERN_ALERT "MEMORY REGION (memory_size) : %d\n", kvm_mem->memory_size);		   
			printk(KERN_ALERT "MEMORY REGION (slot) : %d\n", kvm_mem->slot);
			printk(KERN_ALERT "MEMORY REGION (guest_phys_addr) : 0x%08lx\n", kvm_mem->guest_phys_addr);

			ret = kvm_vm_ioctl_set_memory_region(get_kvm(winkvm_mem.vm_fd), kvm_mem);

			RtlCopyMemory(outBuf, &winkvm_mem, sizeof(winkvm_mem));
			Irp->IoStatus.Information = sizeof(winkvm_mem);
			ntStatus = ConvertRetval(ret);
			break;
		}
	case WINKVM_EXECUTE_TEST:
		{
			struct kvm_vcpu *vcpu;
			int vcpu_fd;

			printk(KERN_ALERT "Call WINKVM_EXECUTE_TEST\n");
			RtlCopyMemory(&vcpu_fd, inBuf, sizeof(vcpu_fd));
			vcpu = get_vcpu(vcpu_fd);
			SAFE_ASSERT(vcpu != NULL);
			if (vcpu) {
				ntStatus = __winkvmstab_execute_guestcode(DeviceObject, Irp, vcpu);
			} else {
				ntStatus = STATUS_INVALID_DEVICE_REQUEST;
			}
			
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

	FUNCTION_EXIT();

	return ntStatus;
}

/*
NTSTATUS __winkvmstab_read(IN PDEVICE_OBJECT DeviceObject,
						   IN PIRP Irp)
{
	PIO_STACK_LOCATION irpSp;
	PVOID SystemAddress;
	kvm_vcpu *test

	irpSp = IoGetCurrentIrpStackLocation(Irp);

	SystemAddress = (PVOID)MmGetSystemAddressForMdl(Irp->MdlAddress);
	Irp->IoStatus.Information = irpSp->Parameters.Read.Length;
}
*/

NTSTATUS 
MapPageToUser(IN PDEVICE_OBJECT DeviceObject,
			  IN PVOID UserSpaceAddress,
			  IN PVOID KernelSpaceAddress)
{
	NTSTATUS ntStatus = STATUS_INVALID_DEVICE_REQUEST;
	PMDL mdl = NULL;
	PVOID ret = NULL;

	mdl = IoAllocateMdl(KernelSpaceAddress, 
		                PAGE_SIZE, 
						FALSE, 
						FALSE, 
						NULL);

	SAFE_ASSERT(mdl != NULL);
	if (!mdl) {		
		ntStatus = STATUS_INVALID_DEVICE_REQUEST;
		printk(KERN_ALERT "Mapping failed\n");
		goto ret;
	}

	MmInitializeMdl(mdl, KernelSpaceAddress, PAGE_SIZE);	
	MmBuildMdlForNonPagedPool(mdl);
	printk(KERN_ALERT "BuildMdlForNonPage\n");

	ret = MmMapLockedPagesSpecifyCache(mdl,
		                               UserMode, 
		                               MmNonCached, 
									   UserSpaceAddress, 
									   FALSE, 
									   HighPagePriority);

	SAFE_ASSERT(ret == UserSpaceAddress);
	
	printk(KERN_ALERT "Mapping done\n");
ret:
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

/* test trampline */
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
