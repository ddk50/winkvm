
#ifndef _MAP_MEM_H_
#define _MAP_MEM_H_

#include "init.h"
#include "extension.h"

#define USE_SECTION
/* #define USE_MDL */

NTSTATUS
CreateUserMapping(IN SIZE_T npages,
				  IN int    slot,
				  OUT MAPMEM *mapMemInfo);

NTSTATUS
CloseUserMapping(IN SIZE_T npages,
				 IN int    slot,
				 IN MAPMEM *mapMemInfo);

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
UnMapAndFreeMemory(PMDL PMdl, PVOID UserVA);

#endif