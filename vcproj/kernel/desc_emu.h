
#ifndef _DESC_H_
#define _DESC_H_

#include <linux/winkvm.h>

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

#endif