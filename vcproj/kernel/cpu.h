
#ifndef _CPU_H
#define _CPU_H

#include <intrin.h>

#pragma intrinsic(__writemsr)
#pragma intrinsic(__readmsr)
#pragma intrinsic(__cpuid)
#pragma intrinsic(__readcr0)
#pragma intrinsic(__readcr3)
#pragma intrinsic(__readcr4)
#pragma intrinsic(__writecr0)
#pragma intrinsic(__writecr3)
#pragma intrinsic(__writecr4)
#pragma intrinsic(__sidt)
/* #pragma intrinsic(__sgdt) */
#pragma intrinsic(__rdtsc)

#define VMX_LOCK                        0x00000001
#define VMX_ENABLE                      0x00000004
#define CPUID_VMX                       (1 << 5)

#define RFLAGS_ZF                       0x00000040
#define RFLAGS_CF                       0x00000001
#define RFLAGS_VM                       0x00020000
#define RFLAGS_RB                       0x00000002
#define RFLAGS_IF                       (0x1 << 9)
#define RFLAGS_RF                       (0x1 << 16)
#define IOPL_SHIFT                      12

#define CR0_PE_MASK                     (0x1 << 0)
#define CR0_MP_MASK                     (0x1 << 1)
#define CR0_EM_MASK                     (0x1 << 2)
#define CR0_TS_MASK                     (0x1 << 3)
#define CR0_ET_MASK                     (0x1 << 4)
#define CR0_NE_MASK                     (0x1 << 5)
#define CR0_PG_MASK                     (0x1 << 31)
#define CR0_WP_MASK                     (0x1 << 16)
#define CR0_RES_MASK                    ((0x3ff << 6) | (0x3ff << 19))

#define CR4_VME_MASK                    (1 << 0)
#define CR4_PVI_MASK                    (1 << 1)
#define CR4_TSD_MASK                    (1 << 2)
#define CR4_DE_MASK                     (1 << 3)
#define CR4_PSE_MASK                    (1 << 4)
#define CR4_PAE_MASK                    (1 << 5)
#define CR4_PGE_MASK                    (1 << 7)
#define CR4_PCE_MASK                    (1 << 8)
#define CR4_OSFXSR_MASK                 (1 << 9)
#define CR4_OSXMMEXCPT_MASK             (1 << 10)
#define CR4_VMXE_MASK                   (1 << 13)

/* #define MSR_IA32_FEATURE_CONTROL        0x0000003a */
#define MSR_VMX_BASIC                   0x00000480
#define MSR_IA32_DEBUGCTL               0x000001d9

#define MSR_IA32_APICBASE               0x1b
#define MSR_IA32_APICBASE_BSP           (1<<8)
#define MSR_IA32_APICBASE_ENABLE        (1<<11)
#define MSR_IA32_APICBASE_BASE          (0xfffff<<12)

#define MSR_IA32_SYSENTER_CS            0x174
#define MSR_IA32_SYSENTER_ESP           0x175
#define MSR_IA32_SYSENTER_EIP           0x176

#define MSR_MCG_CAP                     0x179
#define MSR_MCG_STATUS                  0x17a
#define MSR_MCG_CTL                     0x17b
#define MSR_EFER                        0xc0000080 /* extended feature register */
#define MSR_K6_STAR                     0xc0000081

#define MSR_IA32_VMX_BASIC              0x480
#define MSR_IA32_VMX_PINBASED_CTLS      0x481
#define MSR_IA32_VMX_PROCBASED_CTLS     0x482
#define MSR_IA32_VMX_EXIT_CTLS          0x483
#define MSR_IA32_VMX_ENTRY_CTLS         0x484

#define SELECTOR_TI_MASK                (1 << 2)
#define SELECTOR_RPL_MASK               0x03

#define CR3_L_MODE_RESEVED_BITS         (~((1ULL << 40) - 1) | 0x0fe7ULL)

#endif
