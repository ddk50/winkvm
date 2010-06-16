
/*
 * MapMem.c
 * Get the User-address of a Kernel memory object.
 *
 * Copyright (C) Kazushi Takahashi <kazushi@rvm.jp>, 2010
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


/*
 * Memory mapping routine with MDL
 */
NTSTATUS
CreateUserMappingSectionWithMdl(PMDL     *pMemMdl,
								ULONG    slot,
								SIZE_T   npages,
								PVOID    *userVA)
{
	PMDL               mdl;
	PVOID              userVAToReturn;
	PHYSICAL_ADDRESS   lowAddress;
	PHYSICAL_ADDRESS   highAddress;
	SIZE_T             totalBytes;

	/* initialize the physical addresses need for MmAllocatePagesForMdl */
	lowAddress.QuadPart = 0x0;
	highAddress.QuadPart = 0xFFFFFFFFFFFFFFFFull;
	totalBytes = npages << PAGE_SHIFT;

	/* Allocate a 4K buffer to share with the application */
	mdl = MmAllocatePagesForMdl(
		       lowAddress,
			   highAddress,
			   lowAddress,
			   totalBytes);
	if (!mdl) {
		printk(KERN_ALERT 
			"%s: Could not allocate pages for Mdl\n",
			__FUNCTION__);
		return STATUS_INSUFFICIENT_RESOURCES;
	}

	/* The preferred V5 way to map the buffer into user space */
	userVAToReturn = MmMapLockedPagesSpecifyCache(
		                     mdl,        // MDL
							 UserMode,   // Mode
							 MmCached,   // Caching
							 NULL,       // Address
							 FALSE,      // Bugcheck ?
							 NormalPagePriority); // Priority
	if (!userVAToReturn) {
		MmFreePagesFromMdl(mdl);
		IoFreeMdl(mdl);
		printk(KERN_ALERT 
			"%s: failed to call MmMapLockedPagesSpecifyCache()\n",
			__FUNCTION__);
		return STATUS_INSUFFICIENT_RESOURCES;
	}

	*userVA  = userVAToReturn;
	*pMemMdl = mdl;

	printk(KERN_ALERT "%s: mapping UserVA = 0x%0x\n", 
		userVAToReturn);

	return STATUS_SUCCESS;		 
}


/*
 * This routine frees and unmaps the memory that we shared between a 
 * process and our driver.
 */
void
UnMapAndFreeMemory(PMDL  pMdl,
				   PVOID userVA)
{
	if (!pMdl) {
		printk(KERN_ALERT "%s: invalid PMdl",
			__FUNCTION__);
		return;
	}

	/* Unmap the pages */
	MmUnmapLockedPages(userVA, pMdl);

	/* Free the pages from the MDL */
	MmFreePagesFromMdl(pMdl);

	/* Release the MDL. */
	IoFreeMdl(pMdl);

	return;
}