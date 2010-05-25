
#ifndef _MAP_MEM_H_
#define _MAP_MEM_H_

#include "StdAfx.h"

#include <MapMemIoctl.h>

typedef struct _MAPMEM_DEVICE_EXTENSION {	
	unsigned long   shared_size;
	HANDLE          maphandler;
	PVOID           mappointer;
} MAPMEM_DEVICE_EXTENSION;

typedef struct _MAPMEM_TEST {
	unsigned long shared_size;
} MAPMEM_TEST;

typedef MAPMEM_DEVICE_EXTENSION *PMAPMEM_DEVICE_EXTENSION;

NTSTATUS 
CreateUserMappingSection(IN SIZE_T shared_size,
						 IN PCWSTR section_name,
						 OUT PVOID *OutBuffer,
						 OUT HANDLE *handler);

NTSTATUS
CloseUserMappingSection(IN HANDLE handler,
						IN PVOID *OutBuffer);

#endif