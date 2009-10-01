
#ifndef _VMXOP_H
#define _VMXOP_H

#include "init.h"

#include <linux/winkvmint.h>
#include <linux/vmx.h>

#pragma pack(1)

/* 20.2 Table 20-1 */
struct vmcs {
	__u32 revision_id;
	__u32 abort;
	char *data;
};

#pragma pack()

int __vmxon(PHYSICAL_ADDRESS *addr);
void __vmxoff(void);

void __vmx_clear(PHYSICAL_ADDRESS *addr);
void __vmx_vmptrld(PHYSICAL_ADDRESS *addr);
void __vmx_vmptrst(PHYSICAL_ADDRESS *addr);

unsigned long vmcs_readl(unsigned long field);
__u16 vmcs_read16(unsigned long field);
__u32 vmcs_read32(unsigned long field);
__u64 vmcs_read64(unsigned long field);

void vmcs_writel(unsigned long field, unsigned long value);
void vmcs_write16(unsigned long field, __u16 value);
void vmcs_write32(unsigned long field, __u32 value);
void vmcs_write64(unsigned long field, __u64 value);

#endif
