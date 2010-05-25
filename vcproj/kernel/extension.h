
#ifndef _EXTENSION_H_
#define _EXTENSION_H_

#include <linux/winkvmint.h>

#include "init.h"

typedef struct _MAPMEM {
	__u64    shared_size;
	HANDLE   maphandler;
	PVOID    mappointer;
} MAPMEM;

/* extension */
typedef struct _WINKVM_DEVICE_EXTENSION {	
	MAPMEM   MapmemInfo;	
} WINKVM_DEVICE_EXTENSION;

typedef WINKVM_DEVICE_EXTENSION* PWINKVM_DEVICE_EXTENSION;

#endif
