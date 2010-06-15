
#include "MapMem.h"
#include "kernel.h"

#include <Ntstrsafe.h>

#define MEM_PHYSICAL 0x400000

/*
 * CreateMapSection
 */
//L"\\BaseNamedObjects\\UserKernelSharedSection"
NTSTATUS 
CreateUserMappingSection(IN SIZE_T            npages,
						 IN int               slot,
						 OUT PUNICODE_STRING  section_name,
						 OUT PVOID            *OutBuffer,
						 OUT HANDLE           *handler)
{
	LARGE_INTEGER       size;
	OBJECT_ATTRIBUTES   objAttributes;
	NTSTATUS            status;
	HANDLE              g_hSection;
	PVOID               pSharedSection;
	SIZE_T              ViewSize;

	/* Form section name */	
	RtlInitUnicodeString(section_name, L"\\BaseNamedObjects\\UserKernelSharedSection");
	status = RtlUnicodeStringPrintf(section_name, SECTION_BASENAME, slot);
	if (!NT_SUCCESS(status)) {
		printk(KERN_ALERT "Could not Create %s Section: 0x%x\n", 
			section_name,
			status);
		goto error;
	} else {
		printk(KERN_ALERT "CreateUserMappingSection: %s\n", 
			section_name);
	}

	InitializeObjectAttributes(
		  &objAttributes, 
		  section_name, 
		  OBJ_CASE_INSENSITIVE, 
		  NULL, 
		  NULL);

	size.HighPart  = 0;
	size.LowPart   = npages << PAGE_SHIFT;
	g_hSection     = NULL;

	/* ToDo: セクション名の生成コードを書くこと！ */
	/* OUT PCWSTR section_name */

	status = ZwCreateSection(
		&g_hSection,
		SECTION_ALL_ACCESS, 
		&objAttributes,
		&size,
		PAGE_READWRITE,
		0x8000000,
		NULL);

	if (!NT_SUCCESS(status)) {
		printk(KERN_ALERT "Could not Create %s Section: 0x%x\n", 
			section_name,
			status);
		goto error;
	}

	/* for pSharedSection */
	pSharedSection = NULL;
	ViewSize = npages << PAGE_SHIFT;

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
		printk("Could not %s Map Section: 0x%x\n", 
			section_name,
			status);
		goto error;
	}

	printk("slot [%d] Pointer: 0x%x\n", 
		slot,
		pSharedSection);

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
CloseUserMappingSection(IN HANDLE            handler,
						IN int               slot,
						IN PUNICODE_STRING   section_name,
						IN PVOID             *OutBuffer)
{
	NTSTATUS status;

	status = ZwUnmapViewOfSection(handler, OutBuffer);
	if (!NT_SUCCESS(status)) {
		printk("Could not Unmap Section: %w %p 0x%x\n", 
			section_name, *OutBuffer, status);
		return STATUS_UNSUCCESSFUL;
	}

	ZwClose(handler);

	return STATUS_SUCCESS;
} /* Close CreateMapSection */
