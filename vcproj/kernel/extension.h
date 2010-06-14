
#ifndef _EXTENSION_H_
#define _EXTENSION_H_

#include <linux/winkvmint.h>

#include "init.h"

#define MAX_MEMMAP_SLOT  10
#define MAX_SECTION_NAME 50

//L"\\BaseNamedObjects\\UserKernelSharedSection",
#define SECTION_BASENAME  L"\\BaseNamedObjects\\wkukss-%d"

typedef struct _MEMALLOC {
	struct page_root  *page_slot_root[1024];
	FAST_MUTEX        page_emulater_mutex;
	int               page_slot_num;
} MEMALLOC;

typedef struct _MAPMEM {
	unsigned long    npages;
	unsigned long    base_gfn;
	PVOID            MapPointer;
	HANDLE           MapHandler;
	MEMALLOC         MemAlloc;
	PUNICODE_STRING  SectionName;
} MAPMEM;

/* extension */
typedef struct _WINKVM_DEVICE_EXTENSION {
	MAPMEM   MapmemInfo[MAX_MEMMAP_SLOT];
	MEMALLOC MemAlloc;
} WINKVM_DEVICE_EXTENSION;

typedef WINKVM_DEVICE_EXTENSION* PWINKVM_DEVICE_EXTENSION;

#endif
