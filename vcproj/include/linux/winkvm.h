
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
	int __slot_number;
	struct file_operations *i_fop;
	int i_count;	
};

typedef struct {  
  	int spinlock_number;	
} spinlock_t;

struct mutex {	
	int mutex_number;	
};

enum private_data_type {	
	WINKVM_KVM = 10,
	WINKVM_VCPU,	
};

struct file {
	int __slot_number;
	int __private_data_type;
	void *private_data;	
	int f_count;
	struct file_operations *f_op;	
};

struct vm_area_struct;

struct module {
	void *__module;	
};

struct file_operations {
	struct module *owner;
	int (__cdecl *ioctl) (struct inode*, struct file *, unsigned int, unsigned long);
	long (__cdecl *unlocked_ioctl) (struct file *, unsigned int, unsigned long);
	long (__cdecl *compat_ioctl) (struct file *, unsigned int, unsigned long);	
	int (__cdecl *mmap) (struct file*, struct vm_area_struct *);
	int (__cdecl *open) (struct inode*, struct file *);
	int (__cdecl *release) (struct inode*, struct file *);
	/* currently, emulation layer emulates the release hander only */
	/* The other handlers are never called */	
};

struct vm_operations_struct {
	void (__cdecl *open)(struct vm_area_struct * area);
	void (__cdecl *close)(struct vm_area_struct * area);
	struct page *(__cdecl *nopage)(struct vm_area_struct *area,
								   unsigned long address, int *type);
	unsigned long (__cdecl *nopfn)(struct vm_area_struct *area,
								   unsigned long address);	
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

/* for DEBUG */
enum dbgmsg_level {
	DBG_MISC = 0,	
	DBG_INIT,	
	DBG_RELEASE,
	DBG_DESTROY_KVM_MMU,
	DBG_LIVEMIGRATION,
	DBG_IOCTL,	
};

#endif
