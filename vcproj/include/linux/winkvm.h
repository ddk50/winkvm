
#ifndef _WINKVM_H_
#define _WINKVM_H_

#ifndef _WDM_DDK_
#include "init.h"
#endif

#pragma pack(1)

struct page;

struct page_mapped {
	unsigned long  size;
	void           *systemVA;
	unsigned long  h_pfn;
	unsigned long  g_pfn;
	void           *pMdl;
	void           *userVA;
};

struct page_independed {
	unsigned long  size;
	void           *systemVA;
	unsigned long  h_pfn;
	struct page    *head_page;
};

struct page {
	union {
		unsigned long private;
		void *__mapping;
	};
	unsigned long index;
	int   page_type;	
	union {
		struct page_mapped      mapped;
		struct page_independed  independed;
	};
};

struct inode {	
	void *__inode;	
 };

typedef struct {  
  	int spinlock_number;
} spinlock_t;

struct mutex {	
	int mutex_number;	
};

enum private_data_type {	
	WINKVM_KVM = -1,	
	WINKVM_VCPU,   
};

struct file {
	void *private_data;	
	int __private_data_type;	
	int fd;
	int f_count;
	struct inode *__inode;	
	int r_flags;	
};

struct task_struct {
  int counter;
};

#pragma pack()

enum km_type {	
	KM_BOUNCE_READ = 0,	
	KM_SKB_SUNRPC_DATA,
	KM_SKB_DATA_SOFTIRQ,
	KM_USER0,
	KM_USER1,
	KM_BIO_SRC_IRQ,
	KM_BIO_DST_IRQ,
	KM_PTE0,
	KM_PTE1,
	KM_IRQ0,
	KM_IRQ1,
	KM_SOFTIRQ0,
	KM_SOFTIRQ1,
	KM_TYPE_NR  
};

#endif
