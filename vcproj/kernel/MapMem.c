
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
	if (!mapMemInfo->apMdl[0])
		return STATUS_UNSUCCESSFUL;

	/* Unmap the pages */
	MmUnmapLockedPages(
		mapMemInfo->userVAaddress, 
		mapMemInfo->apMdl[0]);

	/* Free the pages from the MDL */
	MmFreePagesFromMdl(mapMemInfo->apMdl[0]);

	/* Release the MDL. */
	IoFreeMdl(mapMemInfo->apMdl[0]);

	RtlZeroMemory(mapMemInfo, sizeof(MAPMEM));

	flush_memtable();

	return STATUS_SUCCESS;
} /* Close CreateMapSection */
