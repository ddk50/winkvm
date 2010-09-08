
#ifndef _EXTENSION_H_
#define _EXTENSION_H_

#include <linux/winkvmint.h>

#include "init.h"
#include "desc_emu.h"

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
	PVOID            kernelVAaddress;
	unsigned long    cMdls;
	PMDL             apMdl[1];
} MAPMEM;

/* extension */
typedef struct _WINKVM_DEVICE_EXTENSION {
	MAPMEM          mapMemInfo[MAX_MEMMAP_SLOT];
	MEMALLOCMANTBL  globalMemTbl; /* host physical address bitmap */
	struct inode_slot   inode_slot[MAX_INODE_SLOT];
	struct file_slot    file_slot[MAX_FILE_SLOT];
	struct fd_slot      fd_slot[MAX_FD_SLOT];
	FAST_MUTEX          fd_slot_mutex;
	/* mutex and spinlock */
	struct mutex_emulater_slot     mutex_slot[MAX_MUTEX_COUNT];
	struct spinlock_emulater_slot  spinlock_slot[MAX_SPINLOCK_COUNT];
	struct smpf_data               smpf_data_slot[SMPF_SLOTNUM];
	int mutex_emulater_initialized;
	int spinlock_emulater_initialized;
	FAST_MUTEX emulater_mutex;
	FAST_MUTEX emulater_spinlock;
} WINKVM_DEVICE_EXTENSION;

typedef WINKVM_DEVICE_EXTENSION* PWINKVM_DEVICE_EXTENSION;

#endif
