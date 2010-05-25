
#include "MapMem.h"
#include "kernel.h"

#define MEM_PHYSICAL 0x400000

/*
 * CreateMapSection
 */
//L"\\BaseNamedObjects\\UserKernelSharedSection"
NTSTATUS 
CreateUserMappingSection(IN SIZE_T shared_size,
						 IN PCWSTR section_name,
						 OUT PVOID *OutBuffer,
						 OUT HANDLE *handler)
{
	LARGE_INTEGER       size;
	UNICODE_STRING      usSectionName;
	OBJECT_ATTRIBUTES   objAttributes;
	NTSTATUS            status;
	HANDLE              g_hSection;
	PVOID               pSharedSection;
	SIZE_T              ViewSize;

	RtlInitUnicodeString(&usSectionName, section_name);
	InitializeObjectAttributes(
		&objAttributes, 
		&usSectionName, 
		OBJ_CASE_INSENSITIVE, 
		NULL, 
		NULL);

	size.HighPart  = 0;
	size.LowPart   = shared_size;	
	g_hSection     = NULL;

	status = ZwCreateSection(
		&g_hSection,
		SECTION_ALL_ACCESS, 
		&objAttributes,
		&size,
		PAGE_READWRITE,
		0x8000000,
		NULL);

	if (!NT_SUCCESS(status)) {
		printk(KERN_ALERT "Could not Create Section: 0x%x\n", status);
		goto error;
	}

	/* for pSharedSection */
	pSharedSection = NULL;
	ViewSize = shared_size;

	status = ZwMapViewOfSection(
		g_hSection,
		NtCurrentProcess(),
		&pSharedSection,
		0,
		ViewSize,
		NULL,
		&ViewSize,
		ViewShare,
		MEM_PHYSICAL,
		PAGE_READWRITE | PAGE_NOCACHE);	

	if (!NT_SUCCESS(status)) {
		printk("Could not Map Section: 0x%x\n", status);
		goto error;
	}

	printk("Pointer: 0x%x\n", pSharedSection);

	/*
	RtlFillMemory(pSharedSection, shared_size, 'a');	
	((char*)pSharedSection)[shared_size - 1] = '\0';
	*/
	*OutBuffer = pSharedSection;

	return STATUS_SUCCESS;

error:
	*OutBuffer = NULL;
	return STATUS_UNSUCCESSFUL;
} /* end CreateMapSection */


/*
 * CloseMapSection
 */
NTSTATUS
CloseUserMappingSection(IN HANDLE handler,
						IN PVOID *OutBuffer)
{
	NTSTATUS status;

	status = ZwUnmapViewOfSection(handler, OutBuffer);
	if (!NT_SUCCESS(status)) {
		printk("Could not Unmap Section: %p 0x%x\n", 
			*OutBuffer, status);
		return STATUS_UNSUCCESSFUL;
	}

	ZwClose(handler);

	return STATUS_SUCCESS;
} /* Close CreateMapSection */
