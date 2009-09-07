
#ifndef _WINKVM_H_
#define _WINKVM_H_

#ifndef _WDM_DDK_
#include "init.h"
#endif

/*  
 * Address types:
 *
 *  gva - guest virtual address 
 *  gpa - guest physical address
 *  gfn - guest frame number
 *  hva - host virtual address
 *  hpa - host physical address
 *  hfn - host frame number
 */

typedef unsigned long  gva_t;
typedef u64            gpa_t;
typedef unsigned long  gfn_t;

typedef unsigned long  hva_t;
typedef u64            hpa_t;
typedef unsigned long  hfn_t;

#pragma pack(1)

struct page {
	union {
		unsigned long private;
		void *__mapping;		
	};	
	unsigned long index;
	void *__nt_mem;
	hfn_t __wpfn;	
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

struct file {
	void *private_data;
	int fd;
	int r_flags;	
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
