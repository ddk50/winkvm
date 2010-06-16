
#ifndef _EXTENSION_H_
#define _EXTENSION_H_

#include <linux/winkvmint.h>

#include "init.h"

#define MAX_MEMMAP_SLOT  10
#define MAX_SECTION_NAME 50

//L"\\BaseNamedObjects\\UserKernelSharedSection",
#define SECTION_BASENAME  L"\\BaseNamedObjects\\wkukss-%d"

typedef struct _MEMALLOCMANTBL {
	struct page_root  *page_slot_root[1024];
	FAST_MUTEX        page_emulater_mutex;
	int               page_slot_num;
} MEMALLOCMANTBL;

typedef struct _MAPMEM {
	unsigned long    npages;
	unsigned long    base_gfn;
	PVOID            userVAaddress;
	unsigned long    cMdls;
	PMDL             apMdl[1];
	MEMALLOCMANTBL   memTbl;
} MAPMEM;

/* extension */
typedef struct _WINKVM_DEVICE_EXTENSION {
	MAPMEM          mapMemInfo[MAX_MEMMAP_SLOT];
	MEMALLOCMANTBL  globalMemTbl;
} WINKVM_DEVICE_EXTENSION;

typedef WINKVM_DEVICE_EXTENSION* PWINKVM_DEVICE_EXTENSION;

#endif
