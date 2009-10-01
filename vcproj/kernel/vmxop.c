
#include "init.h"

#include <linux/vmx.h>
#include "kernel.h"
#include "cpu.h"

#define  PAU64(x)      \
	((__u64)((x)->u.HighPart) << 32) | ((x)->u.LowPart)

int __vmxon(PHYSICAL_ADDRESS *addr)
{
	unsigned long eflags = 0x0;
	__u64 val = PAU64(addr);
	void *val_addr = &val;

	__asm {
		mov eax, val_addr
		_emit 0xf3 // vmxon [eax]
		_emit 0x0f
		_emit 0xc7
		_emit 0x30

		pushf
		pop  eflags;
	}

	if ( eflags & RFLAGS_CF ) {
		return -1;
	}

	return 1;
}

void __vmxoff(void)
{
	__asm {
		_emit 0x0f // vmxoff
		_emit 0x01
		_emit 0xc4
	}
}

void __vmx_clear(PHYSICAL_ADDRESS *addr)
{
	__u64 val = PAU64(addr);
	void *val_addr = &val;
	
	// check on 64bit mode
	__asm {
		mov eax, val_addr
		_emit 0x66  // vmclear [eax]
		_emit 0x0f
		_emit 0xc7
		_emit 0x30
	}

	return;
}

void __vmx_vmptrld(PHYSICAL_ADDRESS *addr)
{
	__u64 val = PAU64(addr);
	void *val_addr = &val;

	__asm {
		mov eax, val_addr
		_emit 0x0f  // vmptrld [eax]
		_emit 0xc7
		_emit 0x30
	}

	return;
}

/*
void __vmx_vmptrst(PHYSICAL_ADDRESS *addr)
{
	__u64 val = PAU64(addr);
	void *val_addr = &val;

	__asm {
		mov eax, val_addr
		_emit 0x0f // vmptrst [eax]
		_emit 0xc7
		_emit 0x38
	}
}
*/

unsigned long vmcs_readl(unsigned long field)
{
	unsigned long value;

	__asm {
		push eax
		push edx

		mov edx, field

		_emit 0x0f // vmread rax, rdx
		_emit 0x78
		_emit 0xd0

		mov value, eax

		pop edx
		pop eax
	}

	return value;
}

__u16 vmcs_read16(unsigned long field)
{
	return (__u16)vmcs_readl(field);
}

__u32 vmcs_read32(unsigned long field)
{
	return vmcs_readl(field);
}

__u64 vmcs_read64(unsigned long field)
{
	/*
	 * [FIXME] Bugs in 64bit mode
	 */
	__u64 value = vmcs_readl(field) | ((__u64)vmcs_readl(field+1) << 32);
	return value;
}

void vmcs_writel(unsigned long field, unsigned long value)
{
	unsigned long eflags;
	unsigned long _field = field;
	unsigned long _value = value;

	__asm {
		mov edx, _field
		mov eax, _value

		_emit 0x0f  //vmwrite rdx, rax
		_emit 0x79
		_emit 0xd0

		pushf
		pop eflags
	}

	if ((eflags & RFLAGS_ZF) || (eflags & RFLAGS_CF)) {
		printk(KERN_ALERT "%s: failed", __FUNCTION__);
	}

	return;
}

void vmcs_write16(unsigned long field, __u16 value)
{
	vmcs_writel(field, value);
}

void vmcs_write32(unsigned long field, __u32 value)
{
	vmcs_writel(field, value);
}

void vmcs_write64(unsigned long field, __u64 value)
{
  /*
   * [FIXME]: Bugs on 64bit mode
   */
  vmcs_writel(field, value & 0xffffffff);
  vmcs_writel(field+1, value >> 32);
}
