
#ifndef _MAP_MEM_H_
#define _MAP_MEM_H_

#include "init.h"
#include "extension.h"

NTSTATUS 
CreateUserMappingSection(IN SIZE_T            npages,
						 IN int               slot,
						 OUT PUNICODE_STRING  section_name,
						 OUT PVOID            *OutBuffer,
						 OUT HANDLE           *handler);

NTSTATUS
CloseUserMappingSection(IN HANDLE            handler,
						IN int               slot,
						IN PUNICODE_STRING   section_name,
						IN PVOID             *OutBuffer);

/*
 * Memory mapping routine with MDL
 */
NTSTATUS
CreateUserMappingSectionWithMdl(PMDL     *pMemMdl,
								ULONG    slot,
								SIZE_T   npages,
								PVOID    *userVA);

/*
 * This routine frees and unmaps the memory that we shared between a 
 * process and our driver.
 */
void
UnMapAndFreeMemory(PMDL  PMdl,
				   PVOID UserVA);


#endif