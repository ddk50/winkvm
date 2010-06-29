
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
CreateUserMapping(IN SIZE_T npages,
				  IN int    slot,
				  OUT MAPMEM *mapMemInfo)
{
#ifdef USE_MDL
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

	mapMemInfo->userVAaddress = userVAToReturn;
	mapMemInfo->apMdl[0]      = mdl;

	printk(KERN_ALERT "%s: %d [mbytes] mapping UserVA = 0x%0x\n", 
		__FUNCTION__,
		totalBytes / 1024 / 1024,
		userVAToReturn);

	return STATUS_SUCCESS;
#else /* for USE_SECTION */
	LARGE_INTEGER       size;
	OBJECT_ATTRIBUTES   objAttributes;
	NTSTATUS            status;
	HANDLE              g_hSection;
	PVOID               pSharedSection;
	SIZE_T              ViewSize;

	RtlInitUnicodeString(
		mapMemInfo->section_name, 
		L"\\BaseNamedObjects\\UserKernelSharedSection");

	status = RtlUnicodeStringPrintf(
		mapMemInfo->section_name, 
		SECTION_BASENAME, 
		slot);

	if (!NT_SUCCESS(status)) {
		printk(KERN_ALERT "Could not Create %s Section: 0x%x\n", 
			mapMemInfo->section_name,
			status);
		goto error;
	} else {
		printk(KERN_ALERT "CreateUserMappingSection: %s\n", 
			mapMemInfo->section_name);
	}

	InitializeObjectAttributes(
		&objAttributes, 
		mapMemInfo->section_name, 
		OBJ_CASE_INSENSITIVE, 
		NULL, 
		NULL);

	size.HighPart  = 0;
	size.LowPart   = npages << PAGE_SHIFT;
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
		printk(KERN_ALERT "Could not Create %s Section: 0x%x\n", 
			mapMemInfo->section_name,
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
		printk(KERN_ALERT "Could not %s Map Section: 0x%x\n", 
			mapMemInfo->section_name,
			status);
		goto error;
	}

	printk(KERN_ALERT "slot [%d] Pointer: 0x%x\n", 
		slot,
		pSharedSection);

	/*
	RtlFillMemory(pSharedSection, shared_size, 'a');	
	((char*)pSharedSection)[shared_size - 1] = '\0';
	*/

	mapMemInfo->sysVAaddress  = pSharedSection;
	mapMemInfo->userVAaddress = NULL;
	mapMemInfo->hSection      = g_hSection;
	mapMemInfo->npages        = npages;
	return STATUS_SUCCESS;

error:
	mapMemInfo->sysVAaddress  = NULL;
	mapMemInfo->userVAaddress = NULL;
	mapMemInfo->hSection      = NULL;
	mapMemInfo->npages        = 0;
	return STATUS_UNSUCCESSFUL;
#endif
}


/*
 * This routine frees and unmaps the memory that we shared between a 
 * process and our driver.
 */
NTSTATUS
CloseUserMapping(IN SIZE_T npages,
				 IN int    slot,
				 IN MAPMEM *mapMemInfo)
{
#ifdef USE_MDL

	if (!mapMemInfo->apMdl[0]) {
		printk(KERN_ALERT "%s: invalid PMdl",
			__FUNCTION__);
		return STATUS_UNSUCCESSFUL;
	}

	/* Unmap the pages */
	MmUnmapLockedPages(
		mapMemInfo->userVAaddress, 
		mapMemInfo->apMdl[0]);

	/* Free the pages from the MDL */
	MmFreePagesFromMdl(mapMemInfo->apMdl[0]);

	/* Release the MDL. */
	IoFreeMdl(mapMemInfo->apMdl[0]);

	return STATUS_SUCCESS;
#else
	NTSTATUS status;

	status = ZwUnmapViewOfSection(
		mapMemInfo->hSection, 
		mapMemInfo->sysVAaddress);

	if (!NT_SUCCESS(status)) {
		printk(KERN_ALERT "Could not Unmap Section: %w %p 0x%x\n", 
			mapMemInfo->section_name, 
			mapMemInfo->sysVAaddress, 
			status);
		return STATUS_UNSUCCESSFUL;
	}

	ZwClose(mapMemInfo->hSection);

	RtlZeroMemory(mapMemInfo, sizeof(MAPMEM));

	return STATUS_SUCCESS;
#endif
} /* Close CreateMapSection */
