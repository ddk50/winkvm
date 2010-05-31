
#ifndef _EXTENSION_H_
#define _EXTENSION_H_

#include <linux/winkvmint.h>

#include "init.h"

typedef struct _MAPMEM {
	__u64    shared_size;
	HANDLE   maphandler;
	PVOID    mappointer;
} MAPMEM;

typedef struct _MEMALLOC {
	struct page_root  *page_slot_root[1024];
	FAST_MUTEX        page_emulater_mutex;
	int               page_slot_num;
} MEMALLOC;

/* extension */
typedef struct _WINKVM_DEVICE_EXTENSION {
	MAPMEM   MapmemInfo;
	MEMALLOC MemAlloc;
} WINKVM_DEVICE_EXTENSION;

typedef WINKVM_DEVICE_EXTENSION* PWINKVM_DEVICE_EXTENSION;

#endif
