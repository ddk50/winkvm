
#include <linux/winkvmint.h>
#include <linux/winkvmgfp.h>

#include "slab.h"
#include "smp.h"
#include "init.h"
#include "kernel.h"
#include "test/include/kvm.h"

PDRIVER_OBJECT DriverObject;

NTSTATUS DriverEntry(IN OUT PDRIVER_OBJECT  DriverObject,
					 IN PUNICODE_STRING RegistryPath);

NTSTATUS __winkvmstab_close(IN PDEVICE_OBJECT DeviceObject,
							IN PIRP Irp);

NTSTATUS __winkvmstab_create(IN PDEVICE_OBJECT DeviceObject,
							 IN PIRP Irp);

NTSTATUS __winkvmstab_ioctl(IN PDEVICE_OBJECT DeviceObject,
							IN PIRP Irp);

void __winkvmstab_release(IN PDRIVER_OBJECT DriverObject);

/* start linux device driver */
extern int _cdecl vmx_init(void);
extern void _cdecl vmx_exit(void);
/* end linux device driver */

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
	int r;

	printk("%s\n", __FUNCTION__);

    irpSp = IoGetCurrentIrpStackLocation(Irp);
    inBufLen = irpSp->Parameters.DeviceIoControl.InputBufferLength;
    outBufLen = irpSp->Parameters.DeviceIoControl.OutputBufferLength;
   
	switch (irpSp->Parameters.DeviceIoControl.IoControlCode) {
    case KVM_GET_API_VERSION:
		ntStatus = STATUS_SUCCESS;
		break;

	case KVM_CREATE_VM:
//		r = kvm_vm_ioctl_create_vcpu(
		printk("Called: %d\n", 
			irpSp->Parameters.DeviceIoControl.IoControlCode);
		ntStatus = STATUS_SUCCESS;
		break;

	case KVM_CREATE_VCPU:
//		r = kvm_vm_ioctl_create_vcpu();
		ntStatus = STATUS_SUCCESS;
		break;

	case KVM_SET_USER_MEMORY_REGION:
		ntStatus = STATUS_SUCCESS;
		break;

	case KVM_RUN:
		ntStatus = STATUS_SUCCESS;
		break;

	case KVM_GET_REGS:
		ntStatus = STATUS_SUCCESS;
		break;

	case KVM_SET_REGS:
		ntStatus = STATUS_SUCCESS;
		break;

	case KVM_GET_SREGS:
		ntStatus = STATUS_SUCCESS;
		break;

	case KVM_SET_SREGS:
		ntStatus = STATUS_SUCCESS;
		break;

	case KVM_GET_VCPU_MMAP_SIZE:
		ntStatus = STATUS_SUCCESS;
		break;

	default:
		ntStatus = STATUS_INVALID_DEVICE_REQUEST;
		printk("ERROR: unreconginzed IOCTL: %x\n", 
			irpSp->Parameters.DeviceIoControl.IoControlCode);
		break;
	}

	// We're done with I/O request.  Record the status of the I/O action.
	Irp->IoStatus.Status = ntStatus;
	
	// Don't boost priority when returning since this took little time.
	IoCompleteRequest(Irp, IO_NO_INCREMENT);

	return ntStatus;
}
