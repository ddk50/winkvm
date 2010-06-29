
#ifndef _INIT_H_
#define _INIT_H_

#include <linux/winkvmint.h>

#if !defined(AFX_STDAFX_H__DRIVER_TEMPLATE)
#define AFX_STDAFX_H__DRIVER_TEMPLATE

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

// TODO: reference additional headers your program requires here
#define i386 1
#define _X86_ 1
#define STD_CALL
#define CONDITION_HANDLING 1
#define NT_INST 0
#define _NT1X_ 100
#define WINNT 1
#define _WIN32_WINNT 0x0400 /* minimum required OS version */
#define WIN32_LEAN_AND_MEAN 1
#define DEVL 1
#define FPO 1

//extern "C" {
#pragma pack(push, 8)
#include <ntddk.h>
//#include <ntifs.h>
#pragma pack(pop)
//};

#endif // !defined(AFX_STDAFX_H__DRIVER_TEMPLATE)

// NT device name
#define WINKVM_DEVICE_NAME L"\\Device\\winkvm"
#define NT_DEVICE_NAME WINKVM_DEVICE_NAME

// File system device name.   When you execute a CreateFile call to open the
// device, use "\\.\GpdDev", or, given C's conversion of \\ to \, use
// "\\\\.\\GpdDev"
#define DOS_DEVICE_NAME L"\\DosDevices\\winkvm"
#define PORTIO_TAG      'TROP'

#define module_init(x) extern int (*__first_call)(void) = x;
#define module_exit(x) extern void (*__final_call)(void) = x;

#define SAFE_ASSERT(x) \
	do { \
	   if (!(x)) { \
	       printk(KERN_WARNING "assertion failed %s:%d: %s\n", __FILE__, __LINE__, #x); \
	   } \
	} while(0);

#define USE_MDL

#endif
