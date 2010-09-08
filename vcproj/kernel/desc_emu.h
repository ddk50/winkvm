
#ifndef _DESC_H_
#define _DESC_H_

#include <linux/winkvm.h>
#include "init.h"

#define MAX_FD_SLOT 50
#define MAX_INODE_SLOT 50
#define MAX_FILE_SLOT 50

struct file_slot {
	int used;
	struct file file;
};

struct inode_slot {
	int used;
	struct inode inode;   
};

struct fd_slot {
	int used;
	enum private_data_type type;
	struct inode *inode;
	struct file *file;
};

#define MAX_MUTEX_COUNT    50
#define MAX_SPINLOCK_COUNT 50

#define SMPF_SLOTNUM 20

struct mutex_emulater_slot {	
	int used;
	FAST_MUTEX mutex;	
};

struct spinlock_emulater_slot {
	int used;
	KIRQL IrqL;
	KSPIN_LOCK spinlock;	
};

/*
 * for smp_call_function;
 * per cpu;
 */
struct smpf_data {
	void (_cdecl *func)(void *info);
	void *info;
	int mycpu_num;
};

#endif