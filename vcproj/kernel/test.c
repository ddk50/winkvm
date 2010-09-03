/*
 * test.c
 * This file has the main routines of WinKVM
 *
 * Copyright (C) Kazushi Takahashi <kazushi@rvm.jp>, 2009
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#include "init.h"
#include "kernel.h"
#include "cpu.h"

#include <linux/vmx.h>
#include <linux/winkvm.h>

/* test */
void do_check(void)
{
}

void _cdecl test_size(int pvoid_size,
					  int LIST_ENTRY_size)
{
	printk(" === test %s ===\n", __FUNCTION__);
	ASSERTMSG("different void pointer size\n", sizeof(void*) == pvoid_size);
	ASSERTMSG("different LIST_ENTRY size\n", sizeof(LIST_ENTRY) == LIST_ENTRY_size);
}

void _cdecl test_call(char *from_func, int a, int b, int c)
{
	printk(" === test %s ===\n", __FUNCTION__);
	printk("call from %s\n", from_func);
	printk("test pattern\n");
	printk("---%d, %d, %d---\n", a, b, c);
	printk("---%d, %d, %d---\n", a * 100, b * -200, c * 300);

	return;
}

void _cdecl test_nullcheck(void *null_val1)
{
	printk(" === test %s ===\n", __FUNCTION__);
	ASSERTMSG("different null pointer val\n", NULL == null_val1);
}

int _cdecl check_ensure_vmx(void)
{
	int  valid = 1;
	__u32 value_cr4 = __readcr4();
	__u32 value_cr0 = __readcr0();

	/* 19.7 */
	ASSERTMSG("Disable VMEX bit in CR4\n", value_cr4 & CR4_VMXE_MASK);
	valid &= (value_cr4 & CR4_VMXE_MASK) ? 1 : 0;

	ASSERTMSG("Disable PE bit in CR0\n", value_cr0 & CR0_PE_MASK);
	ASSERTMSG("Disable NE bit in CR0\n", value_cr0 & CR0_NE_MASK);
	ASSERTMSG("Disable PG bit in CR0\n", value_cr0 & CR0_PG_MASK);
	value_cr0 &= CR0_PE_MASK | CR0_NE_MASK | CR0_PG_MASK;
	valid &= (value_cr0 == 
		(CR0_PE_MASK | CR0_NE_MASK | CR0_PG_MASK)) ? 1 : 0;

	return valid;
}

static enum dbgmsg_level dbgmsg_status[] = {
    DBG_RELEASE,
};

void _cdecl function_enter(enum dbgmsg_level x, const char *funcname)
{
	int i;
	for (i = 0 ; i < sizeof(dbgmsg_status) / sizeof(enum dbgmsg_level) ; i++) {
		if (dbgmsg_status[i] == x)
			printk(KERN_ALERT " --> %s\n", funcname);
	}
}

void _cdecl function_exit(enum dbgmsg_level x, const char *funcname)
{
	int i;
	for (i = 0 ; i < sizeof(dbgmsg_status) / sizeof(enum dbgmsg_level) ; i++) {
		if (dbgmsg_status[i] == x)
			printk(KERN_ALERT " <-- %s\n", funcname);
	}
}