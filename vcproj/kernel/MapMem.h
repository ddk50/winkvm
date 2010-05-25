
#ifndef _MAP_MEM_H_
#define _MAP_MEM_H_

#include "init.h"

NTSTATUS 
CreateUserMappingSection(IN SIZE_T shared_size,
						 IN PCWSTR section_name,
						 OUT PVOID *OutBuffer,
						 OUT HANDLE *handler);

NTSTATUS
CloseUserMappingSection(IN HANDLE handler,
						IN PVOID *OutBuffer);

#endif