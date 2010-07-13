	.file	"kvm_main.c"
	.section	.debug_abbrev,"dr"
Ldebug_abbrev0:
	.section	.debug_info,"dr"
Ldebug_info0:
	.section	.debug_line,"dr"
Ldebug_line0:
	.text
Ltext0:
	.p2align 4,,15
.globl _segment_base
	.def	_segment_base;	.scl	2;	.type	32;	.endef
_segment_base:
LFB112:
	.file 1 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c"
	.loc 1 188 0
LVL0:
	pushl	%ebx
LCFI0:
	.loc 1 195 0
	xorl	%ecx, %ecx
LVL1:
	.loc 1 188 0
	subl	$12, %esp
LCFI1:
	.loc 1 188 0
	movzwl	20(%esp), %edx
	.loc 1 195 0
	testw	%dx, %dx
	je	L3
LVL2:
	.loc 1 201 0
	movzwl	%dx, %ebx
LVL3:
	.loc 1 198 0
/APP
 # 198 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c" 1
	sgdt 6(%esp)
 # 0 "" 2
	.loc 1 201 0
/NO_APP
	testb	$4, %bl
	.loc 1 199 0
	movl	8(%esp), %eax
LVL4:
	.loc 1 201 0
	jne	L7
L4:
	.loc 1 207 0
	andl	$-8, %ebx
LVL5:
	addl	%ebx, %eax
LVL6:
	.loc 1 208 0
	movzbl	4(%eax), %ecx
	movzbl	7(%eax), %edx
	movzwl	2(%eax), %eax
LVL7:
	sall	$16, %ecx
	sall	$24, %edx
	orl	%edx, %ecx
	orl	%eax, %ecx
LVL8:
L3:
	.loc 1 215 0
	movl	%ecx, %eax
	addl	$12, %esp
	popl	%ebx
LVL9:
	ret
LVL10:
	.p2align 4,,7
L7:
LBB240:
	.loc 1 204 0
/APP
 # 204 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c" 1
	sldt %ax
 # 0 "" 2
LVL11:
	.loc 1 205 0
/NO_APP
	movzwl	%ax, %eax
LVL12:
	movl	%eax, (%esp)
	call	_segment_base
LVL13:
	jmp	L4
LBE240:
LFE112:
	.p2align 4,,15
.globl _gfn_to_memslot
	.def	_gfn_to_memslot;	.scl	2;	.type	32;	.endef
_gfn_to_memslot:
LFB140:
	.loc 1 943 0
LVL14:
	pushl	%ebp
LCFI2:
	pushl	%edi
LCFI3:
	pushl	%esi
LCFI4:
	pushl	%ebx
LCFI5:
	.loc 1 943 0
	movl	20(%esp), %esi
	movl	24(%esp), %ebp
	.loc 1 946 0
	movl	4(%esi), %edi
	testl	%edi, %edi
	jle	L9
LVL15:
	xorl	%ecx, %ecx
LVL16:
	xorl	%ebx, %ebx
LVL17:
	.p2align 4,,7
L12:
LBB241:
	.loc 1 949 0
	movl	8(%esi,%ebx), %edx
	.loc 1 947 0
	leal	(%ecx,%ecx,4), %eax
LVL18:
	leal	8(%esi,%eax,4), %eax
LVL19:
	.loc 1 949 0
	cmpl	%ebp, %edx
	ja	L10
	addl	12(%esi,%ebx), %edx
	cmpl	%edx, %ebp
	jb	L11
L10:
LBE241:
	.loc 1 946 0
	addl	$1, %ecx
	addl	$20, %ebx
	cmpl	%edi, %ecx
	jl	L12
L9:
	xorl	%eax, %eax
L11:
	.loc 1 954 0
	popl	%ebx
LVL20:
	popl	%esi
LVL21:
	popl	%edi
	popl	%ebp
LVL22:
	ret
LFE140:
	.p2align 4,,15
.globl _mark_page_dirty
	.def	_mark_page_dirty;	.scl	2;	.type	32;	.endef
_mark_page_dirty:
LFB141:
	.loc 1 958 0
LVL23:
	pushl	%ebp
LCFI6:
	pushl	%edi
LCFI7:
	pushl	%esi
LCFI8:
	pushl	%ebx
LCFI9:
	.loc 1 958 0
	movl	20(%esp), %ebp
	movl	24(%esp), %esi
	.loc 1 965 0
	movl	4(%ebp), %edi
	testl	%edi, %edi
	jle	L19
LVL24:
	leal	8(%ebp), %edx
	xorl	%ecx, %ecx
LVL25:
	.p2align 4,,7
L18:
	.loc 1 968 0
	movl	(%edx), %ebx
	cmpl	%esi, %ebx
	ja	L17
	movl	%ebx, %eax
	addl	4(%edx), %eax
	cmpl	%eax, %esi
	jb	L21
L17:
	.loc 1 965 0
	addl	$1, %ecx
	addl	$20, %edx
	cmpl	%ecx, %edi
	jg	L18
LVL26:
L19:
	.loc 1 986 0
	popl	%ebx
	popl	%esi
LVL27:
	popl	%edi
	popl	%ebp
LVL28:
	ret
LVL29:
	.p2align 4,,7
L21:
	.loc 1 971 0
	leal	(%ecx,%ecx,4), %eax
	movl	24(%ebp,%eax,4), %edx
	testl	%edx, %edx
	je	L19
	.loc 1 979 0
	movl	%esi, %ecx
LVL30:
	subl	%ebx, %ecx
LBB242:
LBB243:
	.file 2 "include/linux/winkvmstab.h"
	.loc 2 310 0
/APP
 # 310 "include/linux/winkvmstab.h" 1
	btl %ecx,(%edx); setc %al
 # 0 "" 2
LVL31:
/NO_APP
LBE243:
LBE242:
	.loc 1 979 0
	testb	%al, %al
	jne	L19
LBB244:
LBB245:
	.loc 2 291 0
/APP
 # 291 "include/linux/winkvmstab.h" 1
	lock; btsl %ecx,(%edx)
 # 0 "" 2
/NO_APP
LBE245:
LBE244:
	.loc 1 986 0
	popl	%ebx
	popl	%esi
LVL32:
	popl	%edi
	popl	%ebp
LVL33:
	ret
LFE141:
	.p2align 4,,15
.globl _emulate_invlpg
	.def	_emulate_invlpg;	.scl	2;	.type	32;	.endef
_emulate_invlpg:
LFB150:
	.loc 1 1152 0
LVL34:
	.loc 1 1154 0
	xorl	%eax, %eax
	ret
LFE150:
	.p2align 4,,15
.globl _emulate_clts
	.def	_emulate_clts;	.scl	2;	.type	32;	.endef
_emulate_clts:
LFB151:
	.loc 1 1157 0
LVL35:
	pushl	%ebx
LCFI10:
	subl	$8, %esp
LCFI11:
	.loc 1 1160 0
	movl	_kvm_arch_ops, %eax
	.loc 1 1157 0
	movl	16(%esp), %ebx
	.loc 1 1160 0
	movl	%ebx, (%esp)
	call	*72(%eax)
	.loc 1 1162 0
	movl	96(%ebx), %eax
	movl	%ebx, (%esp)
	andl	$-9, %eax
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	call	*76(%eax)
	.loc 1 1164 0
	xorl	%eax, %eax
	addl	$8, %esp
	popl	%ebx
	ret
LFE151:
	.p2align 4,,15
.globl _emulator_set_dr
	.def	_emulator_set_dr;	.scl	2;	.type	32;	.endef
_emulator_set_dr:
LFB153:
	.loc 1 1182 0
LVL36:
	subl	$20, %esp
LCFI12:
	.loc 1 1186 0
	leal	16(%esp), %eax
	movl	%eax, 12(%esp)
	movl	32(%esp), %eax
	movl	%eax, 8(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	24(%esp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	movl	_kvm_arch_ops, %eax
	call	*116(%eax)
	xorl	%eax, %eax
	cmpl	$0, 16(%esp)
LVL37:
	setne	%al
	.loc 1 1192 0
	addl	$20, %esp
	ret
LFE153:
	.p2align 4,,15
.globl _kvm_hypercall
	.def	_kvm_hypercall;	.scl	2;	.type	32;	.endef
_kvm_hypercall:
LFB156:
	.loc 1 1303 0
LVL38:
	pushl	%ebx
LCFI13:
	subl	$4, %esp
LCFI14:
	.loc 1 1306 0
	movl	_kvm_arch_ops, %eax
	.loc 1 1303 0
	movl	12(%esp), %ebx
	.loc 1 1306 0
	movl	%ebx, (%esp)
	call	*120(%eax)
	.loc 1 1332 0
	movl	$-1, 60(%ebx)
	.loc 1 1333 0
	movl	_kvm_arch_ops, %eax
	movl	%ebx, (%esp)
	call	*124(%eax)
	.loc 1 1335 0
	movl	$1, %eax
	addl	$4, %esp
	popl	%ebx
	ret
LFE156:
	.p2align 4,,15
.globl _realmode_lgdt
	.def	_realmode_lgdt;	.scl	2;	.type	32;	.endef
_realmode_lgdt:
LFB158:
	.loc 1 1344 0
LVL39:
	subl	$16, %esp
LCFI15:
	.loc 1 1345 0
	movl	24(%esp), %eax
	movw	%ax, 10(%esp)
	movl	28(%esp), %eax
	movl	%eax, 12(%esp)
	.loc 1 1347 0
	leal	10(%esp), %eax
	movl	%eax, 4(%esp)
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	movl	_kvm_arch_ops, %eax
	call	*108(%eax)
	.loc 1 1348 0
	addl	$16, %esp
	ret
LFE158:
	.p2align 4,,15
.globl _realmode_lidt
	.def	_realmode_lidt;	.scl	2;	.type	32;	.endef
_realmode_lidt:
LFB159:
	.loc 1 1351 0
LVL40:
	subl	$16, %esp
LCFI16:
	.loc 1 1352 0
	movl	24(%esp), %eax
	movw	%ax, 10(%esp)
	movl	28(%esp), %eax
	movl	%eax, 12(%esp)
	.loc 1 1354 0
	leal	10(%esp), %eax
	movl	%eax, 4(%esp)
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	movl	_kvm_arch_ops, %eax
	call	*100(%eax)
	.loc 1 1355 0
	addl	$16, %esp
	ret
LFE159:
	.p2align 4,,15
.globl _kvm_resched
	.def	_kvm_resched;	.scl	2;	.type	32;	.endef
_kvm_resched:
LFB168:
	.loc 1 1606 0
LVL41:
	.loc 1 1615 0
	rep
	ret
LFE168:
	.p2align 4,,15
.globl _load_msrs
	.def	_load_msrs;	.scl	2;	.type	32;	.endef
_load_msrs:
LFB169:
	.loc 1 1619 0
LVL42:
	pushl	%edi
LCFI17:
	pushl	%esi
LCFI18:
	pushl	%ebx
LCFI19:
	.loc 1 1619 0
	movl	20(%esp), %edi
	.loc 1 1622 0
	testl	%edi, %edi
	jle	L39
LVL43:
	movl	16(%esp), %ebx
	xorl	%esi, %esi
LVL44:
	addl	$8, %ebx
	.p2align 4,,7
L38:
LBB246:
LBB247:
	.file 3 "include/asm/winkvmmisc.h"
	.loc 3 167 0
	movl	-8(%ebx), %ecx
	movl	(%ebx), %eax
	movl	4(%ebx), %edx
/APP
 # 167 "include/asm/winkvmmisc.h" 1
	wrmsr
 # 0 "" 2
/NO_APP
LBE247:
LBE246:
	.loc 1 1622 0
	addl	$1, %esi
	addl	$16, %ebx
	cmpl	%esi, %edi
	jg	L38
L39:
	.loc 1 1624 0
	popl	%ebx
	popl	%esi
LVL45:
	popl	%edi
LVL46:
	ret
LFE169:
	.p2align 4,,15
.globl _save_msrs
	.def	_save_msrs;	.scl	2;	.type	32;	.endef
_save_msrs:
LFB170:
	.loc 1 1628 0
LVL47:
	pushl	%edi
LCFI20:
	pushl	%esi
LCFI21:
	pushl	%ebx
LCFI22:
	.loc 1 1628 0
	movl	20(%esp), %edi
	.loc 1 1631 0
	testl	%edi, %edi
	jle	L44
LVL48:
	movl	16(%esp), %ebx
	xorl	%esi, %esi
LVL49:
	.p2align 4,,7
L43:
LBB248:
LBB249:
	.loc 3 161 0
	movl	(%ebx), %ecx
/APP
 # 161 "include/asm/winkvmmisc.h" 1
	rdmsr
 # 0 "" 2
LVL50:
/NO_APP
LBE249:
LBE248:
	.loc 1 1631 0
	addl	$1, %esi
	.loc 1 1632 0
	movl	%eax, 8(%ebx)
	movl	%edx, 12(%ebx)
LVL51:
	.loc 1 1631 0
	addl	$16, %ebx
	cmpl	%esi, %edi
	jg	L43
L44:
	.loc 1 1633 0
	popl	%ebx
	popl	%esi
LVL52:
	popl	%edi
LVL53:
	ret
LFE170:
	.p2align 4,,15
.globl _get_emulated_msrs_array_size
	.def	_get_emulated_msrs_array_size;	.scl	2;	.type	32;	.endef
_get_emulated_msrs_array_size:
LFB178:
	.loc 1 1895 0
	.loc 1 1897 0
	movl	$1, %eax
	ret
LFE178:
	.p2align 4,,15
	.def	_kvm_vcpu_ioctl;	.scl	3;	.type	32;	.endef
_kvm_vcpu_ioctl:
LFB189:
	.loc 1 2170 0
LVL54:
	.loc 1 2295 0
	movl	$-22, %eax
	ret
LFE189:
	.p2align 4,,15
	.def	_kvm_vm_ioctl;	.scl	3;	.type	32;	.endef
_kvm_vm_ioctl:
LFB190:
	.loc 1 2299 0
LVL55:
	.loc 1 2352 0
	movl	$-22, %eax
	ret
LFE190:
	.p2align 4,,15
	.def	_kvm_vm_mmap;	.scl	3;	.type	32;	.endef
_kvm_vm_mmap:
LFB192:
	.loc 1 2380 0
LVL56:
	.loc 1 2381 0
	movl	8(%esp), %eax
	movl	$_kvm_vm_vm_ops, 40(%eax)
	.loc 1 2383 0
	xorl	%eax, %eax
	ret
LFE192:
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "<3>emulator_write_std: addr %lx n %d\12\0"
	.text
	.p2align 4,,15
	.def	_emulator_write_std;	.scl	3;	.type	32;	.endef
_emulator_write_std:
LFB143:
	.loc 1 1028 0
LVL57:
	subl	$12, %esp
LCFI23:
	.loc 1 1029 0
	movl	24(%esp), %eax
	movl	$LC0, (%esp)
	movl	%eax, 8(%esp)
	movl	16(%esp), %eax
	movl	%eax, 4(%esp)
	call	_printk
	.loc 1 1032 0
	movl	$1, %eax
	addl	$12, %esp
	ret
LFE143:
	.section .rdata,"dr"
LC1:
	.ascii "<1>%d, %d, %d %s\12\0"
	.text
	.p2align 4,,15
	.def	_test_2_t;	.scl	3;	.type	32;	.endef
_test_2_t:
LFB203:
	.loc 1 2840 0
LVL58:
	subl	$20, %esp
LCFI24:
	.loc 1 2841 0
	movl	32(%esp), %eax
	movl	$___FUNCTION__.4103, 16(%esp)
	movl	$LC1, (%esp)
	movl	%eax, 12(%esp)
	movl	28(%esp), %eax
	movl	%eax, 8(%esp)
	movl	24(%esp), %eax
	movl	%eax, 4(%esp)
	call	_printk
	.loc 1 2844 0
	movl	$1, %eax
	addl	$20, %esp
	ret
LFE203:
	.section .rdata,"dr"
LC2:
	.ascii "<1>%d %d %d %s\12\0"
	.text
	.p2align 4,,15
.globl _test_1_t
	.def	_test_1_t;	.scl	2;	.type	32;	.endef
_test_1_t:
LFB202:
	.loc 1 2833 0
LVL59:
	subl	$20, %esp
LCFI25:
	.loc 1 2834 0
	movl	32(%esp), %eax
	movl	$___FUNCTION__.4097, 16(%esp)
	movl	$LC2, (%esp)
	movl	%eax, 12(%esp)
	movl	28(%esp), %eax
	movl	%eax, 8(%esp)
	movl	24(%esp), %eax
	movl	%eax, 4(%esp)
	call	_printk
	.loc 1 2837 0
	addl	$20, %esp
	ret
LFE202:
	.section .rdata,"dr"
	.align 4
LC3:
	.ascii "<3>kvm: unhandled rdmsr: 0x%x\12\0"
	.text
	.p2align 4,,15
.globl _kvm_get_msr_common
	.def	_kvm_get_msr_common;	.scl	2;	.type	32;	.endef
_kvm_get_msr_common:
LFB164:
	.loc 1 1474 0
LVL60:
	subl	$8, %esp
LCFI26:
	.loc 1 1474 0
	movl	16(%esp), %edx
	.loc 1 1477 0
	cmpl	$416, %edx
	je	L65
LVL61:
	jbe	L76
	cmpl	$1031, %edx
	je	L62
	.p2align 4,,9
	jbe	L77
	cmpl	$1043, %edx
	.p2align 4,,7
	je	L62
	.p2align 4,,9
	jbe	L78
	cmpl	$-1073676272, %edx
	.p2align 4,,7
	je	L62
	cmpl	$-1073676267, %edx
	.p2align 4,,7
	je	L62
	.p2align 4,,7
L61:
	.loc 1 1513 0
	movl	%edx, 4(%esp)
	movl	$LC3, (%esp)
	call	_printk
LVL62:
	movl	$1, %eax
	.loc 1 1518 0
	addl	$8, %esp
	ret
LVL63:
	.p2align 4,,7
L76:
	.loc 1 1477 0
	cmpl	$139, %edx
	je	L62
	.p2align 4,,6
	jbe	L79
	cmpl	$378, %edx
	.p2align 4,,7
	ja	L69
	cmpl	$377, %edx
	.p2align 4,,7
	jae	L62
	cmpl	$205, %edx
	.p2align 4,,5
	je	L64
	cmpl	$254, %edx
	.p2align 4,,5
	jne	L61
	.p2align 4,,7
L62:
	.loc 1 1514 0
	xorl	%eax, %eax
LVL64:
	xorl	%edx, %edx
LVL65:
	.p2align 4,,3
	jmp	L73
LVL66:
	.p2align 4,,7
L65:
	.loc 1 1505 0
	movl	12(%esp), %ecx
	movl	184(%ecx), %eax
LVL67:
	movl	188(%ecx), %edx
LVL68:
L73:
	.loc 1 1516 0
	movl	20(%esp), %ecx
	movl	%eax, (%ecx)
	xorl	%eax, %eax
LVL69:
	movl	%edx, 4(%ecx)
	.loc 1 1518 0
	addl	$8, %esp
	ret
LVL70:
	.p2align 4,,7
L77:
	.loc 1 1477 0
	cmpl	$1024, %edx
	je	L62
	jbe	L80
	cmpl	$1027, %edx
	.p2align 4,,7
	jne	L61
	.p2align 4,,9
	jmp	L62
	.p2align 4,,7
L79:
	cmpl	$23, %edx
	.p2align 4,,7
	je	L62
	.p2align 4,,9
	jbe	L81
	cmpl	$27, %edx
	.p2align 4,,7
	jne	L61
	.loc 1 1502 0
	movl	12(%esp), %ecx
	movl	176(%ecx), %eax
LVL71:
	movl	180(%ecx), %edx
LVL72:
	jmp	L73
LVL73:
	.p2align 4,,7
L69:
	.loc 1 1477 0
	cmpl	$408, %edx
	jne	L61
	jmp	L62
	.p2align 4,,7
L81:
	cmpl	$1, %edx
	.p2align 4,,7
	ja	L61
	.p2align 4,,9
	jmp	L62
	.p2align 4,,7
L78:
	cmpl	$1035, %edx
	.p2align 4,,7
	je	L62
	cmpl	$1039, %edx
	.p2align 4,,7
	jne	L61
	.p2align 4,,7
	jmp	L62
	.p2align 4,,7
L80:
	leal	-512(%edx), %eax
	cmpl	$255, %eax
	.p2align 4,,2
	ja	L61
	.p2align 4,,4
	jmp	L62
L64:
	movl	$3, %eax
LVL74:
	xorl	%edx, %edx
LVL75:
	jmp	L73
LFE164:
	.section .rdata,"dr"
LC4:
	.ascii "<7>%s: unexpected cr %u\12\0"
	.text
	.p2align 4,,15
.globl _realmode_get_cr
	.def	_realmode_get_cr;	.scl	2;	.type	32;	.endef
_realmode_get_cr:
LFB161:
	.loc 1 1365 0
LVL76:
	subl	$20, %esp
LCFI27:
	.loc 1 1366 0
	movl	_kvm_arch_ops, %eax
	.loc 1 1365 0
	movl	%ebx, 12(%esp)
LCFI28:
	movl	28(%esp), %ebx
	movl	%esi, 16(%esp)
LCFI29:
	.loc 1 1365 0
	movl	24(%esp), %esi
	.loc 1 1366 0
	movl	%esi, (%esp)
	call	*72(%eax)
	.loc 1 1367 0
	cmpl	$2, %ebx
	je	L85
LVL77:
	jle	L91
	cmpl	$3, %ebx
	.p2align 4,,7
	je	L86
	cmpl	$4, %ebx
	.p2align 4,,7
	je	L92
L83:
	.loc 1 1377 0
	movl	%ebx, 8(%esp)
	movl	$___FUNCTION__.3406, 4(%esp)
	movl	$LC4, (%esp)
	call	_printk
	xorl	%eax, %eax
	.loc 1 1380 0
	movl	12(%esp), %ebx
LVL78:
	movl	16(%esp), %esi
LVL79:
	addl	$20, %esp
	ret
LVL80:
	.p2align 4,,7
L91:
	.loc 1 1367 0
	testl	%ebx, %ebx
	jne	L83
	.loc 1 1369 0
	movl	96(%esi), %eax
	.loc 1 1380 0
	movl	12(%esp), %ebx
LVL81:
	movl	16(%esp), %esi
LVL82:
	addl	$20, %esp
	ret
LVL83:
	.p2align 4,,7
L92:
	.loc 1 1375 0
	movl	128(%esi), %eax
	.loc 1 1380 0
	movl	12(%esp), %ebx
LVL84:
	movl	16(%esp), %esi
LVL85:
	addl	$20, %esp
	ret
LVL86:
	.p2align 4,,7
L85:
	.loc 1 1371 0
	movl	100(%esi), %eax
	.loc 1 1380 0
	movl	12(%esp), %ebx
LVL87:
	movl	16(%esp), %esi
LVL88:
	addl	$20, %esp
	ret
LVL89:
	.p2align 4,,7
L86:
	.loc 1 1373 0
	movl	104(%esi), %eax
	.loc 1 1380 0
	movl	12(%esp), %ebx
LVL90:
	movl	16(%esp), %esi
LVL91:
	addl	$20, %esp
	ret
LFE161:
	.section .rdata,"dr"
LC5:
	.ascii "<7>%s: unexpected dr %u\12\0"
	.text
	.p2align 4,,15
.globl _emulator_get_dr
	.def	_emulator_get_dr;	.scl	2;	.type	32;	.endef
_emulator_get_dr:
LFB152:
	.loc 1 1167 0
LVL92:
	subl	$12, %esp
LCFI30:
	.loc 1 1167 0
	movl	20(%esp), %edx
	.loc 1 1168 0
	movl	16(%esp), %eax
	.loc 1 1170 0
	cmpl	$3, %edx
	.loc 1 1168 0
	movl	(%eax), %eax
LVL93:
	.loc 1 1170 0
	ja	L94
LVL94:
	.loc 1 1172 0
	movl	%eax, (%esp)
	movl	_kvm_arch_ops, %eax
LVL95:
	movl	%edx, 4(%esp)
	call	*112(%eax)
LVL96:
	movl	24(%esp), %edx
	movl	%eax, (%edx)
	xorl	%eax, %eax
	.loc 1 1179 0
	addl	$12, %esp
	ret
LVL97:
	.p2align 4,,7
L94:
	.loc 1 1175 0
	movl	%edx, 8(%esp)
	movl	$___FUNCTION__.3267, 4(%esp)
	movl	$LC5, (%esp)
	call	_printk
LVL98:
	movl	$1, %eax
	.loc 1 1179 0
	addl	$12, %esp
	ret
LFE152:
	.section .rdata,"dr"
	.align 4
LC6:
	.ascii "<7>set_cr8: #GP, reserved bits 0x%lx\12\0"
	.text
	.p2align 4,,15
.globl _set_cr8
	.def	_set_cr8;	.scl	2;	.type	32;	.endef
_set_cr8:
LFB134:
	.loc 1 624 0
LVL99:
	pushl	%ebx
LCFI31:
	subl	$8, %esp
LCFI32:
	.loc 1 624 0
	movl	20(%esp), %eax
	movl	16(%esp), %ebx
	.loc 1 625 0
	testl	$-16, %eax
	jne	L101
LVL100:
	.loc 1 630 0
	movl	%eax, 132(%ebx)
	.loc 1 631 0
	addl	$8, %esp
	popl	%ebx
LVL101:
	ret
LVL102:
	.p2align 4,,7
L101:
	.loc 1 626 0
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printk
LVL103:
LBB250:
LBB251:
	.loc 1 439 0
	movl	_kvm_arch_ops, %eax
	movl	%ebx, 16(%esp)
	movl	$0, 20(%esp)
	movl	148(%eax), %ecx
LBE251:
LBE250:
	.loc 1 631 0
	addl	$8, %esp
	popl	%ebx
LVL104:
LBB253:
LBB252:
	.loc 1 439 0
	jmp	*%ecx
LBE252:
LBE253:
LFE134:
	.p2align 4,,15
	.def	_emulator_read_std;	.scl	3;	.type	32;	.endef
_emulator_read_std:
LFB142:
	.loc 1 992 0
LVL105:
	pushl	%ebp
LCFI33:
	pushl	%edi
LCFI34:
	pushl	%esi
LCFI35:
	pushl	%ebx
LCFI36:
	subl	$20, %esp
LCFI37:
	.loc 1 993 0
	movl	52(%esp), %eax
	movl	(%eax), %eax
	movl	%eax, 12(%esp)
LVL106:
	.loc 1 996 0
	movl	48(%esp), %eax
	testl	%eax, %eax
	je	L103
	movl	44(%esp), %eax
	movl	%eax, 16(%esp)
LVL107:
LVL108:
	.p2align 4,,7
L110:
LBB254:
	.loc 1 997 0
	movl	40(%esp), %ecx
	movl	12(%esp), %eax
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	call	*13536(%eax)
	movl	%edx, %ecx
LVL109:
	movl	%eax, %edx
LVL110:
	.loc 1 1004 0
	andl	%ecx, %eax
	addl	$1, %eax
	je	L104
LVL111:
	.loc 1 1007 0
	movl	12(%esp), %eax
	.loc 1 1006 0
	shrdl	$12, %ecx, %edx
LVL112:
	movl	%edx, %edi
	.loc 1 1007 0
	movl	(%eax), %esi
LVL113:
LBB255:
LBB256:
	.loc 1 946 0
	movl	4(%esi), %ebp
LVL114:
	testl	%ebp, %ebp
	jle	L105
	xorl	%ebx, %ebx
LVL115:
	xorl	%edx, %edx
LVL116:
	.p2align 4,,7
L108:
LBB257:
	.loc 1 949 0
	movl	8(%esi,%edx), %ecx
LVL117:
	cmpl	%ecx, %edi
	jb	L106
	addl	12(%esi,%edx), %ecx
	.loc 1 947 0
	leal	(%ebx,%ebx,4), %eax
LVL118:
	leal	8(%esi,%eax,4), %eax
LVL119:
	.loc 1 949 0
	cmpl	%ecx, %edi
	jb	L107
L106:
LBE257:
	.loc 1 946 0
	addl	$1, %ebx
	addl	$20, %edx
	cmpl	%ebp, %ebx
	jl	L108
LVL120:
L105:
LBE256:
LBE255:
LBE254:
	.loc 1 1022 0
	addl	$20, %esp
LBB258:
	.loc 1 1018 0
	movl	$1, %eax
LVL121:
LBE258:
	.loc 1 1022 0
	popl	%ebx
LVL122:
	popl	%esi
	popl	%edi
LVL123:
	popl	%ebp
	ret
LVL124:
	.p2align 4,,7
L107:
LBB259:
	.loc 1 998 0
	movl	40(%esp), %ebp
LVL125:
	.loc 1 999 0
	movl	$4096, %esi
LVL126:
	.loc 1 998 0
	andl	$4095, %ebp
	.loc 1 999 0
	subl	%ebp, %esi
	cmpl	48(%esp), %esi
	jbe	L109
	movl	48(%esp), %esi
L109:
	.loc 1 1010 0
	movl	$3, 4(%esp)
	subl	(%eax), %edi
	movl	12(%eax), %eax
LVL127:
	movl	(%eax,%edi,4), %eax
	movl	%eax, (%esp)
	call	_kmap_atomic
	.loc 1 1012 0
	movl	16(%esp), %ecx
	movl	%esi, 8(%esp)
	movl	%ecx, (%esp)
	.loc 1 1010 0
	movl	%eax, %ebx
LVL128:
	.loc 1 1012 0
	leal	(%eax,%ebp), %eax
	movl	%eax, 4(%esp)
	call	_memcpy
	.loc 1 1014 0
	movl	$3, 4(%esp)
	movl	%ebx, (%esp)
	call	_kunmap_atomic
LBE259:
	.loc 1 996 0
	subl	%esi, 48(%esp)
LVL129:
	je	L103
LVL130:
LBB260:
	.loc 1 1017 0
	addl	%esi, 16(%esp)
LVL131:
	.loc 1 1018 0
	addl	%esi, 40(%esp)
LVL132:
	jmp	L110
LVL133:
L104:
LBE260:
	.loc 1 1022 0
	addl	$20, %esp
LBB261:
	.loc 1 1018 0
	movl	$2, %eax
LBE261:
	.loc 1 1022 0
	popl	%ebx
LVL134:
	popl	%esi
LVL135:
	popl	%edi
LVL136:
	popl	%ebp
LVL137:
	ret
LVL138:
L103:
	addl	$20, %esp
LBB262:
	.loc 1 1018 0
	xorl	%eax, %eax
LBE262:
	.loc 1 1022 0
	popl	%ebx
LVL139:
	popl	%esi
LVL140:
	popl	%edi
LVL141:
	popl	%ebp
LVL142:
	ret
LFE142:
	.p2align 4,,15
	.def	_emulator_read_emulated;	.scl	3;	.type	32;	.endef
_emulator_read_emulated:
LFB144:
	.loc 1 1038 0
LVL143:
	subl	$28, %esp
LCFI38:
	movl	44(%esp), %eax
	movl	%edi, 24(%esp)
LCFI39:
	movl	36(%esp), %edx
	movl	%ebx, 16(%esp)
LCFI40:
	movl	40(%esp), %edi
	movl	%esi, 20(%esp)
LCFI41:
	.loc 1 1039 0
	movl	(%eax), %ebx
LVL144:
	.loc 1 1041 0
	movl	14812(%ebx), %ecx
	testl	%ecx, %ecx
	jne	L120
LVL145:
	.loc 1 1045 0
	movl	%eax, 12(%esp)
	movl	32(%esp), %eax
LVL146:
	movl	%edi, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_emulator_read_std
LVL147:
	xorl	%ecx, %ecx
	testl	%eax, %eax
	jne	L121
LVL148:
L116:
	.loc 1 1060 0
	movl	%ecx, %eax
	movl	16(%esp), %ebx
LVL149:
	movl	20(%esp), %esi
LVL150:
	movl	24(%esp), %edi
LVL151:
	addl	$28, %esp
	ret
LVL152:
	.p2align 4,,7
L121:
LBB263:
	.loc 1 1049 0
	movl	32(%esp), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	*13536(%ebx)
	.loc 1 1051 0
	movl	$2, %ecx
	.loc 1 1049 0
	movl	%eax, %esi
LVL153:
	.loc 1 1051 0
	andl	%edx, %eax
LVL154:
	addl	$1, %eax
	je	L116
	.loc 1 1053 0
	movl	$1, 14808(%ebx)
	.loc 1 1056 0
	movl	$1, %ecx
	.loc 1 1054 0
	movl	%esi, 14832(%ebx)
	movl	%edx, 14836(%ebx)
	.loc 1 1055 0
	movl	%edi, 14820(%ebx)
	.loc 1 1056 0
	movl	$0, 14816(%ebx)
	jmp	L116
LVL155:
	.p2align 4,,7
L120:
LBE263:
	.loc 1 1042 0
	leal	14824(%ebx), %eax
LVL156:
	movl	%edi, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_memcpy
LVL157:
	.loc 1 1043 0
	xorl	%ecx, %ecx
	movl	$0, 14812(%ebx)
	jmp	L116
LFE144:
	.p2align 4,,15
	.def	_emulator_write_emulated;	.scl	3;	.type	32;	.endef
_emulator_write_emulated:
LFB146:
	.loc 1 1088 0
LVL158:
	subl	$48, %esp
LCFI42:
	.loc 1 1089 0
	movl	64(%esp), %eax
	.loc 1 1088 0
	movl	%edi, 40(%esp)
LCFI43:
	movl	%ebp, 44(%esp)
LCFI44:
	movl	%ebx, 32(%esp)
LCFI45:
	movl	%esi, 36(%esp)
LCFI46:
	.loc 1 1089 0
	movl	(%eax), %eax
	movl	%eax, 16(%esp)
LVL159:
	.loc 1 1090 0
	movl	52(%esp), %eax
	movl	%eax, 4(%esp)
	movl	16(%esp), %eax
	movl	%eax, (%esp)
	call	*13536(%eax)
	movl	%eax, %edi
LVL160:
	.loc 1 1092 0
	andl	%edx, %eax
LVL161:
	addl	$1, %eax
	.loc 1 1090 0
	movl	%edx, %ebp
LVL162:
	.loc 1 1092 0
	movl	$2, %edx
	je	L124
LVL163:
	.loc 1 1095 0
	movl	56(%esp), %eax
	movl	%eax, 28(%esp)
LVL164:
LBB271:
LBB272:
	.loc 1 1069 0
	movl	60(%esp), %eax
	movl	%eax, %edx
	movl	%eax, %ebx
	sarl	$31, %edx
	addl	$-1, %ebx
	movl	%edx, %esi
	movl	%edi, %eax
	adcl	$-1, %esi
	addl	%edi, %ebx
	adcl	%ebp, %esi
	movl	%ebp, %edx
	shrdl	$12, %esi, %ebx
	shrl	$12, %esi
	shrdl	$12, %edx, %eax
	movl	%esi, %ecx
	shrl	$12, %edx
	xorl	%ebx, %eax
	xorl	%edx, %ecx
	orl	%eax, %ecx
	je	L131
LVL165:
L125:
LBE272:
LBE271:
	.loc 1 1098 0
	movl	16(%esp), %ecx
LVL166:
	movl	$1, 14808(%ecx)
	.loc 1 1099 0
	movl	%edi, 14832(%ecx)
	movl	%ebp, 14836(%ecx)
	.loc 1 1100 0
	movl	60(%esp), %eax
LVL167:
	.loc 1 1101 0
	movl	$1, 14816(%ecx)
	.loc 1 1100 0
	movl	%eax, 14820(%ecx)
	.loc 1 1102 0
	movl	%eax, 8(%esp)
	leal	56(%esp), %eax
	movl	%eax, 4(%esp)
	movl	%ecx, %eax
	addl	$14824, %eax
	movl	%eax, (%esp)
	call	_memcpy
	xorl	%edx, %edx
LVL168:
L124:
	.loc 1 1105 0
	movl	%edx, %eax
	movl	32(%esp), %ebx
LVL169:
	movl	36(%esp), %esi
	movl	40(%esp), %edi
LVL170:
	movl	44(%esp), %ebp
LVL171:
	addl	$48, %esp
	ret
LVL172:
	.p2align 4,,7
L131:
LBB281:
LBB278:
	.loc 1 1071 0
	movl	16(%esp), %edx
	movl	%ebx, 24(%esp)
	movl	(%edx), %esi
LBB273:
LBB274:
	.loc 1 946 0
	movl	4(%esi), %ecx
	testl	%ecx, %ecx
	movl	%ecx, 20(%esp)
	jle	L125
	xorl	%ecx, %ecx
LVL173:
	xorl	%ebx, %ebx
LVL174:
	.p2align 4,,7
L128:
LBB275:
	.loc 1 949 0
	movl	8(%esi,%ebx), %edx
	cmpl	%edx, 24(%esp)
	jb	L126
	addl	12(%esi,%ebx), %edx
	cmpl	%edx, 24(%esp)
	.loc 1 947 0
	leal	(%ecx,%ecx,4), %eax
LVL175:
	leal	8(%esi,%eax,4), %eax
LVL176:
	.loc 1 949 0
	jb	L127
L126:
LBE275:
	.loc 1 946 0
	addl	$1, %ecx
	addl	$20, %ebx
	cmpl	20(%esp), %ecx
	jl	L128
	jmp	L125
	.p2align 4,,7
L127:
LBE274:
LBE273:
LBB276:
LBB277:
	.file 4 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h"
	.loc 4 438 0
	movl	24(%esp), %edx
	subl	(%eax), %edx
	movl	12(%eax), %eax
LVL177:
	movl	(%eax,%edx,4), %ebx
LVL178:
LBE277:
LBE276:
	.loc 1 1075 0
	movl	60(%esp), %eax
	movl	16(%esp), %edx
	movl	%edi, 4(%esp)
	movl	%ebp, 8(%esp)
	movl	%eax, 12(%esp)
	movl	%edx, (%esp)
	call	_kvm_mmu_pre_write
LVL179:
	.loc 1 1076 0
	movl	16(%esp), %edx
	movl	24(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	(%edx), %eax
	movl	%eax, (%esp)
	call	_mark_page_dirty
LBE278:
	.loc 1 1077 0
	movl	%ebx, (%esp)
	movl	$3, 4(%esp)
	call	_kmap_atomic
LBB279:
	.loc 1 1078 0
	movl	60(%esp), %ecx
	movl	%ecx, 8(%esp)
LBE279:
	.loc 1 1077 0
	movl	%eax, %ebx
LVL180:
LBB280:
	.loc 1 1078 0
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	%edi, %eax
LVL181:
	andl	$4095, %eax
	leal	(%ebx,%eax), %eax
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 1079 0
	movl	$3, 4(%esp)
	movl	%ebx, (%esp)
	call	_kunmap_atomic
	.loc 1 1080 0
	movl	16(%esp), %edx
	movl	60(%esp), %eax
	movl	%edi, 4(%esp)
LVL182:
	movl	%ebp, 8(%esp)
	movl	%edx, (%esp)
	movl	%eax, 12(%esp)
	call	_kvm_mmu_post_write
	xorl	%edx, %edx
	jmp	L124
LBE280:
LBE281:
LFE146:
	.section .rdata,"dr"
	.align 4
LC7:
	.ascii "<4>kvm: emulating exchange8b as write\12\0"
	.text
	.p2align 4,,15
	.def	_emulator_cmpxchg8b_emulated;	.scl	3;	.type	32;	.endef
_emulator_cmpxchg8b_emulated:
LFB148:
	.loc 1 1130 0
LVL183:
	subl	$32, %esp
LCFI47:
	.loc 1 1134 0
	movl	_reported.3230, %eax
	.loc 1 1130 0
	movl	%ebx, 16(%esp)
LCFI48:
	movl	48(%esp), %ebx
	movl	%esi, 20(%esp)
LCFI49:
	movl	56(%esp), %esi
	movl	%edi, 24(%esp)
LCFI50:
	movl	36(%esp), %edi
	.loc 1 1134 0
	testl	%eax, %eax
	.loc 1 1130 0
	movl	%ebp, 28(%esp)
LCFI51:
	.loc 1 1130 0
	movl	52(%esp), %ebp
	.loc 1 1134 0
	je	L136
LVL184:
L133:
	.loc 1 1138 0
	movl	%esi, 12(%esp)
	movl	$4, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	%edi, (%esp)
	call	_emulator_write_emulated
	.loc 1 1139 0
	testl	%eax, %eax
LVL185:
	je	L137
	.loc 1 1142 0
	movl	16(%esp), %ebx
LVL186:
LVL187:
	movl	20(%esp), %esi
LVL188:
	movl	24(%esp), %edi
LVL189:
	movl	28(%esp), %ebp
LVL190:
	addl	$32, %esp
	ret
LVL191:
	.p2align 4,,7
L137:
	.loc 1 1141 0
	leal	4(%edi), %eax
LVL192:
	.loc 1 1142 0
	movl	16(%esp), %ebx
LVL193:
	.loc 1 1141 0
	movl	%esi, 48(%esp)
	.loc 1 1142 0
	movl	24(%esp), %edi
LVL194:
	.loc 1 1141 0
	movl	%ebp, 40(%esp)
	.loc 1 1142 0
	movl	20(%esp), %esi
LVL195:
	.loc 1 1141 0
	movl	$4, 44(%esp)
	.loc 1 1142 0
	movl	28(%esp), %ebp
LVL196:
	.loc 1 1141 0
	movl	%eax, 36(%esp)
	.loc 1 1142 0
	addl	$32, %esp
	.loc 1 1141 0
	jmp	_emulator_write_emulated
LVL197:
	.p2align 4,,7
L136:
	.loc 1 1136 0
	movl	$LC7, (%esp)
	.loc 1 1135 0
	movl	$1, _reported.3230
	.loc 1 1136 0
	call	_printk
	jmp	L133
LFE148:
	.section .rdata,"dr"
	.align 4
LC8:
	.ascii "<4>kvm: emulating exchange as write\12\0"
	.text
	.p2align 4,,15
	.def	_emulator_cmpxchg_emulated;	.scl	3;	.type	32;	.endef
_emulator_cmpxchg_emulated:
LFB147:
	.loc 1 1112 0
LVL198:
	subl	$20, %esp
LCFI52:
	.loc 1 1115 0
	movl	_reported.3218, %eax
	.loc 1 1112 0
	movl	%ebx, 4(%esp)
LCFI53:
	movl	40(%esp), %ebx
	movl	%esi, 8(%esp)
LCFI54:
	movl	36(%esp), %esi
	movl	%edi, 12(%esp)
LCFI55:
	movl	32(%esp), %edi
	.loc 1 1115 0
	testl	%eax, %eax
	.loc 1 1112 0
	movl	%ebp, 16(%esp)
LCFI56:
	.loc 1 1112 0
	movl	24(%esp), %ebp
	.loc 1 1115 0
	jne	L139
LVL199:
	.loc 1 1116 0
	movl	$1, _reported.3218
	.loc 1 1117 0
	movl	$LC8, (%esp)
	call	_printk
L139:
	.loc 1 1119 0
	movl	%ebx, 36(%esp)
	.loc 1 1120 0
	movl	4(%esp), %ebx
LVL200:
	.loc 1 1119 0
	movl	%esi, 32(%esp)
	.loc 1 1120 0
	movl	8(%esp), %esi
LVL201:
	.loc 1 1119 0
	movl	%edi, 28(%esp)
	.loc 1 1120 0
	movl	12(%esp), %edi
LVL202:
	.loc 1 1119 0
	movl	%ebp, 24(%esp)
	.loc 1 1120 0
	movl	16(%esp), %ebp
LVL203:
	addl	$20, %esp
	.loc 1 1119 0
	jmp	_emulator_write_emulated
LFE147:
	.p2align 4,,15
.globl _fx_init
	.def	_fx_init;	.scl	2;	.type	32;	.endef
_fx_init:
LFB135:
	.loc 1 635 0
LVL204:
	subl	$12, %esp
LCFI57:
	.loc 1 635 0
	movl	16(%esp), %edx
	.loc 1 648 0
	movl	14800(%edx), %ecx
LBB282:
LBB283:
	.loc 4 648 0
/APP
 # 648 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	fxsave (%ecx)
 # 0 "" 2
/NO_APP
LBE283:
LBE282:
LBB284:
LBB285:
	.loc 4 658 0
/APP
 # 658 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	finit
 # 0 "" 2
/NO_APP
LBE285:
LBE284:
	.loc 1 650 0
	movl	14804(%edx), %eax
LBB286:
LBB287:
	.loc 4 648 0
/APP
 # 648 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	fxsave (%eax)
 # 0 "" 2
/NO_APP
LBE287:
LBE286:
LBB288:
LBB289:
	.loc 4 653 0
/APP
 # 653 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	fxrstor (%ecx)
 # 0 "" 2
/NO_APP
LBE289:
LBE288:
	.loc 1 654 0
	movl	$8064, 24(%eax)
	.loc 1 655 0
	movl	$480, 8(%esp)
	movl	$0, 4(%esp)
	movl	14804(%edx), %eax
	addl	$32, %eax
	movl	%eax, (%esp)
	call	_memset
	.loc 1 657 0
	addl	$12, %esp
	ret
LFE135:
	.section .rdata,"dr"
	.align 4
LC9:
	.ascii "<1>Can not allocate memory for func test\12\0"
	.text
	.p2align 4,,15
.globl _check_function_pointer_test
	.def	_check_function_pointer_test;	.scl	2;	.type	32;	.endef
_check_function_pointer_test:
LFB204:
	.loc 1 2847 0
	pushl	%ebx
LCFI58:
	subl	$12, %esp
LCFI59:
	.loc 1 2852 0
	movl	$208, 4(%esp)
	movl	$28, (%esp)
	call	_kmalloc
	.loc 1 2853 0
	testl	%eax, %eax
	.loc 1 2852 0
	movl	%eax, %ebx
	.loc 1 2853 0
	je	L147
	.loc 1 2858 0
	movl	$28, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 2860 0
	movl	$_test_1_t, (%ebx)
	.loc 1 2861 0
	movl	$_test_2_t, 4(%ebx)
	.loc 1 2863 0
	movl	$3, 8(%esp)
	movl	$2, 4(%esp)
	movl	$1, (%esp)
	call	*(%ebx)
	.loc 1 2864 0
	movl	$30, 8(%esp)
	movl	$20, 4(%esp)
	movl	$10, (%esp)
	call	*4(%ebx)
	.loc 1 2866 0
	movl	%ebx, (%esp)
	call	_kfree
	movl	$1, %eax
	.loc 1 2872 0
	addl	$12, %esp
	popl	%ebx
	ret
	.p2align 4,,7
L147:
	.loc 1 2854 0
	movl	$LC9, (%esp)
	call	_printk
	xorl	%eax, %eax
	.loc 1 2872 0
	addl	$12, %esp
	popl	%ebx
	ret
LFE204:
	.p2align 4,,15
.globl _kvm_exit_arch
	.def	_kvm_exit_arch;	.scl	2;	.type	32;	.endef
_kvm_exit_arch:
LFB199:
	.loc 1 2752 0
	subl	$16, %esp
LCFI60:
	.loc 1 2765 0
	movl	_kvm_arch_ops, %eax
	movl	$1, 12(%esp)
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	_on_each_cpu
	.loc 1 2766 0
	movl	_kvm_arch_ops, %eax
	call	*20(%eax)
	.loc 1 2767 0
	movl	$0, _kvm_arch_ops
	.loc 1 2771 0
	addl	$16, %esp
	ret
LFE199:
	.section .rdata,"dr"
LC10:
	.ascii "<3>starting kvm_init_arch\12\0"
	.align 4
LC11:
	.ascii "<3>winkvm: already loaded the other module\12\0"
	.align 4
LC12:
	.ascii "<3>winkvm: no hardware support\12\0"
LC13:
	.ascii "<3>kvm: disabled by bios\12\0"
LC14:
	.ascii "<3>start kvm arch ops...\12\0"
	.align 4
LC15:
	.ascii "<3>Could not enable HVM hardware setup\12\0"
LC16:
	.ascii "<1>end\12\0"
	.text
	.p2align 4,,15
.globl _kvm_init_arch
	.def	_kvm_init_arch;	.scl	2;	.type	32;	.endef
_kvm_init_arch:
LFB198:
	.loc 1 2651 0
LVL205:
	pushl	%ebx
LCFI61:
	subl	$16, %esp
LCFI62:
	.loc 1 2651 0
	movl	24(%esp), %ebx
	.loc 1 2716 0
	movl	$LC10, (%esp)
	call	_printk
	.loc 1 2718 0
	movl	_kvm_arch_ops, %eax
	testl	%eax, %eax
	jne	L157
LVL206:
	.loc 1 2723 0
	call	*(%ebx)
	testl	%eax, %eax
	.p2align 4,,2
	je	L158
	.loc 1 2728 0
	.p2align 4,,9
	call	*4(%ebx)
	testl	%eax, %eax
	.p2align 4,,7
	jne	L159
	.loc 1 2733 0
	movl	%ebx, _kvm_arch_ops
	.loc 1 2735 0
	movl	$LC14, (%esp)
	call	_printk
	.loc 1 2736 0
	movl	_kvm_arch_ops, %eax
	call	*16(%eax)
	.loc 1 2737 0
	testl	%eax, %eax
LVL207:
	.loc 1 2736 0
	movl	%eax, %ebx
LVL208:
	.loc 1 2737 0
	js	L160
	.loc 1 2742 0
	movl	_kvm_arch_ops, %eax
	movl	$1, 12(%esp)
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_on_each_cpu
	.loc 1 2744 0
	movl	$LC16, (%esp)
	call	_printk
L152:
	.loc 1 2749 0
	movl	%ebx, %eax
	addl	$16, %esp
	popl	%ebx
LVL209:
	ret
LVL210:
	.p2align 4,,7
L160:
	.loc 1 2738 0
	movl	$LC15, (%esp)
	call	_printk
	.loc 1 2749 0
	movl	%ebx, %eax
	addl	$16, %esp
	popl	%ebx
LVL211:
	ret
LVL212:
	.p2align 4,,7
L157:
	.loc 1 2719 0
	movl	$-17, %ebx
LVL213:
	movl	$LC11, (%esp)
	call	_printk
	.loc 1 2749 0
	movl	%ebx, %eax
	addl	$16, %esp
	popl	%ebx
LVL214:
	ret
LVL215:
	.p2align 4,,7
L158:
	.loc 1 2724 0
	movl	$LC12, (%esp)
	movl	$-95, %ebx
LVL216:
	call	_printk
	jmp	L152
LVL217:
	.p2align 4,,7
L159:
	.loc 1 2729 0
	movl	$LC13, (%esp)
	movl	$-95, %ebx
LVL218:
	call	_printk
	jmp	L152
LFE198:
	.p2align 4,,15
	.def	_kvm_vcpu_release;	.scl	3;	.type	32;	.endef
_kvm_vcpu_release:
LFB186:
	.loc 1 2050 0
LVL219:
	subl	$4, %esp
LCFI63:
	.loc 1 2053 0
	movl	12(%esp), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	movl	16063(%eax), %eax
	movl	%eax, (%esp)
	call	_fput
	.loc 1 2055 0
	xorl	%eax, %eax
	addl	$4, %esp
	ret
LFE186:
	.p2align 4,,15
	.def	_kvm_vm_nopage;	.scl	3;	.type	32;	.endef
_kvm_vm_nopage:
LFB191:
	.loc 1 2357 0
LVL220:
	pushl	%ebp
LCFI64:
	pushl	%edi
LCFI65:
	pushl	%esi
LCFI66:
	pushl	%ebx
LCFI67:
	subl	$4, %esp
LCFI68:
	.loc 1 2357 0
	movl	24(%esp), %eax
	movl	28(%esp), %edi
LVL221:
	.loc 1 2358 0
	movl	28(%eax), %edx
	movl	(%edx), %esi
LVL222:
	.loc 1 2363 0
	movl	32(%esp), %edx
	movl	$0, (%edx)
LBB290:
LBB291:
	.loc 1 946 0
	movl	4(%esi), %ebp
LBE291:
LBE290:
	.loc 1 2364 0
	subl	4(%eax), %edi
	shrl	$12, %edi
	addl	(%eax), %edi
LBB294:
LBB293:
	.loc 1 946 0
	testl	%ebp, %ebp
	jle	L164
LVL223:
	xorl	%ecx, %ecx
LVL224:
	xorl	%ebx, %ebx
LVL225:
	.p2align 4,,7
L167:
LBB292:
	.loc 1 949 0
	movl	8(%esi,%ebx), %edx
	cmpl	%edx, %edi
	jb	L165
	addl	12(%esi,%ebx), %edx
	.loc 1 947 0
	leal	(%ecx,%ecx,4), %eax
LVL226:
	leal	8(%esi,%eax,4), %eax
LVL227:
	.loc 1 949 0
	cmpl	%edx, %edi
	jb	L166
LVL228:
L165:
LBE292:
	.loc 1 946 0
	addl	$1, %ecx
	addl	$20, %ebx
	cmpl	%ebp, %ecx
	jl	L167
LVL229:
L164:
LBE293:
LBE294:
	.loc 1 2372 0
	xorl	%ebx, %ebx
LVL230:
L168:
	.loc 1 2373 0
	addl	$4, %esp
	movl	%ebx, %eax
LVL231:
	popl	%ebx
LVL232:
	popl	%esi
LVL233:
	popl	%edi
LVL234:
	popl	%ebp
	ret
LVL235:
	.p2align 4,,7
L166:
LBB295:
LBB296:
	.loc 4 438 0
	subl	(%eax), %edi
	movl	12(%eax), %eax
LVL236:
	movl	(%eax,%edi,4), %ebx
LVL237:
LBE296:
LBE295:
	.loc 1 2369 0
	testl	%ebx, %ebx
	je	L168
	.loc 1 2371 0
	movl	%ebx, (%esp)
	call	_get_page
LVL238:
	.loc 1 2373 0
	addl	$4, %esp
	movl	%ebx, %eax
	popl	%ebx
LVL239:
	popl	%esi
LVL240:
	popl	%edi
LVL241:
	popl	%ebp
	ret
LFE191:
	.p2align 4,,15
	.def	_load_pdptrs;	.scl	3;	.type	32;	.endef
_load_pdptrs:
LFB129:
	.loc 1 446 0
LVL242:
	pushl	%ebp
LCFI69:
	pushl	%edi
LCFI70:
	.loc 1 447 0
	movl	%edx, %edi
LVL243:
	.loc 1 446 0
	pushl	%esi
LCFI71:
	pushl	%ebx
LCFI72:
	.loc 1 448 0
	shrl	$3, %edx
LVL244:
	.loc 1 446 0
	subl	$16, %esp
LCFI73:
	.loc 1 448 0
	andl	$508, %edx
	.loc 1 446 0
	movl	%eax, 8(%esp)
	.loc 1 447 0
	shrl	$12, %edi
	.loc 1 448 0
	movl	%edx, 12(%esp)
LVL245:
	.loc 1 455 0
	movl	(%eax), %eax
LVL246:
	movl	%eax, (%esp)
	call	_spin_lock
LVL247:
	.loc 1 456 0
	movl	8(%esp), %eax
	movl	(%eax), %ebx
LBB297:
LBB298:
	.loc 1 946 0
	movl	4(%ebx), %ebp
	testl	%ebp, %ebp
	jle	L172
LVL248:
	xorl	%edx, %edx
LVL249:
	xorl	%ecx, %ecx
LVL250:
	.p2align 4,,7
L175:
LBB299:
	.loc 1 947 0
	leal	(%edx,%edx,4), %eax
	leal	8(%ebx,%eax,4), %esi
	.loc 1 949 0
	movl	8(%ebx,%ecx), %eax
	cmpl	%eax, %edi
	jb	L173
	addl	12(%ebx,%ecx), %eax
	cmpl	%eax, %edi
	jb	L174
L173:
LBE299:
	.loc 1 946 0
	addl	$1, %edx
	addl	$20, %ecx
	cmpl	%ebp, %edx
	jl	L175
L172:
	xorl	%esi, %esi
L174:
LBE298:
LBE297:
	.loc 1 458 0
	movl	$3, 4(%esp)
	movl	12(%esi), %eax
	xorl	%ebx, %ebx
LVL251:
	subl	(%esi), %edi
	movl	(%eax,%edi,4), %eax
	movl	%eax, (%esp)
	call	_kmap_atomic
LVL252:
	movl	12(%esp), %edx
	leal	(%eax,%edx,8), %esi
LVL253:
	movl	%eax, %edi
LVL254:
	movl	%esi, %ecx
LVL255:
L178:
	.loc 1 462 0
	movl	(%ecx), %eax
	movl	4(%ecx), %edx
	.loc 1 463 0
	testb	$1, %al
	je	L176
	andl	$486, %eax
	andl	$-16, %edx
	orl	%eax, %edx
LVL256:
	jne	L184
LVL257:
L176:
	.loc 1 461 0
	addl	$1, %ebx
	addl	$8, %ecx
	cmpl	$4, %ebx
	jne	L178
	xorl	%ecx, %ecx
LVL258:
L179:
	.loc 1 470 0
	movl	(%esi), %eax
LVL259:
	movl	4(%esi), %edx
LVL260:
	.loc 1 469 0
	addl	$8, %esi
	.loc 1 470 0
	movl	8(%esp), %ebx
	movl	%eax, 136(%ebx,%ecx,8)
	movl	%edx, 140(%ebx,%ecx,8)
	.loc 1 469 0
	addl	$1, %ecx
	cmpl	$4, %ecx
	jne	L179
	movl	$1, %ebx
LVL261:
L177:
	.loc 1 473 0
	movl	%edi, (%esp)
	movl	$3, 4(%esp)
	call	_kunmap_atomic
LVL262:
	.loc 1 474 0
	movl	8(%esp), %edx
	movl	(%edx), %eax
	movl	%eax, (%esp)
	call	_spin_unlock
	.loc 1 477 0
	addl	$16, %esp
	movl	%ebx, %eax
	popl	%ebx
LVL263:
	popl	%esi
	popl	%edi
LVL264:
	popl	%ebp
	ret
LVL265:
L184:
	.loc 1 463 0
	xorl	%ebx, %ebx
LVL266:
	jmp	L177
LFE129:
	.section .rdata,"dr"
	.align 4
LC17:
	.ascii "<7>set_cr3: #GP, reserved bits\12\0"
	.align 4
LC18:
	.ascii "<7>set_cr3: #GP, pdptrs reserved bits\12\0"
	.text
	.p2align 4,,15
.globl _set_cr3
	.def	_set_cr3;	.scl	2;	.type	32;	.endef
_set_cr3:
LFB133:
	.loc 1 582 0
LVL267:
	pushl	%ebp
LCFI74:
	pushl	%edi
LCFI75:
	pushl	%esi
LCFI76:
	pushl	%ebx
LCFI77:
	subl	$8, %esp
LCFI78:
	.loc 1 582 0
	movl	32(%esp), %ebx
	movl	28(%esp), %ebp
	.loc 1 590 0
	testb	$7, %bl
	jne	L196
LVL268:
	.loc 1 595 0
	movl	96(%ebp), %eax
	testl	%eax, %eax
	js	L197
L187:
	.loc 1 605 0
	movl	(%ebp), %eax
	.loc 1 615 0
	movl	%ebx, %esi
	.loc 1 604 0
	movl	%ebx, 104(%ebp)
	.loc 1 615 0
	shrl	$12, %esi
	.loc 1 605 0
	movl	%eax, (%esp)
	call	_spin_lock
	.loc 1 615 0
	movl	(%ebp), %ebx
LVL269:
LBB300:
LBB301:
	.loc 1 946 0
	movl	4(%ebx), %edi
	testl	%edi, %edi
	jle	L188
	xorl	%edx, %edx
LVL270:
	xorl	%ecx, %ecx
	.p2align 4,,7
L191:
LBB302:
	.loc 1 949 0
	movl	8(%ebx,%ecx), %eax
	cmpl	%eax, %esi
	jb	L189
	addl	12(%ebx,%ecx), %eax
	cmpl	%eax, %esi
	jb	L190
L189:
LBE302:
	.loc 1 946 0
	addl	$1, %edx
	addl	$20, %ecx
	cmpl	%edi, %edx
	jl	L191
L188:
LBE301:
LBE300:
LBB303:
LBB304:
	.loc 1 439 0
	movl	_kvm_arch_ops, %eax
	movl	$0, 4(%esp)
	movl	%ebp, (%esp)
	call	*148(%eax)
LVL271:
	jmp	L192
LVL272:
	.p2align 4,,7
L197:
LBE304:
LBE303:
	.loc 1 595 0
	testb	$32, 128(%ebp)
	je	L187
	movl	%ebx, %edx
	movl	%ebp, %eax
	call	_load_pdptrs
	testl	%eax, %eax
	jne	L187
	.loc 1 597 0
	movl	$LC18, (%esp)
	jmp	L195
	.p2align 4,,7
L196:
	.loc 1 591 0
	movl	$LC17, (%esp)
L195:
	.loc 1 597 0
	call	_printk
LBB305:
LBB306:
	.loc 1 439 0
	movl	_kvm_arch_ops, %eax
	movl	%ebp, 28(%esp)
	movl	$0, 32(%esp)
	movl	148(%eax), %ecx
LBE306:
LBE305:
	.loc 1 620 0
	addl	$8, %esp
	popl	%ebx
LVL273:
	popl	%esi
	popl	%edi
	popl	%ebp
LVL274:
LBB308:
LBB307:
	.loc 1 439 0
	jmp	*%ecx
LVL275:
	.p2align 4,,7
L190:
LBE307:
LBE308:
	.loc 1 618 0
	movl	%ebp, (%esp)
	call	*13524(%ebp)
LVL276:
L192:
	.loc 1 619 0
	movl	(%ebp), %eax
	movl	%eax, 28(%esp)
	.loc 1 620 0
	addl	$8, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
LVL277:
	.loc 1 619 0
	jmp	_spin_unlock
LFE133:
	.p2align 4,,15
.globl _create_vcpu_fd
	.def	_create_vcpu_fd;	.scl	2;	.type	32;	.endef
_create_vcpu_fd:
LFB187:
	.loc 1 2067 0
LVL278:
	subl	$32, %esp
LCFI79:
	movl	%ebp, 28(%esp)
LCFI80:
	movl	36(%esp), %ebp
	movl	%ebx, 16(%esp)
LCFI81:
	movl	%esi, 20(%esp)
LCFI82:
	movl	%edi, 24(%esp)
LCFI83:
	.loc 1 2074 0
	movl	(%ebp), %eax
	movl	16063(%eax), %eax
	addl	$12, %eax
	movl	%eax, 12(%esp)
LVL279:
LBB309:
LBB310:
	.loc 3 458 0
/APP
 # 458 "include/asm/winkvmmisc.h" 1
	lock; incl 12(%esp)
 # 0 "" 2
LVL280:
/NO_APP
LBE310:
LBE309:
LBB311:
	.loc 1 143 0
	call	_new_inode
LBB312:
	.loc 1 145 0
	movl	$-12, %ebx
LVL281:
	testl	%eax, %eax
LVL282:
LBE312:
	.loc 1 143 0
	movl	%eax, %edi
LVL283:
LBB313:
	.loc 1 145 0
	je	L200
LVL284:
LBE313:
LBE311:
	.loc 1 2077 0
	cmpl	$-4096, %eax
	movl	%eax, %ebx
	jbe	L208
LVL285:
L200:
	.loc 1 2106 0
	movl	(%ebp), %eax
	movl	16063(%eax), %eax
	movl	%eax, (%esp)
	call	_fput
L206:
	.loc 1 2108 0
	movl	%ebx, %eax
	movl	20(%esp), %esi
LVL286:
	movl	16(%esp), %ebx
LVL287:
	movl	24(%esp), %edi
LVL288:
	movl	28(%esp), %ebp
LVL289:
	addl	$32, %esp
	ret
LVL290:
	.p2align 4,,7
L208:
LBB314:
	.loc 1 161 0
	call	_get_empty_filp
LVL291:
LBB316:
	.loc 1 163 0
	movl	$-23, %ebx
	testl	%eax, %eax
LVL292:
LBE316:
	.loc 1 161 0
	movl	%eax, %esi
LVL293:
LBB317:
	.loc 1 163 0
	je	L203
	.loc 1 179 0
	movl	$24, 8(%esp)
LBE317:
LBE314:
	.loc 1 2087 0
	movl	%esi, %ebx
LBB319:
LBB315:
	.loc 1 179 0
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
LBE315:
LBE319:
	.loc 1 2087 0
	cmpl	$-4096, %esi
LBB320:
LBB318:
	.loc 1 180 0
	movl	%ebp, (%esi)
	.loc 1 181 0
	movl	$0, 4(%esi)
	.loc 1 182 0
	movl	%edi, 16(%esi)
LBE318:
LBE320:
	.loc 1 2087 0
	jbe	L209
L203:
	.loc 1 2104 0
	movl	%edi, (%esp)
	call	_iput
	jmp	L200
	.p2align 4,,7
L209:
	.loc 1 2092 0
	.p2align 4,,6
	call	_get_unused_fd
	.loc 1 2093 0
	testl	%eax, %eax
	.loc 1 2092 0
	movl	%eax, %ebx
	.loc 1 2093 0
	.p2align 4,,4
	js	L205
	.loc 1 2096 0
	movl	%esi, 4(%esp)
	movl	%eax, (%esp)
	call	_fd_install
	jmp	L206
	.p2align 4,,7
L205:
	.loc 1 2102 0
	movl	%esi, (%esp)
	call	_fput
	.p2align 4,,6
	jmp	L203
LFE187:
	.p2align 4,,15
	.def	_vcpu_load;	.scl	3;	.type	32;	.endef
_vcpu_load:
LFB116:
	.loc 1 305 0
LVL294:
	pushl	%ebx
LCFI84:
	movl	%eax, %ebx
	subl	$4, %esp
LCFI85:
	.loc 1 306 0
	leal	8(%eax), %eax
LVL295:
	movl	%eax, (%esp)
	call	_mutex_lock
	.loc 1 307 0
	movl	_kvm_arch_ops, %eax
	movl	%ebx, (%esp)
	call	*32(%eax)
	.loc 1 308 0
	addl	$4, %esp
	popl	%ebx
LVL296:
	ret
LFE116:
	.p2align 4,,15
	.def	_vcpu_put;	.scl	3;	.type	32;	.endef
_vcpu_put:
LFB118:
	.loc 1 328 0
LVL297:
	pushl	%ebx
LCFI86:
	movl	%eax, %ebx
	subl	$4, %esp
LCFI87:
	.loc 1 329 0
	movl	%eax, (%esp)
	movl	_kvm_arch_ops, %eax
LVL298:
	call	*36(%eax)
	.loc 1 330 0
	leal	8(%ebx), %eax
	movl	%eax, (%esp)
	call	_mutex_unlock
	.loc 1 331 0
	addl	$4, %esp
	popl	%ebx
LVL299:
	ret
LFE118:
	.p2align 4,,15
	.def	_kvm_free_vcpu;	.scl	3;	.type	32;	.endef
_kvm_free_vcpu:
LFB123:
	.loc 1 396 0
LVL300:
	pushl	%ebx
LCFI88:
	movl	%eax, %ebx
	subl	$4, %esp
LCFI89:
	.loc 1 397 0
	movl	4(%eax), %eax
LVL301:
	testl	%eax, %eax
	je	L216
	.loc 1 400 0
	movl	%ebx, %eax
	call	_vcpu_load
	.loc 1 401 0
	movl	%ebx, (%esp)
	call	_kvm_mmu_destroy
	.loc 1 402 0
	movl	%ebx, %eax
	call	_vcpu_put
	.loc 1 403 0
	movl	_kvm_arch_ops, %eax
	movl	%ebx, (%esp)
	call	*28(%eax)
L216:
	.loc 1 404 0
	addl	$4, %esp
	popl	%ebx
LVL302:
	ret
LFE123:
	.p2align 4,,15
.globl _kvm_vcpu_ioctl_interrupt
	.def	_kvm_vcpu_ioctl_interrupt;	.scl	2;	.type	32;	.endef
_kvm_vcpu_ioctl_interrupt:
LFB184:
	.loc 1 2022 0
LVL303:
	subl	$8, %esp
LCFI90:
	.loc 1 2023 0
	movl	$-22, %eax
	.loc 1 2022 0
	movl	%ebx, (%esp)
LCFI91:
	movl	16(%esp), %ebx
	movl	%esi, 4(%esp)
LCFI92:
	.loc 1 2022 0
	movl	12(%esp), %esi
	.loc 1 2023 0
	cmpl	$255, 4(%ebx)
	ja	L219
LVL304:
	.loc 1 2025 0
	movl	%esi, %eax
	call	_vcpu_load
	.loc 1 2027 0
	movl	4(%ebx), %edx
LBB321:
LBB322:
	.loc 2 291 0
	leal	28(%esi), %eax
/APP
 # 291 "include/linux/winkvmstab.h" 1
	lock; btsl %edx,28(%esi)
 # 0 "" 2
/NO_APP
LBE322:
LBE321:
	.loc 1 2028 0
	movl	4(%ebx), %eax
LBB323:
LBB324:
	.loc 2 291 0
	leal	24(%esi), %edx
LBE324:
LBE323:
	.loc 1 2028 0
	shrl	$5, %eax
LBB326:
LBB325:
	.loc 2 291 0
/APP
 # 291 "include/linux/winkvmstab.h" 1
	lock; btsl %eax,24(%esi)
 # 0 "" 2
/NO_APP
LBE325:
LBE326:
	.loc 1 2030 0
	movl	%esi, %eax
	call	_vcpu_put
	xorl	%eax, %eax
L219:
	.loc 1 2033 0
	movl	(%esp), %ebx
LVL305:
	movl	4(%esp), %esi
LVL306:
	addl	$8, %esp
	ret
LFE184:
	.p2align 4,,15
.globl _kvm_vcpu_ioctl_translate
	.def	_kvm_vcpu_ioctl_translate;	.scl	2;	.type	32;	.endef
_kvm_vcpu_ioctl_translate:
LFB183:
	.loc 1 2003 0
LVL307:
	subl	$20, %esp
LCFI93:
	movl	%esi, 12(%esp)
LCFI94:
	movl	24(%esp), %esi
	movl	%ebx, 8(%esp)
LCFI95:
	movl	28(%esp), %ebx
	movl	%edi, 16(%esp)
LCFI96:
	.loc 1 2007 0
	movl	%esi, %eax
	.loc 1 2004 0
	movl	4(%ebx), %edi
LVL308:
	.loc 1 2007 0
	call	_vcpu_load
	.loc 1 2008 0
	movl	(%esi), %eax
	movl	%eax, (%esp)
	call	_spin_lock
	.loc 1 2009 0
	movl	%edi, 4(%esp)
	movl	%esi, (%esp)
	call	*13536(%esi)
	.loc 1 2012 0
	movb	$1, 21(%ebx)
	.loc 1 2013 0
	movb	$0, 22(%ebx)
	.loc 1 2010 0
	movl	%eax, 12(%ebx)
LVL309:
	.loc 1 2011 0
	andl	%edx, %eax
LVL310:
	addl	$1, %eax
LVL311:
	setne	20(%ebx)
	.loc 1 2010 0
	movl	%edx, 16(%ebx)
	.loc 1 2014 0
	movl	(%esi), %eax
	movl	%eax, (%esp)
	call	_spin_unlock
LVL312:
	.loc 1 2015 0
	movl	%esi, %eax
	call	_vcpu_put
	.loc 1 2018 0
	xorl	%eax, %eax
	movl	8(%esp), %ebx
	movl	12(%esp), %esi
	movl	16(%esp), %edi
LVL313:
	addl	$20, %esp
	ret
LFE183:
	.p2align 4,,15
.globl _kvm_vcpu_ioctl_get_sregs
	.def	_kvm_vcpu_ioctl_get_sregs;	.scl	2;	.type	32;	.endef
_kvm_vcpu_ioctl_get_sregs:
LFB175:
	.loc 1 1756 0
LVL314:
	pushl	%edi
LCFI97:
	pushl	%esi
LCFI98:
	pushl	%ebx
LCFI99:
	subl	$20, %esp
LCFI100:
	.loc 1 1756 0
	movl	36(%esp), %esi
	.loc 1 1773 0
	leal	14(%esp), %edi
	.loc 1 1756 0
	movl	40(%esp), %ebx
	.loc 1 1761 0
	movl	%esi, %eax
	call	_vcpu_load
LBB327:
LBB328:
	.loc 1 1751 0
	leal	4(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	movl	%esi, (%esp)
	movl	$0, 8(%esp)
	call	*60(%eax)
LBE328:
LBE327:
LBB329:
LBB330:
	leal	28(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	movl	%esi, (%esp)
	movl	$1, 8(%esp)
	call	*60(%eax)
LBE330:
LBE329:
LBB331:
LBB332:
	leal	52(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	movl	%esi, (%esp)
	movl	$2, 8(%esp)
	call	*60(%eax)
LBE332:
LBE331:
LBB333:
LBB334:
	leal	76(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	movl	%esi, (%esp)
	movl	$3, 8(%esp)
	call	*60(%eax)
LBE334:
LBE333:
LBB335:
LBB336:
	leal	100(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	movl	%esi, (%esp)
	movl	$4, 8(%esp)
	call	*60(%eax)
LBE336:
LBE335:
LBB337:
LBB338:
	leal	124(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	movl	%esi, (%esp)
	movl	$5, 8(%esp)
	call	*60(%eax)
LBE338:
LBE337:
LBB339:
LBB340:
	leal	148(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	movl	%esi, (%esp)
	movl	$6, 8(%esp)
	call	*60(%eax)
LBE340:
LBE339:
LBB341:
LBB342:
	leal	172(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	movl	%esi, (%esp)
	movl	$7, 8(%esp)
	call	*60(%eax)
LBE342:
LBE341:
	.loc 1 1773 0
	movl	_kvm_arch_ops, %eax
	movl	%edi, 4(%esp)
	movl	%esi, (%esp)
	call	*96(%eax)
	.loc 1 1774 0
	movzwl	14(%esp), %eax
	movw	%ax, 220(%ebx)
	.loc 1 1775 0
	movl	16(%esp), %eax
	movl	$0, 216(%ebx)
	movl	%eax, 212(%ebx)
	.loc 1 1776 0
	movl	_kvm_arch_ops, %eax
	movl	%edi, 4(%esp)
	movl	%esi, (%esp)
	call	*104(%eax)
	.loc 1 1777 0
	movzwl	14(%esp), %eax
	movw	%ax, 204(%ebx)
	.loc 1 1778 0
	movl	16(%esp), %eax
	movl	$0, 200(%ebx)
	movl	%eax, 196(%ebx)
	.loc 1 1780 0
	movl	_kvm_arch_ops, %eax
	movl	%esi, (%esp)
	call	*72(%eax)
	.loc 1 1781 0
	movl	96(%esi), %eax
	movl	$0, 232(%ebx)
	movl	%eax, 228(%ebx)
	.loc 1 1782 0
	movl	100(%esi), %eax
	movl	$0, 240(%ebx)
	movl	%eax, 236(%ebx)
	.loc 1 1783 0
	movl	104(%esi), %eax
	movl	$0, 248(%ebx)
	movl	%eax, 244(%ebx)
	.loc 1 1784 0
	movl	128(%esi), %eax
	movl	$0, 256(%ebx)
	movl	%eax, 252(%ebx)
	.loc 1 1785 0
	movl	132(%esi), %eax
	movl	$0, 264(%ebx)
	movl	%eax, 260(%ebx)
	.loc 1 1786 0
	movl	168(%esi), %eax
	movl	172(%esi), %edx
	movl	%eax, 268(%ebx)
	movl	%edx, 272(%ebx)
	.loc 1 1787 0
	movl	176(%esi), %eax
	movl	180(%esi), %edx
	movl	%eax, 276(%ebx)
	.loc 1 1789 0
	leal	28(%esi), %eax
	.loc 1 1787 0
	movl	%edx, 280(%ebx)
	.loc 1 1789 0
	addl	$284, %ebx
	movl	%ebx, (%esp)
	movl	$32, 8(%esp)
	movl	%eax, 4(%esp)
	call	_memcpy
	.loc 1 1792 0
	movl	%esi, %eax
	call	_vcpu_put
	.loc 1 1797 0
	addl	$20, %esp
	xorl	%eax, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	ret
LFE175:
	.p2align 4,,15
.globl _kvm_vcpu_ioctl_set_regs
	.def	_kvm_vcpu_ioctl_set_regs;	.scl	2;	.type	32;	.endef
_kvm_vcpu_ioctl_set_regs:
LFB173:
	.loc 1 1713 0
LVL315:
	pushl	%esi
LCFI101:
	pushl	%ebx
LCFI102:
	subl	$8, %esp
LCFI103:
	.loc 1 1713 0
	movl	20(%esp), %esi
	movl	24(%esp), %ebx
	.loc 1 1715 0
	movl	%esi, %eax
	call	_vcpu_load
	.loc 1 1717 0
	movl	4(%ebx), %eax
	movl	%eax, 60(%esi)
	.loc 1 1718 0
	movl	12(%ebx), %eax
	movl	%eax, 72(%esi)
	.loc 1 1719 0
	movl	20(%ebx), %eax
	movl	%eax, 64(%esi)
	.loc 1 1720 0
	movl	28(%ebx), %eax
	movl	%eax, 68(%esi)
	.loc 1 1721 0
	movl	36(%ebx), %eax
	movl	%eax, 84(%esi)
	.loc 1 1722 0
	movl	44(%ebx), %eax
	movl	%eax, 88(%esi)
	.loc 1 1723 0
	movl	52(%ebx), %eax
	movl	%eax, 76(%esi)
	.loc 1 1724 0
	movl	60(%ebx), %eax
	movl	%eax, 80(%esi)
	.loc 1 1736 0
	movl	132(%ebx), %eax
	movl	%eax, 92(%esi)
	.loc 1 1737 0
	movl	140(%ebx), %eax
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	call	*132(%eax)
	.loc 1 1739 0
	movl	_kvm_arch_ops, %eax
	movl	%esi, (%esp)
	call	*124(%eax)
	.loc 1 1741 0
	movl	%esi, %eax
	call	_vcpu_put
	.loc 1 1746 0
	addl	$8, %esp
	xorl	%eax, %eax
	popl	%ebx
	popl	%esi
	ret
LFE173:
	.p2align 4,,15
.globl _kvm_vcpu_ioctl_get_regs
	.def	_kvm_vcpu_ioctl_get_regs;	.scl	2;	.type	32;	.endef
_kvm_vcpu_ioctl_get_regs:
LFB172:
	.loc 1 1670 0
LVL316:
	pushl	%esi
LCFI104:
	pushl	%ebx
LCFI105:
	subl	$4, %esp
LCFI106:
	.loc 1 1670 0
	movl	16(%esp), %ebx
	movl	20(%esp), %esi
	.loc 1 1672 0
	movl	%ebx, %eax
	call	_vcpu_load
	.loc 1 1674 0
	movl	_kvm_arch_ops, %eax
	movl	%ebx, (%esp)
	call	*120(%eax)
	.loc 1 1676 0
	movl	60(%ebx), %eax
	movl	$0, 8(%esi)
	movl	%eax, 4(%esi)
	.loc 1 1677 0
	movl	72(%ebx), %eax
	movl	$0, 16(%esi)
	movl	%eax, 12(%esi)
	.loc 1 1678 0
	movl	64(%ebx), %eax
	movl	$0, 24(%esi)
	movl	%eax, 20(%esi)
	.loc 1 1679 0
	movl	68(%ebx), %eax
	movl	$0, 32(%esi)
	movl	%eax, 28(%esi)
	.loc 1 1680 0
	movl	84(%ebx), %eax
	movl	$0, 40(%esi)
	movl	%eax, 36(%esi)
	.loc 1 1681 0
	movl	88(%ebx), %eax
	movl	$0, 48(%esi)
	movl	%eax, 44(%esi)
	.loc 1 1682 0
	movl	76(%ebx), %eax
	movl	$0, 56(%esi)
	movl	%eax, 52(%esi)
	.loc 1 1683 0
	movl	80(%ebx), %eax
	movl	$0, 64(%esi)
	movl	%eax, 60(%esi)
	.loc 1 1695 0
	movl	92(%ebx), %eax
	movl	$0, 136(%esi)
	movl	%eax, 132(%esi)
	.loc 1 1696 0
	movl	_kvm_arch_ops, %eax
	movl	%ebx, (%esp)
	call	*128(%eax)
	movl	$0, 144(%esi)
	movl	%eax, 140(%esi)
	.loc 1 1701 0
	movl	13736(%ebx), %ecx
	testl	%ecx, %ecx
	je	L228
LVL317:
	movl	13756(%ebx), %edx
	testl	%edx, %edx
	je	L228
	.loc 1 1702 0
	andl	$-65793, %eax
	movl	%eax, 140(%esi)
L228:
	.loc 1 1704 0
	movl	%ebx, %eax
	call	_vcpu_put
	.loc 1 1709 0
	addl	$4, %esp
	xorl	%eax, %eax
	popl	%ebx
LVL318:
	popl	%esi
LVL319:
	ret
LFE172:
	.p2align 4,,15
	.def	_kvm_free_physmem_slot;	.scl	3;	.type	32;	.endef
_kvm_free_physmem_slot:
LFB121:
	.loc 1 368 0
LVL320:
	pushl	%edi
LCFI107:
	movl	%edx, %edi
	pushl	%esi
LCFI108:
	movl	%eax, %esi
	pushl	%ebx
LCFI109:
	subl	$4, %esp
LCFI110:
	.loc 1 371 0
	testl	%edx, %edx
	je	L243
LVL321:
	movl	12(%eax), %eax
	cmpl	12(%edx), %eax
	je	L233
L232:
	.loc 1 372 0
	testl	%eax, %eax
	je	L234
	.loc 1 373 0
	movl	4(%esi), %ebx
	movl	%eax, %edx
LVL322:
	testl	%ebx, %ebx
	je	L236
	movl	%eax, %edx
	xorl	%ebx, %ebx
LVL323:
	xorl	%eax, %eax
	.p2align 4,,7
L238:
	.loc 1 374 0
	movl	(%edx,%eax,4), %eax
	testl	%eax, %eax
	je	L237
	.loc 1 375 0
	movl	%eax, (%esp)
	call	___free_page
	movl	12(%esi), %edx
L237:
	.loc 1 373 0
	addl	$1, %ebx
	cmpl	%ebx, 4(%esi)
	movl	%ebx, %eax
	ja	L238
L236:
	.loc 1 376 0
	movl	%edx, (%esp)
	call	_vfree
LVL324:
L234:
	.loc 1 379 0
	testl	%edi, %edi
	je	L244
L233:
	movl	16(%esi), %eax
	cmpl	16(%edi), %eax
	je	L240
L239:
	.loc 1 380 0
	movl	%eax, (%esp)
	call	_vfree
LVL325:
L240:
	.loc 1 382 0
	movl	$0, 12(%esi)
	.loc 1 383 0
	movl	$0, 4(%esi)
	.loc 1 384 0
	movl	$0, 16(%esi)
	.loc 1 385 0
	addl	$4, %esp
	popl	%ebx
LVL326:
	popl	%esi
LVL327:
	popl	%edi
LVL328:
	ret
LVL329:
	.p2align 4,,7
L243:
	.loc 1 371 0
	movl	12(%eax), %eax
	jmp	L232
LVL330:
L244:
	.loc 1 379 0
	movl	16(%esi), %eax
	jmp	L239
LFE121:
	.p2align 4,,15
	.def	_kvm_destroy_vm;	.scl	3;	.type	32;	.endef
_kvm_destroy_vm:
LFB126:
	.loc 1 420 0
LVL331:
	pushl	%esi
LCFI111:
	movl	%eax, %esi
	pushl	%ebx
LCFI112:
	subl	$4, %esp
LCFI113:
	.loc 1 421 0
	movl	$_kvm_lock, (%esp)
	call	_spin_lock
LVL332:
LBB343:
LBB344:
	.file 5 "include/linux/winkvmlist.h"
	.loc 5 175 0
	movl	16055(%esi), %edx
	movl	16059(%esi), %eax
LBB345:
LBB346:
	.loc 5 162 0
	movl	%eax, 4(%edx)
	.loc 5 163 0
	movl	%edx, (%eax)
LBE346:
LBE345:
	.loc 5 177 0
	movl	$2097664, 16059(%esi)
	.loc 5 176 0
	movl	$1048832, 16055(%esi)
LBE344:
LBE343:
	.loc 1 423 0
	movl	$_kvm_lock, (%esp)
	call	_spin_unlock
LBB347:
LBB348:
	.loc 1 411 0
	leal	1124(%esi), %eax
	call	_kvm_free_vcpu
LBE348:
LBE347:
LBB349:
LBB350:
	.loc 1 391 0
	movl	4(%esi), %eax
	testl	%eax, %eax
	jle	L246
	xorl	%ebx, %ebx
LVL333:
	.p2align 4,,7
L247:
	.loc 1 392 0
	leal	(%ebx,%ebx,4), %eax
	xorl	%edx, %edx
	leal	8(%esi,%eax,4), %eax
	.loc 1 391 0
	addl	$1, %ebx
	.loc 1 392 0
	call	_kvm_free_physmem_slot
	.loc 1 391 0
	cmpl	4(%esi), %ebx
	jl	L247
L246:
LBE350:
LBE349:
	.loc 1 426 0
	movl	%esi, (%esp)
	call	_kfree
	.loc 1 427 0
	addl	$4, %esp
	popl	%ebx
LVL334:
	popl	%esi
LVL335:
	ret
LFE126:
	.p2align 4,,15
.globl _kvm_dev_ioctl_create_vm
	.def	_kvm_dev_ioctl_create_vm;	.scl	2;	.type	32;	.endef
_kvm_dev_ioctl_create_vm:
LFB193:
	.loc 1 2393 0
	subl	$28, %esp
LCFI114:
	movl	%edi, 20(%esp)
LCFI115:
	movl	%ebx, 12(%esp)
LCFI116:
	movl	%esi, 16(%esp)
LCFI117:
	movl	%ebp, 24(%esp)
LCFI118:
LBB351:
	.loc 1 143 0
	call	_new_inode
	movl	%eax, %edi
LVL336:
LBB352:
	.loc 1 145 0
	movl	$-12, %eax
LVL337:
	testl	%edi, %edi
	je	L252
LBE352:
LBE351:
	.loc 1 2400 0
	cmpl	$-4096, %edi
	movl	%edi, %eax
	jbe	L262
LVL338:
L252:
	.loc 1 2438 0
	movl	12(%esp), %ebx
LVL339:
LVL340:
	movl	16(%esp), %esi
LVL341:
	movl	20(%esp), %edi
LVL342:
	movl	24(%esp), %ebp
LVL343:
	addl	$28, %esp
	ret
LVL344:
	.p2align 4,,7
L262:
LBB353:
	.loc 1 335 0
	movl	$208, 4(%esp)
LBB356:
	.loc 1 338 0
	movl	$-12, %esi
LVL345:
LBE356:
	.loc 1 335 0
	movl	$16067, (%esp)
	call	_kzalloc
LVL346:
LBB355:
	.loc 1 338 0
	testl	%eax, %eax
LVL347:
LBE355:
	.loc 1 335 0
	movl	%eax, %ebx
LVL348:
LBB354:
	.loc 1 338 0
	je	L255
	.loc 1 341 0
	movl	%eax, (%esp)
LBE354:
LBE353:
	.loc 1 2406 0
	movl	%ebx, %esi
LBB369:
LBB368:
	.loc 1 341 0
	call	_spin_lock_init
	.loc 1 342 0
	leal	88(%ebx), %eax
LBB357:
LBB358:
	.loc 5 37 0
	movl	%eax, 88(%ebx)
	.loc 5 38 0
	movl	%eax, 92(%ebx)
LBE358:
LBE357:
LBB359:
	.loc 1 346 0
	leal	1132(%ebx), %eax
	movl	%eax, (%esp)
	call	_mutex_init
	.loc 1 350 0
	leal	1328(%ebx), %eax
LBB360:
LBB361:
	.loc 5 37 0
	movl	%eax, 1328(%ebx)
	.loc 5 38 0
	movl	%eax, 1332(%ebx)
LBE361:
LBE360:
	.loc 1 347 0
	movl	$-1, 1136(%ebx)
	.loc 1 348 0
	movl	%ebx, 1124(%ebx)
	.loc 1 349 0
	movl	$-1, 14664(%ebx)
	movl	$-1, 14668(%ebx)
	.loc 1 351 0
	movl	$_kvm_lock, (%esp)
	call	_spin_lock
LBB362:
LBB363:
	.loc 5 74 0
	movl	_vm_list, %eax
LBE363:
LBE362:
	.loc 1 352 0
	leal	16055(%ebx), %edx
LBB367:
LBB366:
LBB364:
LBB365:
	.loc 5 52 0
	movl	%edx, 4(%eax)
	.loc 5 53 0
	movl	%eax, 16055(%ebx)
	.loc 5 54 0
	movl	$_vm_list, 16059(%ebx)
	.loc 5 55 0
	movl	%edx, _vm_list
LBE365:
LBE364:
LBE366:
LBE367:
	.loc 1 353 0
	movl	$_kvm_lock, (%esp)
	call	_spin_unlock
LBE359:
LBE368:
LBE369:
	.loc 1 2406 0
	cmpl	$-4096, %ebx
	jbe	L263
LVL349:
L255:
	.loc 1 2435 0
	movl	%edi, (%esp)
	call	_iput
	movl	%esi, %eax
LVL350:
	.p2align 4,,2
	jmp	L252
LVL351:
	.p2align 4,,7
L263:
LBB370:
	.loc 1 161 0
	call	_get_empty_filp
LBB372:
	.loc 1 163 0
	movl	$-23, %esi
	testl	%eax, %eax
LVL352:
LBE372:
	.loc 1 161 0
	movl	%eax, %ebp
LVL353:
LBB373:
	.loc 1 163 0
	je	L258
	.loc 1 179 0
	movl	$24, 8(%esp)
LBE373:
LBE370:
	.loc 1 2416 0
	movl	%ebp, %esi
LBB375:
LBB371:
	.loc 1 179 0
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
LBE371:
LBE375:
	.loc 1 2416 0
	cmpl	$-4096, %ebp
LBB376:
LBB374:
	.loc 1 180 0
	movl	%ebx, (%ebp)
	.loc 1 181 0
	movl	$-1, 4(%ebp)
	.loc 1 182 0
	movl	%edi, 16(%ebp)
LBE374:
LBE376:
	.loc 1 2416 0
	jbe	L264
L258:
	.loc 1 2433 0
	movl	%ebx, %eax
	call	_kvm_destroy_vm
	jmp	L255
	.p2align 4,,7
L264:
	.loc 1 2420 0
	movl	%ebp, 16063(%ebx)
	.loc 1 2422 0
	call	_get_unused_fd
	.loc 1 2423 0
	testl	%eax, %eax
	.loc 1 2422 0
	movl	%eax, %esi
	.loc 1 2423 0
	js	L260
	.loc 1 2426 0
	movl	%eax, (%esp)
	movl	%ebp, 4(%esp)
	call	_fd_install
	movl	%esi, %eax
LVL354:
	jmp	L252
LVL355:
L260:
	.loc 1 2431 0
	movl	%ebp, (%esp)
	call	_fput
	.p2align 4,,4
	jmp	L258
LFE193:
	.p2align 4,,15
	.def	_kvm_vm_release;	.scl	3;	.type	32;	.endef
_kvm_vm_release:
LFB127:
	.loc 1 430 0
LVL356:
	.loc 1 433 0
	movl	8(%esp), %eax
	movl	(%eax), %eax
	call	_kvm_destroy_vm
	.loc 1 435 0
	xorl	%eax, %eax
	ret
LFE127:
	.p2align 4,,15
.globl _kvm_vm_ioctl_create_vcpu
	.def	_kvm_vm_ioctl_create_vcpu;	.scl	2;	.type	32;	.endef
_kvm_vm_ioctl_create_vcpu:
LFB188:
	.loc 1 2114 0
LVL357:
	subl	$20, %esp
LCFI119:
	.loc 1 2121 0
	movl	28(%esp), %eax
	.loc 1 2114 0
	movl	%ebx, 4(%esp)
LCFI120:
	.loc 1 2121 0
	movl	$-22, %ebx
LVL358:
	.loc 1 2114 0
	movl	%esi, 8(%esp)
LCFI121:
	movl	24(%esp), %esi
	movl	%edi, 12(%esp)
LCFI122:
	.loc 1 2121 0
	testl	%eax, %eax
	.loc 1 2114 0
	movl	%ebp, 16(%esp)
LCFI123:
	.loc 1 2121 0
	je	L274
LVL359:
L269:
	.loc 1 2166 0
	movl	%ebx, %eax
	movl	8(%esp), %esi
LVL360:
	movl	4(%esp), %ebx
LVL361:
	movl	12(%esp), %edi
LVL362:
	movl	16(%esp), %ebp
	addl	$20, %esp
	ret
LVL363:
	.p2align 4,,7
L274:
	.loc 1 2126 0
	leal	1132(%esi), %ebp
	movl	%ebp, (%esp)
	call	_mutex_lock
	.loc 1 2128 0
	movl	1128(%esi), %eax
	testl	%eax, %eax
	jne	L275
	.loc 1 2133 0
	leal	14899(%esi), %eax
	andl	$-16, %eax
	movl	%eax, 15924(%esi)
	.loc 1 2135 0
	addl	$512, %eax
	movl	%eax, 15928(%esi)
	.loc 1 2137 0
	movl	_kvm_arch_ops, %eax
	.loc 1 2124 0
	leal	1124(%esi), %edi
LVL364:
	.loc 1 2137 0
	movl	%edi, (%esp)
	call	*24(%eax)
	.loc 1 2138 0
	testl	%eax, %eax
	.loc 1 2137 0
	movl	%eax, %ebx
	.loc 1 2138 0
	js	L271
	.loc 1 2141 0
	movl	%edi, (%esp)
	call	_kvm_mmu_create
	.loc 1 2142 0
	testl	%eax, %eax
	.loc 1 2141 0
	movl	%eax, %ebx
	.loc 1 2142 0
	js	L271
	.loc 1 2145 0
	movl	_kvm_arch_ops, %eax
	movl	%edi, (%esp)
	call	*32(%eax)
	.loc 1 2146 0
	movl	%edi, (%esp)
	call	_kvm_mmu_setup
	.loc 1 2147 0
	testl	%eax, %eax
	.loc 1 2146 0
	movl	%eax, %ebx
	.loc 1 2147 0
	js	L272
	.loc 1 2148 0
	movl	_kvm_arch_ops, %eax
	movl	%edi, (%esp)
	call	*156(%eax)
	movl	%eax, %ebx
	.loc 1 2149 0
	movl	%edi, %eax
	call	_vcpu_put
	.loc 1 2151 0
	testl	%ebx, %ebx
	js	L271
	.loc 1 2154 0
	movl	%edi, (%esp)
	call	_create_vcpu_fd
	.loc 1 2155 0
	testl	%eax, %eax
	.loc 1 2154 0
	movl	%eax, %ebx
	.loc 1 2155 0
	jns	L269
	.p2align 4,,7
L271:
	.loc 1 2162 0
	movl	%edi, %eax
	call	_kvm_free_vcpu
	.loc 1 2163 0
	movl	%ebp, (%esp)
	call	_mutex_unlock
	jmp	L269
LVL365:
	.p2align 4,,7
L275:
	.loc 1 2129 0
	movl	%ebp, (%esp)
	movl	$-17, %ebx
	call	_mutex_unlock
	.p2align 4,,4
	jmp	L269
LVL366:
	.p2align 4,,7
L272:
	.loc 1 2149 0
	movl	%edi, %eax
	call	_vcpu_put
	.p2align 4,,6
	jmp	L271
LFE188:
	.p2align 4,,15
.globl _kvm_vcpu_ioctl_set_sregs
	.def	_kvm_vcpu_ioctl_set_sregs;	.scl	2;	.type	32;	.endef
_kvm_vcpu_ioctl_set_sregs:
LFB177:
	.loc 1 1807 0
LVL367:
	pushl	%ebp
LCFI124:
	pushl	%edi
LCFI125:
	pushl	%esi
LCFI126:
	pushl	%ebx
LCFI127:
	subl	$64, %esp
LCFI128:
	.loc 1 1807 0
	movl	84(%esp), %esi
	.loc 1 1828 0
	leal	58(%esp), %ebx
	.loc 1 1807 0
	movl	88(%esp), %edi
	.loc 1 1814 0
	movl	%esi, %eax
	call	_vcpu_load
LBB377:
LBB378:
	.loc 1 1802 0
	leal	4(%edi), %eax
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	movl	$0, 8(%esp)
	movl	%esi, (%esp)
	call	*64(%eax)
LBE378:
LBE377:
LBB379:
LBB380:
	leal	28(%edi), %eax
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	movl	$1, 8(%esp)
	movl	%esi, (%esp)
	call	*64(%eax)
LBE380:
LBE379:
LBB381:
LBB382:
	leal	52(%edi), %eax
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	movl	$2, 8(%esp)
	movl	%esi, (%esp)
	call	*64(%eax)
LBE382:
LBE381:
LBB383:
LBB384:
	leal	76(%edi), %eax
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	movl	$3, 8(%esp)
	movl	%esi, (%esp)
	call	*64(%eax)
LBE384:
LBE383:
LBB385:
LBB386:
	leal	100(%edi), %eax
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	movl	$4, 8(%esp)
	movl	%esi, (%esp)
	call	*64(%eax)
LBE386:
LBE385:
LBB387:
LBB388:
	leal	124(%edi), %eax
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	movl	$5, 8(%esp)
	movl	%esi, (%esp)
	call	*64(%eax)
LBE388:
LBE387:
LBB389:
LBB390:
	leal	148(%edi), %eax
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	movl	$6, 8(%esp)
	movl	%esi, (%esp)
	call	*64(%eax)
LBE390:
LBE389:
LBB391:
LBB392:
	leal	172(%edi), %eax
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	movl	$7, 8(%esp)
	movl	%esi, (%esp)
	call	*64(%eax)
LBE392:
LBE391:
	.loc 1 1826 0
	movzwl	220(%edi), %eax
	movw	%ax, 58(%esp)
	.loc 1 1827 0
	movl	212(%edi), %eax
	.loc 1 1828 0
	movl	%ebx, 4(%esp)
	movl	%esi, (%esp)
	.loc 1 1827 0
	movl	%eax, 60(%esp)
	.loc 1 1828 0
	movl	_kvm_arch_ops, %eax
	call	*100(%eax)
	.loc 1 1829 0
	movzwl	204(%edi), %eax
	movw	%ax, 58(%esp)
	.loc 1 1830 0
	movl	196(%edi), %eax
	.loc 1 1831 0
	movl	%ebx, 4(%esp)
	movl	%esi, (%esp)
	.loc 1 1830 0
	movl	%eax, 60(%esp)
	.loc 1 1831 0
	movl	_kvm_arch_ops, %eax
	call	*108(%eax)
	.loc 1 1833 0
	movl	236(%edi), %eax
	movl	%eax, 100(%esi)
	.loc 1 1834 0
	movl	104(%esi), %eax
	movl	%eax, 52(%esp)
	movl	244(%edi), %edx
	movl	%edx, 16(%esp)
	movl	248(%edi), %eax
	movl	%eax, 12(%esp)
	.loc 1 1835 0
	movl	%edx, 104(%esi)
	.loc 1 1839 0
	movl	168(%esi), %edx
	.loc 1 1837 0
	movl	260(%edi), %eax
	movl	%eax, 132(%esi)
	.loc 1 1839 0
	movl	%edx, 24(%esp)
	movl	172(%esi), %eax
	movl	%eax, 20(%esp)
	movl	268(%edi), %edx
	movl	%edx, 32(%esp)
	movl	272(%edi), %eax
	movl	%eax, 28(%esp)
	.loc 1 1843 0
	movl	276(%edi), %eax
	movl	280(%edi), %edx
	movl	%eax, 176(%esi)
	movl	%edx, 180(%esi)
	.loc 1 1845 0
	movl	_kvm_arch_ops, %eax
	movl	%esi, (%esp)
	call	*72(%eax)
	.loc 1 1847 0
	movl	228(%edi), %edx
	movl	96(%esi), %ebx
	movl	%edx, 40(%esp)
	movl	232(%edi), %eax
	.loc 1 1848 0
	movl	%edx, 4(%esp)
	movl	%esi, (%esp)
	.loc 1 1847 0
	movl	%eax, 36(%esp)
	.loc 1 1848 0
	movl	_kvm_arch_ops, %eax
	call	*80(%eax)
	.loc 1 1850 0
	movl	252(%edi), %edx
	movl	128(%esi), %ebp
	movl	%edx, 48(%esp)
	movl	256(%edi), %eax
	.loc 1 1851 0
	movl	%edx, 4(%esp)
	movl	%esi, (%esp)
	.loc 1 1850 0
	movl	%eax, 44(%esp)
	.loc 1 1851 0
	movl	_kvm_arch_ops, %eax
	call	*88(%eax)
	.loc 1 1852 0
	testb	$32, 128(%esi)
	jne	L283
LVL368:
L277:
	.loc 1 1839 0
	movl	16(%esp), %edx
	xorl	%edx, 52(%esp)
	movl	52(%esp), %eax
	orl	12(%esp), %eax
	setne	%dl
	xorl	40(%esp), %ebx
	orl	36(%esp), %ebx
	setne	%al
	orl	%edx, %eax
	.loc 1 1847 0
	movl	32(%esp), %edx
	xorl	%edx, 24(%esp)
	movl	28(%esp), %edx
	xorl	%edx, 20(%esp)
	movl	24(%esp), %edx
	orl	20(%esp), %edx
	setne	%dl
	orl	%edx, %eax
	.loc 1 1855 0
	xorl	48(%esp), %ebp
	orl	44(%esp), %ebp
	setne	%dl
	orl	%edx, %eax
	testb	$1, %al
	jne	L284
L278:
	.loc 1 1858 0
	leal	284(%edi), %eax
	movl	%eax, 4(%esp)
	leal	28(%esi), %eax
	movl	$32, 8(%esp)
	movl	%eax, (%esp)
	call	_memcpy
LBB393:
LBB394:
	.loc 2 299 0
	leal	24(%esi), %edx
	xorl	%eax, %eax
LVL369:
LBE394:
LBE393:
	.loc 1 1860 0
	movl	$0, 24(%esi)
	.p2align 4,,7
L280:
	.loc 1 1862 0
	movl	28(%esi,%eax,4), %ecx
	testl	%ecx, %ecx
	je	L279
LBB396:
LBB395:
	.loc 2 299 0
/APP
 # 299 "include/linux/winkvmstab.h" 1
	btsl %eax,(%edx)
 # 0 "" 2
/NO_APP
L279:
LBE395:
LBE396:
	.loc 1 1861 0
	addl	$1, %eax
	cmpl	$8, %eax
	jne	L280
	.loc 1 1865 0
	movl	%esi, %eax
LVL370:
	call	_vcpu_put
	.loc 1 1870 0
	addl	$64, %esp
	xorl	%eax, %eax
	popl	%ebx
	popl	%esi
LVL371:
	popl	%edi
LVL372:
	popl	%ebp
	ret
LVL373:
	.p2align 4,,7
L283:
	.loc 1 1853 0
	movl	104(%esi), %edx
	movl	%esi, %eax
	call	_load_pdptrs
	jmp	L277
	.p2align 4,,7
L284:
	.loc 1 1856 0
	movl	%esi, (%esp)
	call	_kvm_mmu_reset_context
	.p2align 4,,6
	jmp	L278
LFE177:
	.section .rdata,"dr"
	.align 4
LC19:
	.ascii "<7>set_cr4: #GP, reserved bits\12\0"
	.align 4
LC20:
	.ascii "<7>set_cr4: #GP, pdptrs reserved bits\12\0"
	.align 4
LC21:
	.ascii "<7>set_cr4: #GP, setting VMXE\12\0"
	.text
	.p2align 4,,15
.globl _set_cr4
	.def	_set_cr4;	.scl	2;	.type	32;	.endef
_set_cr4:
LFB132:
	.loc 1 549 0
LVL374:
	subl	$16, %esp
LCFI129:
	movl	%esi, 12(%esp)
LCFI130:
	movl	24(%esp), %esi
	movl	%ebx, 8(%esp)
LCFI131:
	.loc 1 549 0
	movl	20(%esp), %ebx
	.loc 1 550 0
	testl	$-2048, %esi
	jne	L291
LVL375:
	.loc 1 563 0
	movl	96(%ebx), %eax
	testl	%eax, %eax
	js	L292
L287:
	.loc 1 569 0
	testl	$8192, %esi
	jne	L293
	.loc 1 574 0
	movl	_kvm_arch_ops, %eax
	movl	%esi, 4(%esp)
	movl	%ebx, (%esp)
	call	*88(%eax)
	.loc 1 575 0
	movl	(%ebx), %eax
	movl	%eax, (%esp)
	call	_spin_lock
	.loc 1 576 0
	movl	%ebx, (%esp)
	call	_kvm_mmu_reset_context
	.loc 1 577 0
	movl	(%ebx), %eax
	.loc 1 578 0
	movl	12(%esp), %esi
LVL376:
	movl	8(%esp), %ebx
LVL377:
	.loc 1 577 0
	movl	%eax, 20(%esp)
	.loc 1 578 0
	addl	$16, %esp
	.loc 1 577 0
	jmp	_spin_unlock
LVL378:
	.p2align 4,,7
L293:
	.loc 1 570 0
	movl	$LC21, (%esp)
L290:
	call	_printk
LBB397:
LBB399:
	.loc 1 439 0
	movl	_kvm_arch_ops, %eax
	movl	%ebx, 20(%esp)
LBE399:
LBE397:
	.loc 1 578 0
	movl	12(%esp), %esi
LVL379:
LBB402:
LBB400:
	.loc 1 439 0
	movl	$0, 24(%esp)
LBE400:
LBE402:
	.loc 1 578 0
	movl	8(%esp), %ebx
LVL380:
LBB403:
LBB398:
	.loc 1 439 0
	movl	148(%eax), %ecx
LBE398:
LBE403:
	.loc 1 578 0
	addl	$16, %esp
LBB404:
LBB401:
	.loc 1 439 0
	jmp	*%ecx
LVL381:
	.p2align 4,,7
L291:
LBE401:
LBE404:
	.loc 1 551 0
	movl	$LC19, (%esp)
	jmp	L290
	.p2align 4,,7
L292:
	.loc 1 563 0
	testb	$32, 128(%ebx)
	jne	L287
	testl	$32, %esi
	je	L287
	movl	104(%ebx), %edx
	movl	%ebx, %eax
	call	_load_pdptrs
	testl	%eax, %eax
	jne	L287
	.loc 1 565 0
	movl	$LC20, (%esp)
	call	_printk
LBB405:
LBB406:
	.loc 1 439 0
	movl	_kvm_arch_ops, %eax
	movl	$0, 4(%esp)
	movl	%ebx, (%esp)
	call	*148(%eax)
	jmp	L287
LBE406:
LBE405:
LFE132:
	.section .rdata,"dr"
	.align 4
LC22:
	.ascii "<7>set_cr0: 0x%lx #GP, reserved bits 0x%lx\12\0"
	.align 4
LC23:
	.ascii "<7>set_cr0: #GP, CD == 0 && NW == 1\12\0"
	.align 4
LC24:
	.ascii "<7>set_cr0: #GP, set PG flag and a clear PE flag\12\0"
	.align 4
LC25:
	.ascii "<7>set_cr0: #GP, pdptrs reserved bits\12\0"
	.text
	.p2align 4,,15
.globl _set_cr0
	.def	_set_cr0;	.scl	2;	.type	32;	.endef
_set_cr0:
LFB130:
	.loc 1 480 0
LVL382:
	pushl	%esi
LCFI132:
	pushl	%ebx
LCFI133:
	subl	$12, %esp
LCFI134:
	.loc 1 480 0
	movl	28(%esp), %ebx
	movl	24(%esp), %esi
	.loc 1 481 0
	testl	$536543168, %ebx
	jne	L301
LVL383:
	.loc 1 488 0
	testl	$536870912, %ebx
	je	L296
	testl	$1073741824, %ebx
	je	L302
L296:
	.loc 1 494 0
	testl	%ebx, %ebx
	.p2align 4,,5
	js	L303
L297:
	.loc 1 501 0
	movl	96(%esi), %eax
	testl	%eax, %eax
	.p2align 4,,3
	js	L298
	testl	%ebx, %ebx
	.p2align 4,,3
	js	L304
L298:
	.loc 1 531 0
	movl	_kvm_arch_ops, %eax
	movl	%ebx, 4(%esp)
	movl	%esi, (%esp)
	call	*76(%eax)
	.loc 1 534 0
	movl	(%esi), %eax
	.loc 1 532 0
	movl	%ebx, 96(%esi)
	.loc 1 534 0
	movl	%eax, (%esp)
	call	_spin_lock
	.loc 1 535 0
	movl	%esi, (%esp)
	call	_kvm_mmu_reset_context
	.loc 1 536 0
	movl	(%esi), %eax
	movl	%eax, 24(%esp)
	.loc 1 538 0
	addl	$12, %esp
	popl	%ebx
LVL384:
	popl	%esi
LVL385:
	.loc 1 536 0
	jmp	_spin_unlock
LVL386:
	.p2align 4,,7
L301:
	.loc 1 482 0
	movl	96(%esi), %eax
	movl	%ebx, 4(%esp)
	movl	$LC22, (%esp)
	movl	%eax, 8(%esp)
	call	_printk
L300:
LBB407:
LBB408:
	.loc 1 439 0
	movl	_kvm_arch_ops, %eax
	movl	%esi, 24(%esp)
	movl	$0, 28(%esp)
	movl	148(%eax), %ecx
LBE408:
LBE407:
	.loc 1 538 0
	addl	$12, %esp
	popl	%ebx
LVL387:
	popl	%esi
LVL388:
LBB410:
LBB409:
	.loc 1 439 0
	jmp	*%ecx
LVL389:
	.p2align 4,,7
L303:
LBE409:
LBE410:
	.loc 1 494 0
	testb	$1, %bl
	jne	L297
	.loc 1 495 0
	movl	$LC24, (%esp)
	call	_printk
	jmp	L300
	.p2align 4,,7
L304:
	.loc 1 522 0
	testb	$32, 128(%esi)
	je	L298
	movl	104(%esi), %edx
	movl	%esi, %eax
	call	_load_pdptrs
	testl	%eax, %eax
	jne	L298
	.loc 1 523 0
	movl	$LC25, (%esp)
	call	_printk
	jmp	L300
	.p2align 4,,7
L302:
	.loc 1 489 0
	movl	$LC23, (%esp)
	call	_printk
	.p2align 4,,3
	jmp	L300
LFE130:
	.p2align 4,,15
.globl _realmode_set_cr
	.def	_realmode_set_cr;	.scl	2;	.type	32;	.endef
_realmode_set_cr:
LFB162:
	.loc 1 1384 0
LVL390:
	subl	$16, %esp
LCFI135:
	movl	24(%esp), %eax
	movl	%ebx, 8(%esp)
LCFI136:
	movl	28(%esp), %edx
	movl	%esi, 12(%esp)
LCFI137:
	.loc 1 1384 0
	movl	20(%esp), %ebx
	movl	32(%esp), %esi
	.loc 1 1385 0
	cmpl	$2, %eax
	je	L308
LVL391:
	jle	L314
	cmpl	$3, %eax
	je	L309
	cmpl	$4, %eax
	.p2align 4,,7
	je	L315
L306:
	.loc 1 1400 0
	movl	%eax, 28(%esp)
	.loc 1 1402 0
	movl	8(%esp), %ebx
LVL392:
	.loc 1 1400 0
	movl	$___FUNCTION__.3422, 24(%esp)
	.loc 1 1402 0
	movl	12(%esp), %esi
LVL393:
	.loc 1 1400 0
	movl	$LC4, 20(%esp)
	.loc 1 1402 0
	addl	$16, %esp
	.loc 1 1400 0
	jmp	_printk
LVL394:
	.p2align 4,,7
L314:
	.loc 1 1385 0
	testl	%eax, %eax
	jne	L306
	.loc 1 1387 0
	movl	%edx, 4(%esp)
	movl	%ebx, (%esp)
	call	_set_cr0
LVL395:
	.loc 1 1388 0
	movl	_kvm_arch_ops, %eax
	movl	%ebx, (%esp)
	call	*128(%eax)
	movl	%eax, (%esi)
	.loc 1 1402 0
	movl	8(%esp), %ebx
LVL396:
	movl	12(%esp), %esi
LVL397:
	addl	$16, %esp
	ret
LVL398:
	.p2align 4,,7
L315:
	.loc 1 1397 0
	movl	%ebx, 20(%esp)
	.loc 1 1402 0
	movl	12(%esp), %esi
LVL399:
	.loc 1 1397 0
	movl	%edx, 24(%esp)
	.loc 1 1402 0
	movl	8(%esp), %ebx
LVL400:
	addl	$16, %esp
	.loc 1 1397 0
	jmp	_set_cr4
LVL401:
	.p2align 4,,7
L308:
	.loc 1 1391 0
	movl	%edx, 100(%ebx)
	.loc 1 1402 0
	movl	8(%esp), %ebx
LVL402:
	movl	12(%esp), %esi
LVL403:
	addl	$16, %esp
	ret
LVL404:
	.p2align 4,,7
L309:
	.loc 1 1394 0
	movl	%ebx, 20(%esp)
	.loc 1 1402 0
	movl	12(%esp), %esi
LVL405:
	.loc 1 1394 0
	movl	%edx, 24(%esp)
	.loc 1 1402 0
	movl	8(%esp), %ebx
LVL406:
	addl	$16, %esp
	.loc 1 1394 0
	jmp	_set_cr3
LVL407:
LFE162:
	.p2align 4,,15
.globl _lmsw
	.def	_lmsw;	.scl	2;	.type	32;	.endef
_lmsw:
LFB131:
	.loc 1 542 0
LVL408:
	subl	$12, %esp
LCFI138:
	.loc 1 543 0
	movl	_kvm_arch_ops, %eax
	.loc 1 542 0
	movl	%esi, 8(%esp)
LCFI139:
	movl	16(%esp), %esi
	movl	%ebx, 4(%esp)
LCFI140:
	.loc 1 542 0
	movl	20(%esp), %ebx
	.loc 1 543 0
	movl	%esi, (%esp)
	call	*72(%eax)
	.loc 1 544 0
	movl	96(%esi), %eax
	andl	$15, %ebx
LVL409:
	movl	%esi, 16(%esp)
	.loc 1 545 0
	movl	8(%esp), %esi
	.loc 1 544 0
	andl	$-16, %eax
	orl	%eax, %ebx
	movl	%ebx, 20(%esp)
	.loc 1 545 0
	movl	4(%esp), %ebx
LVL410:
	addl	$12, %esp
	.loc 1 544 0
	jmp	_set_cr0
LFE131:
	.p2align 4,,15
.globl _realmode_lmsw
	.def	_realmode_lmsw;	.scl	2;	.type	32;	.endef
_realmode_lmsw:
LFB160:
	.loc 1 1359 0
LVL411:
	pushl	%ebx
LCFI141:
	subl	$8, %esp
LCFI142:
	.loc 1 1359 0
	movl	16(%esp), %ebx
	.loc 1 1360 0
	movl	20(%esp), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	_lmsw
	.loc 1 1361 0
	movl	_kvm_arch_ops, %eax
	movl	%ebx, (%esp)
	call	*128(%eax)
	movl	24(%esp), %edx
	movl	%eax, (%edx)
	.loc 1 1362 0
	addl	$8, %esp
	popl	%ebx
	ret
LFE160:
	.section .rdata,"dr"
	.align 4
LC26:
	.ascii "<4>%s: MSR_IA32_MC0_STATUS 0x%llx, nop\12\0"
	.align 4
LC27:
	.ascii "<7>kvm: guest trying to enter paravirtual mode\12\0"
	.align 4
LC28:
	.ascii "<7>.... para_state_gpa: %08Lx\12\0"
	.align 4
LC29:
	.ascii "<7>.... para_state_hpa: %08Lx\12\0"
LC30:
	.ascii "<7>....  guest version: %d\12\0"
LC31:
	.ascii "<7>....           size: %d\12\0"
LC32:
	.ascii "<7>.... hypercall_hpa: %08Lx\12\0"
	.align 4
LC33:
	.ascii "<7>kvm: para guest successfully registered.\12\0"
	.align 4
LC34:
	.ascii "<3>kvm: unhandled wrmsr: 0x%x\12\0"
	.text
	.p2align 4,,15
.globl _kvm_set_msr_common
	.def	_kvm_set_msr_common;	.scl	2;	.type	32;	.endef
_kvm_set_msr_common:
LFB166:
	.loc 1 1560 0
LVL412:
	subl	$40, %esp
LCFI143:
	movl	48(%esp), %edx
	movl	%ebx, 24(%esp)
LCFI144:
	movl	%esi, 28(%esp)
LCFI145:
	movl	%edi, 32(%esp)
LCFI146:
	.loc 1 1561 0
	cmpl	$416, %edx
	.loc 1 1560 0
	movl	%ebp, 36(%esp)
LCFI147:
	.loc 1 1561 0
	je	L324
LVL413:
	jbe	L338
	cmpl	$1025, %edx
	je	L325
	.p2align 4,,9
	jbe	L339
	cmpl	$-2023401864, %edx
	.p2align 4,,7
	jne	L321
LBB417:
LBB422:
	.loc 1 1415 0
	movl	$LC27, (%esp)
	call	_printk
LVL414:
	.loc 1 1416 0
	movl	56(%esp), %edx
LVL415:
	movl	52(%esp), %eax
	movl	$LC28, (%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	call	_printk
	.loc 1 1421 0
	movl	52(%esp), %eax
	movl	56(%esp), %edx
	addl	$4095, %eax
	andl	$-4096, %eax
	xorl	52(%esp), %eax
	orl	%eax, %edx
	jne	L337
LVL416:
LBE422:
	.loc 1 1424 0
	movl	56(%esp), %ecx
	movl	52(%esp), %edx
	movl	%ecx, 8(%esp)
	movl	44(%esp), %ecx
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	call	_gpa_to_hpa
LBB421:
	.loc 1 1425 0
	movl	$LC29, (%esp)
LBE421:
	.loc 1 1424 0
	movl	%edx, %esi
LVL417:
	movl	%eax, %ebx
LVL418:
LBB420:
	.loc 1 1425 0
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	call	_printk
	.loc 1 1426 0
	testl	%esi, %esi
	js	L337
	.loc 1 1429 0
	movl	56(%esp), %edx
LBE420:
	.loc 1 1430 0
	shrdl	$12, %esi, %ebx
LVL419:
LBB419:
	.loc 1 1429 0
	movl	52(%esp), %eax
	shrdl	$12, %edx, %eax
	movl	44(%esp), %edx
	movl	%eax, 4(%esp)
	movl	(%edx), %eax
	movl	%eax, (%esp)
	call	_mark_page_dirty
LBE419:
	.loc 1 1430 0
	movl	%ebx, (%esp)
	call	_pfn_to_page
	.loc 1 1431 0
	movl	$3, 4(%esp)
	.loc 1 1430 0
	movl	%eax, %ebp
LVL420:
	.loc 1 1431 0
	movl	%eax, (%esp)
	call	_kmap_atomic
	movl	%eax, %ebx
LVL421:
LBB418:
	.loc 1 1433 0
	movl	(%eax), %eax
	movl	$LC30, (%esp)
	movl	%eax, 4(%esp)
	call	_printk
	.loc 1 1434 0
	movl	8(%ebx), %eax
	movl	$LC31, (%esp)
	movl	%eax, 4(%esp)
	call	_printk
	.loc 1 1441 0
	cmpl	$1, (%ebx)
	.loc 1 1436 0
	movl	$1, 4(%ebx)
	.loc 1 1441 0
	jbe	L331
LVL422:
L335:
	.loc 1 1450 0
	movl	$-1, 12(%ebx)
LVL423:
L332:
	.loc 1 1467 0
	movl	$3, 4(%esp)
	movl	%ebx, (%esp)
	call	_kunmap_atomic
	xorl	%eax, %eax
	jmp	L329
LVL424:
	.p2align 4,,7
L338:
LBE418:
LBE417:
	.loc 1 1561 0
	cmpl	$121, %edx
	je	L336
	cmpl	$139, %edx
	.p2align 4,,5
	je	L336
	cmpl	$27, %edx
	.p2align 4,,5
	je	L340
L321:
	.loc 1 1588 0
	movl	%edx, 4(%esp)
	movl	$LC34, (%esp)
	call	_printk
LVL425:
L337:
	movl	$1, %eax
	jmp	L329
LVL426:
	.p2align 4,,7
L324:
	.loc 1 1579 0
	movl	52(%esp), %eax
	movl	56(%esp), %edx
LVL427:
	movl	44(%esp), %ecx
	movl	%eax, 184(%ecx)
	movl	%edx, 188(%ecx)
LVL428:
L336:
	xorl	%eax, %eax
LVL429:
L329:
	.loc 1 1592 0
	movl	24(%esp), %ebx
LVL430:
	movl	28(%esp), %esi
LVL431:
	movl	32(%esp), %edi
LVL432:
	movl	36(%esp), %ebp
LVL433:
	addl	$40, %esp
	ret
LVL434:
	.p2align 4,,7
L339:
	.loc 1 1561 0
	leal	-512(%edx), %eax
	cmpl	$255, %eax
	ja	L321
	jmp	L336
	.p2align 4,,7
L325:
	.loc 1 1568 0
	movl	52(%esp), %eax
	movl	56(%esp), %edx
LVL435:
	movl	$___FUNCTION__.3517, 4(%esp)
	movl	$LC26, (%esp)
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	call	_printk
	xorl	%eax, %eax
	jmp	L329
LVL436:
	.p2align 4,,7
L340:
	.loc 1 1576 0
	movl	52(%esp), %edx
LVL437:
	xorl	%eax, %eax
	movl	56(%esp), %ecx
LVL438:
	movl	44(%esp), %ebx
	movl	%edx, 176(%ebx)
	movl	%ecx, 180(%ebx)
	jmp	L329
LVL439:
L331:
LBB428:
LBB423:
	.loc 1 1446 0
	movl	16(%ebx), %esi
LVL440:
	movl	20(%ebx), %edi
LVL441:
LBE423:
	.loc 1 1447 0
	movl	44(%esp), %ecx
	movl	%esi, 4(%esp)
	movl	%edi, 8(%esp)
	movl	%ecx, (%esp)
	call	_gpa_to_hpa
LBB424:
	.loc 1 1448 0
	movl	$LC32, (%esp)
LBE424:
	.loc 1 1447 0
	movl	%eax, 16(%esp)
LVL442:
	movl	%edx, 20(%esp)
LVL443:
LBB425:
	.loc 1 1448 0
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	call	_printk
	.loc 1 1449 0
	movl	20(%esp), %eax
	testl	%eax, %eax
	js	L335
LVL444:
	.loc 1 1454 0
	movl	$LC33, (%esp)
	call	_printk
	.loc 1 1455 0
	movl	44(%esp), %eax
	movl	%ebp, 116(%eax)
	.loc 1 1456 0
	movl	56(%esp), %ecx
	movl	52(%esp), %edx
	movl	44(%esp), %eax
	movl	%ecx, 112(%eax)
	.loc 1 1457 0
	movl	%esi, 120(%eax)
	.loc 1 1459 0
	shrdl	$12, %edi, %esi
LVL445:
	.loc 1 1456 0
	movl	%edx, 108(%eax)
	.loc 1 1457 0
	movl	%edi, 124(%eax)
	.loc 1 1459 0
	movl	44(%esp), %edx
	movl	%esi, 4(%esp)
	movl	(%edx), %eax
	movl	%eax, (%esp)
	call	_mark_page_dirty
LBE425:
	.loc 1 1460 0
	movl	20(%esp), %edx
	movl	16(%esp), %eax
	shrdl	$12, %edx, %eax
	movl	%eax, (%esp)
	call	_pfn_to_page
	movl	$4, 4(%esp)
	movl	%eax, (%esp)
	call	_kmap_atomic
LBB426:
	.loc 1 1462 0
	movl	44(%esp), %ecx
	movl	%ecx, (%esp)
LBE426:
	.loc 1 1460 0
	movl	%eax, %edx
LBB427:
	movl	16(%esp), %eax
	andl	$4095, %eax
	leal	(%edx,%eax), %esi
LVL446:
	.loc 1 1462 0
	movl	_kvm_arch_ops, %eax
	movl	%esi, 4(%esp)
	call	*164(%eax)
	.loc 1 1463 0
	movl	$4, 4(%esp)
	movl	%esi, (%esp)
	call	_kunmap_atomic
	.loc 1 1465 0
	movl	$0, 12(%ebx)
	jmp	L332
LBE427:
LBE428:
LFE166:
	.section .rdata,"dr"
	.align 4
LC35:
	.ascii "<3>emulation failed but !mmio_needed? rip %lx %02x %02x %02x %02x\12\0"
	.text
	.p2align 4,,15
.globl _emulate_instruction
	.def	_emulate_instruction;	.scl	2;	.type	32;	.endef
_emulate_instruction:
LFB155:
	.loc 1 1229 0
LVL447:
	pushl	%ebp
LCFI148:
	pushl	%edi
LCFI149:
	pushl	%esi
LCFI150:
	pushl	%ebx
LCFI151:
	subl	$76, %esp
LCFI152:
	.loc 1 1229 0
	movl	96(%esp), %ebx
	movl	104(%esp), %ebp
	movl	100(%esp), %edi
	.loc 1 1236 0
	movl	%ebp, 14840(%ebx)
	.loc 1 1237 0
	movl	_kvm_arch_ops, %eax
	movl	%ebx, (%esp)
	call	*120(%eax)
	.loc 1 1239 0
	leal	68(%esp), %eax
	movl	%eax, 8(%esp)
	leal	72(%esp), %eax
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	movl	%ebx, (%esp)
	call	*68(%eax)
	.loc 1 1242 0
	movl	_kvm_arch_ops, %eax
	.loc 1 1241 0
	movl	%ebx, 24(%esp)
	.loc 1 1242 0
	movl	%ebx, (%esp)
	call	*128(%eax)
	.loc 1 1244 0
	xorl	%edx, %edx
	.loc 1 1243 0
	movl	%ebp, 32(%esp)
	.loc 1 1244 0
	testl	$131072, %eax
	.loc 1 1242 0
	movl	%eax, 28(%esp)
	.loc 1 1244 0
	jne	L343
LVL448:
	movl	68(%esp), %edx
LVL449:
	testl	%edx, %edx
	jne	L344
	cmpl	$1, 72(%esp)
LVL450:
	sbbl	%edx, %edx
	andl	$-2, %edx
	addl	$4, %edx
L343:
LBB429:
	.loc 1 1148 0
	movl	_kvm_arch_ops, %eax
LBE429:
	.loc 1 1244 0
	movl	%edx, 36(%esp)
LBB430:
	.loc 1 1148 0
	movl	$0, 4(%esp)
	movl	%ebx, (%esp)
	call	*56(%eax)
LBE430:
LBB431:
	movl	$1, 4(%esp)
	movl	%ebx, (%esp)
LBE431:
	.loc 1 1255 0
	movl	%eax, 40(%esp)
LBB432:
	.loc 1 1148 0
	movl	_kvm_arch_ops, %eax
	call	*56(%eax)
LBE432:
LBB433:
	movl	$2, 4(%esp)
	movl	%ebx, (%esp)
LBE433:
	.loc 1 1256 0
	movl	%eax, 44(%esp)
LBB434:
	.loc 1 1148 0
	movl	_kvm_arch_ops, %eax
	call	*56(%eax)
LBE434:
LBB435:
	movl	$5, 4(%esp)
	movl	%ebx, (%esp)
LBE435:
	.loc 1 1257 0
	movl	%eax, 48(%esp)
LBB436:
	.loc 1 1148 0
	movl	_kvm_arch_ops, %eax
	call	*56(%eax)
LBE436:
	.loc 1 1258 0
	movl	%eax, 52(%esp)
L353:
LBB437:
	.loc 1 1148 0
	movl	_kvm_arch_ops, %eax
	movl	$4, 4(%esp)
	movl	%ebx, (%esp)
	call	*56(%eax)
LBE437:
LBB438:
	movl	$3, 4(%esp)
	movl	%ebx, (%esp)
LBE438:
	.loc 1 1261 0
	movl	%eax, 56(%esp)
LBB439:
	.loc 1 1148 0
	movl	_kvm_arch_ops, %eax
	call	*56(%eax)
LBE439:
	.loc 1 1262 0
	movl	%eax, 60(%esp)
	.loc 1 1265 0
	leal	24(%esp), %eax
	.loc 1 1264 0
	movl	$0, 14816(%ebx)
	.loc 1 1265 0
	movl	$_emulate_ops, 4(%esp)
	movl	%eax, (%esp)
	call	_x86_emulate_memop
	.loc 1 1267 0
	testl	%eax, %eax
LVL451:
	.loc 1 1265 0
	movl	%eax, %esi
LVL452:
	.loc 1 1267 0
	jne	L346
	movl	14816(%ebx), %eax
	testl	%eax, %eax
	je	L347
L346:
	testl	%edi, %edi
	je	L348
	.loc 1 1268 0
	movl	14832(%ebx), %eax
	movl	14836(%ebx), %edx
	movl	%eax, 60(%edi)
	.loc 1 1269 0
	leal	14824(%ebx), %eax
	.loc 1 1268 0
	movl	%edx, 64(%edi)
	.loc 1 1269 0
	movl	%eax, 4(%esp)
	leal	68(%edi), %eax
	movl	$8, 8(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 1270 0
	movl	14820(%ebx), %eax
	movl	%eax, 76(%edi)
	.loc 1 1271 0
	movl	14816(%ebx), %eax
	movb	%al, 80(%edi)
L348:
	.loc 1 1274 0
	testl	%esi, %esi
	je	L347
	.loc 1 1275 0
	movl	%ebp, 4(%esp)
	movl	%ebx, (%esp)
	call	_kvm_mmu_unprotect_page_virt
	xorl	%edx, %edx
	testl	%eax, %eax
	jne	L350
	.loc 1 1279 0
	movl	14808(%ebx), %eax
	movl	$1, %edx
	testl	%eax, %eax
	jne	L350
LBB440:
LBB441:
	.loc 1 1198 0
	movl	24(%esp), %eax
	movl	92(%eax), %ebx
LVL453:
LBB442:
	.loc 1 1148 0
	movl	%eax, (%esp)
	movl	_kvm_arch_ops, %eax
	movl	$0, 4(%esp)
	call	*56(%eax)
LBE442:
	.loc 1 1203 0
	movl	$2, %edx
LBB443:
	.loc 1 1148 0
	movl	%eax, %ecx
LBE443:
	.loc 1 1203 0
	movl	_reported.3288, %eax
	testl	%eax, %eax
	jne	L350
	.loc 1 1206 0
	leal	24(%esp), %eax
	movl	%eax, 12(%esp)
	leal	64(%esp), %eax
	movl	%eax, 4(%esp)
	leal	(%ebx,%ecx), %eax
	movl	$4, 8(%esp)
	movl	%eax, (%esp)
	call	_emulator_read_std
	.loc 1 1208 0
	movzbl	67(%esp), %eax
	movl	%ebx, 4(%esp)
	movl	$LC35, (%esp)
	movl	%eax, 20(%esp)
	movzbl	66(%esp), %eax
	movl	%eax, 16(%esp)
	movzbl	65(%esp), %eax
	movl	%eax, 12(%esp)
	movzbl	64(%esp), %eax
	movl	%eax, 8(%esp)
	call	_printk
	.loc 1 1211 0
	movl	$2, %edx
	movl	$1, _reported.3288
	jmp	L350
LVL454:
	.p2align 4,,7
L347:
LBE441:
LBE440:
	.loc 1 1288 0
	movl	_kvm_arch_ops, %eax
	movl	%ebx, (%esp)
	call	*124(%eax)
	.loc 1 1289 0
	movl	28(%esp), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	call	*132(%eax)
	xorl	%edx, %edx
	cmpl	$0, 14816(%ebx)
	setne	%dl
LVL455:
L350:
	.loc 1 1299 0
	addl	$76, %esp
	movl	%edx, %eax
	popl	%ebx
LVL456:
	popl	%esi
LVL457:
	popl	%edi
LVL458:
	popl	%ebp
LVL459:
	ret
LVL460:
	.p2align 4,,7
L344:
	.loc 1 1244 0
	movl	$8, 36(%esp)
	.loc 1 1250 0
	movl	$0, 40(%esp)
	.loc 1 1251 0
	movl	$0, 44(%esp)
	.loc 1 1252 0
	movl	$0, 48(%esp)
	.loc 1 1253 0
	movl	$0, 52(%esp)
	jmp	L353
LFE155:
	.p2align 4,,15
.globl _kvm_vcpu_ioctl_run
	.def	_kvm_vcpu_ioctl_run;	.scl	2;	.type	32;	.endef
_kvm_vcpu_ioctl_run:
LFB171:
	.loc 1 1637 0
LVL461:
	pushl	%esi
LCFI153:
	pushl	%ebx
LCFI154:
	subl	$16, %esp
LCFI155:
	.loc 1 1637 0
	movl	28(%esp), %esi
	movl	32(%esp), %ebx
	.loc 1 1642 0
	movl	%esi, %eax
	call	_vcpu_load
	.loc 1 1645 0
	movl	44(%ebx), %eax
	movl	%eax, 132(%esi)
	.loc 1 1647 0
	movl	12(%ebx), %eax
	testl	%eax, %eax
	jne	L359
LVL462:
L356:
	.loc 1 1652 0
	movl	16(%ebx), %ecx
	testl	%ecx, %ecx
	je	L357
	.loc 1 1653 0
	leal	68(%ebx), %eax
	movl	%eax, 4(%esp)
	leal	14824(%esi), %eax
	movl	$8, 8(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 1654 0
	movl	$1, 14812(%esi)
	.loc 1 1655 0
	movl	$0, 12(%esp)
	movl	14840(%esi), %eax
	movl	%ebx, 4(%esp)
	movl	%esi, (%esp)
	movl	%eax, 8(%esp)
	call	_emulate_instruction
L357:
	.loc 1 1658 0
	movl	$0, 14808(%esi)
	.loc 1 1660 0
	movl	_kvm_arch_ops, %eax
	movl	%ebx, 4(%esp)
	movl	%esi, (%esp)
	call	*152(%eax)
	movl	%eax, %ebx
LVL463:
	.loc 1 1662 0
	movl	%esi, %eax
	call	_vcpu_put
	.loc 1 1666 0
	movl	%ebx, %eax
	addl	$16, %esp
	popl	%ebx
LVL464:
	popl	%esi
LVL465:
	ret
LVL466:
	.p2align 4,,7
L359:
	.loc 1 1648 0
	movl	_kvm_arch_ops, %eax
	movl	%esi, (%esp)
	call	*160(%eax)
	.loc 1 1649 0
	movl	$0, 12(%ebx)
	jmp	L356
LFE171:
	.section .rdata,"dr"
LC36:
	.ascii "<1>kvm->lock: %d\12\0"
	.text
	.p2align 4,,15
.globl _kvm_vm_ioctl_set_memory_region
	.def	_kvm_vm_ioctl_set_memory_region;	.scl	2;	.type	32;	.endef
_kvm_vm_ioctl_set_memory_region:
LFB137:
	.loc 1 675 0
LVL467:
	pushl	%ebp
LCFI156:
	pushl	%edi
LCFI157:
	pushl	%esi
LCFI158:
	pushl	%ebx
LCFI159:
	subl	$100, %esp
LCFI160:
	.loc 1 675 0
	movl	120(%esp), %edi
	.loc 1 686 0
	movl	(%edi), %eax
	movl	$LC36, (%esp)
	movl	%eax, 4(%esp)
	call	_printk
	.loc 1 690 0
	movl	124(%esp), %eax
	movl	16(%eax), %ebx
	movl	20(%eax), %esi
	testl	$4095, %ebx
	jne	L361
LVL468:
	.loc 1 692 0
	movl	8(%eax), %edx
	movl	12(%eax), %ecx
	testl	$4095, %edx
	movl	%edx, 12(%esp)
	movl	%ecx, 16(%esp)
	je	L388
L361:
	.loc 1 816 0
	movl	$-22, %ebx
LVL469:
L382:
	.loc 1 820 0
	addl	$100, %esp
	movl	%ebx, %eax
	popl	%ebx
LVL470:
	popl	%esi
LVL471:
	popl	%edi
LVL472:
	popl	%ebp
LVL473:
	ret
LVL474:
	.p2align 4,,7
L388:
	.loc 1 694 0
	movl	(%eax), %eax
	cmpl	$3, %eax
	movl	%eax, 36(%esp)
	ja	L361
	.loc 1 696 0
	addl	%ebx, %edx
	adcl	%esi, %ecx
	cmpl	%ecx, 16(%esp)
	movl	%edx, 28(%esp)
	movl	%ecx, 32(%esp)
	ja	L361
	jae	L389
L385:
	.loc 1 699 0
	movl	36(%esp), %ecx
	.loc 1 701 0
	shrdl	$12, %esi, %ebx
	.loc 1 700 0
	movl	16(%esp), %edx
	.loc 1 701 0
	movl	%ebx, %ebp
LVL475:
	.loc 1 699 0
	leal	(%ecx,%ecx,4), %eax
	leal	8(%edi,%eax,4), %eax
	movl	%eax, 48(%esp)
LVL476:
	.loc 1 700 0
	movl	12(%esp), %eax
	shrdl	$12, %edx, %eax
	.loc 1 703 0
	testl	%ebx, %ebx
	.loc 1 700 0
	movl	%eax, 44(%esp)
LVL477:
	.loc 1 703 0
	je	L390
LVL478:
L363:
	.loc 1 750 0
	leal	0(,%ebp,4), %ecx
	.loc 1 710 0
	movl	36(%esp), %edx
	.loc 1 750 0
	movl	%ecx, 40(%esp)
LBB444:
	.loc 1 728 0
	movl	44(%esp), %ecx
LBE444:
LBB445:
	.loc 1 769 0
	leal	31(%ebp), %ebx
LVL479:
	andl	$-32, %ebx
	shrl	$3, %ebx
LBE445:
	.loc 1 710 0
	leal	(%edx,%edx,4), %eax
	sall	$2, %eax
LBB446:
	.loc 1 728 0
	addl	%ebp, %ecx
LBE446:
LBB447:
	.loc 1 769 0
	movl	%ebx, 56(%esp)
LVL480:
LBE447:
	.loc 1 710 0
	movl	%eax, 24(%esp)
LBB448:
	.loc 1 728 0
	movl	%ecx, 20(%esp)
LVL481:
L376:
LBE448:
	.loc 1 707 0
	movl	%edi, (%esp)
	call	_spin_lock
	.loc 1 709 0
	movl	16043(%edi), %ebx
	.loc 1 718 0
	testl	%ebp, %ebp
	.loc 1 710 0
	movl	24(%esp), %edx
	.loc 1 709 0
	movl	%ebx, 52(%esp)
LVL482:
	.loc 1 710 0
	movl	8(%edx,%edi), %eax
	movl	%edx, %ebx
	movl	%eax, 80(%esp)
	movl	12(%edx,%edi), %ecx
	movl	%ecx, 84(%esp)
	movl	16(%edx,%edi), %eax
	movl	%eax, 88(%esp)
	movl	20(%edx,%edi), %edx
	movl	%edx, 92(%esp)
	movl	24(%ebx,%edi), %eax
	movl	%edx, 72(%esp)
	.loc 1 714 0
	movl	124(%esp), %edx
	.loc 1 713 0
	movl	%ebp, 64(%esp)
	.loc 1 710 0
	movl	%eax, 96(%esp)
	movl	%eax, 76(%esp)
	.loc 1 712 0
	movl	44(%esp), %eax
	movl	%eax, 60(%esp)
	.loc 1 714 0
	movl	4(%edx), %eax
	movl	%eax, 68(%esp)
	.loc 1 718 0
	je	L364
	testl	%ecx, %ecx
	jne	L391
L364:
	.loc 1 719 0
	xorl	%edx, %edx
LVL483:
	xorl	%ecx, %ecx
	.p2align 4,,7
L368:
LBB449:
	.loc 1 726 0
	leal	(%edx,%edx,4), %eax
	leal	8(%edi,%eax,4), %eax
	cmpl	%eax, 48(%esp)
	je	L366
LVL484:
	.loc 1 728 0
	movl	8(%edi,%ecx), %eax
	cmpl	%eax, 20(%esp)
	jbe	L366
	addl	12(%edi,%ecx), %eax
	cmpl	%eax, 44(%esp)
	jb	L392
L366:
LBE449:
	.loc 1 723 0
	addl	$1, %edx
	addl	$20, %ecx
	cmpl	$4, %edx
	jne	L368
	.loc 1 736 0
	movl	%edi, (%esp)
	call	_spin_unlock
LVL485:
	.loc 1 739 0
	testl	%ebp, %ebp
	jne	L369
	.loc 1 740 0
	movl	$0, 72(%esp)
L369:
	.loc 1 743 0
	movl	68(%esp), %eax
	andl	$1, %eax
	jne	L370
	.loc 1 744 0
	movl	$0, 76(%esp)
L370:
	.loc 1 749 0
	testl	%ebp, %ebp
	je	L371
	movl	72(%esp), %edx
	testl	%edx, %edx
	je	L393
LVL486:
L371:
	.loc 1 768 0
	testl	%eax, %eax
	je	L374
	movl	76(%esp), %eax
	testl	%eax, %eax
	je	L394
L374:
	.loc 1 777 0
	movl	%edi, (%esp)
	call	_spin_lock
	.loc 1 779 0
	movl	52(%esp), %ecx
	cmpl	%ecx, 16043(%edi)
	je	L375
LVL487:
	.loc 1 780 0
	movl	%edi, (%esp)
	call	_spin_unlock
	.loc 1 781 0
	leal	80(%esp), %edx
	leal	60(%esp), %eax
	call	_kvm_free_physmem_slot
	jmp	L376
LVL488:
	.p2align 4,,7
L392:
LBB450:
	.loc 1 728 0
	movl	$-17, %ebx
LVL489:
L367:
LBE450:
	.loc 1 814 0
	movl	%edi, (%esp)
	call	_spin_unlock
LVL490:
L383:
	.loc 1 816 0
	leal	80(%esp), %edx
	leal	60(%esp), %eax
	call	_kvm_free_physmem_slot
	jmp	L382
LVL491:
	.p2align 4,,7
L391:
	.loc 1 718 0
	cmpl	%ecx, %ebp
	je	L364
	.loc 1 811 0
	movl	$-22, %ebx
LVL492:
	.p2align 4,,7
	jmp	L367
LVL493:
	.p2align 4,,7
L390:
	.loc 1 704 0
	movl	124(%esp), %edx
	andl	$-2, 4(%edx)
	.p2align 4,,2
	jmp	L363
LVL494:
	.p2align 4,,7
L389:
	.loc 1 696 0
	cmpl	%edx, 12(%esp)
	ja	L361
	.p2align 4,,3
	jmp	L385
LVL495:
L394:
LBB451:
	.loc 1 771 0
	movl	56(%esp), %eax
	movl	%eax, (%esp)
	call	_vmalloc
	.loc 1 772 0
	testl	%eax, %eax
	.loc 1 771 0
	movl	%eax, 76(%esp)
	.loc 1 772 0
	je	L372
LVL496:
	.loc 1 774 0
	movl	56(%esp), %edx
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	movl	%edx, 8(%esp)
	call	_memset
	jmp	L374
LVL497:
L393:
LBE451:
	.loc 1 750 0
	movl	40(%esp), %ecx
	movl	%ecx, (%esp)
	call	_vmalloc
	.loc 1 752 0
	testl	%eax, %eax
	.loc 1 750 0
	movl	%eax, 72(%esp)
	.loc 1 752 0
	je	L372
	.loc 1 755 0
	movl	40(%esp), %ebx
	xorl	%esi, %esi
LVL498:
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	movl	%ebx, 8(%esp)
	call	_memset
	jmp	L373
	.p2align 4,,7
L396:
	.loc 1 756 0
	addl	$1, %esi
	cmpl	%esi, %ebp
	.loc 1 763 0
	movl	$0, (%eax)
	.loc 1 756 0
	jbe	L395
L373:
	.loc 1 760 0
	movl	60(%esp), %eax
	.loc 1 755 0
	leal	0(,%esi,4), %ebx
	.loc 1 760 0
	movl	$164050, 8(%esp)
	addl	72(%esp), %ebx
	movl	%esi, 4(%esp)
	movl	%eax, (%esp)
	call	_wk_alloc_page
	movl	%eax, (%ebx)
	.loc 1 761 0
	movl	72(%esp), %eax
	movl	(%eax,%esi,4), %eax
	testl	%eax, %eax
	jne	L396
L372:
	.loc 1 815 0
	movl	$-12, %ebx
LVL499:
	jmp	L383
LVL500:
L375:
	.loc 1 786 0
	movl	16047(%edi), %eax
	movl	$-11, %ebx
LVL501:
	testl	%eax, %eax
	jne	L367
	.loc 1 789 0
	movl	124(%esp), %ebx
LVL502:
	movl	(%ebx), %eax
	cmpl	4(%edi), %eax
	jb	L378
	.loc 1 790 0
	addl	$1, %eax
	movl	%eax, 4(%edi)
L378:
	.loc 1 792 0
	movl	36(%esp), %edx
LBB452:
LBB454:
LBB456:
	.loc 1 318 0
	leal	1132(%edi), %ebx
LBE456:
LBE454:
LBE452:
	.loc 1 792 0
	leal	(%edx,%edx,4), %eax
	movl	60(%esp), %edx
	sall	$2, %eax
	movl	%edx, 8(%eax,%edi)
	movl	64(%esp), %edx
	movl	%edx, 12(%eax,%edi)
	movl	68(%esp), %edx
	movl	%edx, 16(%eax,%edi)
	movl	72(%esp), %edx
	movl	%edx, 20(%eax,%edi)
	movl	76(%esp), %edx
	.loc 1 793 0
	addl	$1, 16043(%edi)
	.loc 1 792 0
	movl	%edx, 24(%eax,%edi)
	.loc 1 795 0
	movl	%edi, (%esp)
	call	_spin_unlock
LBB463:
LBB453:
LBB455:
	.loc 1 318 0
	movl	%ebx, (%esp)
	call	_mutex_lock
	.loc 1 319 0
	movl	1128(%edi), %eax
	testl	%eax, %eax
	je	L397
	.loc 1 323 0
	movl	_kvm_arch_ops, %eax
	.loc 1 316 0
	leal	1124(%edi), %esi
LVL503:
	.loc 1 323 0
	movl	%esi, (%esp)
	call	*32(%eax)
LBE455:
LBE453:
	.loc 1 803 0
	testb	$1, 68(%esp)
	jne	L398
L381:
	.loc 1 805 0
	movl	%esi, (%esp)
	call	_kvm_mmu_reset_context
	.loc 1 806 0
	movl	%esi, %eax
	call	_vcpu_put
LVL504:
L380:
LBE463:
	.loc 1 809 0
	leal	60(%esp), %edx
	xorl	%ebx, %ebx
LVL505:
	leal	80(%esp), %eax
	call	_kvm_free_physmem_slot
	jmp	L382
LVL506:
L395:
	.loc 1 756 0
	movl	68(%esp), %eax
	andl	$1, %eax
	jmp	L371
LVL507:
L398:
LBB464:
	.loc 1 804 0
	movl	124(%esp), %ecx
LBB458:
LBB459:
	.loc 1 662 0
	movl	1124(%edi), %eax
LBE459:
LBE458:
	.loc 1 804 0
	movl	(%ecx), %ebx
LBB461:
LBB460:
	.loc 1 662 0
	movl	%eax, (%esp)
	call	_spin_lock
	.loc 1 663 0
	movl	%esi, (%esp)
	movl	%ebx, 4(%esp)
	call	_kvm_mmu_slot_remove_write_access
	.loc 1 664 0
	movl	1124(%edi), %eax
	movl	%eax, (%esp)
	call	_spin_unlock
	jmp	L381
LVL508:
L397:
LBE460:
LBE461:
LBB462:
LBB457:
	.loc 1 320 0
	movl	%ebx, (%esp)
	call	_mutex_unlock
	.p2align 4,,6
	jmp	L380
LBE457:
LBE462:
LBE464:
LFE137:
	.p2align 4,,15
.globl _kvm_write_guest
	.def	_kvm_write_guest;	.scl	2;	.type	32;	.endef
_kvm_write_guest:
LFB115:
	.loc 1 263 0
LVL509:
	pushl	%ebp
LCFI161:
	pushl	%edi
LCFI162:
	pushl	%esi
LCFI163:
	pushl	%ebx
LCFI164:
	subl	$16, %esp
LCFI165:
	.loc 1 264 0
	movl	48(%esp), %eax
	movl	44(%esp), %ebp
	.loc 1 263 0
	movl	40(%esp), %edi
	.loc 1 264 0
	movl	%eax, 12(%esp)
LVL510:
	.loc 1 269 0
	xorl	%eax, %eax
	testl	%ebp, %ebp
	jne	L407
LVL511:
	jmp	L401
LVL512:
	.p2align 4,,7
L402:
LBB465:
	.loc 1 281 0
	movl	36(%esp), %ecx
	.loc 1 283 0
	shrdl	$12, %esi, %ebx
LVL513:
	.loc 1 287 0
	movl	$4096, %esi
LVL514:
	.loc 1 281 0
	movl	%edi, 4(%esp)
	movl	%ecx, (%esp)
	call	*13536(%ecx)
	.loc 1 282 0
	shrdl	$12, %edx, %eax
	movl	36(%esp), %edx
	movl	%eax, 4(%esp)
	movl	(%edx), %eax
	movl	%eax, (%esp)
	call	_mark_page_dirty
	.loc 1 283 0
	movl	%ebx, (%esp)
	call	_pfn_to_page
	movl	$3, 4(%esp)
	movl	%eax, (%esp)
	call	_kmap_atomic
	movl	%eax, %ebx
LVL515:
	.loc 1 285 0
	movl	%edi, %eax
LVL516:
	andl	$4095, %eax
	.loc 1 287 0
	subl	%eax, %esi
	.loc 1 286 0
	orl	%eax, %ebx
	.loc 1 287 0
	cmpl	%ebp, %esi
	jbe	L403
LVL517:
	movl	%ebp, %esi
L403:
	.loc 1 288 0
	movl	12(%esp), %ecx
	.loc 1 291 0
	subl	%esi, %ebp
	.loc 1 288 0
	movl	%ebx, (%esp)
	.loc 1 292 0
	andl	$-4096, %ebx
	.loc 1 288 0
	movl	%esi, 8(%esp)
	movl	%ecx, 4(%esp)
	call	_memcpy
LVL518:
	.loc 1 292 0
	movl	$3, 4(%esp)
	movl	%ebx, (%esp)
	call	_kunmap_atomic
LBE465:
	.loc 1 269 0
	testl	%ebp, %ebp
	je	L404
LVL519:
LBB466:
	.loc 1 289 0
	addl	%esi, 12(%esp)
LVL520:
	.loc 1 290 0
	addl	%esi, %edi
LVL521:
L407:
	.loc 1 276 0
	movl	36(%esp), %edx
	movl	%edi, 4(%esp)
	movl	%edx, (%esp)
	call	_gva_to_hpa
	.loc 1 278 0
	testl	%edx, %edx
LVL522:
	.loc 1 276 0
	movl	%eax, %ebx
LVL523:
	movl	%edx, %esi
LVL524:
	.loc 1 278 0
	jns	L402
	movl	44(%esp), %eax
	subl	%ebp, %eax
L401:
LBE466:
	.loc 1 298 0
	addl	$16, %esp
	popl	%ebx
LVL525:
	popl	%esi
LVL526:
	popl	%edi
LVL527:
	popl	%ebp
	ret
LVL528:
	.p2align 4,,7
L404:
LBB467:
	.loc 1 290 0
	movl	44(%esp), %eax
LBE467:
	.loc 1 298 0
	addl	$16, %esp
	popl	%ebx
LVL529:
	popl	%esi
LVL530:
	popl	%edi
LVL531:
	popl	%ebp
LVL532:
	ret
LFE115:
	.p2align 4,,15
.globl _kvm_read_guest
	.def	_kvm_read_guest;	.scl	2;	.type	32;	.endef
_kvm_read_guest:
LFB114:
	.loc 1 225 0
LVL533:
	pushl	%ebp
LCFI166:
	pushl	%edi
LCFI167:
	pushl	%esi
LCFI168:
	pushl	%ebx
LCFI169:
	subl	$16, %esp
LCFI170:
	.loc 1 226 0
	movl	48(%esp), %eax
	movl	44(%esp), %edi
	.loc 1 225 0
	movl	40(%esp), %ebp
	.loc 1 226 0
	movl	%eax, 12(%esp)
LVL534:
	.loc 1 231 0
	xorl	%eax, %eax
	testl	%edi, %edi
	jne	L416
LVL535:
	jmp	L410
LVL536:
	.p2align 4,,7
L411:
LBB468:
	.loc 1 242 0
	shrdl	$12, %edx, %eax
LVL537:
	.loc 1 247 0
	movl	$4096, %esi
	.loc 1 242 0
	movl	%eax, (%esp)
	call	_pfn_to_page
LVL538:
	movl	$3, 4(%esp)
	movl	%eax, (%esp)
	call	_kmap_atomic
	movl	%eax, %ebx
	.loc 1 245 0
	movl	%ebp, %eax
LVL539:
	andl	$4095, %eax
	.loc 1 247 0
	subl	%eax, %esi
	.loc 1 246 0
	orl	%eax, %ebx
	.loc 1 247 0
	cmpl	%edi, %esi
	jbe	L412
LVL540:
	movl	%edi, %esi
L412:
	.loc 1 248 0
	movl	12(%esp), %eax
LVL541:
	.loc 1 251 0
	subl	%esi, %edi
	.loc 1 248 0
	movl	%ebx, 4(%esp)
	.loc 1 252 0
	andl	$-4096, %ebx
	.loc 1 248 0
	movl	%esi, 8(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 252 0
	movl	$3, 4(%esp)
	movl	%ebx, (%esp)
	call	_kunmap_atomic
LBE468:
	.loc 1 231 0
	testl	%edi, %edi
	je	L413
LVL542:
LBB469:
	.loc 1 249 0
	addl	%esi, 12(%esp)
LVL543:
	.loc 1 250 0
	addl	%esi, %ebp
LVL544:
L416:
	.loc 1 237 0
	movl	36(%esp), %eax
	movl	%ebp, 4(%esp)
	movl	%eax, (%esp)
	call	_gva_to_hpa
	.loc 1 239 0
	testl	%edx, %edx
LVL545:
	jns	L411
	movl	44(%esp), %eax
	subl	%edi, %eax
L410:
LBE469:
	.loc 1 258 0
	addl	$16, %esp
	popl	%ebx
LVL546:
	popl	%esi
LVL547:
	popl	%edi
	popl	%ebp
LVL548:
	ret
LVL549:
	.p2align 4,,7
L413:
LBB470:
	.loc 1 250 0
	movl	44(%esp), %eax
LBE470:
	.loc 1 258 0
	addl	$16, %esp
	popl	%ebx
LVL550:
	popl	%esi
LVL551:
	popl	%edi
LVL552:
	popl	%ebp
LVL553:
	ret
LFE114:
.globl _emulate_ops
	.data
_emulate_ops:
	.long	_emulator_read_std
	.long	_emulator_write_std
	.long	_emulator_read_emulated
	.long	_emulator_write_emulated
	.long	_emulator_cmpxchg_emulated
	.long	_emulator_cmpxchg8b_emulated
.globl _msrs_to_save
	.align 4
_msrs_to_save:
	.long	372
	.long	373
	.long	374
	.long	-1073741695
	.long	16
.globl _emulated_msrs
	.align 4
_emulated_msrs:
	.long	416
.lcomm _reported.3230,16
.lcomm _reported.3218,16
	.section .rdata,"dr"
___FUNCTION__.4103:
	.ascii "test_2_t\0"
___FUNCTION__.4097:
	.ascii "test_1_t\0"
	.data
	.align 4
_kvm_vm_vm_ops:
	.space 8
	.long	_kvm_vm_nopage
	.space 4
	.align 4
_vm_list:
	.long	_vm_list
	.long	_vm_list
	.section .rdata,"dr"
___FUNCTION__.3517:
	.ascii "kvm_set_msr_common\0"
___FUNCTION__.3422:
	.ascii "realmode_set_cr\0"
___FUNCTION__.3406:
	.ascii "realmode_get_cr\0"
.lcomm _reported.3288,16
___FUNCTION__.3267:
	.ascii "emulator_get_dr\0"
.lcomm _kvm_lock,16
.globl _kvm_stat
	.bss
	.align 32
_kvm_stat:
	.space 48
.globl _kvm_arch_ops
	.align 4
_kvm_arch_ops:
	.space 4
.globl _kvmfs_mnt
	.align 4
_kvmfs_mnt:
	.space 4
.globl _num_msrs_to_save
	.align 4
_num_msrs_to_save:
	.space 4
	.section	.debug_frame,"dr"
Lframe0:
	.long	LECIE0-LSCIE0
LSCIE0:
	.long	0xffffffff
	.byte	0x1
	.ascii "\0"
	.uleb128 0x1
	.sleb128 -4
	.byte	0x8
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x1
	.align 4
LECIE0:
LSFDE0:
	.long	LEFDE0-LASFDE0
LASFDE0:
	.secrel32	Lframe0
	.long	LFB112
	.long	LFE112-LFB112
	.byte	0x4
	.long	LCFI0-LFB112
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI1-LCFI0
	.byte	0xe
	.uleb128 0x14
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE0:
LSFDE2:
	.long	LEFDE2-LASFDE2
LASFDE2:
	.secrel32	Lframe0
	.long	LFB140
	.long	LFE140-LFB140
	.byte	0x4
	.long	LCFI2-LFB140
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI3-LCFI2
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI4-LCFI3
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI5-LCFI4
	.byte	0xe
	.uleb128 0x14
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.align 4
LEFDE2:
LSFDE4:
	.long	LEFDE4-LASFDE4
LASFDE4:
	.secrel32	Lframe0
	.long	LFB141
	.long	LFE141-LFB141
	.byte	0x4
	.long	LCFI6-LFB141
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI7-LCFI6
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI8-LCFI7
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI9-LCFI8
	.byte	0xe
	.uleb128 0x14
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.align 4
LEFDE4:
LSFDE6:
	.long	LEFDE6-LASFDE6
LASFDE6:
	.secrel32	Lframe0
	.long	LFB150
	.long	LFE150-LFB150
	.align 4
LEFDE6:
LSFDE8:
	.long	LEFDE8-LASFDE8
LASFDE8:
	.secrel32	Lframe0
	.long	LFB151
	.long	LFE151-LFB151
	.byte	0x4
	.long	LCFI10-LFB151
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI11-LCFI10
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE8:
LSFDE10:
	.long	LEFDE10-LASFDE10
LASFDE10:
	.secrel32	Lframe0
	.long	LFB153
	.long	LFE153-LFB153
	.byte	0x4
	.long	LCFI12-LFB153
	.byte	0xe
	.uleb128 0x18
	.align 4
LEFDE10:
LSFDE12:
	.long	LEFDE12-LASFDE12
LASFDE12:
	.secrel32	Lframe0
	.long	LFB156
	.long	LFE156-LFB156
	.byte	0x4
	.long	LCFI13-LFB156
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI14-LCFI13
	.byte	0xe
	.uleb128 0xc
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE12:
LSFDE14:
	.long	LEFDE14-LASFDE14
LASFDE14:
	.secrel32	Lframe0
	.long	LFB158
	.long	LFE158-LFB158
	.byte	0x4
	.long	LCFI15-LFB158
	.byte	0xe
	.uleb128 0x14
	.align 4
LEFDE14:
LSFDE16:
	.long	LEFDE16-LASFDE16
LASFDE16:
	.secrel32	Lframe0
	.long	LFB159
	.long	LFE159-LFB159
	.byte	0x4
	.long	LCFI16-LFB159
	.byte	0xe
	.uleb128 0x14
	.align 4
LEFDE16:
LSFDE18:
	.long	LEFDE18-LASFDE18
LASFDE18:
	.secrel32	Lframe0
	.long	LFB168
	.long	LFE168-LFB168
	.align 4
LEFDE18:
LSFDE20:
	.long	LEFDE20-LASFDE20
LASFDE20:
	.secrel32	Lframe0
	.long	LFB169
	.long	LFE169-LFB169
	.byte	0x4
	.long	LCFI17-LFB169
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI18-LCFI17
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI19-LCFI18
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x4
	.byte	0x86
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.align 4
LEFDE20:
LSFDE22:
	.long	LEFDE22-LASFDE22
LASFDE22:
	.secrel32	Lframe0
	.long	LFB170
	.long	LFE170-LFB170
	.byte	0x4
	.long	LCFI20-LFB170
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI21-LCFI20
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI22-LCFI21
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x4
	.byte	0x86
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.align 4
LEFDE22:
LSFDE24:
	.long	LEFDE24-LASFDE24
LASFDE24:
	.secrel32	Lframe0
	.long	LFB178
	.long	LFE178-LFB178
	.align 4
LEFDE24:
LSFDE26:
	.long	LEFDE26-LASFDE26
LASFDE26:
	.secrel32	Lframe0
	.long	LFB189
	.long	LFE189-LFB189
	.align 4
LEFDE26:
LSFDE28:
	.long	LEFDE28-LASFDE28
LASFDE28:
	.secrel32	Lframe0
	.long	LFB190
	.long	LFE190-LFB190
	.align 4
LEFDE28:
LSFDE30:
	.long	LEFDE30-LASFDE30
LASFDE30:
	.secrel32	Lframe0
	.long	LFB192
	.long	LFE192-LFB192
	.align 4
LEFDE30:
LSFDE32:
	.long	LEFDE32-LASFDE32
LASFDE32:
	.secrel32	Lframe0
	.long	LFB143
	.long	LFE143-LFB143
	.byte	0x4
	.long	LCFI23-LFB143
	.byte	0xe
	.uleb128 0x10
	.align 4
LEFDE32:
LSFDE34:
	.long	LEFDE34-LASFDE34
LASFDE34:
	.secrel32	Lframe0
	.long	LFB203
	.long	LFE203-LFB203
	.byte	0x4
	.long	LCFI24-LFB203
	.byte	0xe
	.uleb128 0x18
	.align 4
LEFDE34:
LSFDE36:
	.long	LEFDE36-LASFDE36
LASFDE36:
	.secrel32	Lframe0
	.long	LFB202
	.long	LFE202-LFB202
	.byte	0x4
	.long	LCFI25-LFB202
	.byte	0xe
	.uleb128 0x18
	.align 4
LEFDE36:
LSFDE38:
	.long	LEFDE38-LASFDE38
LASFDE38:
	.secrel32	Lframe0
	.long	LFB164
	.long	LFE164-LFB164
	.byte	0x4
	.long	LCFI26-LFB164
	.byte	0xe
	.uleb128 0xc
	.align 4
LEFDE38:
LSFDE40:
	.long	LEFDE40-LASFDE40
LASFDE40:
	.secrel32	Lframe0
	.long	LFB161
	.long	LFE161-LFB161
	.byte	0x4
	.long	LCFI27-LFB161
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.long	LCFI28-LCFI27
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	LCFI29-LCFI28
	.byte	0x86
	.uleb128 0x2
	.align 4
LEFDE40:
LSFDE42:
	.long	LEFDE42-LASFDE42
LASFDE42:
	.secrel32	Lframe0
	.long	LFB152
	.long	LFE152-LFB152
	.byte	0x4
	.long	LCFI30-LFB152
	.byte	0xe
	.uleb128 0x10
	.align 4
LEFDE42:
LSFDE44:
	.long	LEFDE44-LASFDE44
LASFDE44:
	.secrel32	Lframe0
	.long	LFB134
	.long	LFE134-LFB134
	.byte	0x4
	.long	LCFI31-LFB134
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI32-LCFI31
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE44:
LSFDE46:
	.long	LEFDE46-LASFDE46
LASFDE46:
	.secrel32	Lframe0
	.long	LFB142
	.long	LFE142-LFB142
	.byte	0x4
	.long	LCFI33-LFB142
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI34-LCFI33
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI35-LCFI34
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI36-LCFI35
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI37-LCFI36
	.byte	0xe
	.uleb128 0x28
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.align 4
LEFDE46:
LSFDE48:
	.long	LEFDE48-LASFDE48
LASFDE48:
	.secrel32	Lframe0
	.long	LFB144
	.long	LFE144-LFB144
	.byte	0x4
	.long	LCFI38-LFB144
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.long	LCFI40-LCFI38
	.byte	0x83
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x2
	.byte	0x4
	.long	LCFI41-LCFI40
	.byte	0x86
	.uleb128 0x3
	.align 4
LEFDE48:
LSFDE50:
	.long	LEFDE50-LASFDE50
LASFDE50:
	.secrel32	Lframe0
	.long	LFB146
	.long	LFE146-LFB146
	.byte	0x4
	.long	LCFI42-LFB146
	.byte	0xe
	.uleb128 0x34
	.byte	0x4
	.long	LCFI46-LCFI42
	.byte	0x86
	.uleb128 0x4
	.byte	0x83
	.uleb128 0x5
	.byte	0x85
	.uleb128 0x2
	.byte	0x87
	.uleb128 0x3
	.align 4
LEFDE50:
LSFDE52:
	.long	LEFDE52-LASFDE52
LASFDE52:
	.secrel32	Lframe0
	.long	LFB148
	.long	LFE148-LFB148
	.byte	0x4
	.long	LCFI47-LFB148
	.byte	0xe
	.uleb128 0x24
	.byte	0x4
	.long	LCFI48-LCFI47
	.byte	0x83
	.uleb128 0x5
	.byte	0x4
	.long	LCFI49-LCFI48
	.byte	0x86
	.uleb128 0x4
	.byte	0x4
	.long	LCFI50-LCFI49
	.byte	0x87
	.uleb128 0x3
	.byte	0x4
	.long	LCFI51-LCFI50
	.byte	0x85
	.uleb128 0x2
	.align 4
LEFDE52:
LSFDE54:
	.long	LEFDE54-LASFDE54
LASFDE54:
	.secrel32	Lframe0
	.long	LFB147
	.long	LFE147-LFB147
	.byte	0x4
	.long	LCFI52-LFB147
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.long	LCFI53-LCFI52
	.byte	0x83
	.uleb128 0x5
	.byte	0x4
	.long	LCFI54-LCFI53
	.byte	0x86
	.uleb128 0x4
	.byte	0x4
	.long	LCFI55-LCFI54
	.byte	0x87
	.uleb128 0x3
	.byte	0x4
	.long	LCFI56-LCFI55
	.byte	0x85
	.uleb128 0x2
	.align 4
LEFDE54:
LSFDE56:
	.long	LEFDE56-LASFDE56
LASFDE56:
	.secrel32	Lframe0
	.long	LFB135
	.long	LFE135-LFB135
	.byte	0x4
	.long	LCFI57-LFB135
	.byte	0xe
	.uleb128 0x10
	.align 4
LEFDE56:
LSFDE58:
	.long	LEFDE58-LASFDE58
LASFDE58:
	.secrel32	Lframe0
	.long	LFB204
	.long	LFE204-LFB204
	.byte	0x4
	.long	LCFI58-LFB204
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI59-LCFI58
	.byte	0xe
	.uleb128 0x14
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE58:
LSFDE60:
	.long	LEFDE60-LASFDE60
LASFDE60:
	.secrel32	Lframe0
	.long	LFB199
	.long	LFE199-LFB199
	.byte	0x4
	.long	LCFI60-LFB199
	.byte	0xe
	.uleb128 0x14
	.align 4
LEFDE60:
LSFDE62:
	.long	LEFDE62-LASFDE62
LASFDE62:
	.secrel32	Lframe0
	.long	LFB198
	.long	LFE198-LFB198
	.byte	0x4
	.long	LCFI61-LFB198
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI62-LCFI61
	.byte	0xe
	.uleb128 0x18
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE62:
LSFDE64:
	.long	LEFDE64-LASFDE64
LASFDE64:
	.secrel32	Lframe0
	.long	LFB186
	.long	LFE186-LFB186
	.byte	0x4
	.long	LCFI63-LFB186
	.byte	0xe
	.uleb128 0x8
	.align 4
LEFDE64:
LSFDE66:
	.long	LEFDE66-LASFDE66
LASFDE66:
	.secrel32	Lframe0
	.long	LFB191
	.long	LFE191-LFB191
	.byte	0x4
	.long	LCFI64-LFB191
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI65-LCFI64
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI66-LCFI65
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI67-LCFI66
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI68-LCFI67
	.byte	0xe
	.uleb128 0x18
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.align 4
LEFDE66:
LSFDE68:
	.long	LEFDE68-LASFDE68
LASFDE68:
	.secrel32	Lframe0
	.long	LFB129
	.long	LFE129-LFB129
	.byte	0x4
	.long	LCFI69-LFB129
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI70-LCFI69
	.byte	0xe
	.uleb128 0xc
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI71-LCFI70
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI72-LCFI71
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI73-LCFI72
	.byte	0xe
	.uleb128 0x24
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.align 4
LEFDE68:
LSFDE70:
	.long	LEFDE70-LASFDE70
LASFDE70:
	.secrel32	Lframe0
	.long	LFB133
	.long	LFE133-LFB133
	.byte	0x4
	.long	LCFI74-LFB133
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI75-LCFI74
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI76-LCFI75
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI77-LCFI76
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI78-LCFI77
	.byte	0xe
	.uleb128 0x1c
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.align 4
LEFDE70:
LSFDE72:
	.long	LEFDE72-LASFDE72
LASFDE72:
	.secrel32	Lframe0
	.long	LFB187
	.long	LFE187-LFB187
	.byte	0x4
	.long	LCFI79-LFB187
	.byte	0xe
	.uleb128 0x24
	.byte	0x4
	.long	LCFI80-LCFI79
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI83-LCFI80
	.byte	0x87
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x4
	.byte	0x83
	.uleb128 0x5
	.align 4
LEFDE72:
LSFDE74:
	.long	LEFDE74-LASFDE74
LASFDE74:
	.secrel32	Lframe0
	.long	LFB116
	.long	LFE116-LFB116
	.byte	0x4
	.long	LCFI84-LFB116
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x4
	.long	LCFI85-LCFI84
	.byte	0xe
	.uleb128 0xc
	.align 4
LEFDE74:
LSFDE76:
	.long	LEFDE76-LASFDE76
LASFDE76:
	.secrel32	Lframe0
	.long	LFB118
	.long	LFE118-LFB118
	.byte	0x4
	.long	LCFI86-LFB118
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x4
	.long	LCFI87-LCFI86
	.byte	0xe
	.uleb128 0xc
	.align 4
LEFDE76:
LSFDE78:
	.long	LEFDE78-LASFDE78
LASFDE78:
	.secrel32	Lframe0
	.long	LFB123
	.long	LFE123-LFB123
	.byte	0x4
	.long	LCFI88-LFB123
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x4
	.long	LCFI89-LCFI88
	.byte	0xe
	.uleb128 0xc
	.align 4
LEFDE78:
LSFDE80:
	.long	LEFDE80-LASFDE80
LASFDE80:
	.secrel32	Lframe0
	.long	LFB184
	.long	LFE184-LFB184
	.byte	0x4
	.long	LCFI90-LFB184
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI91-LCFI90
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	LCFI92-LCFI91
	.byte	0x86
	.uleb128 0x2
	.align 4
LEFDE80:
LSFDE82:
	.long	LEFDE82-LASFDE82
LASFDE82:
	.secrel32	Lframe0
	.long	LFB183
	.long	LFE183-LFB183
	.byte	0x4
	.long	LCFI93-LFB183
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.long	LCFI94-LCFI93
	.byte	0x86
	.uleb128 0x3
	.byte	0x4
	.long	LCFI95-LCFI94
	.byte	0x83
	.uleb128 0x4
	.byte	0x4
	.long	LCFI96-LCFI95
	.byte	0x87
	.uleb128 0x2
	.align 4
LEFDE82:
LSFDE84:
	.long	LEFDE84-LASFDE84
LASFDE84:
	.secrel32	Lframe0
	.long	LFB175
	.long	LFE175-LFB175
	.byte	0x4
	.long	LCFI97-LFB175
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI98-LCFI97
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI99-LCFI98
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI100-LCFI99
	.byte	0xe
	.uleb128 0x24
	.byte	0x83
	.uleb128 0x4
	.byte	0x86
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.align 4
LEFDE84:
LSFDE86:
	.long	LEFDE86-LASFDE86
LASFDE86:
	.secrel32	Lframe0
	.long	LFB173
	.long	LFE173-LFB173
	.byte	0x4
	.long	LCFI101-LFB173
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI102-LCFI101
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI103-LCFI102
	.byte	0xe
	.uleb128 0x14
	.byte	0x83
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.align 4
LEFDE86:
LSFDE88:
	.long	LEFDE88-LASFDE88
LASFDE88:
	.secrel32	Lframe0
	.long	LFB172
	.long	LFE172-LFB172
	.byte	0x4
	.long	LCFI104-LFB172
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI105-LCFI104
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI106-LCFI105
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.align 4
LEFDE88:
LSFDE90:
	.long	LEFDE90-LASFDE90
LASFDE90:
	.secrel32	Lframe0
	.long	LFB121
	.long	LFE121-LFB121
	.byte	0x4
	.long	LCFI107-LFB121
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x4
	.long	LCFI108-LCFI107
	.byte	0xe
	.uleb128 0xc
	.byte	0x86
	.uleb128 0x3
	.byte	0x4
	.long	LCFI109-LCFI108
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI110-LCFI109
	.byte	0xe
	.uleb128 0x14
	.byte	0x83
	.uleb128 0x4
	.align 4
LEFDE90:
LSFDE92:
	.long	LEFDE92-LASFDE92
LASFDE92:
	.secrel32	Lframe0
	.long	LFB126
	.long	LFE126-LFB126
	.byte	0x4
	.long	LCFI111-LFB126
	.byte	0xe
	.uleb128 0x8
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	LCFI112-LCFI111
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI113-LCFI112
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x3
	.align 4
LEFDE92:
LSFDE94:
	.long	LEFDE94-LASFDE94
LASFDE94:
	.secrel32	Lframe0
	.long	LFB193
	.long	LFE193-LFB193
	.byte	0x4
	.long	LCFI114-LFB193
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.long	LCFI118-LCFI114
	.byte	0x85
	.uleb128 0x2
	.byte	0x86
	.uleb128 0x4
	.byte	0x83
	.uleb128 0x5
	.byte	0x87
	.uleb128 0x3
	.align 4
LEFDE94:
LSFDE96:
	.long	LEFDE96-LASFDE96
LASFDE96:
	.secrel32	Lframe0
	.long	LFB127
	.long	LFE127-LFB127
	.align 4
LEFDE96:
LSFDE98:
	.long	LEFDE98-LASFDE98
LASFDE98:
	.secrel32	Lframe0
	.long	LFB188
	.long	LFE188-LFB188
	.byte	0x4
	.long	LCFI119-LFB188
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.long	LCFI120-LCFI119
	.byte	0x83
	.uleb128 0x5
	.byte	0x4
	.long	LCFI121-LCFI120
	.byte	0x86
	.uleb128 0x4
	.byte	0x4
	.long	LCFI123-LCFI121
	.byte	0x85
	.uleb128 0x2
	.byte	0x87
	.uleb128 0x3
	.align 4
LEFDE98:
LSFDE100:
	.long	LEFDE100-LASFDE100
LASFDE100:
	.secrel32	Lframe0
	.long	LFB177
	.long	LFE177-LFB177
	.byte	0x4
	.long	LCFI124-LFB177
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI125-LCFI124
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI126-LCFI125
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI127-LCFI126
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI128-LCFI127
	.byte	0xe
	.uleb128 0x54
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.align 4
LEFDE100:
LSFDE102:
	.long	LEFDE102-LASFDE102
LASFDE102:
	.secrel32	Lframe0
	.long	LFB132
	.long	LFE132-LFB132
	.byte	0x4
	.long	LCFI129-LFB132
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI130-LCFI129
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	LCFI131-LCFI130
	.byte	0x83
	.uleb128 0x3
	.align 4
LEFDE102:
LSFDE104:
	.long	LEFDE104-LASFDE104
LASFDE104:
	.secrel32	Lframe0
	.long	LFB130
	.long	LFE130-LFB130
	.byte	0x4
	.long	LCFI132-LFB130
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI133-LCFI132
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI134-LCFI133
	.byte	0xe
	.uleb128 0x18
	.byte	0x83
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.align 4
LEFDE104:
LSFDE106:
	.long	LEFDE106-LASFDE106
LASFDE106:
	.secrel32	Lframe0
	.long	LFB162
	.long	LFE162-LFB162
	.byte	0x4
	.long	LCFI135-LFB162
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI137-LCFI135
	.byte	0x86
	.uleb128 0x2
	.byte	0x83
	.uleb128 0x3
	.align 4
LEFDE106:
LSFDE108:
	.long	LEFDE108-LASFDE108
LASFDE108:
	.secrel32	Lframe0
	.long	LFB131
	.long	LFE131-LFB131
	.byte	0x4
	.long	LCFI138-LFB131
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI139-LCFI138
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	LCFI140-LCFI139
	.byte	0x83
	.uleb128 0x3
	.align 4
LEFDE108:
LSFDE110:
	.long	LEFDE110-LASFDE110
LASFDE110:
	.secrel32	Lframe0
	.long	LFB160
	.long	LFE160-LFB160
	.byte	0x4
	.long	LCFI141-LFB160
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI142-LCFI141
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE110:
LSFDE112:
	.long	LEFDE112-LASFDE112
LASFDE112:
	.secrel32	Lframe0
	.long	LFB166
	.long	LFE166-LFB166
	.byte	0x4
	.long	LCFI143-LFB166
	.byte	0xe
	.uleb128 0x2c
	.byte	0x4
	.long	LCFI147-LCFI143
	.byte	0x85
	.uleb128 0x2
	.byte	0x87
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x4
	.byte	0x83
	.uleb128 0x5
	.align 4
LEFDE112:
LSFDE114:
	.long	LEFDE114-LASFDE114
LASFDE114:
	.secrel32	Lframe0
	.long	LFB155
	.long	LFE155-LFB155
	.byte	0x4
	.long	LCFI148-LFB155
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI149-LCFI148
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI150-LCFI149
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI151-LCFI150
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI152-LCFI151
	.byte	0xe
	.uleb128 0x60
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.align 4
LEFDE114:
LSFDE116:
	.long	LEFDE116-LASFDE116
LASFDE116:
	.secrel32	Lframe0
	.long	LFB171
	.long	LFE171-LFB171
	.byte	0x4
	.long	LCFI153-LFB171
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI154-LCFI153
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI155-LCFI154
	.byte	0xe
	.uleb128 0x1c
	.byte	0x83
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.align 4
LEFDE116:
LSFDE118:
	.long	LEFDE118-LASFDE118
LASFDE118:
	.secrel32	Lframe0
	.long	LFB137
	.long	LFE137-LFB137
	.byte	0x4
	.long	LCFI156-LFB137
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI157-LCFI156
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI158-LCFI157
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI159-LCFI158
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI160-LCFI159
	.byte	0xe
	.uleb128 0x78
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.align 4
LEFDE118:
LSFDE120:
	.long	LEFDE120-LASFDE120
LASFDE120:
	.secrel32	Lframe0
	.long	LFB115
	.long	LFE115-LFB115
	.byte	0x4
	.long	LCFI161-LFB115
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI162-LCFI161
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI163-LCFI162
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI164-LCFI163
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI165-LCFI164
	.byte	0xe
	.uleb128 0x24
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.align 4
LEFDE120:
LSFDE122:
	.long	LEFDE122-LASFDE122
LASFDE122:
	.secrel32	Lframe0
	.long	LFB114
	.long	LFE114-LFB114
	.byte	0x4
	.long	LCFI166-LFB114
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI167-LCFI166
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI168-LCFI167
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI169-LCFI168
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI170-LCFI169
	.byte	0xe
	.uleb128 0x24
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.align 4
LEFDE122:
	.text
Letext0:
	.section	.debug_loc,"dr"
Ldebug_loc0:
LLST0:
	.long	LFB112-Ltext0
	.long	LCFI0-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI0-Ltext0
	.long	LCFI1-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI1-Ltext0
	.long	LFE112-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST1:
	.long	LVL0-Ltext0
	.long	LVL2-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL2-Ltext0
	.long	LVL3-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL3-Ltext0
	.long	LVL9-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL9-Ltext0
	.long	LVL10-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL10-Ltext0
	.long	LFE112-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST2:
	.long	LVL6-Ltext0
	.long	LVL7-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST3:
	.long	LVL4-Ltext0
	.long	LVL6-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL10-Ltext0
	.long	LVL11-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST4:
	.long	LVL1-Ltext0
	.long	LVL13-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST5:
	.long	LVL11-Ltext0
	.long	LVL13-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST6:
	.long	LFB140-Ltext0
	.long	LCFI2-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI2-Ltext0
	.long	LCFI3-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI3-Ltext0
	.long	LCFI4-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI4-Ltext0
	.long	LCFI5-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI5-Ltext0
	.long	LFE140-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST7:
	.long	LVL14-Ltext0
	.long	LVL15-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL15-Ltext0
	.long	LVL21-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL21-Ltext0
	.long	LFE140-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST8:
	.long	LVL14-Ltext0
	.long	LVL15-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL15-Ltext0
	.long	LVL22-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL22-Ltext0
	.long	LFE140-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST9:
	.long	LVL17-Ltext0
	.long	LVL18-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL19-Ltext0
	.long	LVL20-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST10:
	.long	LFB141-Ltext0
	.long	LCFI6-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI6-Ltext0
	.long	LCFI7-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI7-Ltext0
	.long	LCFI8-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI8-Ltext0
	.long	LCFI9-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI9-Ltext0
	.long	LFE141-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST11:
	.long	LVL23-Ltext0
	.long	LVL24-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL24-Ltext0
	.long	LVL28-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL28-Ltext0
	.long	LVL29-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL29-Ltext0
	.long	LVL33-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL33-Ltext0
	.long	LFE141-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST12:
	.long	LVL23-Ltext0
	.long	LVL24-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL24-Ltext0
	.long	LVL27-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL27-Ltext0
	.long	LVL29-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL29-Ltext0
	.long	LVL32-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL32-Ltext0
	.long	LFE141-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST13:
	.long	LVL25-Ltext0
	.long	LVL30-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST14:
	.long	LVL26-Ltext0
	.long	LVL29-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL31-Ltext0
	.long	LFE141-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST16:
	.long	LFB151-Ltext0
	.long	LCFI10-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI10-Ltext0
	.long	LCFI11-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI11-Ltext0
	.long	LFE151-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST17:
	.long	LFB153-Ltext0
	.long	LCFI12-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI12-Ltext0
	.long	LFE153-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST18:
	.long	LFB156-Ltext0
	.long	LCFI13-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI13-Ltext0
	.long	LCFI14-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI14-Ltext0
	.long	LFE156-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
LLST19:
	.long	LFB158-Ltext0
	.long	LCFI15-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI15-Ltext0
	.long	LFE158-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST20:
	.long	LFB159-Ltext0
	.long	LCFI16-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI16-Ltext0
	.long	LFE159-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST22:
	.long	LFB169-Ltext0
	.long	LCFI17-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI17-Ltext0
	.long	LCFI18-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI18-Ltext0
	.long	LCFI19-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI19-Ltext0
	.long	LFE169-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST23:
	.long	LVL42-Ltext0
	.long	LVL43-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL43-Ltext0
	.long	LVL46-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL46-Ltext0
	.long	LFE169-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST24:
	.long	LVL44-Ltext0
	.long	LVL45-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST25:
	.long	LFB170-Ltext0
	.long	LCFI20-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI20-Ltext0
	.long	LCFI21-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI21-Ltext0
	.long	LCFI22-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI22-Ltext0
	.long	LFE170-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST26:
	.long	LVL47-Ltext0
	.long	LVL48-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL48-Ltext0
	.long	LVL53-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL53-Ltext0
	.long	LFE170-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST27:
	.long	LVL49-Ltext0
	.long	LVL52-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST32:
	.long	LFB143-Ltext0
	.long	LCFI23-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI23-Ltext0
	.long	LFE143-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST33:
	.long	LFB203-Ltext0
	.long	LCFI24-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI24-Ltext0
	.long	LFE203-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST34:
	.long	LFB202-Ltext0
	.long	LCFI25-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI25-Ltext0
	.long	LFE202-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST35:
	.long	LFB164-Ltext0
	.long	LCFI26-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI26-Ltext0
	.long	LFE164-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
LLST36:
	.long	LVL60-Ltext0
	.long	LVL61-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL61-Ltext0
	.long	LVL62-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL62-Ltext0
	.long	LVL63-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL63-Ltext0
	.long	LVL65-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL65-Ltext0
	.long	LVL66-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL66-Ltext0
	.long	LVL68-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL68-Ltext0
	.long	LVL70-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL70-Ltext0
	.long	LVL72-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL72-Ltext0
	.long	LVL73-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL73-Ltext0
	.long	LVL75-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL75-Ltext0
	.long	LFE164-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST37:
	.long	LVL65-Ltext0
	.long	LVL66-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	LVL68-Ltext0
	.long	LVL69-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	LVL72-Ltext0
	.long	LVL73-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	LVL75-Ltext0
	.long	LFE164-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST38:
	.long	LFB161-Ltext0
	.long	LCFI27-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI27-Ltext0
	.long	LFE161-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST39:
	.long	LVL76-Ltext0
	.long	LVL77-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL77-Ltext0
	.long	LVL79-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL79-Ltext0
	.long	LVL80-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL80-Ltext0
	.long	LVL82-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL82-Ltext0
	.long	LVL83-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL83-Ltext0
	.long	LVL85-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL85-Ltext0
	.long	LVL86-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL86-Ltext0
	.long	LVL88-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL88-Ltext0
	.long	LVL89-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL89-Ltext0
	.long	LVL91-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL91-Ltext0
	.long	LFE161-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST40:
	.long	LVL76-Ltext0
	.long	LVL77-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL77-Ltext0
	.long	LVL78-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL78-Ltext0
	.long	LVL80-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL80-Ltext0
	.long	LVL81-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL81-Ltext0
	.long	LVL83-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL83-Ltext0
	.long	LVL84-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL84-Ltext0
	.long	LVL86-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL86-Ltext0
	.long	LVL87-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL87-Ltext0
	.long	LVL89-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL89-Ltext0
	.long	LVL90-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL90-Ltext0
	.long	LFE161-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST41:
	.long	LFB152-Ltext0
	.long	LCFI30-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI30-Ltext0
	.long	LFE152-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST42:
	.long	LVL92-Ltext0
	.long	LVL94-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL94-Ltext0
	.long	LVL96-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL96-Ltext0
	.long	LVL97-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL97-Ltext0
	.long	LVL98-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL98-Ltext0
	.long	LFE152-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST43:
	.long	LVL93-Ltext0
	.long	LVL95-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL97-Ltext0
	.long	LVL98-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST44:
	.long	LFB134-Ltext0
	.long	LCFI31-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI31-Ltext0
	.long	LCFI32-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI32-Ltext0
	.long	LFE134-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST45:
	.long	LVL99-Ltext0
	.long	LVL100-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL100-Ltext0
	.long	LVL101-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL101-Ltext0
	.long	LVL102-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL102-Ltext0
	.long	LVL104-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL104-Ltext0
	.long	LFE134-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST46:
	.long	LVL99-Ltext0
	.long	LVL100-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL100-Ltext0
	.long	LVL103-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL103-Ltext0
	.long	LFE134-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST47:
	.long	LFB142-Ltext0
	.long	LCFI33-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI33-Ltext0
	.long	LCFI34-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI34-Ltext0
	.long	LCFI35-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI35-Ltext0
	.long	LCFI36-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI36-Ltext0
	.long	LCFI37-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI37-Ltext0
	.long	LFE142-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 40
	.long	0x0
	.long	0x0
LLST48:
	.long	LVL106-Ltext0
	.long	LVL111-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LVL111-Ltext0
	.long	LVL138-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -28
	.long	LVL138-Ltext0
	.long	LFE142-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
LLST49:
	.long	LVL107-Ltext0
	.long	LVL130-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LVL130-Ltext0
	.long	LVL133-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -24
	.long	LVL133-Ltext0
	.long	LVL138-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LVL138-Ltext0
	.long	LFE142-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -24
	.long	0x0
	.long	0x0
LLST50:
	.long	LVL110-Ltext0
	.long	LVL116-Ltext0
	.word	0x6
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.long	LVL120-Ltext0
	.long	LVL124-Ltext0
	.word	0x6
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.long	LVL133-Ltext0
	.long	LVL138-Ltext0
	.word	0x6
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST51:
	.long	LVL108-Ltext0
	.long	LVL114-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL125-Ltext0
	.long	LVL137-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL138-Ltext0
	.long	LVL142-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST52:
	.long	LVL108-Ltext0
	.long	LVL113-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL126-Ltext0
	.long	LVL135-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL138-Ltext0
	.long	LVL140-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST53:
	.long	LVL108-Ltext0
	.long	LVL123-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL124-Ltext0
	.long	LVL136-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL138-Ltext0
	.long	LVL141-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST54:
	.long	LVL116-Ltext0
	.long	LVL118-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL119-Ltext0
	.long	LVL121-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL124-Ltext0
	.long	LVL127-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST55:
	.long	LVL108-Ltext0
	.long	LVL115-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL120-Ltext0
	.long	LVL122-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL128-Ltext0
	.long	LVL134-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL138-Ltext0
	.long	LVL139-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST56:
	.long	LVL115-Ltext0
	.long	LVL122-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL124-Ltext0
	.long	LVL128-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST57:
	.long	LFB144-Ltext0
	.long	LCFI38-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI38-Ltext0
	.long	LFE144-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 32
	.long	0x0
	.long	0x0
LLST58:
	.long	LVL143-Ltext0
	.long	LVL145-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL145-Ltext0
	.long	LVL147-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL147-Ltext0
	.long	LVL155-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL155-Ltext0
	.long	LVL157-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL157-Ltext0
	.long	LFE144-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST59:
	.long	LVL143-Ltext0
	.long	LVL145-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL145-Ltext0
	.long	LVL151-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL151-Ltext0
	.long	LVL152-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL152-Ltext0
	.long	LFE144-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST60:
	.long	LVL143-Ltext0
	.long	LVL145-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 12
	.long	LVL145-Ltext0
	.long	LVL146-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL146-Ltext0
	.long	LVL155-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 12
	.long	LVL155-Ltext0
	.long	LVL156-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL156-Ltext0
	.long	LFE144-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 12
	.long	0x0
	.long	0x0
LLST61:
	.long	LVL144-Ltext0
	.long	LVL149-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL152-Ltext0
	.long	LFE144-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST62:
	.long	LVL148-Ltext0
	.long	LVL150-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	LVL154-Ltext0
	.long	LVL155-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST63:
	.long	LFB146-Ltext0
	.long	LCFI42-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI42-Ltext0
	.long	LFE146-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 52
	.long	0x0
	.long	0x0
LLST64:
	.long	LVL159-Ltext0
	.long	LVL163-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LVL163-Ltext0
	.long	LFE146-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -36
	.long	0x0
	.long	0x0
LLST65:
	.long	LVL161-Ltext0
	.long	LVL162-Ltext0
	.word	0x6
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	LVL172-Ltext0
	.long	LVL181-Ltext0
	.word	0x6
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.long	LVL182-Ltext0
	.long	LFE146-Ltext0
	.word	0x6
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST66:
	.long	LVL165-Ltext0
	.long	LVL167-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL174-Ltext0
	.long	LVL175-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL176-Ltext0
	.long	LVL177-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST67:
	.long	LVL178-Ltext0
	.long	LVL180-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST68:
	.long	LVL168-Ltext0
	.long	LVL169-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL180-Ltext0
	.long	LFE146-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST69:
	.long	LVL165-Ltext0
	.long	LVL166-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL173-Ltext0
	.long	LVL179-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST70:
	.long	LFB148-Ltext0
	.long	LCFI47-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI47-Ltext0
	.long	LFE148-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	0x0
	.long	0x0
LLST71:
	.long	LVL183-Ltext0
	.long	LVL184-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL184-Ltext0
	.long	LVL189-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL189-Ltext0
	.long	LVL191-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL191-Ltext0
	.long	LVL194-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL194-Ltext0
	.long	LVL197-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL197-Ltext0
	.long	LFE148-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST72:
	.long	LVL183-Ltext0
	.long	LVL184-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 12
	.long	LVL184-Ltext0
	.long	LVL186-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL186-Ltext0
	.long	LVL191-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 12
	.long	LVL191-Ltext0
	.long	LVL193-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL193-Ltext0
	.long	LVL197-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 12
	.long	LVL197-Ltext0
	.long	LFE148-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST73:
	.long	LVL183-Ltext0
	.long	LVL184-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 16
	.long	LVL184-Ltext0
	.long	LVL190-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL190-Ltext0
	.long	LVL191-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 16
	.long	LVL191-Ltext0
	.long	LVL196-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL196-Ltext0
	.long	LVL197-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 16
	.long	LVL197-Ltext0
	.long	LFE148-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST74:
	.long	LVL183-Ltext0
	.long	LVL184-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 20
	.long	LVL184-Ltext0
	.long	LVL188-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL188-Ltext0
	.long	LVL191-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 20
	.long	LVL191-Ltext0
	.long	LVL195-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL195-Ltext0
	.long	LVL197-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 20
	.long	LVL197-Ltext0
	.long	LFE148-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST75:
	.long	LVL185-Ltext0
	.long	LVL187-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL191-Ltext0
	.long	LVL192-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST76:
	.long	LFB147-Ltext0
	.long	LCFI52-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI52-Ltext0
	.long	LFE147-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST77:
	.long	LVL198-Ltext0
	.long	LVL199-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL199-Ltext0
	.long	LVL203-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL203-Ltext0
	.long	LFE147-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST78:
	.long	LVL198-Ltext0
	.long	LVL199-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL199-Ltext0
	.long	LVL202-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL202-Ltext0
	.long	LFE147-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	0x0
	.long	0x0
LLST79:
	.long	LVL198-Ltext0
	.long	LVL199-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 12
	.long	LVL199-Ltext0
	.long	LVL201-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL201-Ltext0
	.long	LFE147-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 12
	.long	0x0
	.long	0x0
LLST80:
	.long	LVL198-Ltext0
	.long	LVL199-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 16
	.long	LVL199-Ltext0
	.long	LVL200-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL200-Ltext0
	.long	LFE147-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 16
	.long	0x0
	.long	0x0
LLST81:
	.long	LFB135-Ltext0
	.long	LCFI57-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI57-Ltext0
	.long	LFE135-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST82:
	.long	LFB204-Ltext0
	.long	LCFI58-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI58-Ltext0
	.long	LCFI59-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI59-Ltext0
	.long	LFE204-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST83:
	.long	LFB199-Ltext0
	.long	LCFI60-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI60-Ltext0
	.long	LFE199-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST84:
	.long	LFB198-Ltext0
	.long	LCFI61-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI61-Ltext0
	.long	LCFI62-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI62-Ltext0
	.long	LFE198-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST85:
	.long	LVL205-Ltext0
	.long	LVL206-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL206-Ltext0
	.long	LVL208-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL208-Ltext0
	.long	LVL212-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL212-Ltext0
	.long	LVL213-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL213-Ltext0
	.long	LVL215-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL215-Ltext0
	.long	LVL216-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL216-Ltext0
	.long	LVL217-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL217-Ltext0
	.long	LVL218-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL218-Ltext0
	.long	LFE198-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST86:
	.long	LVL207-Ltext0
	.long	LVL208-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL210-Ltext0
	.long	LVL211-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL213-Ltext0
	.long	LVL214-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL216-Ltext0
	.long	LVL217-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL218-Ltext0
	.long	LFE198-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST87:
	.long	LFB186-Ltext0
	.long	LCFI63-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI63-Ltext0
	.long	LFE186-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	0x0
	.long	0x0
LLST88:
	.long	LFB191-Ltext0
	.long	LCFI64-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI64-Ltext0
	.long	LCFI65-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI65-Ltext0
	.long	LCFI66-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI66-Ltext0
	.long	LCFI67-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI67-Ltext0
	.long	LCFI68-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI68-Ltext0
	.long	LFE191-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST89:
	.long	LVL220-Ltext0
	.long	LVL223-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL223-Ltext0
	.long	LVL226-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL226-Ltext0
	.long	LVL229-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL229-Ltext0
	.long	LVL230-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL230-Ltext0
	.long	LFE191-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST90:
	.long	LVL220-Ltext0
	.long	LVL223-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL223-Ltext0
	.long	LVL225-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL225-Ltext0
	.long	LFE191-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	0x0
	.long	0x0
LLST91:
	.long	LVL222-Ltext0
	.long	LVL233-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL235-Ltext0
	.long	LVL240-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST92:
	.long	LVL221-Ltext0
	.long	LVL234-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL235-Ltext0
	.long	LVL241-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST93:
	.long	LVL225-Ltext0
	.long	LVL226-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL227-Ltext0
	.long	LVL231-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL235-Ltext0
	.long	LVL236-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST94:
	.long	LVL230-Ltext0
	.long	LVL232-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL237-Ltext0
	.long	LVL239-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST95:
	.long	LVL224-Ltext0
	.long	LVL238-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST96:
	.long	LFB129-Ltext0
	.long	LCFI69-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI69-Ltext0
	.long	LCFI70-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI70-Ltext0
	.long	LCFI71-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI71-Ltext0
	.long	LCFI72-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI72-Ltext0
	.long	LCFI73-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI73-Ltext0
	.long	LFE129-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	0x0
	.long	0x0
LLST97:
	.long	LVL242-Ltext0
	.long	LVL246-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL246-Ltext0
	.long	LVL248-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LVL248-Ltext0
	.long	LFE129-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -28
	.long	0x0
	.long	0x0
LLST98:
	.long	LVL242-Ltext0
	.long	LVL247-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST99:
	.long	LVL243-Ltext0
	.long	LVL254-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST100:
	.long	LVL245-Ltext0
	.long	LVL255-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LVL255-Ltext0
	.long	LFE129-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -24
	.long	0x0
	.long	0x0
LLST101:
	.long	LVL251-Ltext0
	.long	LVL258-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL258-Ltext0
	.long	LVL262-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL265-Ltext0
	.long	LVL266-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST102:
	.long	LVL255-Ltext0
	.long	LVL256-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	LVL257-Ltext0
	.long	LVL259-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST103:
	.long	LVL253-Ltext0
	.long	LVL254-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL265-Ltext0
	.long	LFE129-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST104:
	.long	LVL261-Ltext0
	.long	LVL263-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL266-Ltext0
	.long	LFE129-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST105:
	.long	LVL250-Ltext0
	.long	LVL253-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST106:
	.long	LVL249-Ltext0
	.long	LVL252-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST107:
	.long	LFB133-Ltext0
	.long	LCFI74-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI74-Ltext0
	.long	LCFI75-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI75-Ltext0
	.long	LCFI76-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI76-Ltext0
	.long	LCFI77-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI77-Ltext0
	.long	LCFI78-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI78-Ltext0
	.long	LFE133-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 28
	.long	0x0
	.long	0x0
LLST108:
	.long	LVL267-Ltext0
	.long	LVL268-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL268-Ltext0
	.long	LVL274-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL274-Ltext0
	.long	LVL275-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL275-Ltext0
	.long	LVL277-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL277-Ltext0
	.long	LFE133-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST109:
	.long	LVL267-Ltext0
	.long	LVL268-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL268-Ltext0
	.long	LVL269-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL269-Ltext0
	.long	LVL272-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL272-Ltext0
	.long	LVL273-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL273-Ltext0
	.long	LFE133-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST110:
	.long	LVL270-Ltext0
	.long	LVL271-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL275-Ltext0
	.long	LVL276-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST111:
	.long	LFB187-Ltext0
	.long	LCFI79-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI79-Ltext0
	.long	LFE187-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	0x0
	.long	0x0
LLST112:
	.long	LVL278-Ltext0
	.long	LVL284-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL284-Ltext0
	.long	LVL289-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL289-Ltext0
	.long	LVL290-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL290-Ltext0
	.long	LFE187-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST113:
	.long	LVL281-Ltext0
	.long	LVL287-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL290-Ltext0
	.long	LFE187-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST114:
	.long	LVL282-Ltext0
	.long	LVL283-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL290-Ltext0
	.long	LVL291-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL291-Ltext0
	.long	LFE187-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST115:
	.long	LVL285-Ltext0
	.long	LVL286-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL292-Ltext0
	.long	LVL293-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST116:
	.long	LVL279-Ltext0
	.long	LVL280-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LVL280-Ltext0
	.long	LFE187-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -24
	.long	0x0
	.long	0x0
LLST117:
	.long	LFB116-Ltext0
	.long	LCFI84-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI84-Ltext0
	.long	LCFI85-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI85-Ltext0
	.long	LFE116-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
LLST118:
	.long	LVL294-Ltext0
	.long	LVL295-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL295-Ltext0
	.long	LVL296-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST119:
	.long	LFB118-Ltext0
	.long	LCFI86-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI86-Ltext0
	.long	LCFI87-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI87-Ltext0
	.long	LFE118-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
LLST120:
	.long	LVL297-Ltext0
	.long	LVL298-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL298-Ltext0
	.long	LVL299-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST121:
	.long	LFB123-Ltext0
	.long	LCFI88-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI88-Ltext0
	.long	LCFI89-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI89-Ltext0
	.long	LFE123-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
LLST122:
	.long	LVL300-Ltext0
	.long	LVL301-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL301-Ltext0
	.long	LVL302-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST123:
	.long	LFB184-Ltext0
	.long	LCFI90-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI90-Ltext0
	.long	LFE184-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
LLST124:
	.long	LVL303-Ltext0
	.long	LVL304-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL304-Ltext0
	.long	LVL306-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL306-Ltext0
	.long	LFE184-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST125:
	.long	LVL303-Ltext0
	.long	LVL304-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL304-Ltext0
	.long	LVL305-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL305-Ltext0
	.long	LFE184-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST126:
	.long	LFB183-Ltext0
	.long	LCFI93-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI93-Ltext0
	.long	LFE183-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST127:
	.long	LVL308-Ltext0
	.long	LVL313-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST128:
	.long	LVL310-Ltext0
	.long	LVL311-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST129:
	.long	LFB175-Ltext0
	.long	LCFI97-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI97-Ltext0
	.long	LCFI98-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI98-Ltext0
	.long	LCFI99-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI99-Ltext0
	.long	LCFI100-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI100-Ltext0
	.long	LFE175-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	0x0
	.long	0x0
LLST130:
	.long	LFB173-Ltext0
	.long	LCFI101-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI101-Ltext0
	.long	LCFI102-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI102-Ltext0
	.long	LCFI103-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI103-Ltext0
	.long	LFE173-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST131:
	.long	LFB172-Ltext0
	.long	LCFI104-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI104-Ltext0
	.long	LCFI105-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI105-Ltext0
	.long	LCFI106-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI106-Ltext0
	.long	LFE172-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST132:
	.long	LVL316-Ltext0
	.long	LVL317-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL317-Ltext0
	.long	LVL318-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL318-Ltext0
	.long	LFE172-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST133:
	.long	LVL316-Ltext0
	.long	LVL317-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL317-Ltext0
	.long	LVL319-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL319-Ltext0
	.long	LFE172-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST134:
	.long	LFB121-Ltext0
	.long	LCFI107-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI107-Ltext0
	.long	LCFI108-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI108-Ltext0
	.long	LCFI109-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI109-Ltext0
	.long	LCFI110-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI110-Ltext0
	.long	LFE121-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST135:
	.long	LVL320-Ltext0
	.long	LVL321-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL321-Ltext0
	.long	LVL327-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL329-Ltext0
	.long	LFE121-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST136:
	.long	LVL320-Ltext0
	.long	LVL322-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL322-Ltext0
	.long	LVL328-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL328-Ltext0
	.long	LVL330-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL330-Ltext0
	.long	LFE121-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST137:
	.long	LVL323-Ltext0
	.long	LVL326-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL330-Ltext0
	.long	LFE121-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST138:
	.long	LFB126-Ltext0
	.long	LCFI111-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI111-Ltext0
	.long	LCFI112-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI112-Ltext0
	.long	LCFI113-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI113-Ltext0
	.long	LFE126-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST139:
	.long	LVL331-Ltext0
	.long	LVL332-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL332-Ltext0
	.long	LVL335-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST140:
	.long	LVL333-Ltext0
	.long	LVL334-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST141:
	.long	LFB193-Ltext0
	.long	LCFI114-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI114-Ltext0
	.long	LFE193-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 32
	.long	0x0
	.long	0x0
LLST142:
	.long	LVL337-Ltext0
	.long	LVL340-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL344-Ltext0
	.long	LVL346-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL350-Ltext0
	.long	LVL351-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL354-Ltext0
	.long	LVL355-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST143:
	.long	LVL338-Ltext0
	.long	LVL341-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL345-Ltext0
	.long	LFE193-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST144:
	.long	LVL336-Ltext0
	.long	LVL342-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL344-Ltext0
	.long	LFE193-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST145:
	.long	LVL338-Ltext0
	.long	LVL343-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL349-Ltext0
	.long	LVL351-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL352-Ltext0
	.long	LVL353-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST146:
	.long	LVL338-Ltext0
	.long	LVL339-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL347-Ltext0
	.long	LVL348-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST148:
	.long	LFB188-Ltext0
	.long	LCFI119-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI119-Ltext0
	.long	LFE188-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST149:
	.long	LVL357-Ltext0
	.long	LVL359-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL359-Ltext0
	.long	LVL360-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL360-Ltext0
	.long	LVL363-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL363-Ltext0
	.long	LFE188-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST150:
	.long	LVL358-Ltext0
	.long	LVL361-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL363-Ltext0
	.long	LFE188-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST151:
	.long	LVL359-Ltext0
	.long	LVL362-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL364-Ltext0
	.long	LVL365-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL366-Ltext0
	.long	LFE188-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST152:
	.long	LFB177-Ltext0
	.long	LCFI124-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI124-Ltext0
	.long	LCFI125-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI125-Ltext0
	.long	LCFI126-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI126-Ltext0
	.long	LCFI127-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI127-Ltext0
	.long	LCFI128-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI128-Ltext0
	.long	LFE177-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 84
	.long	0x0
	.long	0x0
LLST153:
	.long	LVL367-Ltext0
	.long	LVL368-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL368-Ltext0
	.long	LVL371-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL371-Ltext0
	.long	LVL373-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL373-Ltext0
	.long	LFE177-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST154:
	.long	LVL367-Ltext0
	.long	LVL368-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL368-Ltext0
	.long	LVL372-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL372-Ltext0
	.long	LVL373-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL373-Ltext0
	.long	LFE177-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST155:
	.long	LVL369-Ltext0
	.long	LVL370-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST156:
	.long	LFB132-Ltext0
	.long	LCFI129-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI129-Ltext0
	.long	LFE132-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST157:
	.long	LVL374-Ltext0
	.long	LVL375-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL375-Ltext0
	.long	LVL377-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL377-Ltext0
	.long	LVL378-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL378-Ltext0
	.long	LVL380-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL380-Ltext0
	.long	LVL381-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL381-Ltext0
	.long	LFE132-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST158:
	.long	LVL374-Ltext0
	.long	LVL375-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL375-Ltext0
	.long	LVL376-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL376-Ltext0
	.long	LVL378-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL378-Ltext0
	.long	LVL379-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL379-Ltext0
	.long	LVL381-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL381-Ltext0
	.long	LFE132-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST159:
	.long	LFB130-Ltext0
	.long	LCFI132-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI132-Ltext0
	.long	LCFI133-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI133-Ltext0
	.long	LCFI134-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI134-Ltext0
	.long	LFE130-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST160:
	.long	LVL382-Ltext0
	.long	LVL383-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL383-Ltext0
	.long	LVL385-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL385-Ltext0
	.long	LVL386-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL386-Ltext0
	.long	LVL388-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL388-Ltext0
	.long	LVL389-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL389-Ltext0
	.long	LFE130-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST161:
	.long	LVL382-Ltext0
	.long	LVL383-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL383-Ltext0
	.long	LVL384-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL384-Ltext0
	.long	LVL386-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL386-Ltext0
	.long	LVL387-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL387-Ltext0
	.long	LVL389-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL389-Ltext0
	.long	LFE130-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST162:
	.long	LFB162-Ltext0
	.long	LCFI135-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI135-Ltext0
	.long	LFE162-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST163:
	.long	LVL390-Ltext0
	.long	LVL391-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL391-Ltext0
	.long	LVL392-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL392-Ltext0
	.long	LVL394-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL394-Ltext0
	.long	LVL396-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL396-Ltext0
	.long	LVL398-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL398-Ltext0
	.long	LVL400-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL400-Ltext0
	.long	LVL401-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL401-Ltext0
	.long	LVL402-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL402-Ltext0
	.long	LVL404-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL404-Ltext0
	.long	LVL406-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL406-Ltext0
	.long	LFE162-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST164:
	.long	LVL390-Ltext0
	.long	LVL391-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL391-Ltext0
	.long	LVL394-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL394-Ltext0
	.long	LVL395-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL395-Ltext0
	.long	LVL398-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL398-Ltext0
	.long	LVL401-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL401-Ltext0
	.long	LVL407-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL407-Ltext0
	.long	LFE162-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST165:
	.long	LVL390-Ltext0
	.long	LVL391-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL391-Ltext0
	.long	LVL394-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL394-Ltext0
	.long	LVL395-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL395-Ltext0
	.long	LVL398-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL398-Ltext0
	.long	LVL401-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL401-Ltext0
	.long	LVL407-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL407-Ltext0
	.long	LFE162-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	0x0
	.long	0x0
LLST166:
	.long	LVL390-Ltext0
	.long	LVL391-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 12
	.long	LVL391-Ltext0
	.long	LVL393-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL393-Ltext0
	.long	LVL394-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 12
	.long	LVL394-Ltext0
	.long	LVL397-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL397-Ltext0
	.long	LVL398-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 12
	.long	LVL398-Ltext0
	.long	LVL399-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL399-Ltext0
	.long	LVL401-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 12
	.long	LVL401-Ltext0
	.long	LVL403-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL403-Ltext0
	.long	LVL404-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 12
	.long	LVL404-Ltext0
	.long	LVL405-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL405-Ltext0
	.long	LFE162-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 12
	.long	0x0
	.long	0x0
LLST167:
	.long	LFB131-Ltext0
	.long	LCFI138-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI138-Ltext0
	.long	LFE131-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST168:
	.long	LVL408-Ltext0
	.long	LVL409-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL409-Ltext0
	.long	LVL410-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST169:
	.long	LFB160-Ltext0
	.long	LCFI141-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI141-Ltext0
	.long	LCFI142-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI142-Ltext0
	.long	LFE160-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST170:
	.long	LFB166-Ltext0
	.long	LCFI143-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI143-Ltext0
	.long	LFE166-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 44
	.long	0x0
	.long	0x0
LLST171:
	.long	LVL412-Ltext0
	.long	LVL413-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL413-Ltext0
	.long	LVL414-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL414-Ltext0
	.long	LVL424-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL424-Ltext0
	.long	LVL425-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL425-Ltext0
	.long	LVL426-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL426-Ltext0
	.long	LVL427-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL427-Ltext0
	.long	LVL434-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL434-Ltext0
	.long	LVL435-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL435-Ltext0
	.long	LVL436-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL436-Ltext0
	.long	LVL437-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL437-Ltext0
	.long	LFE166-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST172:
	.long	LVL421-Ltext0
	.long	LVL424-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL429-Ltext0
	.long	LVL430-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL439-Ltext0
	.long	LFE166-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST173:
	.long	LVL418-Ltext0
	.long	LVL421-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	LVL425-Ltext0
	.long	LVL426-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	LVL429-Ltext0
	.long	LVL430-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST174:
	.long	LVL422-Ltext0
	.long	LVL424-Ltext0
	.word	0x8
	.byte	0x74
	.sleb128 16
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -24
	.byte	0x93
	.uleb128 0x4
	.long	LVL429-Ltext0
	.long	LVL434-Ltext0
	.word	0x8
	.byte	0x74
	.sleb128 16
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -24
	.byte	0x93
	.uleb128 0x4
	.long	LVL443-Ltext0
	.long	LVL444-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LVL444-Ltext0
	.long	LFE166-Ltext0
	.word	0x8
	.byte	0x74
	.sleb128 16
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -24
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST175:
	.long	LVL420-Ltext0
	.long	LVL424-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL429-Ltext0
	.long	LVL433-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL439-Ltext0
	.long	LFE166-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST176:
	.long	LVL423-Ltext0
	.long	LVL424-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL429-Ltext0
	.long	LVL431-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL446-Ltext0
	.long	LFE166-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST177:
	.long	LVL422-Ltext0
	.long	LVL424-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	LVL429-Ltext0
	.long	LVL431-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	LVL441-Ltext0
	.long	LVL446-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST178:
	.long	LFB155-Ltext0
	.long	LCFI148-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI148-Ltext0
	.long	LCFI149-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI149-Ltext0
	.long	LCFI150-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI150-Ltext0
	.long	LCFI151-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI151-Ltext0
	.long	LCFI152-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI152-Ltext0
	.long	LFE155-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 96
	.long	0x0
	.long	0x0
LLST179:
	.long	LVL447-Ltext0
	.long	LVL448-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL448-Ltext0
	.long	LVL453-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL453-Ltext0
	.long	LVL454-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL454-Ltext0
	.long	LVL455-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL455-Ltext0
	.long	LVL460-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL460-Ltext0
	.long	LFE155-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST180:
	.long	LVL447-Ltext0
	.long	LVL448-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL448-Ltext0
	.long	LVL458-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL458-Ltext0
	.long	LVL460-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL460-Ltext0
	.long	LFE155-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST181:
	.long	LVL447-Ltext0
	.long	LVL448-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL448-Ltext0
	.long	LVL459-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL459-Ltext0
	.long	LVL460-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL460-Ltext0
	.long	LFE155-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST182:
	.long	LVL451-Ltext0
	.long	LVL452-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST183:
	.long	LVL450-Ltext0
	.long	LVL460-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -24
	.long	0x0
	.long	0x0
LLST184:
	.long	LVL453-Ltext0
	.long	LVL454-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL455-Ltext0
	.long	LVL456-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST185:
	.long	LFB171-Ltext0
	.long	LCFI153-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI153-Ltext0
	.long	LCFI154-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI154-Ltext0
	.long	LCFI155-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI155-Ltext0
	.long	LFE171-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 28
	.long	0x0
	.long	0x0
LLST186:
	.long	LVL461-Ltext0
	.long	LVL462-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL462-Ltext0
	.long	LVL465-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL465-Ltext0
	.long	LVL466-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL466-Ltext0
	.long	LFE171-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST187:
	.long	LVL461-Ltext0
	.long	LVL462-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL462-Ltext0
	.long	LVL463-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL463-Ltext0
	.long	LVL466-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL466-Ltext0
	.long	LFE171-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST188:
	.long	LVL463-Ltext0
	.long	LVL464-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST189:
	.long	LFB137-Ltext0
	.long	LCFI156-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI156-Ltext0
	.long	LCFI157-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI157-Ltext0
	.long	LCFI158-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI158-Ltext0
	.long	LCFI159-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI159-Ltext0
	.long	LCFI160-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI160-Ltext0
	.long	LFE137-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 120
	.long	0x0
	.long	0x0
LLST190:
	.long	LVL467-Ltext0
	.long	LVL468-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL468-Ltext0
	.long	LVL472-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL472-Ltext0
	.long	LVL474-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL474-Ltext0
	.long	LFE137-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST191:
	.long	LVL469-Ltext0
	.long	LVL470-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL489-Ltext0
	.long	LVL491-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL492-Ltext0
	.long	LVL493-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL499-Ltext0
	.long	LVL500-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL501-Ltext0
	.long	LVL502-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL505-Ltext0
	.long	LVL506-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST192:
	.long	LVL469-Ltext0
	.long	LVL474-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -76
	.long	LVL477-Ltext0
	.long	LVL481-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 44
	.long	LVL481-Ltext0
	.long	LVL493-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -76
	.long	LVL493-Ltext0
	.long	LVL494-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 44
	.long	LVL495-Ltext0
	.long	LFE137-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -76
	.long	0x0
	.long	0x0
LLST193:
	.long	LVL469-Ltext0
	.long	LVL473-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL475-Ltext0
	.long	LVL478-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL478-Ltext0
	.long	LVL479-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL479-Ltext0
	.long	LVL493-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL493-Ltext0
	.long	LVL494-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL495-Ltext0
	.long	LFE137-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST194:
	.long	LVL469-Ltext0
	.long	LVL471-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL481-Ltext0
	.long	LVL483-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL483-Ltext0
	.long	LVL485-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL486-Ltext0
	.long	LVL488-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL488-Ltext0
	.long	LVL489-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL489-Ltext0
	.long	LVL493-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL495-Ltext0
	.long	LVL497-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL498-Ltext0
	.long	LVL503-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL504-Ltext0
	.long	LVL507-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL508-Ltext0
	.long	LFE137-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST195:
	.long	LVL469-Ltext0
	.long	LVL474-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 48
	.long	LVL476-Ltext0
	.long	LVL484-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 48
	.long	LVL484-Ltext0
	.long	LVL490-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -72
	.long	LVL490-Ltext0
	.long	LVL494-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 48
	.long	LVL495-Ltext0
	.long	LFE137-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -72
	.long	0x0
	.long	0x0
LLST196:
	.long	LVL469-Ltext0
	.long	LVL474-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 52
	.long	LVL481-Ltext0
	.long	LVL482-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -68
	.long	LVL482-Ltext0
	.long	LVL487-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 52
	.long	LVL487-Ltext0
	.long	LVL488-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -68
	.long	LVL488-Ltext0
	.long	LVL493-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 52
	.long	LVL495-Ltext0
	.long	LVL500-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 52
	.long	LVL500-Ltext0
	.long	LVL506-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -68
	.long	LVL506-Ltext0
	.long	LVL507-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 52
	.long	LVL507-Ltext0
	.long	LFE137-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -68
	.long	0x0
	.long	0x0
LLST197:
	.long	LVL469-Ltext0
	.long	LVL474-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 56
	.long	LVL480-Ltext0
	.long	LVL493-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 56
	.long	LVL495-Ltext0
	.long	LVL496-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 56
	.long	LVL496-Ltext0
	.long	LVL497-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -64
	.long	LVL497-Ltext0
	.long	LFE137-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 56
	.long	0x0
	.long	0x0
LLST198:
	.long	LVL469-Ltext0
	.long	LVL471-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL503-Ltext0
	.long	LVL506-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL507-Ltext0
	.long	LVL508-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST199:
	.long	LFB115-Ltext0
	.long	LCFI161-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI161-Ltext0
	.long	LCFI162-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI162-Ltext0
	.long	LCFI163-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI163-Ltext0
	.long	LCFI164-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI164-Ltext0
	.long	LCFI165-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI165-Ltext0
	.long	LFE115-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	0x0
	.long	0x0
LLST200:
	.long	LVL509-Ltext0
	.long	LVL511-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL511-Ltext0
	.long	LVL527-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL527-Ltext0
	.long	LVL528-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL528-Ltext0
	.long	LVL531-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL531-Ltext0
	.long	LFE115-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST201:
	.long	LVL509-Ltext0
	.long	LVL517-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL517-Ltext0
	.long	LVL521-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL521-Ltext0
	.long	LVL528-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL528-Ltext0
	.long	LVL532-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL532-Ltext0
	.long	LFE115-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	0x0
	.long	0x0
LLST202:
	.long	LVL510-Ltext0
	.long	LVL519-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LVL519-Ltext0
	.long	LVL521-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -24
	.long	LVL521-Ltext0
	.long	LVL528-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LVL528-Ltext0
	.long	LFE115-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -24
	.long	0x0
	.long	0x0
LLST203:
	.long	LVL512-Ltext0
	.long	LVL514-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	LVL523-Ltext0
	.long	LVL524-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST204:
	.long	LVL514-Ltext0
	.long	LVL524-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL528-Ltext0
	.long	LVL530-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST205:
	.long	LVL516-Ltext0
	.long	LVL518-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST206:
	.long	LVL515-Ltext0
	.long	LVL523-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL528-Ltext0
	.long	LVL529-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST207:
	.long	LFB114-Ltext0
	.long	LCFI166-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI166-Ltext0
	.long	LCFI167-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI167-Ltext0
	.long	LCFI168-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI168-Ltext0
	.long	LCFI169-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI169-Ltext0
	.long	LCFI170-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI170-Ltext0
	.long	LFE114-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	0x0
	.long	0x0
LLST208:
	.long	LVL533-Ltext0
	.long	LVL535-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL535-Ltext0
	.long	LVL548-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL548-Ltext0
	.long	LVL549-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL549-Ltext0
	.long	LVL553-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL553-Ltext0
	.long	LFE114-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST209:
	.long	LVL533-Ltext0
	.long	LVL540-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL540-Ltext0
	.long	LVL544-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL544-Ltext0
	.long	LVL549-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL549-Ltext0
	.long	LVL552-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL552-Ltext0
	.long	LFE114-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	0x0
	.long	0x0
LLST210:
	.long	LVL534-Ltext0
	.long	LVL542-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LVL542-Ltext0
	.long	LVL544-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -24
	.long	LVL544-Ltext0
	.long	LVL549-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LVL549-Ltext0
	.long	LFE114-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -24
	.long	0x0
	.long	0x0
LLST211:
	.long	LVL537-Ltext0
	.long	LVL538-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST212:
	.long	LVL536-Ltext0
	.long	LVL547-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL549-Ltext0
	.long	LVL551-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST213:
	.long	LVL539-Ltext0
	.long	LVL541-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST214:
	.long	LVL536-Ltext0
	.long	LVL546-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL549-Ltext0
	.long	LVL550-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
	.file 6 "include/linux/winkvmint.h"
	.file 7 "include/linux/winkvm.h"
	.file 8 "include/linux/winkvmtypes.h"
	.file 9 "include/linux/kvm.h"
	.file 10 "include/linux/kvm_para.h"
	.file 11 "/home/ddk50/vmware/winkvm/kvm/kernel/x86_emulate.h"
	.file 12 "/home/ddk50/vmware/winkvm/kvm/kernel/segment_descriptor.h"
	.section	.debug_info,"dr"
	.long	0x5950
	.word	0x2
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C 4.3.4 20090804 (release) 1\0"
	.byte	0x1
	.ascii "/home/ddk50/vmware/winkvm/kvm/kernel/kvm_main.c\0"
	.ascii "/cygdrive/z/winkvm/windows-linux-compat\0"
	.long	Ltext0
	.long	Letext0
	.secrel32	Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x3
	.ascii "__u8\0"
	.byte	0x6
	.byte	0x9
	.long	0xad
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x3
	.ascii "__u16\0"
	.byte	0x6
	.byte	0xc
	.long	0xd8
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x3
	.ascii "__u32\0"
	.byte	0x6
	.byte	0xf
	.long	0x102
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x3
	.ascii "__u64\0"
	.byte	0x6
	.byte	0x17
	.long	0x130
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x3
	.ascii "u8\0"
	.byte	0x6
	.byte	0x1a
	.long	0xad
	.uleb128 0x3
	.ascii "u16\0"
	.byte	0x6
	.byte	0x1b
	.long	0xd8
	.uleb128 0x3
	.ascii "u32\0"
	.byte	0x6
	.byte	0x1c
	.long	0x102
	.uleb128 0x3
	.ascii "u64\0"
	.byte	0x6
	.byte	0x1d
	.long	0x123
	.uleb128 0x4
	.ascii "list_head\0"
	.byte	0x8
	.byte	0x5
	.byte	0x1a
	.long	0x1a6
	.uleb128 0x5
	.ascii "next\0"
	.byte	0x5
	.byte	0x1b
	.long	0x1a6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "prev\0"
	.byte	0x5
	.byte	0x1b
	.long	0x1a6
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x175
	.uleb128 0x7
	.ascii "hlist_head\0"
	.byte	0x4
	.byte	0x5
	.word	0x2c1
	.long	0x1d2
	.uleb128 0x8
	.ascii "first\0"
	.byte	0x5
	.word	0x2c2
	.long	0x208
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.ascii "hlist_node\0"
	.byte	0x8
	.byte	0x5
	.word	0x2c2
	.long	0x208
	.uleb128 0x8
	.ascii "next\0"
	.byte	0x5
	.word	0x2c6
	.long	0x208
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "pprev\0"
	.byte	0x5
	.word	0x2c6
	.long	0x20e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1d2
	.uleb128 0x6
	.byte	0x4
	.long	0x208
	.uleb128 0x4
	.ascii "page_mapped\0"
	.byte	0x18
	.byte	0x7
	.byte	0xd
	.long	0x285
	.uleb128 0x9
	.secrel32	LASF0
	.byte	0x7
	.byte	0xe
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.secrel32	LASF1
	.byte	0x7
	.byte	0xf
	.long	0x29a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "h_pfn\0"
	.byte	0x7
	.byte	0x10
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "g_pfn\0"
	.byte	0x7
	.byte	0x11
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "pMdl\0"
	.byte	0x7
	.byte	0x12
	.long	0x29a
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "userVA\0"
	.byte	0x7
	.byte	0x13
	.long	0x29a
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0x0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.uleb128 0xa
	.byte	0x4
	.uleb128 0x4
	.ascii "page_independed\0"
	.byte	0x10
	.byte	0x7
	.byte	0x16
	.long	0x2f5
	.uleb128 0x9
	.secrel32	LASF0
	.byte	0x7
	.byte	0x17
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.secrel32	LASF1
	.byte	0x7
	.byte	0x18
	.long	0x29a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "h_pfn\0"
	.byte	0x7
	.byte	0x19
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "head_page\0"
	.byte	0x7
	.byte	0x1a
	.long	0x337
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x4
	.ascii "page\0"
	.byte	0x24
	.byte	0x7
	.byte	0xb
	.long	0x337
	.uleb128 0xb
	.long	0x33d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "index\0"
	.byte	0x7
	.byte	0x22
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "page_type\0"
	.byte	0x7
	.byte	0x23
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.long	0x366
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2f5
	.uleb128 0xc
	.byte	0x4
	.byte	0x7
	.byte	0x1e
	.long	0x366
	.uleb128 0xd
	.ascii "private\0"
	.byte	0x7
	.byte	0x1f
	.long	0x285
	.uleb128 0xd
	.ascii "__mapping\0"
	.byte	0x7
	.byte	0x20
	.long	0x29a
	.byte	0x0
	.uleb128 0xc
	.byte	0x18
	.byte	0x7
	.byte	0x24
	.long	0x38f
	.uleb128 0xd
	.ascii "mapped\0"
	.byte	0x7
	.byte	0x25
	.long	0x214
	.uleb128 0xd
	.ascii "independed\0"
	.byte	0x7
	.byte	0x26
	.long	0x29c
	.byte	0x0
	.uleb128 0xe
	.secrel32	LASF2
	.byte	0x4
	.byte	0x7
	.byte	0x2a
	.long	0x3ae
	.uleb128 0x5
	.ascii "__inode\0"
	.byte	0x7
	.byte	0x2b
	.long	0x29a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.byte	0x4
	.byte	0x7
	.byte	0x2e
	.long	0x3d1
	.uleb128 0x5
	.ascii "spinlock_number\0"
	.byte	0x7
	.byte	0x2f
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x3
	.ascii "spinlock_t\0"
	.byte	0x7
	.byte	0x30
	.long	0x3ae
	.uleb128 0x4
	.ascii "mutex\0"
	.byte	0x4
	.byte	0x7
	.byte	0x32
	.long	0x409
	.uleb128 0x5
	.ascii "mutex_number\0"
	.byte	0x7
	.byte	0x33
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x10
	.ascii "private_data_type\0"
	.byte	0x4
	.byte	0x7
	.byte	0x36
	.long	0x43f
	.uleb128 0x11
	.ascii "WINKVM_KVM\0"
	.sleb128 -1
	.uleb128 0x11
	.ascii "WINKVM_VCPU\0"
	.sleb128 0
	.byte	0x0
	.uleb128 0x4
	.ascii "file\0"
	.byte	0x18
	.byte	0x7
	.byte	0x3b
	.long	0x4bc
	.uleb128 0x9
	.secrel32	LASF3
	.byte	0x7
	.byte	0x3c
	.long	0x29a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "__private_data_type\0"
	.byte	0x7
	.byte	0x3d
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "fd\0"
	.byte	0x7
	.byte	0x3e
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "f_count\0"
	.byte	0x7
	.byte	0x3f
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "__inode\0"
	.byte	0x7
	.byte	0x40
	.long	0x4bc
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "r_flags\0"
	.byte	0x7
	.byte	0x41
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x38f
	.uleb128 0x10
	.ascii "km_type\0"
	.byte	0x4
	.byte	0x7
	.byte	0x4a
	.long	0x598
	.uleb128 0x11
	.ascii "KM_BOUNCE_READ\0"
	.sleb128 0
	.uleb128 0x11
	.ascii "KM_SKB_SUNRPC_DATA\0"
	.sleb128 1
	.uleb128 0x11
	.ascii "KM_SKB_DATA_SOFTIRQ\0"
	.sleb128 2
	.uleb128 0x11
	.ascii "KM_USER0\0"
	.sleb128 3
	.uleb128 0x11
	.ascii "KM_USER1\0"
	.sleb128 4
	.uleb128 0x11
	.ascii "KM_BIO_SRC_IRQ\0"
	.sleb128 5
	.uleb128 0x11
	.ascii "KM_BIO_DST_IRQ\0"
	.sleb128 6
	.uleb128 0x11
	.ascii "KM_PTE0\0"
	.sleb128 7
	.uleb128 0x11
	.ascii "KM_PTE1\0"
	.sleb128 8
	.uleb128 0x11
	.ascii "KM_IRQ0\0"
	.sleb128 9
	.uleb128 0x11
	.ascii "KM_IRQ1\0"
	.sleb128 10
	.uleb128 0x11
	.ascii "KM_SOFTIRQ0\0"
	.sleb128 11
	.uleb128 0x11
	.ascii "KM_SOFTIRQ1\0"
	.sleb128 12
	.uleb128 0x11
	.ascii "KM_TYPE_NR\0"
	.sleb128 13
	.byte	0x0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x12
	.byte	0x4
	.byte	0x7
	.uleb128 0xf
	.byte	0x8
	.byte	0x8
	.byte	0x53
	.long	0x5c1
	.uleb128 0x5
	.ascii "pgprot\0"
	.byte	0x8
	.byte	0x53
	.long	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x3
	.ascii "pgprot_t\0"
	.byte	0x8
	.byte	0x53
	.long	0x5a7
	.uleb128 0x4
	.ascii "module\0"
	.byte	0x4
	.byte	0x8
	.byte	0x61
	.long	0x5f4
	.uleb128 0x5
	.ascii "__module\0"
	.byte	0x8
	.byte	0x62
	.long	0x29a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x4
	.ascii "vm_area_struct\0"
	.byte	0x30
	.byte	0x8
	.byte	0x6d
	.long	0x6ba
	.uleb128 0x5
	.ascii "vm_pgoff\0"
	.byte	0x8
	.byte	0x6e
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "vm_start\0"
	.byte	0x8
	.byte	0x6f
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "vm_end\0"
	.byte	0x8
	.byte	0x70
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "vm_page_prot\0"
	.byte	0x8
	.byte	0x71
	.long	0x5c1
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "vm_mm\0"
	.byte	0x8
	.byte	0x72
	.long	0x6c6
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.ascii "vm_file\0"
	.byte	0x8
	.byte	0x73
	.long	0x6cc
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.ascii "vm_private_data\0"
	.byte	0x8
	.byte	0x74
	.long	0x29a
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x5
	.ascii "vm_flags\0"
	.byte	0x8
	.byte	0x75
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x5
	.ascii "vm_ops\0"
	.byte	0x8
	.byte	0x76
	.long	0x29a
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x13
	.ascii "mm_struct\0"
	.byte	0x1
	.uleb128 0x6
	.byte	0x4
	.long	0x6ba
	.uleb128 0x6
	.byte	0x4
	.long	0x43f
	.uleb128 0xe
	.secrel32	LASF4
	.byte	0x1c
	.byte	0x8
	.byte	0x79
	.long	0x75f
	.uleb128 0x5
	.ascii "owner\0"
	.byte	0x8
	.byte	0x7a
	.long	0x75f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "ioctl\0"
	.byte	0x8
	.byte	0x82
	.long	0x784
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "unlocked_ioctl\0"
	.byte	0x8
	.byte	0x83
	.long	0x7a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "compat_ioctl\0"
	.byte	0x8
	.byte	0x84
	.long	0x7a4
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "mmap\0"
	.byte	0x8
	.byte	0x85
	.long	0x7c5
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "open\0"
	.byte	0x8
	.byte	0x86
	.long	0x7e0
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.ascii "release\0"
	.byte	0x8
	.byte	0x88
	.long	0x7e0
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x5d1
	.uleb128 0x14
	.byte	0x1
	.long	0xee
	.long	0x784
	.uleb128 0x15
	.long	0x4bc
	.uleb128 0x15
	.long	0x6cc
	.uleb128 0x15
	.long	0x102
	.uleb128 0x15
	.long	0x285
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x765
	.uleb128 0x14
	.byte	0x1
	.long	0x598
	.long	0x7a4
	.uleb128 0x15
	.long	0x6cc
	.uleb128 0x15
	.long	0x102
	.uleb128 0x15
	.long	0x285
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x78a
	.uleb128 0x14
	.byte	0x1
	.long	0xee
	.long	0x7bf
	.uleb128 0x15
	.long	0x6cc
	.uleb128 0x15
	.long	0x7bf
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x5f4
	.uleb128 0x6
	.byte	0x4
	.long	0x7aa
	.uleb128 0x14
	.byte	0x1
	.long	0xee
	.long	0x7e0
	.uleb128 0x15
	.long	0x4bc
	.uleb128 0x15
	.long	0x6cc
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x7cb
	.uleb128 0x4
	.ascii "vm_operations_struct\0"
	.byte	0x10
	.byte	0x8
	.byte	0x99
	.long	0x844
	.uleb128 0x5
	.ascii "open\0"
	.byte	0x8
	.byte	0x9a
	.long	0x850
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "close\0"
	.byte	0x8
	.byte	0x9b
	.long	0x850
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "nopage\0"
	.byte	0x8
	.byte	0x9d
	.long	0x876
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "nopfn\0"
	.byte	0x8
	.byte	0x9f
	.long	0x891
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x16
	.byte	0x1
	.long	0x850
	.uleb128 0x15
	.long	0x7bf
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x844
	.uleb128 0x14
	.byte	0x1
	.long	0x337
	.long	0x870
	.uleb128 0x15
	.long	0x7bf
	.uleb128 0x15
	.long	0x285
	.uleb128 0x15
	.long	0x870
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xee
	.uleb128 0x6
	.byte	0x4
	.long	0x856
	.uleb128 0x14
	.byte	0x1
	.long	0x285
	.long	0x891
	.uleb128 0x15
	.long	0x7bf
	.uleb128 0x15
	.long	0x285
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x87c
	.uleb128 0x4
	.ascii "miscdevice\0"
	.byte	0xc
	.byte	0x8
	.byte	0xae
	.long	0x8d9
	.uleb128 0x5
	.ascii "minor\0"
	.byte	0x8
	.byte	0xaf
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "name\0"
	.byte	0x8
	.byte	0xb0
	.long	0x8d9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "fops\0"
	.byte	0x8
	.byte	0xb1
	.long	0x8ec
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x8df
	.uleb128 0x17
	.long	0x8e4
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x6
	.byte	0x4
	.long	0x8f2
	.uleb128 0x18
	.secrel32	LASF4
	.long	0x6d2
	.uleb128 0x4
	.ascii "notifier_block\0"
	.byte	0xc
	.byte	0x8
	.byte	0xb7
	.long	0x94d
	.uleb128 0x5
	.ascii "notifier_call\0"
	.byte	0x8
	.byte	0xb8
	.long	0x96d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "next\0"
	.byte	0x8
	.byte	0xb9
	.long	0x967
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "priority\0"
	.byte	0x8
	.byte	0xba
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x14
	.byte	0x1
	.long	0xee
	.long	0x967
	.uleb128 0x15
	.long	0x967
	.uleb128 0x15
	.long	0x285
	.uleb128 0x15
	.long	0x29a
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x8fb
	.uleb128 0x6
	.byte	0x4
	.long	0x94d
	.uleb128 0x4
	.ascii "kvm_memory_region\0"
	.byte	0x18
	.byte	0x9
	.byte	0x30
	.long	0x9dd
	.uleb128 0x5
	.ascii "slot\0"
	.byte	0x9
	.byte	0x31
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "flags\0"
	.byte	0x9
	.byte	0x32
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "guest_phys_addr\0"
	.byte	0x9
	.byte	0x33
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "memory_size\0"
	.byte	0x9
	.byte	0x34
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0xf
	.byte	0x4
	.byte	0x9
	.byte	0x92
	.long	0xa05
	.uleb128 0x5
	.ascii "hardware_exit_reason\0"
	.byte	0x9
	.byte	0x93
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.byte	0x8
	.byte	0x9
	.byte	0x96
	.long	0xa2a
	.uleb128 0x9
	.secrel32	LASF5
	.byte	0x9
	.byte	0x97
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.secrel32	LASF6
	.byte	0x9
	.byte	0x98
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xc
	.byte	0x8
	.byte	0x9
	.byte	0xa6
	.long	0xa4b
	.uleb128 0x19
	.secrel32	LASF7
	.byte	0x9
	.byte	0xa7
	.long	0x123
	.uleb128 0xd
	.ascii "value\0"
	.byte	0x9
	.byte	0xa8
	.long	0xf5
	.byte	0x0
	.uleb128 0xf
	.byte	0x18
	.byte	0x9
	.byte	0x9b
	.long	0xae0
	.uleb128 0x5
	.ascii "direction\0"
	.byte	0x9
	.byte	0x9e
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.secrel32	LASF0
	.byte	0x9
	.byte	0x9f
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x5
	.ascii "string\0"
	.byte	0x9
	.byte	0xa0
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x5
	.ascii "string_down\0"
	.byte	0x9
	.byte	0xa1
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x5
	.ascii "rep\0"
	.byte	0x9
	.byte	0xa2
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "pad\0"
	.byte	0x9
	.byte	0xa3
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x5
	.ascii "port\0"
	.byte	0x9
	.byte	0xa4
	.long	0xcb
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x5
	.ascii "count\0"
	.byte	0x9
	.byte	0xa5
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.long	0xa2a
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0xf
	.byte	0x15
	.byte	0x9
	.byte	0xb0
	.long	0xb2c
	.uleb128 0x5
	.ascii "phys_addr\0"
	.byte	0x9
	.byte	0xb1
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.secrel32	LASF8
	.byte	0x9
	.byte	0xb2
	.long	0xb2c
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "len\0"
	.byte	0x9
	.byte	0xb3
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "is_write\0"
	.byte	0x9
	.byte	0xb4
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0x0
	.uleb128 0x1a
	.long	0xa1
	.long	0xb3c
	.uleb128 0x1b
	.long	0x5a4
	.byte	0x7
	.byte	0x0
	.uleb128 0xc
	.byte	0x18
	.byte	0x9
	.byte	0x90
	.long	0xb6f
	.uleb128 0xd
	.ascii "hw\0"
	.byte	0x9
	.byte	0x94
	.long	0x9dd
	.uleb128 0xd
	.ascii "ex\0"
	.byte	0x9
	.byte	0x99
	.long	0xa05
	.uleb128 0xd
	.ascii "io\0"
	.byte	0x9
	.byte	0xaa
	.long	0xa4b
	.uleb128 0xd
	.ascii "mmio\0"
	.byte	0x9
	.byte	0xb5
	.long	0xae0
	.byte	0x0
	.uleb128 0x4
	.ascii "kvm_run\0"
	.byte	0x54
	.byte	0x9
	.byte	0x78
	.long	0xccb
	.uleb128 0x9
	.secrel32	LASF9
	.byte	0x9
	.byte	0x7a
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "_errno\0"
	.byte	0x9
	.byte	0x7b
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "ioctl_r\0"
	.byte	0x9
	.byte	0x7c
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "emulated\0"
	.byte	0x9
	.byte	0x7f
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "mmio_completed\0"
	.byte	0x9
	.byte	0x80
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "request_interrupt_window\0"
	.byte	0x9
	.byte	0x81
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.ascii "padding1\0"
	.byte	0x9
	.byte	0x82
	.long	0xccb
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0x5
	.ascii "exit_type\0"
	.byte	0x9
	.byte	0x85
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.ascii "exit_reason\0"
	.byte	0x9
	.byte	0x86
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x5
	.ascii "instruction_length\0"
	.byte	0x9
	.byte	0x87
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x5
	.ascii "ready_for_interrupt_injection\0"
	.byte	0x9
	.byte	0x88
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x5
	.ascii "if_flag\0"
	.byte	0x9
	.byte	0x89
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x29
	.uleb128 0x5
	.ascii "padding2\0"
	.byte	0x9
	.byte	0x8a
	.long	0xcb
	.byte	0x2
	.byte	0x23
	.uleb128 0x2a
	.uleb128 0x5
	.ascii "cr8\0"
	.byte	0x9
	.byte	0x8d
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x9
	.secrel32	LASF10
	.byte	0x9
	.byte	0x8e
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0xb
	.long	0xb3c
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.byte	0x0
	.uleb128 0x1a
	.long	0xa1
	.long	0xcdb
	.uleb128 0x1b
	.long	0x5a4
	.byte	0x6
	.byte	0x0
	.uleb128 0x4
	.ascii "kvm_regs\0"
	.byte	0x94
	.byte	0x9
	.byte	0xba
	.long	0xdf7
	.uleb128 0x9
	.secrel32	LASF9
	.byte	0x9
	.byte	0xbc
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "rax\0"
	.byte	0x9
	.byte	0xbf
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "rbx\0"
	.byte	0x9
	.byte	0xbf
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "rcx\0"
	.byte	0x9
	.byte	0xbf
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.ascii "rdx\0"
	.byte	0x9
	.byte	0xbf
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.ascii "rsi\0"
	.byte	0x9
	.byte	0xc0
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x5
	.ascii "rdi\0"
	.byte	0x9
	.byte	0xc0
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x5
	.ascii "rsp\0"
	.byte	0x9
	.byte	0xc0
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x5
	.ascii "rbp\0"
	.byte	0x9
	.byte	0xc0
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x5
	.ascii "r8\0"
	.byte	0x9
	.byte	0xc1
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x5
	.ascii "r9\0"
	.byte	0x9
	.byte	0xc1
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x5
	.ascii "r10\0"
	.byte	0x9
	.byte	0xc1
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x5
	.ascii "r11\0"
	.byte	0x9
	.byte	0xc1
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x5
	.ascii "r12\0"
	.byte	0x9
	.byte	0xc2
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x5
	.ascii "r13\0"
	.byte	0x9
	.byte	0xc2
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x5
	.ascii "r14\0"
	.byte	0x9
	.byte	0xc2
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x5
	.ascii "r15\0"
	.byte	0x9
	.byte	0xc2
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0x5
	.ascii "rip\0"
	.byte	0x9
	.byte	0xc3
	.long	0x123
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0x9
	.secrel32	LASF11
	.byte	0x9
	.byte	0xc3
	.long	0x123
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.byte	0x0
	.uleb128 0x4
	.ascii "kvm_segment\0"
	.byte	0x18
	.byte	0x9
	.byte	0xc6
	.long	0xec5
	.uleb128 0x9
	.secrel32	LASF12
	.byte	0x9
	.byte	0xc7
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.secrel32	LASF13
	.byte	0x9
	.byte	0xc8
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.secrel32	LASF14
	.byte	0x9
	.byte	0xc9
	.long	0xcb
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "type\0"
	.byte	0x9
	.byte	0xca
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0x5
	.ascii "present\0"
	.byte	0x9
	.byte	0xcb
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.uleb128 0x5
	.ascii "dpl\0"
	.byte	0x9
	.byte	0xcb
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "db\0"
	.byte	0x9
	.byte	0xcb
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x11
	.uleb128 0x5
	.ascii "s\0"
	.byte	0x9
	.byte	0xcb
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x5
	.ascii "l\0"
	.byte	0x9
	.byte	0xcb
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0x5
	.ascii "g\0"
	.byte	0x9
	.byte	0xcb
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.ascii "avl\0"
	.byte	0x9
	.byte	0xcb
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0x5
	.ascii "unusable\0"
	.byte	0x9
	.byte	0xcc
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0x9
	.secrel32	LASF15
	.byte	0x9
	.byte	0xcd
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.byte	0x0
	.uleb128 0x4
	.ascii "kvm_dtable\0"
	.byte	0x10
	.byte	0x9
	.byte	0xd0
	.long	0xf03
	.uleb128 0x9
	.secrel32	LASF12
	.byte	0x9
	.byte	0xd1
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.secrel32	LASF13
	.byte	0x9
	.byte	0xd2
	.long	0xcb
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.secrel32	LASF15
	.byte	0x9
	.byte	0xd3
	.long	0xf03
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x1a
	.long	0xcb
	.long	0xf13
	.uleb128 0x1b
	.long	0x5a4
	.byte	0x2
	.byte	0x0
	.uleb128 0x1c
	.ascii "kvm_sregs\0"
	.word	0x13c
	.byte	0x9
	.byte	0xd7
	.long	0x1044
	.uleb128 0x9
	.secrel32	LASF9
	.byte	0x9
	.byte	0xd9
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "cs\0"
	.byte	0x9
	.byte	0xdc
	.long	0xdf7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "ds\0"
	.byte	0x9
	.byte	0xdc
	.long	0xdf7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.ascii "es\0"
	.byte	0x9
	.byte	0xdc
	.long	0xdf7
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x5
	.ascii "fs\0"
	.byte	0x9
	.byte	0xdc
	.long	0xdf7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x5
	.ascii "gs\0"
	.byte	0x9
	.byte	0xdc
	.long	0xdf7
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x5
	.ascii "ss\0"
	.byte	0x9
	.byte	0xdc
	.long	0xdf7
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0x5
	.ascii "tr\0"
	.byte	0x9
	.byte	0xdd
	.long	0xdf7
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0x5
	.ascii "ldt\0"
	.byte	0x9
	.byte	0xdd
	.long	0xdf7
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0x5
	.ascii "gdt\0"
	.byte	0x9
	.byte	0xde
	.long	0xec5
	.byte	0x3
	.byte	0x23
	.uleb128 0xc4
	.uleb128 0x5
	.ascii "idt\0"
	.byte	0x9
	.byte	0xde
	.long	0xec5
	.byte	0x3
	.byte	0x23
	.uleb128 0xd4
	.uleb128 0x5
	.ascii "cr0\0"
	.byte	0x9
	.byte	0xdf
	.long	0x123
	.byte	0x3
	.byte	0x23
	.uleb128 0xe4
	.uleb128 0x5
	.ascii "cr2\0"
	.byte	0x9
	.byte	0xdf
	.long	0x123
	.byte	0x3
	.byte	0x23
	.uleb128 0xec
	.uleb128 0x5
	.ascii "cr3\0"
	.byte	0x9
	.byte	0xdf
	.long	0x123
	.byte	0x3
	.byte	0x23
	.uleb128 0xf4
	.uleb128 0x5
	.ascii "cr4\0"
	.byte	0x9
	.byte	0xdf
	.long	0x123
	.byte	0x3
	.byte	0x23
	.uleb128 0xfc
	.uleb128 0x5
	.ascii "cr8\0"
	.byte	0x9
	.byte	0xdf
	.long	0x123
	.byte	0x3
	.byte	0x23
	.uleb128 0x104
	.uleb128 0x5
	.ascii "efer\0"
	.byte	0x9
	.byte	0xe0
	.long	0x123
	.byte	0x3
	.byte	0x23
	.uleb128 0x10c
	.uleb128 0x9
	.secrel32	LASF10
	.byte	0x9
	.byte	0xe1
	.long	0x123
	.byte	0x3
	.byte	0x23
	.uleb128 0x114
	.uleb128 0x5
	.ascii "interrupt_bitmap\0"
	.byte	0x9
	.byte	0xe2
	.long	0x1044
	.byte	0x3
	.byte	0x23
	.uleb128 0x11c
	.byte	0x0
	.uleb128 0x1a
	.long	0x123
	.long	0x1054
	.uleb128 0x1b
	.long	0x5a4
	.byte	0x3
	.byte	0x0
	.uleb128 0x4
	.ascii "kvm_msr_entry\0"
	.byte	0x10
	.byte	0x9
	.byte	0xe5
	.long	0x109c
	.uleb128 0x5
	.ascii "index\0"
	.byte	0x9
	.byte	0xe6
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "reserved\0"
	.byte	0x9
	.byte	0xe7
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.secrel32	LASF8
	.byte	0x9
	.byte	0xe8
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x4
	.ascii "kvm_translation\0"
	.byte	0x1c
	.byte	0x9
	.byte	0xfa
	.long	0x1141
	.uleb128 0x9
	.secrel32	LASF9
	.byte	0x9
	.byte	0xfc
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "linear_address\0"
	.byte	0x9
	.byte	0xff
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.ascii "physical_address\0"
	.byte	0x9
	.word	0x102
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.ascii "valid\0"
	.byte	0x9
	.word	0x103
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.ascii "writeable\0"
	.byte	0x9
	.word	0x104
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0x8
	.ascii "usermode\0"
	.byte	0x9
	.word	0x105
	.long	0xa1
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0x8
	.ascii "pad\0"
	.byte	0x9
	.word	0x106
	.long	0x1141
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.byte	0x0
	.uleb128 0x1a
	.long	0xa1
	.long	0x1151
	.uleb128 0x1b
	.long	0x5a4
	.byte	0x4
	.byte	0x0
	.uleb128 0x7
	.ascii "kvm_interrupt\0"
	.byte	0x8
	.byte	0x9
	.word	0x10a
	.long	0x1187
	.uleb128 0x1d
	.secrel32	LASF9
	.byte	0x9
	.word	0x10d
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "irq\0"
	.byte	0x9
	.word	0x10f
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x7
	.ascii "kvm_breakpoint\0"
	.byte	0x10
	.byte	0x9
	.word	0x112
	.long	0x11cd
	.uleb128 0x1d
	.secrel32	LASF16
	.byte	0x9
	.word	0x113
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x1d
	.secrel32	LASF15
	.byte	0x9
	.word	0x114
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x1d
	.secrel32	LASF7
	.byte	0x9
	.word	0x115
	.long	0x123
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x7
	.ascii "kvm_debug_guest\0"
	.byte	0x4c
	.byte	0x9
	.word	0x119
	.long	0x122b
	.uleb128 0x1d
	.secrel32	LASF16
	.byte	0x9
	.word	0x11b
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "pad\0"
	.byte	0x9
	.word	0x11c
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.ascii "breakpoints\0"
	.byte	0x9
	.word	0x11d
	.long	0x122b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x1d
	.secrel32	LASF17
	.byte	0x9
	.word	0x11e
	.long	0xf5
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.byte	0x0
	.uleb128 0x1a
	.long	0x1187
	.long	0x123b
	.uleb128 0x1b
	.long	0x5a4
	.byte	0x3
	.byte	0x0
	.uleb128 0x1c
	.ascii "kvm_vcpu_para_state\0"
	.word	0x1000
	.byte	0xa
	.byte	0x14
	.long	0x12b2
	.uleb128 0x5
	.ascii "guest_version\0"
	.byte	0xa
	.byte	0x1d
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "host_version\0"
	.byte	0xa
	.byte	0x1e
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.secrel32	LASF0
	.byte	0xa
	.byte	0x1f
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "ret\0"
	.byte	0xa
	.byte	0x20
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x9
	.secrel32	LASF18
	.byte	0xa
	.byte	0x27
	.long	0x16a
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x3
	.ascii "gva_t\0"
	.byte	0x4
	.byte	0x5b
	.long	0x285
	.uleb128 0x3
	.ascii "gpa_t\0"
	.byte	0x4
	.byte	0x5c
	.long	0x16a
	.uleb128 0x3
	.ascii "gfn_t\0"
	.byte	0x4
	.byte	0x5d
	.long	0x285
	.uleb128 0x3
	.ascii "hva_t\0"
	.byte	0x4
	.byte	0x5f
	.long	0x285
	.uleb128 0x3
	.ascii "hpa_t\0"
	.byte	0x4
	.byte	0x60
	.long	0x16a
	.uleb128 0x6
	.byte	0x4
	.long	0x16a
	.uleb128 0xf
	.byte	0x3
	.byte	0x4
	.byte	0x76
	.long	0x137f
	.uleb128 0x1e
	.ascii "glevels\0"
	.byte	0x4
	.byte	0x77
	.long	0x102
	.byte	0x4
	.byte	0x4
	.byte	0x1c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x1e
	.ascii "level\0"
	.byte	0x4
	.byte	0x78
	.long	0x102
	.byte	0x4
	.byte	0x4
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x1e
	.ascii "quadrant\0"
	.byte	0x4
	.byte	0x79
	.long	0x102
	.byte	0x4
	.byte	0x2
	.byte	0x16
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x1e
	.ascii "pad_for_nice_hex_output\0"
	.byte	0x4
	.byte	0x7a
	.long	0x102
	.byte	0x4
	.byte	0x6
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x1e
	.ascii "metaphysical\0"
	.byte	0x4
	.byte	0x7b
	.long	0x102
	.byte	0x4
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1f
	.ascii "kvm_mmu_page_role\0"
	.byte	0x4
	.byte	0x4
	.byte	0x74
	.long	0x13ab
	.uleb128 0xd
	.ascii "word\0"
	.byte	0x4
	.byte	0x75
	.long	0x102
	.uleb128 0x20
	.long	0x12f9
	.byte	0x0
	.uleb128 0xc
	.byte	0x4
	.byte	0x4
	.byte	0x91
	.long	0x13d9
	.uleb128 0xd
	.ascii "parent_pte\0"
	.byte	0x4
	.byte	0x92
	.long	0x12f3
	.uleb128 0xd
	.ascii "parent_ptes\0"
	.byte	0x4
	.byte	0x93
	.long	0x1ac
	.byte	0x0
	.uleb128 0x4
	.ascii "kvm_mmu_page\0"
	.byte	0x34
	.byte	0x4
	.byte	0x7f
	.long	0x149c
	.uleb128 0x5
	.ascii "link\0"
	.byte	0x4
	.byte	0x80
	.long	0x175
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "hash_link\0"
	.byte	0x4
	.byte	0x81
	.long	0x1d2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "gfn\0"
	.byte	0x4
	.byte	0x87
	.long	0x12cc
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "role\0"
	.byte	0x4
	.byte	0x88
	.long	0x137f
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.ascii "page_hpa\0"
	.byte	0x4
	.byte	0x8a
	.long	0x12e6
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.ascii "slot_bitmap\0"
	.byte	0x4
	.byte	0x8b
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x5
	.ascii "global\0"
	.byte	0x4
	.byte	0x8e
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x5
	.ascii "multimapped\0"
	.byte	0x4
	.byte	0x8f
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x5
	.ascii "root_count\0"
	.byte	0x4
	.byte	0x90
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0xb
	.long	0x13ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.byte	0x0
	.uleb128 0x4
	.ascii "vmcs\0"
	.byte	0x8
	.byte	0x4
	.byte	0x97
	.long	0x14de
	.uleb128 0x5
	.ascii "revision_id\0"
	.byte	0x4
	.byte	0x98
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "abort\0"
	.byte	0x4
	.byte	0x99
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.secrel32	LASF8
	.byte	0x4
	.byte	0x9a
	.long	0x14de
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x1a
	.long	0x8e4
	.long	0x14ed
	.uleb128 0x21
	.long	0x5a4
	.byte	0x0
	.uleb128 0x4
	.ascii "kvm_mmu\0"
	.byte	0x24
	.byte	0x4
	.byte	0xa6
	.long	0x1581
	.uleb128 0x5
	.ascii "new_cr3\0"
	.byte	0x4
	.byte	0xa7
	.long	0x194f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "page_fault\0"
	.byte	0x4
	.byte	0xa8
	.long	0x196f
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "free\0"
	.byte	0x4
	.byte	0xa9
	.long	0x194f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "gva_to_gpa\0"
	.byte	0x4
	.byte	0xaa
	.long	0x198a
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x9
	.secrel32	LASF19
	.byte	0x4
	.byte	0xab
	.long	0x12e6
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.secrel32	LASF20
	.byte	0x4
	.byte	0xac
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.secrel32	LASF21
	.byte	0x4
	.byte	0xad
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x9
	.secrel32	LASF22
	.byte	0x4
	.byte	0xae
	.long	0x12f3
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0x0
	.uleb128 0x16
	.byte	0x1
	.long	0x158d
	.uleb128 0x15
	.long	0x158d
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1593
	.uleb128 0x1c
	.ascii "kvm_vcpu\0"
	.word	0x3a47
	.byte	0x4
	.byte	0x9f
	.long	0x194f
	.uleb128 0x5
	.ascii "kvm\0"
	.byte	0x4
	.byte	0xee
	.long	0x1e0c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.long	0x1bfe
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "mutex\0"
	.byte	0x4
	.byte	0xf3
	.long	0x3e3
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "cpu\0"
	.byte	0x4
	.byte	0xf4
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "launched\0"
	.byte	0x4
	.byte	0xf5
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "interrupt_window_open\0"
	.byte	0x4
	.byte	0xf6
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.ascii "irq_summary\0"
	.byte	0x4
	.byte	0xf7
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.ascii "irq_pending\0"
	.byte	0x4
	.byte	0xf9
	.long	0x1e12
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.ascii "regs\0"
	.byte	0x4
	.byte	0xfa
	.long	0x1e12
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x5
	.ascii "rip\0"
	.byte	0x4
	.byte	0xfb
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x5
	.ascii "cr0\0"
	.byte	0x4
	.byte	0xfd
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x5
	.ascii "cr2\0"
	.byte	0x4
	.byte	0xfe
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x5
	.ascii "cr3\0"
	.byte	0x4
	.byte	0xff
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x1d
	.secrel32	LASF23
	.byte	0x4
	.word	0x100
	.long	0x12bf
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x1d
	.secrel32	LASF24
	.byte	0x4
	.word	0x101
	.long	0x337
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x1d
	.secrel32	LASF18
	.byte	0x4
	.word	0x102
	.long	0x12bf
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x8
	.ascii "cr4\0"
	.byte	0x4
	.word	0x103
	.long	0x285
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x8
	.ascii "cr8\0"
	.byte	0x4
	.word	0x104
	.long	0x285
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0x8
	.ascii "pdptrs\0"
	.byte	0x4
	.word	0x105
	.long	0x1e22
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0x8
	.ascii "shadow_efer\0"
	.byte	0x4
	.word	0x106
	.long	0x16a
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x1d
	.secrel32	LASF10
	.byte	0x4
	.word	0x107
	.long	0x16a
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x8
	.ascii "ia32_misc_enable_msr\0"
	.byte	0x4
	.word	0x108
	.long	0x16a
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.uleb128 0x8
	.ascii "nmsrs\0"
	.byte	0x4
	.word	0x109
	.long	0xee
	.byte	0x3
	.byte	0x23
	.uleb128 0xc0
	.uleb128 0x8
	.ascii "guest_msrs\0"
	.byte	0x4
	.word	0x10a
	.long	0x1e32
	.byte	0x3
	.byte	0x23
	.uleb128 0xc4
	.uleb128 0x8
	.ascii "host_msrs\0"
	.byte	0x4
	.word	0x10b
	.long	0x1e32
	.byte	0x3
	.byte	0x23
	.uleb128 0xc8
	.uleb128 0x8
	.ascii "free_pages\0"
	.byte	0x4
	.word	0x10d
	.long	0x175
	.byte	0x3
	.byte	0x23
	.uleb128 0xcc
	.uleb128 0x8
	.ascii "page_header_buf\0"
	.byte	0x4
	.word	0x10e
	.long	0x1e38
	.byte	0x3
	.byte	0x23
	.uleb128 0xd4
	.uleb128 0x8
	.ascii "mmu\0"
	.byte	0x4
	.word	0x10f
	.long	0x14ed
	.byte	0x3
	.byte	0x23
	.uleb128 0x34d4
	.uleb128 0x8
	.ascii "mmu_pte_chain_cache\0"
	.byte	0x4
	.word	0x111
	.long	0x1a41
	.byte	0x3
	.byte	0x23
	.uleb128 0x34f8
	.uleb128 0x8
	.ascii "mmu_rmap_desc_cache\0"
	.byte	0x4
	.word	0x112
	.long	0x1a41
	.byte	0x3
	.byte	0x23
	.uleb128 0x354c
	.uleb128 0x8
	.ascii "last_pt_write_gfn\0"
	.byte	0x4
	.word	0x114
	.long	0x12cc
	.byte	0x3
	.byte	0x23
	.uleb128 0x35a0
	.uleb128 0x8
	.ascii "last_pt_write_count\0"
	.byte	0x4
	.word	0x115
	.long	0xee
	.byte	0x3
	.byte	0x23
	.uleb128 0x35a4
	.uleb128 0x8
	.ascii "guest_debug\0"
	.byte	0x4
	.word	0x117
	.long	0x1a91
	.byte	0x3
	.byte	0x23
	.uleb128 0x35a8
	.uleb128 0x8
	.ascii "fx_buf\0"
	.byte	0x4
	.word	0x119
	.long	0x1e48
	.byte	0x3
	.byte	0x23
	.uleb128 0x35c0
	.uleb128 0x8
	.ascii "host_fx_image\0"
	.byte	0x4
	.word	0x11a
	.long	0x1e59
	.byte	0x3
	.byte	0x23
	.uleb128 0x39d0
	.uleb128 0x8
	.ascii "guest_fx_image\0"
	.byte	0x4
	.word	0x11b
	.long	0x1e59
	.byte	0x3
	.byte	0x23
	.uleb128 0x39d4
	.uleb128 0x8
	.ascii "mmio_needed\0"
	.byte	0x4
	.word	0x11d
	.long	0xee
	.byte	0x3
	.byte	0x23
	.uleb128 0x39d8
	.uleb128 0x8
	.ascii "mmio_read_completed\0"
	.byte	0x4
	.word	0x11e
	.long	0xee
	.byte	0x3
	.byte	0x23
	.uleb128 0x39dc
	.uleb128 0x8
	.ascii "mmio_is_write\0"
	.byte	0x4
	.word	0x11f
	.long	0xee
	.byte	0x3
	.byte	0x23
	.uleb128 0x39e0
	.uleb128 0x8
	.ascii "mmio_size\0"
	.byte	0x4
	.word	0x120
	.long	0xee
	.byte	0x3
	.byte	0x23
	.uleb128 0x39e4
	.uleb128 0x8
	.ascii "mmio_data\0"
	.byte	0x4
	.word	0x121
	.long	0x1e5f
	.byte	0x3
	.byte	0x23
	.uleb128 0x39e8
	.uleb128 0x8
	.ascii "mmio_phys_addr\0"
	.byte	0x4
	.word	0x122
	.long	0x12bf
	.byte	0x3
	.byte	0x23
	.uleb128 0x39f0
	.uleb128 0x8
	.ascii "mmio_fault_cr2\0"
	.byte	0x4
	.word	0x123
	.long	0x12b2
	.byte	0x3
	.byte	0x23
	.uleb128 0x39f8
	.uleb128 0x8
	.ascii "rmode\0"
	.byte	0x4
	.word	0x12e
	.long	0x1c8b
	.byte	0x3
	.byte	0x23
	.uleb128 0x39fc
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1581
	.uleb128 0x14
	.byte	0x1
	.long	0xee
	.long	0x196f
	.uleb128 0x15
	.long	0x158d
	.uleb128 0x15
	.long	0x12b2
	.uleb128 0x15
	.long	0x15f
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1955
	.uleb128 0x14
	.byte	0x1
	.long	0x12bf
	.long	0x198a
	.uleb128 0x15
	.long	0x158d
	.uleb128 0x15
	.long	0x12b2
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1975
	.uleb128 0x4
	.ascii "func_pointer_test\0"
	.byte	0x1c
	.byte	0x4
	.byte	0xb2
	.long	0x1a05
	.uleb128 0x5
	.ascii "test_1\0"
	.byte	0x4
	.byte	0xb3
	.long	0x1a1b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "test_2\0"
	.byte	0x4
	.byte	0xb4
	.long	0x1a3b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.secrel32	LASF19
	.byte	0x4
	.byte	0xb5
	.long	0x12e6
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.secrel32	LASF20
	.byte	0x4
	.byte	0xb6
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.secrel32	LASF21
	.byte	0x4
	.byte	0xb7
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x9
	.secrel32	LASF22
	.byte	0x4
	.byte	0xb8
	.long	0x12f3
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.byte	0x0
	.uleb128 0x16
	.byte	0x1
	.long	0x1a1b
	.uleb128 0x15
	.long	0xee
	.uleb128 0x15
	.long	0xee
	.uleb128 0x15
	.long	0xee
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1a05
	.uleb128 0x14
	.byte	0x1
	.long	0xee
	.long	0x1a3b
	.uleb128 0x15
	.long	0xee
	.uleb128 0x15
	.long	0xee
	.uleb128 0x15
	.long	0xee
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1a21
	.uleb128 0x4
	.ascii "kvm_mmu_memory_cache\0"
	.byte	0x54
	.byte	0x4
	.byte	0xbd
	.long	0x1a81
	.uleb128 0x5
	.ascii "nobjs\0"
	.byte	0x4
	.byte	0xbe
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "objects\0"
	.byte	0x4
	.byte	0xbf
	.long	0x1a81
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x1a
	.long	0x29a
	.long	0x1a91
	.uleb128 0x1b
	.long	0x5a4
	.byte	0x13
	.byte	0x0
	.uleb128 0x4
	.ascii "kvm_guest_debug\0"
	.byte	0x18
	.byte	0x4
	.byte	0xc6
	.long	0x1ad3
	.uleb128 0x9
	.secrel32	LASF16
	.byte	0x4
	.byte	0xc7
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "bp\0"
	.byte	0x4
	.byte	0xc8
	.long	0x1ad3
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.secrel32	LASF17
	.byte	0x4
	.byte	0xc9
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0x0
	.uleb128 0x1a
	.long	0x285
	.long	0x1ae3
	.uleb128 0x1b
	.long	0x5a4
	.byte	0x3
	.byte	0x0
	.uleb128 0x22
	.byte	0x4
	.byte	0x4
	.byte	0xcc
	.long	0x1b7b
	.uleb128 0x11
	.ascii "VCPU_REGS_RAX\0"
	.sleb128 0
	.uleb128 0x11
	.ascii "VCPU_REGS_RCX\0"
	.sleb128 1
	.uleb128 0x11
	.ascii "VCPU_REGS_RDX\0"
	.sleb128 2
	.uleb128 0x11
	.ascii "VCPU_REGS_RBX\0"
	.sleb128 3
	.uleb128 0x11
	.ascii "VCPU_REGS_RSP\0"
	.sleb128 4
	.uleb128 0x11
	.ascii "VCPU_REGS_RBP\0"
	.sleb128 5
	.uleb128 0x11
	.ascii "VCPU_REGS_RSI\0"
	.sleb128 6
	.uleb128 0x11
	.ascii "VCPU_REGS_RDI\0"
	.sleb128 7
	.uleb128 0x11
	.ascii "NR_VCPU_REGS\0"
	.sleb128 8
	.byte	0x0
	.uleb128 0x22
	.byte	0x4
	.byte	0x4
	.byte	0xe2
	.long	0x1bfe
	.uleb128 0x11
	.ascii "VCPU_SREG_CS\0"
	.sleb128 0
	.uleb128 0x11
	.ascii "VCPU_SREG_DS\0"
	.sleb128 1
	.uleb128 0x11
	.ascii "VCPU_SREG_ES\0"
	.sleb128 2
	.uleb128 0x11
	.ascii "VCPU_SREG_FS\0"
	.sleb128 3
	.uleb128 0x11
	.ascii "VCPU_SREG_GS\0"
	.sleb128 4
	.uleb128 0x11
	.ascii "VCPU_SREG_SS\0"
	.sleb128 5
	.uleb128 0x11
	.ascii "VCPU_SREG_TR\0"
	.sleb128 6
	.uleb128 0x11
	.ascii "VCPU_SREG_LDTR\0"
	.sleb128 7
	.byte	0x0
	.uleb128 0xc
	.byte	0x4
	.byte	0x4
	.byte	0xef
	.long	0x1c1e
	.uleb128 0xd
	.ascii "vmcs\0"
	.byte	0x4
	.byte	0xf0
	.long	0x1c1e
	.uleb128 0xd
	.ascii "svm\0"
	.byte	0x4
	.byte	0xf1
	.long	0x1c2f
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x149c
	.uleb128 0x13
	.ascii "vcpu_svm\0"
	.byte	0x1
	.uleb128 0x6
	.byte	0x4
	.long	0x1c24
	.uleb128 0x7
	.ascii "kvm_save_segment\0"
	.byte	0xe
	.byte	0x4
	.word	0x128
	.long	0x1c8b
	.uleb128 0x1d
	.secrel32	LASF14
	.byte	0x4
	.word	0x129
	.long	0x154
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x1d
	.secrel32	LASF12
	.byte	0x4
	.word	0x12a
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x1d
	.secrel32	LASF13
	.byte	0x4
	.word	0x12b
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x8
	.ascii "ar\0"
	.byte	0x4
	.word	0x12c
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x23
	.byte	0x4b
	.byte	0x4
	.word	0x125
	.long	0x1d02
	.uleb128 0x8
	.ascii "active\0"
	.byte	0x4
	.word	0x126
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "save_iopl\0"
	.byte	0x4
	.word	0x127
	.long	0x14a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.ascii "tr\0"
	.byte	0x4
	.word	0x12d
	.long	0x1c35
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x8
	.ascii "es\0"
	.byte	0x4
	.word	0x12d
	.long	0x1c35
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0x8
	.ascii "ds\0"
	.byte	0x4
	.word	0x12d
	.long	0x1c35
	.byte	0x2
	.byte	0x23
	.uleb128 0x21
	.uleb128 0x8
	.ascii "fs\0"
	.byte	0x4
	.word	0x12d
	.long	0x1c35
	.byte	0x2
	.byte	0x23
	.uleb128 0x2f
	.uleb128 0x8
	.ascii "gs\0"
	.byte	0x4
	.word	0x12d
	.long	0x1c35
	.byte	0x2
	.byte	0x23
	.uleb128 0x3d
	.byte	0x0
	.uleb128 0x1c
	.ascii "kvm\0"
	.word	0x3ec3
	.byte	0x4
	.byte	0xee
	.long	0x1e0c
	.uleb128 0x8
	.ascii "lock\0"
	.byte	0x4
	.word	0x13a
	.long	0x3d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "nmemslots\0"
	.byte	0x4
	.word	0x13b
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.ascii "memslots\0"
	.byte	0x4
	.word	0x13c
	.long	0x1ef3
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.ascii "active_mmu_pages\0"
	.byte	0x4
	.word	0x140
	.long	0x175
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x8
	.ascii "n_free_mmu_pages\0"
	.byte	0x4
	.word	0x141
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x8
	.ascii "mmu_page_hash\0"
	.byte	0x4
	.word	0x142
	.long	0x1f03
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x8
	.ascii "vcpus\0"
	.byte	0x4
	.word	0x143
	.long	0x1f13
	.byte	0x3
	.byte	0x23
	.uleb128 0x464
	.uleb128 0x1d
	.secrel32	LASF25
	.byte	0x4
	.word	0x144
	.long	0xee
	.byte	0x3
	.byte	0x23
	.uleb128 0x3eab
	.uleb128 0x8
	.ascii "busy\0"
	.byte	0x4
	.word	0x145
	.long	0xee
	.byte	0x3
	.byte	0x23
	.uleb128 0x3eaf
	.uleb128 0x8
	.ascii "rmap_overflow\0"
	.byte	0x4
	.word	0x146
	.long	0x285
	.byte	0x3
	.byte	0x23
	.uleb128 0x3eb3
	.uleb128 0x8
	.ascii "vm_list\0"
	.byte	0x4
	.word	0x147
	.long	0x175
	.byte	0x3
	.byte	0x23
	.uleb128 0x3eb7
	.uleb128 0x8
	.ascii "filp\0"
	.byte	0x4
	.word	0x148
	.long	0x6cc
	.byte	0x3
	.byte	0x23
	.uleb128 0x3ebf
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1d02
	.uleb128 0x1a
	.long	0x285
	.long	0x1e22
	.uleb128 0x1b
	.long	0x5a4
	.byte	0x7
	.byte	0x0
	.uleb128 0x1a
	.long	0x16a
	.long	0x1e32
	.uleb128 0x1b
	.long	0x5a4
	.byte	0x3
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1054
	.uleb128 0x1a
	.long	0x13d9
	.long	0x1e48
	.uleb128 0x1b
	.long	0x5a4
	.byte	0xff
	.byte	0x0
	.uleb128 0x1a
	.long	0x8e4
	.long	0x1e59
	.uleb128 0x24
	.long	0x5a4
	.word	0x40f
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x8e4
	.uleb128 0x1a
	.long	0xad
	.long	0x1e6f
	.uleb128 0x1b
	.long	0x5a4
	.byte	0x7
	.byte	0x0
	.uleb128 0x7
	.ascii "kvm_memory_slot\0"
	.byte	0x14
	.byte	0x4
	.word	0x131
	.long	0x1ee7
	.uleb128 0x1d
	.secrel32	LASF26
	.byte	0x4
	.word	0x132
	.long	0x12cc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "npages\0"
	.byte	0x4
	.word	0x133
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.ascii "flags\0"
	.byte	0x4
	.word	0x134
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.ascii "phys_mem\0"
	.byte	0x4
	.word	0x135
	.long	0x1ee7
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.ascii "dirty_bitmap\0"
	.byte	0x4
	.word	0x136
	.long	0x1eed
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x337
	.uleb128 0x6
	.byte	0x4
	.long	0x285
	.uleb128 0x1a
	.long	0x1e6f
	.long	0x1f03
	.uleb128 0x1b
	.long	0x5a4
	.byte	0x3
	.byte	0x0
	.uleb128 0x1a
	.long	0x1ac
	.long	0x1f13
	.uleb128 0x1b
	.long	0x5a4
	.byte	0xff
	.byte	0x0
	.uleb128 0x1a
	.long	0x1593
	.long	0x1f23
	.uleb128 0x1b
	.long	0x5a4
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.secrel32	LASF27
	.byte	0x30
	.byte	0x4
	.word	0x14b
	.long	0x2031
	.uleb128 0x8
	.ascii "pf_fixed\0"
	.byte	0x4
	.word	0x14c
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "pf_guest\0"
	.byte	0x4
	.word	0x14d
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x1d
	.secrel32	LASF28
	.byte	0x4
	.word	0x14e
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.ascii "invlpg\0"
	.byte	0x4
	.word	0x14f
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.ascii "exits\0"
	.byte	0x4
	.word	0x151
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.ascii "io_exits\0"
	.byte	0x4
	.word	0x152
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.ascii "mmio_exits\0"
	.byte	0x4
	.word	0x153
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x8
	.ascii "signal_exits\0"
	.byte	0x4
	.word	0x154
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x8
	.ascii "irq_window_exits\0"
	.byte	0x4
	.word	0x155
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x8
	.ascii "halt_exits\0"
	.byte	0x4
	.word	0x156
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x8
	.ascii "request_irq_exits\0"
	.byte	0x4
	.word	0x157
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.ascii "irq_exits\0"
	.byte	0x4
	.word	0x158
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.byte	0x0
	.uleb128 0x7
	.ascii "descriptor_table\0"
	.byte	0x6
	.byte	0x4
	.word	0x15b
	.long	0x206a
	.uleb128 0x1d
	.secrel32	LASF13
	.byte	0x4
	.word	0x15c
	.long	0x154
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x1d
	.secrel32	LASF12
	.byte	0x4
	.word	0x15d
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x25
	.secrel32	LASF29
	.byte	0xa8
	.byte	0x4
	.word	0x160
	.long	0x2426
	.uleb128 0x8
	.ascii "cpu_has_kvm_support\0"
	.byte	0x4
	.word	0x161
	.long	0x242c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "disabled_by_bios\0"
	.byte	0x4
	.word	0x162
	.long	0x242c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.ascii "hardware_enable\0"
	.byte	0x4
	.word	0x163
	.long	0x243e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.ascii "hardware_disable\0"
	.byte	0x4
	.word	0x164
	.long	0x243e
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.ascii "hardware_setup\0"
	.byte	0x4
	.word	0x165
	.long	0x242c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.ascii "hardware_unsetup\0"
	.byte	0x4
	.word	0x166
	.long	0x2446
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.ascii "vcpu_create\0"
	.byte	0x4
	.word	0x168
	.long	0x245c
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x8
	.ascii "vcpu_free\0"
	.byte	0x4
	.word	0x169
	.long	0x194f
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x1d
	.secrel32	LASF30
	.byte	0x4
	.word	0x16b
	.long	0x194f
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x1d
	.secrel32	LASF31
	.byte	0x4
	.word	0x16c
	.long	0x194f
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x8
	.ascii "vcpu_decache\0"
	.byte	0x4
	.word	0x16d
	.long	0x194f
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.ascii "set_guest_debug\0"
	.byte	0x4
	.word	0x16f
	.long	0x247d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x8
	.ascii "get_msr\0"
	.byte	0x4
	.word	0x171
	.long	0x249d
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x8
	.ascii "set_msr\0"
	.byte	0x4
	.word	0x172
	.long	0x24bd
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x1d
	.secrel32	LASF32
	.byte	0x4
	.word	0x173
	.long	0x24d8
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x1d
	.secrel32	LASF33
	.byte	0x4
	.word	0x174
	.long	0x24fa
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x1d
	.secrel32	LASF34
	.byte	0x4
	.word	0x176
	.long	0x24fa
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x8
	.ascii "get_cs_db_l_bits\0"
	.byte	0x4
	.word	0x178
	.long	0x2516
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x8
	.ascii "decache_cr0_cr4_guest_bits\0"
	.byte	0x4
	.word	0x179
	.long	0x194f
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x8
	.ascii "set_cr0\0"
	.byte	0x4
	.word	0x17a
	.long	0x252d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x8
	.ascii "set_cr0_no_modeswitch\0"
	.byte	0x4
	.word	0x17b
	.long	0x252d
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x8
	.ascii "set_cr3\0"
	.byte	0x4
	.word	0x17d
	.long	0x252d
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x8
	.ascii "set_cr4\0"
	.byte	0x4
	.word	0x17e
	.long	0x252d
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x8
	.ascii "set_efer\0"
	.byte	0x4
	.word	0x17f
	.long	0x2544
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x8
	.ascii "get_idt\0"
	.byte	0x4
	.word	0x180
	.long	0x2561
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x8
	.ascii "set_idt\0"
	.byte	0x4
	.word	0x181
	.long	0x2561
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x8
	.ascii "get_gdt\0"
	.byte	0x4
	.word	0x182
	.long	0x2561
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x8
	.ascii "set_gdt\0"
	.byte	0x4
	.word	0x183
	.long	0x2561
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x8
	.ascii "get_dr\0"
	.byte	0x4
	.word	0x184
	.long	0x257c
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x8
	.ascii "set_dr\0"
	.byte	0x4
	.word	0x185
	.long	0x259d
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x8
	.ascii "cache_regs\0"
	.byte	0x4
	.word	0x187
	.long	0x194f
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x8
	.ascii "decache_regs\0"
	.byte	0x4
	.word	0x188
	.long	0x194f
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0x8
	.ascii "get_rflags\0"
	.byte	0x4
	.word	0x189
	.long	0x25b3
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x8
	.ascii "set_rflags\0"
	.byte	0x4
	.word	0x18a
	.long	0x252d
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0x8
	.ascii "invlpg\0"
	.byte	0x4
	.word	0x18c
	.long	0x25ca
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0x1d
	.secrel32	LASF28
	.byte	0x4
	.word	0x18d
	.long	0x194f
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0x8
	.ascii "inject_page_fault\0"
	.byte	0x4
	.word	0x18e
	.long	0x25e6
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0x1d
	.secrel32	LASF35
	.byte	0x4
	.word	0x191
	.long	0x25fd
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0x8
	.ascii "run\0"
	.byte	0x4
	.word	0x193
	.long	0x261e
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0x8
	.ascii "vcpu_setup\0"
	.byte	0x4
	.word	0x194
	.long	0x245c
	.byte	0x3
	.byte	0x23
	.uleb128 0x9c
	.uleb128 0x8
	.ascii "skip_emulated_instruction\0"
	.byte	0x4
	.word	0x195
	.long	0x194f
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x8
	.ascii "patch_hypercall\0"
	.byte	0x4
	.word	0x196
	.long	0x263b
	.byte	0x3
	.byte	0x23
	.uleb128 0xa4
	.byte	0x0
	.uleb128 0x26
	.byte	0x1
	.long	0xee
	.uleb128 0x6
	.byte	0x4
	.long	0x2426
	.uleb128 0x16
	.byte	0x1
	.long	0x243e
	.uleb128 0x15
	.long	0x29a
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2432
	.uleb128 0x27
	.byte	0x1
	.uleb128 0x6
	.byte	0x4
	.long	0x2444
	.uleb128 0x14
	.byte	0x1
	.long	0xee
	.long	0x245c
	.uleb128 0x15
	.long	0x158d
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x244c
	.uleb128 0x14
	.byte	0x1
	.long	0xee
	.long	0x2477
	.uleb128 0x15
	.long	0x158d
	.uleb128 0x15
	.long	0x2477
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x11cd
	.uleb128 0x6
	.byte	0x4
	.long	0x2462
	.uleb128 0x14
	.byte	0x1
	.long	0xee
	.long	0x249d
	.uleb128 0x15
	.long	0x158d
	.uleb128 0x15
	.long	0x15f
	.uleb128 0x15
	.long	0x12f3
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2483
	.uleb128 0x14
	.byte	0x1
	.long	0xee
	.long	0x24bd
	.uleb128 0x15
	.long	0x158d
	.uleb128 0x15
	.long	0x15f
	.uleb128 0x15
	.long	0x16a
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x24a3
	.uleb128 0x14
	.byte	0x1
	.long	0x16a
	.long	0x24d8
	.uleb128 0x15
	.long	0x158d
	.uleb128 0x15
	.long	0xee
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x24c3
	.uleb128 0x16
	.byte	0x1
	.long	0x24f4
	.uleb128 0x15
	.long	0x158d
	.uleb128 0x15
	.long	0x24f4
	.uleb128 0x15
	.long	0xee
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xdf7
	.uleb128 0x6
	.byte	0x4
	.long	0x24de
	.uleb128 0x16
	.byte	0x1
	.long	0x2516
	.uleb128 0x15
	.long	0x158d
	.uleb128 0x15
	.long	0x870
	.uleb128 0x15
	.long	0x870
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2500
	.uleb128 0x16
	.byte	0x1
	.long	0x252d
	.uleb128 0x15
	.long	0x158d
	.uleb128 0x15
	.long	0x285
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x251c
	.uleb128 0x16
	.byte	0x1
	.long	0x2544
	.uleb128 0x15
	.long	0x158d
	.uleb128 0x15
	.long	0x16a
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2533
	.uleb128 0x16
	.byte	0x1
	.long	0x255b
	.uleb128 0x15
	.long	0x158d
	.uleb128 0x15
	.long	0x255b
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2031
	.uleb128 0x6
	.byte	0x4
	.long	0x254a
	.uleb128 0x14
	.byte	0x1
	.long	0x285
	.long	0x257c
	.uleb128 0x15
	.long	0x158d
	.uleb128 0x15
	.long	0xee
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2567
	.uleb128 0x16
	.byte	0x1
	.long	0x259d
	.uleb128 0x15
	.long	0x158d
	.uleb128 0x15
	.long	0xee
	.uleb128 0x15
	.long	0x285
	.uleb128 0x15
	.long	0x870
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2582
	.uleb128 0x14
	.byte	0x1
	.long	0x285
	.long	0x25b3
	.uleb128 0x15
	.long	0x158d
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x25a3
	.uleb128 0x16
	.byte	0x1
	.long	0x25ca
	.uleb128 0x15
	.long	0x158d
	.uleb128 0x15
	.long	0x12b2
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x25b9
	.uleb128 0x16
	.byte	0x1
	.long	0x25e6
	.uleb128 0x15
	.long	0x158d
	.uleb128 0x15
	.long	0x285
	.uleb128 0x15
	.long	0x15f
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x25d0
	.uleb128 0x16
	.byte	0x1
	.long	0x25fd
	.uleb128 0x15
	.long	0x158d
	.uleb128 0x15
	.long	0x102
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x25ec
	.uleb128 0x14
	.byte	0x1
	.long	0xee
	.long	0x2618
	.uleb128 0x15
	.long	0x158d
	.uleb128 0x15
	.long	0x2618
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xb6f
	.uleb128 0x6
	.byte	0x4
	.long	0x2603
	.uleb128 0x16
	.byte	0x1
	.long	0x2635
	.uleb128 0x15
	.long	0x158d
	.uleb128 0x15
	.long	0x2635
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xad
	.uleb128 0x6
	.byte	0x4
	.long	0x2624
	.uleb128 0x28
	.ascii "emulation_result\0"
	.byte	0x4
	.byte	0x4
	.word	0x1bc
	.long	0x268c
	.uleb128 0x11
	.ascii "EMULATE_DONE\0"
	.sleb128 0
	.uleb128 0x11
	.ascii "EMULATE_DO_MMIO\0"
	.sleb128 1
	.uleb128 0x11
	.ascii "EMULATE_FAIL\0"
	.sleb128 2
	.byte	0x0
	.uleb128 0x4
	.ascii "x86_emulate_ops\0"
	.byte	0x18
	.byte	0xb
	.byte	0x36
	.long	0x2735
	.uleb128 0x5
	.ascii "read_std\0"
	.byte	0xb
	.byte	0x3e
	.long	0x281d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "write_std\0"
	.byte	0xb
	.byte	0x4a
	.long	0x2842
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "read_emulated\0"
	.byte	0xb
	.byte	0x54
	.long	0x281d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "write_emulated\0"
	.byte	0xb
	.byte	0x60
	.long	0x2842
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "cmpxchg_emulated\0"
	.byte	0xb
	.byte	0x6d
	.long	0x286c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "cmpxchg8b_emulated\0"
	.byte	0xb
	.byte	0x7f
	.long	0x289b
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0x0
	.uleb128 0x14
	.byte	0x1
	.long	0xee
	.long	0x2754
	.uleb128 0x15
	.long	0x285
	.uleb128 0x15
	.long	0x1eed
	.uleb128 0x15
	.long	0x102
	.uleb128 0x15
	.long	0x2754
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x275a
	.uleb128 0x7
	.ascii "x86_emulate_ctxt\0"
	.byte	0x28
	.byte	0x4
	.word	0x1cd
	.long	0x281d
	.uleb128 0x9
	.secrel32	LASF36
	.byte	0xb
	.byte	0x8b
	.long	0x158d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "eflags\0"
	.byte	0xb
	.byte	0x8e
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "cr2\0"
	.byte	0xb
	.byte	0x8f
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "mode\0"
	.byte	0xb
	.byte	0x92
	.long	0xee
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "cs_base\0"
	.byte	0xb
	.byte	0x94
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "ds_base\0"
	.byte	0xb
	.byte	0x95
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.ascii "es_base\0"
	.byte	0xb
	.byte	0x96
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.ascii "ss_base\0"
	.byte	0xb
	.byte	0x97
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.ascii "gs_base\0"
	.byte	0xb
	.byte	0x98
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x5
	.ascii "fs_base\0"
	.byte	0xb
	.byte	0x99
	.long	0x285
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2735
	.uleb128 0x14
	.byte	0x1
	.long	0xee
	.long	0x2842
	.uleb128 0x15
	.long	0x285
	.uleb128 0x15
	.long	0x285
	.uleb128 0x15
	.long	0x102
	.uleb128 0x15
	.long	0x2754
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2823
	.uleb128 0x14
	.byte	0x1
	.long	0xee
	.long	0x286c
	.uleb128 0x15
	.long	0x285
	.uleb128 0x15
	.long	0x285
	.uleb128 0x15
	.long	0x285
	.uleb128 0x15
	.long	0x102
	.uleb128 0x15
	.long	0x2754
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2848
	.uleb128 0x14
	.byte	0x1
	.long	0xee
	.long	0x289b
	.uleb128 0x15
	.long	0x285
	.uleb128 0x15
	.long	0x285
	.uleb128 0x15
	.long	0x285
	.uleb128 0x15
	.long	0x285
	.uleb128 0x15
	.long	0x285
	.uleb128 0x15
	.long	0x2754
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2872
	.uleb128 0x4
	.ascii "segment_descriptor\0"
	.byte	0x8
	.byte	0xc
	.byte	0x1
	.long	0x29c8
	.uleb128 0x5
	.ascii "limit_low\0"
	.byte	0xc
	.byte	0x2
	.long	0x154
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "base_low\0"
	.byte	0xc
	.byte	0x3
	.long	0x154
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x5
	.ascii "base_mid\0"
	.byte	0xc
	.byte	0x4
	.long	0x14a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x1e
	.ascii "type\0"
	.byte	0xc
	.byte	0x5
	.long	0x14a
	.byte	0x1
	.byte	0x4
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x1e
	.ascii "system\0"
	.byte	0xc
	.byte	0x6
	.long	0x14a
	.byte	0x1
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x1e
	.ascii "dpl\0"
	.byte	0xc
	.byte	0x7
	.long	0x14a
	.byte	0x1
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x1e
	.ascii "present\0"
	.byte	0xc
	.byte	0x8
	.long	0x14a
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x1e
	.ascii "limit_high\0"
	.byte	0xc
	.byte	0x9
	.long	0x14a
	.byte	0x1
	.byte	0x4
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x1e
	.ascii "avl\0"
	.byte	0xc
	.byte	0xa
	.long	0x14a
	.byte	0x1
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x1e
	.ascii "long_mode\0"
	.byte	0xc
	.byte	0xb
	.long	0x14a
	.byte	0x1
	.byte	0x1
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x1e
	.ascii "default_op\0"
	.byte	0xc
	.byte	0xc
	.long	0x14a
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x1e
	.ascii "granularity\0"
	.byte	0xc
	.byte	0xd
	.long	0x14a
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x5
	.ascii "base_high\0"
	.byte	0xc
	.byte	0xe
	.long	0x14a
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.byte	0x0
	.uleb128 0x4
	.ascii "kvm_stats_debugfs_item\0"
	.byte	0xc
	.byte	0x1
	.byte	0x47
	.long	0x2a16
	.uleb128 0x5
	.ascii "name\0"
	.byte	0x1
	.byte	0x48
	.long	0x8d9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.secrel32	LASF8
	.byte	0x1
	.byte	0x49
	.long	0x2a16
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "dentry\0"
	.byte	0x1
	.byte	0x4a
	.long	0x2a25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x15f
	.uleb128 0x13
	.ascii "dentry\0"
	.byte	0x1
	.uleb128 0x6
	.byte	0x4
	.long	0x2a1c
	.uleb128 0x29
	.ascii "__list_add\0"
	.byte	0x5
	.byte	0x33
	.byte	0x1
	.byte	0x3
	.long	0x2a63
	.uleb128 0x2a
	.ascii "new\0"
	.byte	0x5
	.byte	0x30
	.long	0x1a6
	.uleb128 0x2a
	.ascii "prev\0"
	.byte	0x5
	.byte	0x31
	.long	0x1a6
	.uleb128 0x2a
	.ascii "next\0"
	.byte	0x5
	.byte	0x32
	.long	0x1a6
	.byte	0x0
	.uleb128 0x29
	.ascii "__list_del\0"
	.byte	0x5
	.byte	0xa1
	.byte	0x1
	.byte	0x3
	.long	0x2a90
	.uleb128 0x2a
	.ascii "prev\0"
	.byte	0x5
	.byte	0xa0
	.long	0x1a6
	.uleb128 0x2a
	.ascii "next\0"
	.byte	0x5
	.byte	0xa0
	.long	0x1a6
	.byte	0x0
	.uleb128 0x2b
	.ascii "test_bit\0"
	.byte	0x2
	.word	0x132
	.byte	0x1
	.long	0xee
	.byte	0x3
	.long	0x2ad3
	.uleb128 0x2c
	.ascii "nr\0"
	.byte	0x2
	.word	0x131
	.long	0xee
	.uleb128 0x2d
	.secrel32	LASF37
	.byte	0x2
	.word	0x131
	.long	0x2ad3
	.uleb128 0x2e
	.ascii "v\0"
	.byte	0x2
	.word	0x133
	.long	0x14a
	.uleb128 0x2e
	.ascii "p\0"
	.byte	0x2
	.word	0x134
	.long	0x2ada
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2ad9
	.uleb128 0x2f
	.uleb128 0x6
	.byte	0x4
	.long	0x2ae0
	.uleb128 0x17
	.long	0x15f
	.uleb128 0x30
	.ascii "set_bit\0"
	.byte	0x2
	.word	0x122
	.byte	0x1
	.byte	0x3
	.long	0x2b0f
	.uleb128 0x2c
	.ascii "nr\0"
	.byte	0x2
	.word	0x121
	.long	0xee
	.uleb128 0x2d
	.secrel32	LASF37
	.byte	0x2
	.word	0x121
	.long	0x2b0f
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2b15
	.uleb128 0x31
	.long	0x285
	.uleb128 0x29
	.ascii "native_write_msr\0"
	.byte	0x3
	.byte	0xa6
	.byte	0x1
	.byte	0x3
	.long	0x2b4b
	.uleb128 0x2a
	.ascii "msr\0"
	.byte	0x3
	.byte	0xa5
	.long	0x102
	.uleb128 0x2a
	.ascii "val\0"
	.byte	0x3
	.byte	0xa5
	.long	0x130
	.byte	0x0
	.uleb128 0x32
	.ascii "native_read_msr\0"
	.byte	0x3
	.byte	0x9e
	.byte	0x1
	.long	0x130
	.byte	0x3
	.long	0x2b7f
	.uleb128 0x2a
	.ascii "msr\0"
	.byte	0x3
	.byte	0x9d
	.long	0x102
	.uleb128 0x33
	.ascii "val\0"
	.byte	0x3
	.byte	0x9f
	.long	0x130
	.byte	0x0
	.uleb128 0x34
	.secrel32	LASF35
	.byte	0x1
	.word	0x1b6
	.byte	0x1
	.byte	0x0
	.long	0x2b9a
	.uleb128 0x2d
	.secrel32	LASF36
	.byte	0x1
	.word	0x1b5
	.long	0x158d
	.byte	0x0
	.uleb128 0x35
	.byte	0x1
	.ascii "gfn_to_memslot\0"
	.byte	0x1
	.word	0x3af
	.byte	0x1
	.long	0x2be9
	.byte	0x0
	.long	0x2be9
	.uleb128 0x2c
	.ascii "kvm\0"
	.byte	0x1
	.word	0x3ae
	.long	0x1e0c
	.uleb128 0x2c
	.ascii "gfn\0"
	.byte	0x1
	.word	0x3ae
	.long	0x12cc
	.uleb128 0x2e
	.ascii "i\0"
	.byte	0x1
	.word	0x3b0
	.long	0xee
	.uleb128 0x36
	.uleb128 0x37
	.secrel32	LASF38
	.byte	0x1
	.word	0x3b3
	.long	0x2be9
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1e6f
	.uleb128 0x2b
	.ascii "gfn_to_page\0"
	.byte	0x4
	.word	0x1b5
	.byte	0x1
	.long	0x337
	.byte	0x3
	.long	0x2c23
	.uleb128 0x2c
	.ascii "slot\0"
	.byte	0x4
	.word	0x1b4
	.long	0x2be9
	.uleb128 0x2c
	.ascii "gfn\0"
	.byte	0x4
	.word	0x1b4
	.long	0x12cc
	.byte	0x0
	.uleb128 0x38
	.secrel32	LASF32
	.byte	0x1
	.word	0x47b
	.byte	0x1
	.long	0x285
	.byte	0x0
	.long	0x2c4e
	.uleb128 0x2d
	.secrel32	LASF36
	.byte	0x1
	.word	0x47a
	.long	0x158d
	.uleb128 0x2c
	.ascii "seg\0"
	.byte	0x1
	.word	0x47a
	.long	0xee
	.byte	0x0
	.uleb128 0x30
	.ascii "fx_save\0"
	.byte	0x4
	.word	0x287
	.byte	0x1
	.byte	0x3
	.long	0x2c6f
	.uleb128 0x2c
	.ascii "image\0"
	.byte	0x4
	.word	0x286
	.long	0x29a
	.byte	0x0
	.uleb128 0x39
	.ascii "fpu_init\0"
	.byte	0x4
	.word	0x291
	.byte	0x1
	.byte	0x3
	.uleb128 0x30
	.ascii "fx_restore\0"
	.byte	0x4
	.word	0x28c
	.byte	0x1
	.byte	0x3
	.long	0x2ca2
	.uleb128 0x2c
	.ascii "image\0"
	.byte	0x4
	.word	0x28b
	.long	0x29a
	.byte	0x0
	.uleb128 0x2b
	.ascii "ERR_PTR\0"
	.byte	0x2
	.word	0x14b
	.byte	0x1
	.long	0x29a
	.byte	0x3
	.long	0x2cc7
	.uleb128 0x2c
	.ascii "error\0"
	.byte	0x2
	.word	0x14a
	.long	0x598
	.byte	0x0
	.uleb128 0x29
	.ascii "INIT_LIST_HEAD\0"
	.byte	0x5
	.byte	0x24
	.byte	0x1
	.byte	0x3
	.long	0x2cec
	.uleb128 0x2a
	.ascii "list\0"
	.byte	0x5
	.byte	0x23
	.long	0x1a6
	.byte	0x0
	.uleb128 0x29
	.ascii "list_add\0"
	.byte	0x5
	.byte	0x49
	.byte	0x1
	.byte	0x3
	.long	0x2d27
	.uleb128 0x2a
	.ascii "new\0"
	.byte	0x5
	.byte	0x48
	.long	0x1a6
	.uleb128 0x2a
	.ascii "head\0"
	.byte	0x5
	.byte	0x48
	.long	0x1a6
	.uleb128 0x36
	.uleb128 0x3a
	.long	0x2a56
	.uleb128 0x3a
	.long	0x2a4a
	.uleb128 0x3a
	.long	0x2a3f
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.ascii "atomic_inc\0"
	.byte	0x3
	.word	0x1c9
	.byte	0x1
	.byte	0x3
	.long	0x2d47
	.uleb128 0x2c
	.ascii "v\0"
	.byte	0x3
	.word	0x1c8
	.long	0x870
	.byte	0x0
	.uleb128 0x32
	.ascii "kvmfs_inode\0"
	.byte	0x1
	.byte	0x75
	.byte	0x1
	.long	0x4bc
	.byte	0x0
	.long	0x2d91
	.uleb128 0x2a
	.ascii "fops\0"
	.byte	0x1
	.byte	0x74
	.long	0x2d91
	.uleb128 0x33
	.ascii "error\0"
	.byte	0x1
	.byte	0x76
	.long	0xee
	.uleb128 0x3b
	.secrel32	LASF2
	.byte	0x1
	.byte	0x8f
	.long	0x4bc
	.uleb128 0x3c
	.ascii "eexit_1\0"
	.byte	0x1
	.byte	0x96
	.uleb128 0x3d
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x6d2
	.uleb128 0x2b
	.ascii "IS_ERR\0"
	.byte	0x2
	.word	0x155
	.byte	0x1
	.long	0x598
	.byte	0x3
	.long	0x2db9
	.uleb128 0x2c
	.ascii "ptr\0"
	.byte	0x2
	.word	0x154
	.long	0x2ad3
	.byte	0x0
	.uleb128 0x2b
	.ascii "PTR_ERR\0"
	.byte	0x2
	.word	0x150
	.byte	0x1
	.long	0x598
	.byte	0x3
	.long	0x2ddc
	.uleb128 0x2c
	.ascii "ptr\0"
	.byte	0x2
	.word	0x14f
	.long	0x2ad3
	.byte	0x0
	.uleb128 0x32
	.ascii "kvmfs_file\0"
	.byte	0x1
	.byte	0xa0
	.byte	0x1
	.long	0x6cc
	.byte	0x0
	.long	0x2e24
	.uleb128 0x3e
	.secrel32	LASF2
	.byte	0x1
	.byte	0x9e
	.long	0x4bc
	.uleb128 0x3e
	.secrel32	LASF3
	.byte	0x1
	.byte	0x9e
	.long	0x29a
	.uleb128 0x2a
	.ascii "type\0"
	.byte	0x1
	.byte	0x9e
	.long	0xee
	.uleb128 0x33
	.ascii "file\0"
	.byte	0x1
	.byte	0xa1
	.long	0x6cc
	.uleb128 0x3d
	.byte	0x0
	.uleb128 0x34
	.secrel32	LASF33
	.byte	0x1
	.word	0x6d6
	.byte	0x1
	.byte	0x0
	.long	0x2e57
	.uleb128 0x2d
	.secrel32	LASF36
	.byte	0x1
	.word	0x6d4
	.long	0x158d
	.uleb128 0x2c
	.ascii "var\0"
	.byte	0x1
	.word	0x6d5
	.long	0x24f4
	.uleb128 0x2c
	.ascii "seg\0"
	.byte	0x1
	.word	0x6d5
	.long	0xee
	.byte	0x0
	.uleb128 0x29
	.ascii "list_del\0"
	.byte	0x5
	.byte	0xae
	.byte	0x1
	.byte	0x3
	.long	0x2e83
	.uleb128 0x2a
	.ascii "entry\0"
	.byte	0x5
	.byte	0xad
	.long	0x1a6
	.uleb128 0x36
	.uleb128 0x3a
	.long	0x2a83
	.uleb128 0x3a
	.long	0x2a77
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.ascii "kvm_free_vcpus\0"
	.byte	0x1
	.word	0x197
	.byte	0x1
	.byte	0x0
	.long	0x2eb3
	.uleb128 0x2c
	.ascii "kvm\0"
	.byte	0x1
	.word	0x196
	.long	0x1e0c
	.uleb128 0x2e
	.ascii "i\0"
	.byte	0x1
	.word	0x198
	.long	0x102
	.byte	0x0
	.uleb128 0x30
	.ascii "kvm_free_physmem\0"
	.byte	0x1
	.word	0x184
	.byte	0x1
	.byte	0x0
	.long	0x2ee5
	.uleb128 0x2c
	.ascii "kvm\0"
	.byte	0x1
	.word	0x183
	.long	0x1e0c
	.uleb128 0x2e
	.ascii "i\0"
	.byte	0x1
	.word	0x185
	.long	0xee
	.byte	0x0
	.uleb128 0x2b
	.ascii "kvm_create_vm\0"
	.byte	0x1
	.word	0x14e
	.byte	0x1
	.long	0x1e0c
	.byte	0x0
	.long	0x2f5a
	.uleb128 0x2e
	.ascii "kvm\0"
	.byte	0x1
	.word	0x14f
	.long	0x1e0c
	.uleb128 0x2e
	.ascii "i\0"
	.byte	0x1
	.word	0x150
	.long	0xee
	.uleb128 0x3f
	.long	0x2f51
	.uleb128 0x37
	.secrel32	LASF36
	.byte	0x1
	.word	0x158
	.long	0x158d
	.uleb128 0x3f
	.long	0x2f33
	.uleb128 0x3a
	.long	0x2cdf
	.byte	0x0
	.uleb128 0x36
	.uleb128 0x3a
	.long	0x2d09
	.uleb128 0x3a
	.long	0x2cfe
	.uleb128 0x36
	.uleb128 0x3a
	.long	0x2a56
	.uleb128 0x3a
	.long	0x2a4a
	.uleb128 0x3a
	.long	0x2a3f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3d
	.uleb128 0x36
	.uleb128 0x3a
	.long	0x2cdf
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.ascii "valid_vcpu\0"
	.byte	0x1
	.byte	0xdb
	.byte	0x1
	.long	0xee
	.byte	0x3
	.long	0x2f7c
	.uleb128 0x2a
	.ascii "n\0"
	.byte	0x1
	.byte	0xda
	.long	0xee
	.byte	0x0
	.uleb128 0x2b
	.ascii "is_long_mode\0"
	.byte	0x4
	.word	0x222
	.byte	0x1
	.long	0xee
	.byte	0x3
	.long	0x2fa4
	.uleb128 0x2d
	.secrel32	LASF36
	.byte	0x4
	.word	0x221
	.long	0x158d
	.byte	0x0
	.uleb128 0x2b
	.ascii "is_paging\0"
	.byte	0x4
	.word	0x235
	.byte	0x1
	.long	0xee
	.byte	0x3
	.long	0x2fc9
	.uleb128 0x2d
	.secrel32	LASF36
	.byte	0x4
	.word	0x234
	.long	0x158d
	.byte	0x0
	.uleb128 0x2b
	.ascii "is_pae\0"
	.byte	0x4
	.word	0x22b
	.byte	0x1
	.long	0xee
	.byte	0x3
	.long	0x2feb
	.uleb128 0x2d
	.secrel32	LASF36
	.byte	0x4
	.word	0x22a
	.long	0x158d
	.byte	0x0
	.uleb128 0x34
	.secrel32	LASF34
	.byte	0x1
	.word	0x709
	.byte	0x1
	.byte	0x0
	.long	0x301e
	.uleb128 0x2d
	.secrel32	LASF36
	.byte	0x1
	.word	0x707
	.long	0x158d
	.uleb128 0x2c
	.ascii "var\0"
	.byte	0x1
	.word	0x708
	.long	0x24f4
	.uleb128 0x2c
	.ascii "seg\0"
	.byte	0x1
	.word	0x708
	.long	0xee
	.byte	0x0
	.uleb128 0x30
	.ascii "__set_bit\0"
	.byte	0x2
	.word	0x12a
	.byte	0x1
	.byte	0x3
	.long	0x304a
	.uleb128 0x2c
	.ascii "nr\0"
	.byte	0x2
	.word	0x129
	.long	0xee
	.uleb128 0x2d
	.secrel32	LASF37
	.byte	0x2
	.word	0x129
	.long	0x2b0f
	.byte	0x0
	.uleb128 0x2b
	.ascii "mk_cr_64\0"
	.byte	0x1
	.word	0x53b
	.byte	0x1
	.long	0x16a
	.byte	0x0
	.long	0x3082
	.uleb128 0x2c
	.ascii "curr_cr\0"
	.byte	0x1
	.word	0x53a
	.long	0x16a
	.uleb128 0x2c
	.ascii "new_val\0"
	.byte	0x1
	.word	0x53a
	.long	0x15f
	.byte	0x0
	.uleb128 0x2b
	.ascii "is_error_hpa\0"
	.byte	0x4
	.word	0x1ad
	.byte	0x1
	.long	0xee
	.byte	0x3
	.long	0x30aa
	.uleb128 0x2c
	.ascii "hpa\0"
	.byte	0x4
	.word	0x1ad
	.long	0x12e6
	.byte	0x0
	.uleb128 0x30
	.ascii "report_emulation_failure\0"
	.byte	0x1
	.word	0x4ab
	.byte	0x1
	.byte	0x0
	.long	0x312b
	.uleb128 0x2d
	.secrel32	LASF39
	.byte	0x1
	.word	0x4aa
	.long	0x2754
	.uleb128 0x2e
	.ascii "opcodes\0"
	.byte	0x1
	.word	0x4ad
	.long	0x312b
	.uleb128 0x2e
	.ascii "rip\0"
	.byte	0x1
	.word	0x4ae
	.long	0x285
	.uleb128 0x2e
	.ascii "rip_linear\0"
	.byte	0x1
	.word	0x4af
	.long	0x285
	.uleb128 0x3f
	.long	0x3118
	.uleb128 0x3a
	.long	0x2c41
	.uleb128 0x3a
	.long	0x2c35
	.byte	0x0
	.uleb128 0x40
	.secrel32	LASF40
	.byte	0x1
	.word	0x4ac
	.long	0xee
	.byte	0x5
	.byte	0x3
	.long	_reported.3288
	.byte	0x0
	.uleb128 0x1a
	.long	0x14a
	.long	0x313b
	.uleb128 0x1b
	.long	0x5a4
	.byte	0x3
	.byte	0x0
	.uleb128 0x2b
	.ascii "vcpu_load_slot\0"
	.byte	0x1
	.word	0x13b
	.byte	0x1
	.long	0x158d
	.byte	0x0
	.long	0x317e
	.uleb128 0x2c
	.ascii "kvm\0"
	.byte	0x1
	.word	0x13a
	.long	0x1e0c
	.uleb128 0x2c
	.ascii "slot\0"
	.byte	0x1
	.word	0x13a
	.long	0xee
	.uleb128 0x37
	.secrel32	LASF36
	.byte	0x1
	.word	0x13c
	.long	0x158d
	.byte	0x0
	.uleb128 0x30
	.ascii "do_remove_write_access\0"
	.byte	0x1
	.word	0x295
	.byte	0x1
	.byte	0x0
	.long	0x31b9
	.uleb128 0x2d
	.secrel32	LASF36
	.byte	0x1
	.word	0x294
	.long	0x158d
	.uleb128 0x2c
	.ascii "slot\0"
	.byte	0x1
	.word	0x294
	.long	0xee
	.byte	0x0
	.uleb128 0x41
	.byte	0x1
	.ascii "segment_base\0"
	.byte	0x1
	.byte	0xbc
	.byte	0x1
	.long	0x285
	.long	LFB112
	.long	LFE112
	.secrel32	LLST0
	.long	0x324f
	.uleb128 0x42
	.secrel32	LASF14
	.byte	0x1
	.byte	0xbb
	.long	0x154
	.secrel32	LLST1
	.uleb128 0x43
	.ascii "gdt\0"
	.byte	0x1
	.byte	0xbd
	.long	0x2031
	.byte	0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x44
	.ascii "d\0"
	.byte	0x1
	.byte	0xbe
	.long	0x324f
	.secrel32	LLST2
	.uleb128 0x44
	.ascii "table_base\0"
	.byte	0x1
	.byte	0xbf
	.long	0x285
	.secrel32	LLST3
	.uleb128 0x44
	.ascii "v\0"
	.byte	0x1
	.byte	0xc1
	.long	0x285
	.secrel32	LLST4
	.uleb128 0x45
	.long	LBB240
	.long	LBE240
	.uleb128 0x44
	.ascii "ldt_selector\0"
	.byte	0x1
	.byte	0xca
	.long	0x154
	.secrel32	LLST5
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x28a1
	.uleb128 0x46
	.long	0x2b9a
	.long	LFB140
	.long	LFE140
	.secrel32	LLST6
	.long	0x3297
	.uleb128 0x47
	.long	0x2bb8
	.secrel32	LLST7
	.uleb128 0x47
	.long	0x2bc4
	.secrel32	LLST8
	.uleb128 0x48
	.long	0x2bd0
	.byte	0x1
	.byte	0x51
	.uleb128 0x45
	.long	LBB241
	.long	LBE241
	.uleb128 0x49
	.long	0x2bdb
	.secrel32	LLST9
	.byte	0x0
	.byte	0x0
	.uleb128 0x4a
	.byte	0x1
	.ascii "mark_page_dirty\0"
	.byte	0x1
	.word	0x3be
	.byte	0x1
	.long	LFB141
	.long	LFE141
	.secrel32	LLST10
	.long	0x3350
	.uleb128 0x4b
	.ascii "kvm\0"
	.byte	0x1
	.word	0x3bd
	.long	0x1e0c
	.secrel32	LLST11
	.uleb128 0x4b
	.ascii "gfn\0"
	.byte	0x1
	.word	0x3bd
	.long	0x12cc
	.secrel32	LLST12
	.uleb128 0x4c
	.ascii "i\0"
	.byte	0x1
	.word	0x3bf
	.long	0xee
	.secrel32	LLST13
	.uleb128 0x37
	.secrel32	LASF38
	.byte	0x1
	.word	0x3c0
	.long	0x2be9
	.uleb128 0x2e
	.ascii "rel_gfn\0"
	.byte	0x1
	.word	0x3c1
	.long	0x285
	.uleb128 0x4d
	.long	0x2a90
	.long	LBB242
	.long	LBE242
	.byte	0x1
	.word	0x3d3
	.long	0x3334
	.uleb128 0x45
	.long	LBB243
	.long	LBE243
	.uleb128 0x49
	.long	0x2abe
	.secrel32	LLST14
	.uleb128 0x4e
	.long	0x2ac8
	.byte	0x0
	.byte	0x0
	.uleb128 0x4f
	.long	0x2ae5
	.long	LBB244
	.long	LBE244
	.byte	0x1
	.word	0x3d4
	.uleb128 0x3a
	.long	0x2b02
	.uleb128 0x3a
	.long	0x2af7
	.byte	0x0
	.byte	0x0
	.uleb128 0x50
	.byte	0x1
	.ascii "emulate_invlpg\0"
	.byte	0x1
	.word	0x480
	.byte	0x1
	.long	0xee
	.long	LFB150
	.long	LFE150
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x3397
	.uleb128 0x51
	.secrel32	LASF36
	.byte	0x1
	.word	0x47f
	.long	0x158d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x51
	.secrel32	LASF7
	.byte	0x1
	.word	0x47f
	.long	0x12b2
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0x0
	.uleb128 0x52
	.byte	0x1
	.ascii "emulate_clts\0"
	.byte	0x1
	.word	0x485
	.byte	0x1
	.long	0xee
	.long	LFB151
	.long	LFE151
	.secrel32	LLST16
	.long	0x33da
	.uleb128 0x51
	.secrel32	LASF36
	.byte	0x1
	.word	0x484
	.long	0x158d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2e
	.ascii "cr0\0"
	.byte	0x1
	.word	0x486
	.long	0x285
	.byte	0x0
	.uleb128 0x52
	.byte	0x1
	.ascii "emulator_set_dr\0"
	.byte	0x1
	.word	0x49e
	.byte	0x1
	.long	0xee
	.long	LFB153
	.long	LFE153
	.secrel32	LLST17
	.long	0x344f
	.uleb128 0x51
	.secrel32	LASF39
	.byte	0x1
	.word	0x49d
	.long	0x2754
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x53
	.ascii "dr\0"
	.byte	0x1
	.word	0x49d
	.long	0xee
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x53
	.ascii "value\0"
	.byte	0x1
	.word	0x49d
	.long	0x285
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x2e
	.ascii "mask\0"
	.byte	0x1
	.word	0x49f
	.long	0x285
	.uleb128 0x40
	.secrel32	LASF5
	.byte	0x1
	.word	0x4a0
	.long	0xee
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0x0
	.uleb128 0x52
	.byte	0x1
	.ascii "kvm_hypercall\0"
	.byte	0x1
	.word	0x517
	.byte	0x1
	.long	0xee
	.long	LFB156
	.long	LFE156
	.secrel32	LLST18
	.long	0x34ef
	.uleb128 0x51
	.secrel32	LASF36
	.byte	0x1
	.word	0x516
	.long	0x158d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x53
	.ascii "run\0"
	.byte	0x1
	.word	0x516
	.long	0x2618
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x2e
	.ascii "nr\0"
	.byte	0x1
	.word	0x518
	.long	0x285
	.uleb128 0x2e
	.ascii "a0\0"
	.byte	0x1
	.word	0x518
	.long	0x285
	.uleb128 0x2e
	.ascii "a1\0"
	.byte	0x1
	.word	0x518
	.long	0x285
	.uleb128 0x2e
	.ascii "a2\0"
	.byte	0x1
	.word	0x518
	.long	0x285
	.uleb128 0x2e
	.ascii "a3\0"
	.byte	0x1
	.word	0x518
	.long	0x285
	.uleb128 0x2e
	.ascii "a4\0"
	.byte	0x1
	.word	0x518
	.long	0x285
	.uleb128 0x2e
	.ascii "a5\0"
	.byte	0x1
	.word	0x518
	.long	0x285
	.uleb128 0x2e
	.ascii "ret\0"
	.byte	0x1
	.word	0x518
	.long	0x285
	.byte	0x0
	.uleb128 0x4a
	.byte	0x1
	.ascii "realmode_lgdt\0"
	.byte	0x1
	.word	0x540
	.byte	0x1
	.long	LFB158
	.long	LFE158
	.secrel32	LLST19
	.long	0x354f
	.uleb128 0x51
	.secrel32	LASF36
	.byte	0x1
	.word	0x53f
	.long	0x158d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x51
	.secrel32	LASF13
	.byte	0x1
	.word	0x53f
	.long	0x154
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x51
	.secrel32	LASF12
	.byte	0x1
	.word	0x53f
	.long	0x285
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x54
	.ascii "dt\0"
	.byte	0x1
	.word	0x541
	.long	0x2031
	.byte	0x2
	.byte	0x91
	.sleb128 -10
	.byte	0x0
	.uleb128 0x4a
	.byte	0x1
	.ascii "realmode_lidt\0"
	.byte	0x1
	.word	0x547
	.byte	0x1
	.long	LFB159
	.long	LFE159
	.secrel32	LLST20
	.long	0x35af
	.uleb128 0x51
	.secrel32	LASF36
	.byte	0x1
	.word	0x546
	.long	0x158d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x51
	.secrel32	LASF13
	.byte	0x1
	.word	0x546
	.long	0x154
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x51
	.secrel32	LASF12
	.byte	0x1
	.word	0x546
	.long	0x285
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x54
	.ascii "dt\0"
	.byte	0x1
	.word	0x548
	.long	0x2031
	.byte	0x2
	.byte	0x91
	.sleb128 -10
	.byte	0x0
	.uleb128 0x55
	.byte	0x1
	.ascii "kvm_resched\0"
	.byte	0x1
	.word	0x646
	.byte	0x1
	.long	LFB168
	.long	LFE168
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x35e0
	.uleb128 0x51
	.secrel32	LASF36
	.byte	0x1
	.word	0x645
	.long	0x158d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0x0
	.uleb128 0x4a
	.byte	0x1
	.ascii "load_msrs\0"
	.byte	0x1
	.word	0x653
	.byte	0x1
	.long	LFB169
	.long	LFE169
	.secrel32	LLST22
	.long	0x363a
	.uleb128 0x53
	.ascii "e\0"
	.byte	0x1
	.word	0x652
	.long	0x1e32
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4b
	.ascii "n\0"
	.byte	0x1
	.word	0x652
	.long	0xee
	.secrel32	LLST23
	.uleb128 0x4c
	.ascii "i\0"
	.byte	0x1
	.word	0x654
	.long	0xee
	.secrel32	LLST24
	.uleb128 0x56
	.long	0x2b1a
	.long	LBB246
	.long	LBE246
	.byte	0x1
	.word	0x657
	.byte	0x0
	.uleb128 0x4a
	.byte	0x1
	.ascii "save_msrs\0"
	.byte	0x1
	.word	0x65c
	.byte	0x1
	.long	LFB170
	.long	LFE170
	.secrel32	LLST25
	.long	0x36ab
	.uleb128 0x53
	.ascii "e\0"
	.byte	0x1
	.word	0x65b
	.long	0x1e32
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4b
	.ascii "n\0"
	.byte	0x1
	.word	0x65b
	.long	0xee
	.secrel32	LLST26
	.uleb128 0x4c
	.ascii "i\0"
	.byte	0x1
	.word	0x65d
	.long	0xee
	.secrel32	LLST27
	.uleb128 0x4f
	.long	0x2b4b
	.long	LBB248
	.long	LBE248
	.byte	0x1
	.word	0x660
	.uleb128 0x45
	.long	LBB249
	.long	LBE249
	.uleb128 0x48
	.long	0x2b73
	.byte	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x57
	.byte	0x1
	.ascii "get_emulated_msrs_array_size\0"
	.byte	0x1
	.word	0x767
	.byte	0x1
	.long	0x285
	.long	LFB178
	.long	LFE178
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.uleb128 0x58
	.ascii "kvm_vcpu_ioctl\0"
	.byte	0x1
	.word	0x87a
	.byte	0x1
	.long	0x598
	.long	LFB189
	.long	LFE189
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x3735
	.uleb128 0x53
	.ascii "filp\0"
	.byte	0x1
	.word	0x878
	.long	0x6cc
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x53
	.ascii "ioctl\0"
	.byte	0x1
	.word	0x879
	.long	0x102
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x53
	.ascii "arg\0"
	.byte	0x1
	.word	0x879
	.long	0x285
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x58
	.ascii "kvm_vm_ioctl\0"
	.byte	0x1
	.word	0x8fb
	.byte	0x1
	.long	0x598
	.long	LFB190
	.long	LFE190
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x378b
	.uleb128 0x53
	.ascii "filp\0"
	.byte	0x1
	.word	0x8f9
	.long	0x6cc
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x53
	.ascii "ioctl\0"
	.byte	0x1
	.word	0x8fa
	.long	0x102
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x53
	.ascii "arg\0"
	.byte	0x1
	.word	0x8fa
	.long	0x285
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x58
	.ascii "kvm_vm_mmap\0"
	.byte	0x1
	.word	0x94c
	.byte	0x1
	.long	0xee
	.long	LFB192
	.long	LFE192
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x37cf
	.uleb128 0x53
	.ascii "file\0"
	.byte	0x1
	.word	0x94b
	.long	0x6cc
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x53
	.ascii "vma\0"
	.byte	0x1
	.word	0x94b
	.long	0x7bf
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0x0
	.uleb128 0x59
	.ascii "emulator_write_std\0"
	.byte	0x1
	.word	0x404
	.byte	0x1
	.long	0xee
	.long	LFB143
	.long	LFE143
	.secrel32	LLST32
	.long	0x3838
	.uleb128 0x51
	.secrel32	LASF37
	.byte	0x1
	.word	0x400
	.long	0x285
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x53
	.ascii "val\0"
	.byte	0x1
	.word	0x401
	.long	0x285
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x51
	.secrel32	LASF41
	.byte	0x1
	.word	0x402
	.long	0x102
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x51
	.secrel32	LASF39
	.byte	0x1
	.word	0x403
	.long	0x2754
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.byte	0x0
	.uleb128 0x59
	.ascii "test_2_t\0"
	.byte	0x1
	.word	0xb18
	.byte	0x1
	.long	0xee
	.long	LFB203
	.long	LFE203
	.secrel32	LLST33
	.long	0x3892
	.uleb128 0x53
	.ascii "a\0"
	.byte	0x1
	.word	0xb17
	.long	0xee
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x53
	.ascii "b\0"
	.byte	0x1
	.word	0xb17
	.long	0xee
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x53
	.ascii "c\0"
	.byte	0x1
	.word	0xb17
	.long	0xee
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x5a
	.secrel32	LASF42
	.long	0x577e
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.4103
	.byte	0x0
	.uleb128 0x4a
	.byte	0x1
	.ascii "test_1_t\0"
	.byte	0x1
	.word	0xb11
	.byte	0x1
	.long	LFB202
	.long	LFE202
	.secrel32	LLST34
	.long	0x38e9
	.uleb128 0x53
	.ascii "a\0"
	.byte	0x1
	.word	0xb10
	.long	0xee
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x53
	.ascii "b\0"
	.byte	0x1
	.word	0xb10
	.long	0xee
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x53
	.ascii "c\0"
	.byte	0x1
	.word	0xb10
	.long	0xee
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x5a
	.secrel32	LASF42
	.long	0x5779
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.4097
	.byte	0x0
	.uleb128 0x52
	.byte	0x1
	.ascii "kvm_get_msr_common\0"
	.byte	0x1
	.word	0x5c2
	.byte	0x1
	.long	0xee
	.long	LFB164
	.long	LFE164
	.secrel32	LLST35
	.long	0x3957
	.uleb128 0x51
	.secrel32	LASF36
	.byte	0x1
	.word	0x5c1
	.long	0x158d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4b
	.ascii "msr\0"
	.byte	0x1
	.word	0x5c1
	.long	0x15f
	.secrel32	LLST36
	.uleb128 0x53
	.ascii "pdata\0"
	.byte	0x1
	.word	0x5c1
	.long	0x12f3
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x5b
	.secrel32	LASF8
	.byte	0x1
	.word	0x5c3
	.long	0x16a
	.secrel32	LLST37
	.byte	0x0
	.uleb128 0x52
	.byte	0x1
	.ascii "realmode_get_cr\0"
	.byte	0x1
	.word	0x555
	.byte	0x1
	.long	0x285
	.long	LFB161
	.long	LFE161
	.secrel32	LLST38
	.long	0x39b1
	.uleb128 0x5c
	.secrel32	LASF36
	.byte	0x1
	.word	0x554
	.long	0x158d
	.secrel32	LLST39
	.uleb128 0x4b
	.ascii "cr\0"
	.byte	0x1
	.word	0x554
	.long	0xee
	.secrel32	LLST40
	.uleb128 0x5a
	.secrel32	LASF42
	.long	0x574a
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.3406
	.byte	0x0
	.uleb128 0x52
	.byte	0x1
	.ascii "emulator_get_dr\0"
	.byte	0x1
	.word	0x48f
	.byte	0x1
	.long	0xee
	.long	LFB152
	.long	LFE152
	.secrel32	LLST41
	.long	0x3a2a
	.uleb128 0x51
	.secrel32	LASF39
	.byte	0x1
	.word	0x48e
	.long	0x2754
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4b
	.ascii "dr\0"
	.byte	0x1
	.word	0x48e
	.long	0xee
	.secrel32	LLST42
	.uleb128 0x53
	.ascii "dest\0"
	.byte	0x1
	.word	0x48e
	.long	0x1eed
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x5b
	.secrel32	LASF36
	.byte	0x1
	.word	0x490
	.long	0x158d
	.secrel32	LLST43
	.uleb128 0x5a
	.secrel32	LASF42
	.long	0x5745
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.3267
	.byte	0x0
	.uleb128 0x4a
	.byte	0x1
	.ascii "set_cr8\0"
	.byte	0x1
	.word	0x270
	.byte	0x1
	.long	LFB134
	.long	LFE134
	.secrel32	LLST44
	.long	0x3a7b
	.uleb128 0x5c
	.secrel32	LASF36
	.byte	0x1
	.word	0x26f
	.long	0x158d
	.secrel32	LLST45
	.uleb128 0x4b
	.ascii "cr8\0"
	.byte	0x1
	.word	0x26f
	.long	0x285
	.secrel32	LLST46
	.uleb128 0x5d
	.long	0x2b7f
	.secrel32	Ldebug_ranges0+0x0
	.byte	0x1
	.word	0x273
	.uleb128 0x3a
	.long	0x2b8d
	.byte	0x0
	.byte	0x0
	.uleb128 0x59
	.ascii "emulator_read_std\0"
	.byte	0x1
	.word	0x3e0
	.byte	0x1
	.long	0xee
	.long	LFB142
	.long	LFE142
	.secrel32	LLST47
	.long	0x3baa
	.uleb128 0x51
	.secrel32	LASF37
	.byte	0x1
	.word	0x3dc
	.long	0x285
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x53
	.ascii "val\0"
	.byte	0x1
	.word	0x3dd
	.long	0x1eed
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x51
	.secrel32	LASF41
	.byte	0x1
	.word	0x3de
	.long	0x102
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x51
	.secrel32	LASF39
	.byte	0x1
	.word	0x3df
	.long	0x2754
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x5b
	.secrel32	LASF36
	.byte	0x1
	.word	0x3e1
	.long	0x158d
	.secrel32	LLST48
	.uleb128 0x5b
	.secrel32	LASF8
	.byte	0x1
	.word	0x3e2
	.long	0x29a
	.secrel32	LLST49
	.uleb128 0x5e
	.secrel32	Ldebug_ranges0+0x18
	.uleb128 0x4c
	.ascii "gpa\0"
	.byte	0x1
	.word	0x3e5
	.long	0x12bf
	.secrel32	LLST50
	.uleb128 0x5b
	.secrel32	LASF43
	.byte	0x1
	.word	0x3e6
	.long	0x102
	.secrel32	LLST51
	.uleb128 0x4c
	.ascii "tocopy\0"
	.byte	0x1
	.word	0x3e7
	.long	0x102
	.secrel32	LLST52
	.uleb128 0x4c
	.ascii "pfn\0"
	.byte	0x1
	.word	0x3e8
	.long	0x285
	.secrel32	LLST53
	.uleb128 0x5b
	.secrel32	LASF38
	.byte	0x1
	.word	0x3e9
	.long	0x2be9
	.secrel32	LLST54
	.uleb128 0x4c
	.ascii "page\0"
	.byte	0x1
	.word	0x3ea
	.long	0x29a
	.secrel32	LLST55
	.uleb128 0x4f
	.long	0x2b9a
	.long	LBB255
	.long	LBE255
	.byte	0x1
	.word	0x3ef
	.uleb128 0x3a
	.long	0x3273
	.uleb128 0x3a
	.long	0x326a
	.uleb128 0x45
	.long	LBB256
	.long	LBE256
	.uleb128 0x49
	.long	0x2bd0
	.secrel32	LLST56
	.uleb128 0x45
	.long	LBB257
	.long	LBE257
	.uleb128 0x4e
	.long	0x2bdb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x59
	.ascii "emulator_read_emulated\0"
	.byte	0x1
	.word	0x40e
	.byte	0x1
	.long	0xee
	.long	LFB144
	.long	LFE144
	.secrel32	LLST57
	.long	0x3c44
	.uleb128 0x51
	.secrel32	LASF37
	.byte	0x1
	.word	0x40a
	.long	0x285
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4b
	.ascii "val\0"
	.byte	0x1
	.word	0x40b
	.long	0x1eed
	.secrel32	LLST58
	.uleb128 0x5c
	.secrel32	LASF41
	.byte	0x1
	.word	0x40c
	.long	0x102
	.secrel32	LLST59
	.uleb128 0x5c
	.secrel32	LASF39
	.byte	0x1
	.word	0x40d
	.long	0x2754
	.secrel32	LLST60
	.uleb128 0x5b
	.secrel32	LASF36
	.byte	0x1
	.word	0x40f
	.long	0x158d
	.secrel32	LLST61
	.uleb128 0x45
	.long	LBB263
	.long	LBE263
	.uleb128 0x4c
	.ascii "gpa\0"
	.byte	0x1
	.word	0x419
	.long	0x12bf
	.secrel32	LLST62
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
	.ascii "emulator_write_phys\0"
	.byte	0x1
	.word	0x428
	.byte	0x1
	.long	0xee
	.byte	0x1
	.long	0x3ce5
	.uleb128 0x2d
	.secrel32	LASF36
	.byte	0x1
	.word	0x426
	.long	0x158d
	.uleb128 0x2c
	.ascii "gpa\0"
	.byte	0x1
	.word	0x426
	.long	0x12bf
	.uleb128 0x2c
	.ascii "val\0"
	.byte	0x1
	.word	0x427
	.long	0x285
	.uleb128 0x2d
	.secrel32	LASF41
	.byte	0x1
	.word	0x427
	.long	0xee
	.uleb128 0x2e
	.ascii "m\0"
	.byte	0x1
	.word	0x429
	.long	0x2be9
	.uleb128 0x2e
	.ascii "page\0"
	.byte	0x1
	.word	0x42a
	.long	0x337
	.uleb128 0x2e
	.ascii "virt\0"
	.byte	0x1
	.word	0x42b
	.long	0x29a
	.uleb128 0x3f
	.long	0x3cd8
	.uleb128 0x3a
	.long	0x3273
	.uleb128 0x3a
	.long	0x326a
	.uleb128 0x36
	.uleb128 0x4e
	.long	0x2bd0
	.uleb128 0x36
	.uleb128 0x4e
	.long	0x2bdb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.uleb128 0x3a
	.long	0x2c16
	.uleb128 0x3a
	.long	0x2c09
	.byte	0x0
	.byte	0x0
	.uleb128 0x59
	.ascii "emulator_write_emulated\0"
	.byte	0x1
	.word	0x440
	.byte	0x1
	.long	0xee
	.long	LFB146
	.long	LFE146
	.secrel32	LLST63
	.long	0x3e14
	.uleb128 0x51
	.secrel32	LASF37
	.byte	0x1
	.word	0x43c
	.long	0x285
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x53
	.ascii "val\0"
	.byte	0x1
	.word	0x43d
	.long	0x285
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x51
	.secrel32	LASF41
	.byte	0x1
	.word	0x43e
	.long	0x102
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x51
	.secrel32	LASF39
	.byte	0x1
	.word	0x43f
	.long	0x2754
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x5b
	.secrel32	LASF36
	.byte	0x1
	.word	0x441
	.long	0x158d
	.secrel32	LLST64
	.uleb128 0x4c
	.ascii "gpa\0"
	.byte	0x1
	.word	0x442
	.long	0x12bf
	.secrel32	LLST65
	.uleb128 0x5d
	.long	0x3c44
	.secrel32	Ldebug_ranges0+0x50
	.byte	0x1
	.word	0x447
	.uleb128 0x3a
	.long	0x3c8a
	.uleb128 0x5f
	.long	0x3c7e
	.byte	0x2
	.byte	0x74
	.sleb128 28
	.uleb128 0x3a
	.long	0x3c72
	.uleb128 0x3a
	.long	0x3c66
	.uleb128 0x5e
	.secrel32	Ldebug_ranges0+0x68
	.uleb128 0x49
	.long	0x3c96
	.secrel32	LLST66
	.uleb128 0x49
	.long	0x3ca0
	.secrel32	LLST67
	.uleb128 0x49
	.long	0x3cad
	.secrel32	LLST68
	.uleb128 0x4d
	.long	0x2b9a
	.long	LBB273
	.long	LBE273
	.byte	0x1
	.word	0x42f
	.long	0x3df6
	.uleb128 0x3a
	.long	0x3273
	.uleb128 0x3a
	.long	0x326a
	.uleb128 0x45
	.long	LBB274
	.long	LBE274
	.uleb128 0x49
	.long	0x2bd0
	.secrel32	LLST69
	.uleb128 0x45
	.long	LBB275
	.long	LBE275
	.uleb128 0x4e
	.long	0x2bdb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x4f
	.long	0x2bef
	.long	LBB276
	.long	LBE276
	.byte	0x1
	.word	0x432
	.uleb128 0x3a
	.long	0x2c16
	.uleb128 0x3a
	.long	0x2c09
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x59
	.ascii "emulator_cmpxchg8b_emulated\0"
	.byte	0x1
	.word	0x46a
	.byte	0x1
	.long	0xee
	.long	LFB148
	.long	LFE148
	.secrel32	LLST70
	.long	0x3ed4
	.uleb128 0x5c
	.secrel32	LASF37
	.byte	0x1
	.word	0x464
	.long	0x285
	.secrel32	LLST71
	.uleb128 0x53
	.ascii "old_lo\0"
	.byte	0x1
	.word	0x465
	.long	0x285
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x53
	.ascii "old_hi\0"
	.byte	0x1
	.word	0x466
	.long	0x285
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x4b
	.ascii "new_lo\0"
	.byte	0x1
	.word	0x467
	.long	0x285
	.secrel32	LLST72
	.uleb128 0x4b
	.ascii "new_hi\0"
	.byte	0x1
	.word	0x468
	.long	0x285
	.secrel32	LLST73
	.uleb128 0x5c
	.secrel32	LASF39
	.byte	0x1
	.word	0x469
	.long	0x2754
	.secrel32	LLST74
	.uleb128 0x4c
	.ascii "r\0"
	.byte	0x1
	.word	0x46c
	.long	0xee
	.secrel32	LLST75
	.uleb128 0x40
	.secrel32	LASF40
	.byte	0x1
	.word	0x46b
	.long	0xee
	.byte	0x5
	.byte	0x3
	.long	_reported.3230
	.byte	0x0
	.uleb128 0x59
	.ascii "emulator_cmpxchg_emulated\0"
	.byte	0x1
	.word	0x458
	.byte	0x1
	.long	0xee
	.long	LFB147
	.long	LFE147
	.secrel32	LLST76
	.long	0x3f69
	.uleb128 0x5c
	.secrel32	LASF37
	.byte	0x1
	.word	0x453
	.long	0x285
	.secrel32	LLST77
	.uleb128 0x53
	.ascii "old\0"
	.byte	0x1
	.word	0x454
	.long	0x285
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x4b
	.ascii "new\0"
	.byte	0x1
	.word	0x455
	.long	0x285
	.secrel32	LLST78
	.uleb128 0x5c
	.secrel32	LASF41
	.byte	0x1
	.word	0x456
	.long	0x102
	.secrel32	LLST79
	.uleb128 0x5c
	.secrel32	LASF39
	.byte	0x1
	.word	0x457
	.long	0x2754
	.secrel32	LLST80
	.uleb128 0x40
	.secrel32	LASF40
	.byte	0x1
	.word	0x459
	.long	0xee
	.byte	0x5
	.byte	0x3
	.long	_reported.3218
	.byte	0x0
	.uleb128 0x4a
	.byte	0x1
	.ascii "fx_init\0"
	.byte	0x1
	.word	0x27b
	.byte	0x1
	.long	LFB135
	.long	LFE135
	.secrel32	LLST81
	.long	0x408b
	.uleb128 0x51
	.secrel32	LASF36
	.byte	0x1
	.word	0x27a
	.long	0x158d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x7
	.ascii "fx_image_s\0"
	.byte	0x20
	.byte	0x1
	.word	0x27c
	.long	0x4039
	.uleb128 0x8
	.ascii "control\0"
	.byte	0x1
	.word	0x27d
	.long	0x154
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "status\0"
	.byte	0x1
	.word	0x27e
	.long	0x154
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x8
	.ascii "tag\0"
	.byte	0x1
	.word	0x27f
	.long	0x154
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.ascii "opcode\0"
	.byte	0x1
	.word	0x280
	.long	0x154
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x8
	.ascii "ip\0"
	.byte	0x1
	.word	0x281
	.long	0x16a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.ascii "operand\0"
	.byte	0x1
	.word	0x282
	.long	0x16a
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.ascii "mxcsr\0"
	.byte	0x1
	.word	0x283
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x8
	.ascii "mxcsr_mask\0"
	.byte	0x1
	.word	0x284
	.long	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x2e
	.ascii "fx_image\0"
	.byte	0x1
	.word	0x286
	.long	0x408b
	.uleb128 0x56
	.long	0x2c4e
	.long	LBB282
	.long	LBE282
	.byte	0x1
	.word	0x288
	.uleb128 0x56
	.long	0x2c6f
	.long	LBB284
	.long	LBE284
	.byte	0x1
	.word	0x289
	.uleb128 0x56
	.long	0x2c4e
	.long	LBB286
	.long	LBE286
	.byte	0x1
	.word	0x28a
	.uleb128 0x56
	.long	0x2c7e
	.long	LBB288
	.long	LBE288
	.byte	0x1
	.word	0x28b
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x3f96
	.uleb128 0x52
	.byte	0x1
	.ascii "check_function_pointer_test\0"
	.byte	0x1
	.word	0xb1f
	.byte	0x1
	.long	0xee
	.long	LFB204
	.long	LFE204
	.secrel32	LLST82
	.long	0x40d7
	.uleb128 0x2e
	.ascii "func_p\0"
	.byte	0x1
	.word	0xb20
	.long	0x40d7
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1990
	.uleb128 0x60
	.byte	0x1
	.ascii "kvm_exit_arch\0"
	.byte	0x1
	.word	0xac0
	.byte	0x1
	.long	LFB199
	.long	LFE199
	.secrel32	LLST83
	.uleb128 0x52
	.byte	0x1
	.ascii "kvm_init_arch\0"
	.byte	0x1
	.word	0xa5b
	.byte	0x1
	.long	0xee
	.long	LFB198
	.long	LFE198
	.secrel32	LLST84
	.long	0x415e
	.uleb128 0x4b
	.ascii "ops\0"
	.byte	0x1
	.word	0xa5a
	.long	0x415e
	.secrel32	LLST85
	.uleb128 0x53
	.ascii "module\0"
	.byte	0x1
	.word	0xa5a
	.long	0x75f
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x4c
	.ascii "r\0"
	.byte	0x1
	.word	0xa9a
	.long	0xee
	.secrel32	LLST86
	.uleb128 0x61
	.ascii "out\0"
	.byte	0x1
	.word	0xaba
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x206a
	.uleb128 0x59
	.ascii "kvm_vcpu_release\0"
	.byte	0x1
	.word	0x802
	.byte	0x1
	.long	0xee
	.long	LFB186
	.long	LFE186
	.secrel32	LLST87
	.long	0x41ba
	.uleb128 0x51
	.secrel32	LASF2
	.byte	0x1
	.word	0x801
	.long	0x4bc
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x53
	.ascii "filp\0"
	.byte	0x1
	.word	0x801
	.long	0x6cc
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x37
	.secrel32	LASF36
	.byte	0x1
	.word	0x803
	.long	0x158d
	.byte	0x0
	.uleb128 0x59
	.ascii "kvm_vm_nopage\0"
	.byte	0x1
	.word	0x935
	.byte	0x1
	.long	0x337
	.long	LFB191
	.long	LFE191
	.secrel32	LLST88
	.long	0x42aa
	.uleb128 0x4b
	.ascii "vma\0"
	.byte	0x1
	.word	0x932
	.long	0x7bf
	.secrel32	LLST89
	.uleb128 0x51
	.secrel32	LASF7
	.byte	0x1
	.word	0x933
	.long	0x285
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x4b
	.ascii "type\0"
	.byte	0x1
	.word	0x934
	.long	0x870
	.secrel32	LLST90
	.uleb128 0x4c
	.ascii "kvm\0"
	.byte	0x1
	.word	0x936
	.long	0x1e0c
	.secrel32	LLST91
	.uleb128 0x4c
	.ascii "pgoff\0"
	.byte	0x1
	.word	0x937
	.long	0x285
	.secrel32	LLST92
	.uleb128 0x4c
	.ascii "slot\0"
	.byte	0x1
	.word	0x938
	.long	0x2be9
	.secrel32	LLST93
	.uleb128 0x4c
	.ascii "page\0"
	.byte	0x1
	.word	0x939
	.long	0x337
	.secrel32	LLST94
	.uleb128 0x62
	.long	0x2b9a
	.secrel32	Ldebug_ranges0+0x90
	.byte	0x1
	.word	0x93d
	.long	0x428e
	.uleb128 0x3a
	.long	0x3273
	.uleb128 0x3a
	.long	0x326a
	.uleb128 0x5e
	.secrel32	Ldebug_ranges0+0xa8
	.uleb128 0x49
	.long	0x2bd0
	.secrel32	LLST95
	.uleb128 0x45
	.long	LBB292
	.long	LBE292
	.uleb128 0x4e
	.long	0x2bdb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x4f
	.long	0x2bef
	.long	LBB295
	.long	LBE295
	.byte	0x1
	.word	0x940
	.uleb128 0x3a
	.long	0x2c16
	.uleb128 0x3a
	.long	0x2c09
	.byte	0x0
	.byte	0x0
	.uleb128 0x59
	.ascii "load_pdptrs\0"
	.byte	0x1
	.word	0x1be
	.byte	0x1
	.long	0xee
	.long	LFB129
	.long	LFE129
	.secrel32	LLST96
	.long	0x43af
	.uleb128 0x5c
	.secrel32	LASF36
	.byte	0x1
	.word	0x1bd
	.long	0x158d
	.secrel32	LLST97
	.uleb128 0x4b
	.ascii "cr3\0"
	.byte	0x1
	.word	0x1bd
	.long	0x285
	.secrel32	LLST98
	.uleb128 0x4c
	.ascii "pdpt_gfn\0"
	.byte	0x1
	.word	0x1bf
	.long	0x12cc
	.secrel32	LLST99
	.uleb128 0x5b
	.secrel32	LASF43
	.byte	0x1
	.word	0x1c0
	.long	0x102
	.secrel32	LLST100
	.uleb128 0x4c
	.ascii "i\0"
	.byte	0x1
	.word	0x1c1
	.long	0xee
	.secrel32	LLST101
	.uleb128 0x4c
	.ascii "pdpte\0"
	.byte	0x1
	.word	0x1c2
	.long	0x16a
	.secrel32	LLST102
	.uleb128 0x4c
	.ascii "pdpt\0"
	.byte	0x1
	.word	0x1c3
	.long	0x12f3
	.secrel32	LLST103
	.uleb128 0x4c
	.ascii "ret\0"
	.byte	0x1
	.word	0x1c4
	.long	0xee
	.secrel32	LLST104
	.uleb128 0x5b
	.secrel32	LASF38
	.byte	0x1
	.word	0x1c5
	.long	0x2be9
	.secrel32	LLST105
	.uleb128 0x63
	.ascii "out\0"
	.byte	0x1
	.word	0x1d8
	.long	L177
	.uleb128 0x4f
	.long	0x2b9a
	.long	LBB297
	.long	LBE297
	.byte	0x1
	.word	0x1c8
	.uleb128 0x3a
	.long	0x3273
	.uleb128 0x3a
	.long	0x326a
	.uleb128 0x45
	.long	LBB298
	.long	LBE298
	.uleb128 0x49
	.long	0x2bd0
	.secrel32	LLST106
	.uleb128 0x45
	.long	LBB299
	.long	LBE299
	.uleb128 0x4e
	.long	0x2bdb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x4a
	.byte	0x1
	.ascii "set_cr3\0"
	.byte	0x1
	.word	0x246
	.byte	0x1
	.long	LFB133
	.long	LFE133
	.secrel32	LLST107
	.long	0x445b
	.uleb128 0x5c
	.secrel32	LASF36
	.byte	0x1
	.word	0x245
	.long	0x158d
	.secrel32	LLST108
	.uleb128 0x4b
	.ascii "cr3\0"
	.byte	0x1
	.word	0x245
	.long	0x285
	.secrel32	LLST109
	.uleb128 0x4d
	.long	0x2b9a
	.long	LBB300
	.long	LBE300
	.byte	0x1
	.word	0x267
	.long	0x442e
	.uleb128 0x3a
	.long	0x3273
	.uleb128 0x3a
	.long	0x326a
	.uleb128 0x45
	.long	LBB301
	.long	LBE301
	.uleb128 0x49
	.long	0x2bd0
	.secrel32	LLST110
	.uleb128 0x45
	.long	LBB302
	.long	LBE302
	.uleb128 0x4e
	.long	0x2bdb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x4d
	.long	0x2b7f
	.long	LBB303
	.long	LBE303
	.byte	0x1
	.word	0x268
	.long	0x4448
	.uleb128 0x3a
	.long	0x2b8d
	.byte	0x0
	.uleb128 0x5d
	.long	0x2b7f
	.secrel32	Ldebug_ranges0+0xc0
	.byte	0x1
	.word	0x257
	.uleb128 0x3a
	.long	0x2b8d
	.byte	0x0
	.byte	0x0
	.uleb128 0x52
	.byte	0x1
	.ascii "create_vcpu_fd\0"
	.byte	0x1
	.word	0x813
	.byte	0x1
	.long	0xee
	.long	LFB187
	.long	LFE187
	.secrel32	LLST111
	.long	0x456a
	.uleb128 0x5c
	.secrel32	LASF36
	.byte	0x1
	.word	0x812
	.long	0x158d
	.secrel32	LLST112
	.uleb128 0x2e
	.ascii "fd\0"
	.byte	0x1
	.word	0x814
	.long	0xee
	.uleb128 0x4c
	.ascii "r\0"
	.byte	0x1
	.word	0x814
	.long	0xee
	.secrel32	LLST113
	.uleb128 0x5b
	.secrel32	LASF2
	.byte	0x1
	.word	0x815
	.long	0x4bc
	.secrel32	LLST114
	.uleb128 0x4c
	.ascii "file\0"
	.byte	0x1
	.word	0x816
	.long	0x6cc
	.secrel32	LLST115
	.uleb128 0x63
	.ascii "out1\0"
	.byte	0x1
	.word	0x839
	.long	L200
	.uleb128 0x63
	.ascii "out2\0"
	.byte	0x1
	.word	0x837
	.long	L203
	.uleb128 0x63
	.ascii "out3\0"
	.byte	0x1
	.word	0x835
	.long	L205
	.uleb128 0x4d
	.long	0x2d27
	.long	LBB309
	.long	LBE309
	.byte	0x1
	.word	0x81a
	.long	0x4513
	.uleb128 0x47
	.long	0x2d3c
	.secrel32	LLST116
	.byte	0x0
	.uleb128 0x4d
	.long	0x2d47
	.long	LBB311
	.long	LBE311
	.byte	0x1
	.word	0x81c
	.long	0x4542
	.uleb128 0x3a
	.long	0x2d60
	.uleb128 0x5e
	.secrel32	Ldebug_ranges0+0xd8
	.uleb128 0x4e
	.long	0x2d6c
	.uleb128 0x4e
	.long	0x2d79
	.uleb128 0x64
	.long	0x2d84
	.byte	0x0
	.byte	0x0
	.uleb128 0x5d
	.long	0x2ddc
	.secrel32	Ldebug_ranges0+0xf0
	.byte	0x1
	.word	0x825
	.uleb128 0x3a
	.long	0x2e0a
	.uleb128 0x3a
	.long	0x2dff
	.uleb128 0x3a
	.long	0x2df4
	.uleb128 0x5e
	.secrel32	Ldebug_ranges0+0x110
	.uleb128 0x4e
	.long	0x2e16
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x65
	.secrel32	LASF30
	.byte	0x1
	.word	0x131
	.byte	0x1
	.long	LFB116
	.long	LFE116
	.secrel32	LLST117
	.long	0x4594
	.uleb128 0x5c
	.secrel32	LASF36
	.byte	0x1
	.word	0x130
	.long	0x158d
	.secrel32	LLST118
	.byte	0x0
	.uleb128 0x65
	.secrel32	LASF31
	.byte	0x1
	.word	0x148
	.byte	0x1
	.long	LFB118
	.long	LFE118
	.secrel32	LLST119
	.long	0x45be
	.uleb128 0x5c
	.secrel32	LASF36
	.byte	0x1
	.word	0x147
	.long	0x158d
	.secrel32	LLST120
	.byte	0x0
	.uleb128 0x66
	.ascii "kvm_free_vcpu\0"
	.byte	0x1
	.word	0x18c
	.byte	0x1
	.long	LFB123
	.long	LFE123
	.secrel32	LLST121
	.long	0x45f2
	.uleb128 0x5c
	.secrel32	LASF36
	.byte	0x1
	.word	0x18b
	.long	0x158d
	.secrel32	LLST122
	.byte	0x0
	.uleb128 0x52
	.byte	0x1
	.ascii "kvm_vcpu_ioctl_interrupt\0"
	.byte	0x1
	.word	0x7e6
	.byte	0x1
	.long	0xee
	.long	LFB184
	.long	LFE184
	.secrel32	LLST123
	.long	0x467c
	.uleb128 0x5c
	.secrel32	LASF36
	.byte	0x1
	.word	0x7e4
	.long	0x158d
	.secrel32	LLST124
	.uleb128 0x4b
	.ascii "irq\0"
	.byte	0x1
	.word	0x7e5
	.long	0x467c
	.secrel32	LLST125
	.uleb128 0x4d
	.long	0x2ae5
	.long	LBB321
	.long	LBE321
	.byte	0x1
	.word	0x7eb
	.long	0x4664
	.uleb128 0x3a
	.long	0x2b02
	.uleb128 0x3a
	.long	0x2af7
	.byte	0x0
	.uleb128 0x5d
	.long	0x2ae5
	.secrel32	Ldebug_ranges0+0x138
	.byte	0x1
	.word	0x7ec
	.uleb128 0x3a
	.long	0x2b02
	.uleb128 0x3a
	.long	0x2af7
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1151
	.uleb128 0x52
	.byte	0x1
	.ascii "kvm_vcpu_ioctl_translate\0"
	.byte	0x1
	.word	0x7d3
	.byte	0x1
	.long	0xee
	.long	LFB183
	.long	LFE183
	.secrel32	LLST126
	.long	0x46f5
	.uleb128 0x51
	.secrel32	LASF36
	.byte	0x1
	.word	0x7d1
	.long	0x158d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x53
	.ascii "tr\0"
	.byte	0x1
	.word	0x7d2
	.long	0x46f5
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x4c
	.ascii "vaddr\0"
	.byte	0x1
	.word	0x7d4
	.long	0x285
	.secrel32	LLST127
	.uleb128 0x4c
	.ascii "gpa\0"
	.byte	0x1
	.word	0x7d5
	.long	0x12bf
	.secrel32	LLST128
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x109c
	.uleb128 0x52
	.byte	0x1
	.ascii "kvm_vcpu_ioctl_get_sregs\0"
	.byte	0x1
	.word	0x6dc
	.byte	0x1
	.long	0xee
	.long	LFB175
	.long	LFE175
	.secrel32	LLST129
	.long	0x4879
	.uleb128 0x51
	.secrel32	LASF36
	.byte	0x1
	.word	0x6da
	.long	0x158d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x53
	.ascii "sregs\0"
	.byte	0x1
	.word	0x6db
	.long	0x4879
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x54
	.ascii "dt\0"
	.byte	0x1
	.word	0x6dd
	.long	0x2031
	.byte	0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x4d
	.long	0x2e24
	.long	LBB327
	.long	LBE327
	.byte	0x1
	.word	0x6e3
	.long	0x4780
	.uleb128 0x3a
	.long	0x2e4a
	.uleb128 0x3a
	.long	0x2e3e
	.uleb128 0x3a
	.long	0x2e32
	.byte	0x0
	.uleb128 0x4d
	.long	0x2e24
	.long	LBB329
	.long	LBE329
	.byte	0x1
	.word	0x6e4
	.long	0x47a4
	.uleb128 0x3a
	.long	0x2e4a
	.uleb128 0x3a
	.long	0x2e3e
	.uleb128 0x3a
	.long	0x2e32
	.byte	0x0
	.uleb128 0x4d
	.long	0x2e24
	.long	LBB331
	.long	LBE331
	.byte	0x1
	.word	0x6e5
	.long	0x47c8
	.uleb128 0x3a
	.long	0x2e4a
	.uleb128 0x3a
	.long	0x2e3e
	.uleb128 0x3a
	.long	0x2e32
	.byte	0x0
	.uleb128 0x4d
	.long	0x2e24
	.long	LBB333
	.long	LBE333
	.byte	0x1
	.word	0x6e6
	.long	0x47ec
	.uleb128 0x3a
	.long	0x2e4a
	.uleb128 0x3a
	.long	0x2e3e
	.uleb128 0x3a
	.long	0x2e32
	.byte	0x0
	.uleb128 0x4d
	.long	0x2e24
	.long	LBB335
	.long	LBE335
	.byte	0x1
	.word	0x6e7
	.long	0x4810
	.uleb128 0x3a
	.long	0x2e4a
	.uleb128 0x3a
	.long	0x2e3e
	.uleb128 0x3a
	.long	0x2e32
	.byte	0x0
	.uleb128 0x4d
	.long	0x2e24
	.long	LBB337
	.long	LBE337
	.byte	0x1
	.word	0x6e8
	.long	0x4834
	.uleb128 0x3a
	.long	0x2e4a
	.uleb128 0x3a
	.long	0x2e3e
	.uleb128 0x3a
	.long	0x2e32
	.byte	0x0
	.uleb128 0x4d
	.long	0x2e24
	.long	LBB339
	.long	LBE339
	.byte	0x1
	.word	0x6ea
	.long	0x4858
	.uleb128 0x3a
	.long	0x2e4a
	.uleb128 0x3a
	.long	0x2e3e
	.uleb128 0x3a
	.long	0x2e32
	.byte	0x0
	.uleb128 0x4f
	.long	0x2e24
	.long	LBB341
	.long	LBE341
	.byte	0x1
	.word	0x6eb
	.uleb128 0x3a
	.long	0x2e4a
	.uleb128 0x3a
	.long	0x2e3e
	.uleb128 0x3a
	.long	0x2e32
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xf13
	.uleb128 0x52
	.byte	0x1
	.ascii "kvm_vcpu_ioctl_set_regs\0"
	.byte	0x1
	.word	0x6b1
	.byte	0x1
	.long	0xee
	.long	LFB173
	.long	LFE173
	.secrel32	LLST130
	.long	0x48d1
	.uleb128 0x51
	.secrel32	LASF36
	.byte	0x1
	.word	0x6af
	.long	0x158d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x53
	.ascii "regs\0"
	.byte	0x1
	.word	0x6b0
	.long	0x48d1
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xcdb
	.uleb128 0x52
	.byte	0x1
	.ascii "kvm_vcpu_ioctl_get_regs\0"
	.byte	0x1
	.word	0x686
	.byte	0x1
	.long	0xee
	.long	LFB172
	.long	LFE172
	.secrel32	LLST131
	.long	0x492b
	.uleb128 0x5c
	.secrel32	LASF36
	.byte	0x1
	.word	0x684
	.long	0x158d
	.secrel32	LLST132
	.uleb128 0x4b
	.ascii "regs\0"
	.byte	0x1
	.word	0x685
	.long	0x48d1
	.secrel32	LLST133
	.byte	0x0
	.uleb128 0x66
	.ascii "kvm_free_physmem_slot\0"
	.byte	0x1
	.word	0x170
	.byte	0x1
	.long	LFB121
	.long	LFE121
	.secrel32	LLST134
	.long	0x4987
	.uleb128 0x4b
	.ascii "free\0"
	.byte	0x1
	.word	0x16e
	.long	0x2be9
	.secrel32	LLST135
	.uleb128 0x4b
	.ascii "dont\0"
	.byte	0x1
	.word	0x16f
	.long	0x2be9
	.secrel32	LLST136
	.uleb128 0x4c
	.ascii "i\0"
	.byte	0x1
	.word	0x171
	.long	0xee
	.secrel32	LLST137
	.byte	0x0
	.uleb128 0x66
	.ascii "kvm_destroy_vm\0"
	.byte	0x1
	.word	0x1a4
	.byte	0x1
	.long	LFB126
	.long	LFE126
	.secrel32	LLST138
	.long	0x4a42
	.uleb128 0x4b
	.ascii "kvm\0"
	.byte	0x1
	.word	0x1a3
	.long	0x1e0c
	.secrel32	LLST139
	.uleb128 0x4d
	.long	0x2e57
	.long	LBB343
	.long	LBE343
	.byte	0x1
	.word	0x1a6
	.long	0x49ef
	.uleb128 0x3a
	.long	0x2e69
	.uleb128 0x67
	.long	0x2a63
	.long	LBB345
	.long	LBE345
	.byte	0x5
	.byte	0xaf
	.uleb128 0x3a
	.long	0x2a83
	.uleb128 0x3a
	.long	0x2a77
	.byte	0x0
	.byte	0x0
	.uleb128 0x4d
	.long	0x2e83
	.long	LBB347
	.long	LBE347
	.byte	0x1
	.word	0x1a8
	.long	0x4a18
	.uleb128 0x3a
	.long	0x2e9c
	.uleb128 0x45
	.long	LBB348
	.long	LBE348
	.uleb128 0x4e
	.long	0x2ea8
	.byte	0x0
	.byte	0x0
	.uleb128 0x4f
	.long	0x2eb3
	.long	LBB349
	.long	LBE349
	.byte	0x1
	.word	0x1a9
	.uleb128 0x3a
	.long	0x2ece
	.uleb128 0x45
	.long	LBB350
	.long	LBE350
	.uleb128 0x49
	.long	0x2eda
	.secrel32	LLST140
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x52
	.byte	0x1
	.ascii "kvm_dev_ioctl_create_vm\0"
	.byte	0x1
	.word	0x959
	.byte	0x1
	.long	0xee
	.long	LFB193
	.long	LFE193
	.secrel32	LLST141
	.long	0x4be7
	.uleb128 0x4c
	.ascii "fd\0"
	.byte	0x1
	.word	0x95a
	.long	0xee
	.secrel32	LLST142
	.uleb128 0x4c
	.ascii "r\0"
	.byte	0x1
	.word	0x95a
	.long	0xee
	.secrel32	LLST143
	.uleb128 0x5b
	.secrel32	LASF2
	.byte	0x1
	.word	0x95b
	.long	0x4bc
	.secrel32	LLST144
	.uleb128 0x4c
	.ascii "file\0"
	.byte	0x1
	.word	0x95c
	.long	0x6cc
	.secrel32	LLST145
	.uleb128 0x4c
	.ascii "kvm\0"
	.byte	0x1
	.word	0x95d
	.long	0x1e0c
	.secrel32	LLST146
	.uleb128 0x61
	.ascii "out1\0"
	.byte	0x1
	.word	0x984
	.uleb128 0x63
	.ascii "out2\0"
	.byte	0x1
	.word	0x982
	.long	L255
	.uleb128 0x63
	.ascii "out3\0"
	.byte	0x1
	.word	0x980
	.long	L258
	.uleb128 0x63
	.ascii "out4\0"
	.byte	0x1
	.word	0x97e
	.long	L260
	.uleb128 0x4d
	.long	0x2d47
	.long	LBB351
	.long	LBE351
	.byte	0x1
	.word	0x95f
	.long	0x4b25
	.uleb128 0x3a
	.long	0x2d60
	.uleb128 0x45
	.long	LBB352
	.long	LBE352
	.uleb128 0x4e
	.long	0x2d6c
	.uleb128 0x4e
	.long	0x2d79
	.uleb128 0x64
	.long	0x2d84
	.byte	0x0
	.byte	0x0
	.uleb128 0x62
	.long	0x2ee5
	.secrel32	Ldebug_ranges0+0x150
	.byte	0x1
	.word	0x965
	.long	0x4bbf
	.uleb128 0x5e
	.secrel32	Ldebug_ranges0+0x168
	.uleb128 0x4e
	.long	0x2f01
	.uleb128 0x4e
	.long	0x2f0d
	.uleb128 0x4d
	.long	0x2cc7
	.long	LBB357
	.long	LBE357
	.byte	0x1
	.word	0x156
	.long	0x4b5e
	.uleb128 0x3a
	.long	0x2cdf
	.byte	0x0
	.uleb128 0x45
	.long	LBB359
	.long	LBE359
	.uleb128 0x4e
	.long	0x2f1c
	.uleb128 0x4d
	.long	0x2cc7
	.long	LBB360
	.long	LBE360
	.byte	0x1
	.word	0x15e
	.long	0x4b86
	.uleb128 0x3a
	.long	0x2cdf
	.byte	0x0
	.uleb128 0x5d
	.long	0x2cec
	.secrel32	Ldebug_ranges0+0x190
	.byte	0x1
	.word	0x160
	.uleb128 0x3a
	.long	0x2d09
	.uleb128 0x3a
	.long	0x2cfe
	.uleb128 0x67
	.long	0x2a2b
	.long	LBB364
	.long	LBE364
	.byte	0x5
	.byte	0x4a
	.uleb128 0x3a
	.long	0x2a56
	.uleb128 0x3a
	.long	0x2a4a
	.uleb128 0x3a
	.long	0x2a3f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x5d
	.long	0x2ddc
	.secrel32	Ldebug_ranges0+0x1a8
	.byte	0x1
	.word	0x96e
	.uleb128 0x3a
	.long	0x2e0a
	.uleb128 0x3a
	.long	0x2dff
	.uleb128 0x3a
	.long	0x2df4
	.uleb128 0x5e
	.secrel32	Ldebug_ranges0+0x1c8
	.uleb128 0x4e
	.long	0x2e16
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x58
	.ascii "kvm_vm_release\0"
	.byte	0x1
	.word	0x1ae
	.byte	0x1
	.long	0xee
	.long	LFB127
	.long	LFE127
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x4c3a
	.uleb128 0x51
	.secrel32	LASF2
	.byte	0x1
	.word	0x1ad
	.long	0x4bc
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x53
	.ascii "filp\0"
	.byte	0x1
	.word	0x1ad
	.long	0x6cc
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x2e
	.ascii "kvm\0"
	.byte	0x1
	.word	0x1af
	.long	0x1e0c
	.byte	0x0
	.uleb128 0x52
	.byte	0x1
	.ascii "kvm_vm_ioctl_create_vcpu\0"
	.byte	0x1
	.word	0x842
	.byte	0x1
	.long	0xee
	.long	LFB188
	.long	LFE188
	.secrel32	LLST148
	.long	0x4cc8
	.uleb128 0x4b
	.ascii "kvm\0"
	.byte	0x1
	.word	0x841
	.long	0x1e0c
	.secrel32	LLST149
	.uleb128 0x53
	.ascii "n\0"
	.byte	0x1
	.word	0x841
	.long	0xee
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x4c
	.ascii "r\0"
	.byte	0x1
	.word	0x843
	.long	0xee
	.secrel32	LLST150
	.uleb128 0x5b
	.secrel32	LASF36
	.byte	0x1
	.word	0x844
	.long	0x158d
	.secrel32	LLST151
	.uleb128 0x61
	.ascii "out\0"
	.byte	0x1
	.word	0x874
	.uleb128 0x63
	.ascii "out_free_vcpus\0"
	.byte	0x1
	.word	0x871
	.long	L271
	.byte	0x0
	.uleb128 0x52
	.byte	0x1
	.ascii "kvm_vcpu_ioctl_set_sregs\0"
	.byte	0x1
	.word	0x70f
	.byte	0x1
	.long	0xee
	.long	LFB177
	.long	LFE177
	.secrel32	LLST152
	.long	0x4e8a
	.uleb128 0x5c
	.secrel32	LASF36
	.byte	0x1
	.word	0x70d
	.long	0x158d
	.secrel32	LLST153
	.uleb128 0x4b
	.ascii "sregs\0"
	.byte	0x1
	.word	0x70e
	.long	0x4879
	.secrel32	LLST154
	.uleb128 0x2e
	.ascii "mmu_reset_needed\0"
	.byte	0x1
	.word	0x710
	.long	0xee
	.uleb128 0x4c
	.ascii "i\0"
	.byte	0x1
	.word	0x711
	.long	0xee
	.secrel32	LLST155
	.uleb128 0x54
	.ascii "dt\0"
	.byte	0x1
	.word	0x712
	.long	0x2031
	.byte	0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x4d
	.long	0x2feb
	.long	LBB377
	.long	LBE377
	.byte	0x1
	.word	0x718
	.long	0x4d76
	.uleb128 0x3a
	.long	0x3011
	.uleb128 0x3a
	.long	0x3005
	.uleb128 0x3a
	.long	0x2ff9
	.byte	0x0
	.uleb128 0x4d
	.long	0x2feb
	.long	LBB379
	.long	LBE379
	.byte	0x1
	.word	0x719
	.long	0x4d9a
	.uleb128 0x3a
	.long	0x3011
	.uleb128 0x3a
	.long	0x3005
	.uleb128 0x3a
	.long	0x2ff9
	.byte	0x0
	.uleb128 0x4d
	.long	0x2feb
	.long	LBB381
	.long	LBE381
	.byte	0x1
	.word	0x71a
	.long	0x4dbe
	.uleb128 0x3a
	.long	0x3011
	.uleb128 0x3a
	.long	0x3005
	.uleb128 0x3a
	.long	0x2ff9
	.byte	0x0
	.uleb128 0x4d
	.long	0x2feb
	.long	LBB383
	.long	LBE383
	.byte	0x1
	.word	0x71b
	.long	0x4de2
	.uleb128 0x3a
	.long	0x3011
	.uleb128 0x3a
	.long	0x3005
	.uleb128 0x3a
	.long	0x2ff9
	.byte	0x0
	.uleb128 0x4d
	.long	0x2feb
	.long	LBB385
	.long	LBE385
	.byte	0x1
	.word	0x71c
	.long	0x4e06
	.uleb128 0x3a
	.long	0x3011
	.uleb128 0x3a
	.long	0x3005
	.uleb128 0x3a
	.long	0x2ff9
	.byte	0x0
	.uleb128 0x4d
	.long	0x2feb
	.long	LBB387
	.long	LBE387
	.byte	0x1
	.word	0x71d
	.long	0x4e2a
	.uleb128 0x3a
	.long	0x3011
	.uleb128 0x3a
	.long	0x3005
	.uleb128 0x3a
	.long	0x2ff9
	.byte	0x0
	.uleb128 0x4d
	.long	0x2feb
	.long	LBB389
	.long	LBE389
	.byte	0x1
	.word	0x71f
	.long	0x4e4e
	.uleb128 0x3a
	.long	0x3011
	.uleb128 0x3a
	.long	0x3005
	.uleb128 0x3a
	.long	0x2ff9
	.byte	0x0
	.uleb128 0x4d
	.long	0x2feb
	.long	LBB391
	.long	LBE391
	.byte	0x1
	.word	0x720
	.long	0x4e72
	.uleb128 0x3a
	.long	0x3011
	.uleb128 0x3a
	.long	0x3005
	.uleb128 0x3a
	.long	0x2ff9
	.byte	0x0
	.uleb128 0x5d
	.long	0x301e
	.secrel32	Ldebug_ranges0+0x1f0
	.byte	0x1
	.word	0x747
	.uleb128 0x3a
	.long	0x303d
	.uleb128 0x3a
	.long	0x3032
	.byte	0x0
	.byte	0x0
	.uleb128 0x4a
	.byte	0x1
	.ascii "set_cr4\0"
	.byte	0x1
	.word	0x225
	.byte	0x1
	.long	LFB132
	.long	LFE132
	.secrel32	LLST156
	.long	0x4ef5
	.uleb128 0x5c
	.secrel32	LASF36
	.byte	0x1
	.word	0x224
	.long	0x158d
	.secrel32	LLST157
	.uleb128 0x4b
	.ascii "cr4\0"
	.byte	0x1
	.word	0x224
	.long	0x285
	.secrel32	LLST158
	.uleb128 0x62
	.long	0x2b7f
	.secrel32	Ldebug_ranges0+0x208
	.byte	0x1
	.word	0x23b
	.long	0x4ede
	.uleb128 0x3a
	.long	0x2b8d
	.byte	0x0
	.uleb128 0x4f
	.long	0x2b7f
	.long	LBB405
	.long	LBE405
	.byte	0x1
	.word	0x236
	.uleb128 0x3a
	.long	0x2b8d
	.byte	0x0
	.byte	0x0
	.uleb128 0x4a
	.byte	0x1
	.ascii "set_cr0\0"
	.byte	0x1
	.word	0x1e0
	.byte	0x1
	.long	LFB130
	.long	LFE130
	.secrel32	LLST159
	.long	0x4f46
	.uleb128 0x5c
	.secrel32	LASF36
	.byte	0x1
	.word	0x1df
	.long	0x158d
	.secrel32	LLST160
	.uleb128 0x4b
	.ascii "cr0\0"
	.byte	0x1
	.word	0x1df
	.long	0x285
	.secrel32	LLST161
	.uleb128 0x5d
	.long	0x2b7f
	.secrel32	Ldebug_ranges0+0x230
	.byte	0x1
	.word	0x1ea
	.uleb128 0x3a
	.long	0x2b8d
	.byte	0x0
	.byte	0x0
	.uleb128 0x4a
	.byte	0x1
	.ascii "realmode_set_cr\0"
	.byte	0x1
	.word	0x568
	.byte	0x1
	.long	LFB162
	.long	LFE162
	.secrel32	LLST162
	.long	0x4fbc
	.uleb128 0x5c
	.secrel32	LASF36
	.byte	0x1
	.word	0x566
	.long	0x158d
	.secrel32	LLST163
	.uleb128 0x4b
	.ascii "cr\0"
	.byte	0x1
	.word	0x566
	.long	0xee
	.secrel32	LLST164
	.uleb128 0x4b
	.ascii "val\0"
	.byte	0x1
	.word	0x566
	.long	0x285
	.secrel32	LLST165
	.uleb128 0x5c
	.secrel32	LASF11
	.byte	0x1
	.word	0x567
	.long	0x1eed
	.secrel32	LLST166
	.uleb128 0x5a
	.secrel32	LASF42
	.long	0x574f
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.3422
	.byte	0x0
	.uleb128 0x4a
	.byte	0x1
	.ascii "lmsw\0"
	.byte	0x1
	.word	0x21e
	.byte	0x1
	.long	LFB131
	.long	LFE131
	.secrel32	LLST167
	.long	0x4ff7
	.uleb128 0x51
	.secrel32	LASF36
	.byte	0x1
	.word	0x21d
	.long	0x158d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4b
	.ascii "msw\0"
	.byte	0x1
	.word	0x21d
	.long	0x285
	.secrel32	LLST168
	.byte	0x0
	.uleb128 0x4a
	.byte	0x1
	.ascii "realmode_lmsw\0"
	.byte	0x1
	.word	0x54f
	.byte	0x1
	.long	LFB160
	.long	LFE160
	.secrel32	LLST169
	.long	0x5049
	.uleb128 0x51
	.secrel32	LASF36
	.byte	0x1
	.word	0x54d
	.long	0x158d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x53
	.ascii "msw\0"
	.byte	0x1
	.word	0x54d
	.long	0x285
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x51
	.secrel32	LASF11
	.byte	0x1
	.word	0x54e
	.long	0x1eed
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x2b
	.ascii "vcpu_register_para\0"
	.byte	0x1
	.word	0x580
	.byte	0x1
	.long	0xee
	.byte	0x1
	.long	0x511e
	.uleb128 0x2d
	.secrel32	LASF36
	.byte	0x1
	.word	0x57f
	.long	0x158d
	.uleb128 0x2d
	.secrel32	LASF23
	.byte	0x1
	.word	0x57f
	.long	0x12bf
	.uleb128 0x2e
	.ascii "para_state\0"
	.byte	0x1
	.word	0x581
	.long	0x511e
	.uleb128 0x2e
	.ascii "para_state_hpa\0"
	.byte	0x1
	.word	0x582
	.long	0x12e6
	.uleb128 0x2e
	.ascii "hypercall_hpa\0"
	.byte	0x1
	.word	0x582
	.long	0x12e6
	.uleb128 0x37
	.secrel32	LASF24
	.byte	0x1
	.word	0x583
	.long	0x337
	.uleb128 0x2e
	.ascii "hypercall\0"
	.byte	0x1
	.word	0x584
	.long	0x2635
	.uleb128 0x37
	.secrel32	LASF18
	.byte	0x1
	.word	0x585
	.long	0x12bf
	.uleb128 0x61
	.ascii "err_gp\0"
	.byte	0x1
	.word	0x5bd
	.uleb128 0x61
	.ascii "err_kunmap_skip\0"
	.byte	0x1
	.word	0x5ba
	.uleb128 0x3f
	.long	0x5116
	.uleb128 0x3a
	.long	0x309d
	.byte	0x0
	.uleb128 0x36
	.uleb128 0x3a
	.long	0x309d
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x123b
	.uleb128 0x52
	.byte	0x1
	.ascii "kvm_set_msr_common\0"
	.byte	0x1
	.word	0x618
	.byte	0x1
	.long	0xee
	.long	LFB166
	.long	LFE166
	.secrel32	LLST170
	.long	0x51f5
	.uleb128 0x51
	.secrel32	LASF36
	.byte	0x1
	.word	0x617
	.long	0x158d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4b
	.ascii "msr\0"
	.byte	0x1
	.word	0x617
	.long	0x15f
	.secrel32	LLST171
	.uleb128 0x51
	.secrel32	LASF8
	.byte	0x1
	.word	0x617
	.long	0x16a
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x62
	.long	0x5049
	.secrel32	Ldebug_ranges0+0x248
	.byte	0x1
	.word	0x631
	.long	0x51e4
	.uleb128 0x3a
	.long	0x5076
	.uleb128 0x3a
	.long	0x506a
	.uleb128 0x5e
	.secrel32	Ldebug_ranges0+0x260
	.uleb128 0x49
	.long	0x5082
	.secrel32	LLST172
	.uleb128 0x49
	.long	0x5095
	.secrel32	LLST173
	.uleb128 0x49
	.long	0x50ac
	.secrel32	LLST174
	.uleb128 0x49
	.long	0x50c2
	.secrel32	LLST175
	.uleb128 0x49
	.long	0x50ce
	.secrel32	LLST176
	.uleb128 0x49
	.long	0x50e0
	.secrel32	LLST177
	.uleb128 0x64
	.long	0x50ec
	.uleb128 0x68
	.long	0x50f7
	.long	L332
	.byte	0x0
	.byte	0x0
	.uleb128 0x5a
	.secrel32	LASF42
	.long	0x5764
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.3517
	.byte	0x0
	.uleb128 0x52
	.byte	0x1
	.ascii "emulate_instruction\0"
	.byte	0x1
	.word	0x4cd
	.byte	0x1
	.long	0xee
	.long	LFB155
	.long	LFE155
	.secrel32	LLST178
	.long	0x539f
	.uleb128 0x5c
	.secrel32	LASF36
	.byte	0x1
	.word	0x4c9
	.long	0x158d
	.secrel32	LLST179
	.uleb128 0x4b
	.ascii "run\0"
	.byte	0x1
	.word	0x4ca
	.long	0x2618
	.secrel32	LLST180
	.uleb128 0x4b
	.ascii "cr2\0"
	.byte	0x1
	.word	0x4cb
	.long	0x285
	.secrel32	LLST181
	.uleb128 0x51
	.secrel32	LASF6
	.byte	0x1
	.word	0x4cc
	.long	0x154
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x54
	.ascii "emulate_ctxt\0"
	.byte	0x1
	.word	0x4ce
	.long	0x275a
	.byte	0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x4c
	.ascii "r\0"
	.byte	0x1
	.word	0x4cf
	.long	0xee
	.secrel32	LLST182
	.uleb128 0x4c
	.ascii "cs_db\0"
	.byte	0x1
	.word	0x4d0
	.long	0xee
	.secrel32	LLST183
	.uleb128 0x54
	.ascii "cs_l\0"
	.byte	0x1
	.word	0x4d0
	.long	0xee
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x62
	.long	0x2c23
	.secrel32	Ldebug_ranges0+0x2b8
	.byte	0x1
	.word	0x4e7
	.long	0x52c6
	.uleb128 0x3a
	.long	0x2c41
	.uleb128 0x3a
	.long	0x2c35
	.byte	0x0
	.uleb128 0x62
	.long	0x2c23
	.secrel32	Ldebug_ranges0+0x2d0
	.byte	0x1
	.word	0x4e8
	.long	0x52e1
	.uleb128 0x3a
	.long	0x2c41
	.uleb128 0x3a
	.long	0x2c35
	.byte	0x0
	.uleb128 0x62
	.long	0x2c23
	.secrel32	Ldebug_ranges0+0x2e8
	.byte	0x1
	.word	0x4e9
	.long	0x52fc
	.uleb128 0x3a
	.long	0x2c41
	.uleb128 0x3a
	.long	0x2c35
	.byte	0x0
	.uleb128 0x62
	.long	0x2c23
	.secrel32	Ldebug_ranges0+0x300
	.byte	0x1
	.word	0x4ea
	.long	0x5317
	.uleb128 0x3a
	.long	0x2c41
	.uleb128 0x3a
	.long	0x2c35
	.byte	0x0
	.uleb128 0x4d
	.long	0x2c23
	.long	LBB437
	.long	LBE437
	.byte	0x1
	.word	0x4ed
	.long	0x5336
	.uleb128 0x3a
	.long	0x2c41
	.uleb128 0x3a
	.long	0x2c35
	.byte	0x0
	.uleb128 0x62
	.long	0x2c23
	.secrel32	Ldebug_ranges0+0x318
	.byte	0x1
	.word	0x4ee
	.long	0x5351
	.uleb128 0x3a
	.long	0x2c41
	.uleb128 0x3a
	.long	0x2c35
	.byte	0x0
	.uleb128 0x4f
	.long	0x30aa
	.long	LBB440
	.long	LBE440
	.byte	0x1
	.word	0x500
	.uleb128 0x3a
	.long	0x30cd
	.uleb128 0x45
	.long	LBB441
	.long	LBE441
	.uleb128 0x48
	.long	0x30d9
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x49
	.long	0x30e9
	.secrel32	LLST184
	.uleb128 0x4e
	.long	0x30f5
	.uleb128 0x5d
	.long	0x2c23
	.secrel32	Ldebug_ranges0+0x330
	.byte	0x1
	.word	0x4b1
	.uleb128 0x3a
	.long	0x2c41
	.uleb128 0x3a
	.long	0x2c35
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x52
	.byte	0x1
	.ascii "kvm_vcpu_ioctl_run\0"
	.byte	0x1
	.word	0x665
	.byte	0x1
	.long	0xee
	.long	LFB171
	.long	LFE171
	.secrel32	LLST185
	.long	0x53ff
	.uleb128 0x5c
	.secrel32	LASF36
	.byte	0x1
	.word	0x664
	.long	0x158d
	.secrel32	LLST186
	.uleb128 0x4b
	.ascii "kvm_run\0"
	.byte	0x1
	.word	0x664
	.long	0x2618
	.secrel32	LLST187
	.uleb128 0x4c
	.ascii "r\0"
	.byte	0x1
	.word	0x666
	.long	0xee
	.secrel32	LLST188
	.byte	0x0
	.uleb128 0x52
	.byte	0x1
	.ascii "kvm_vm_ioctl_set_memory_region\0"
	.byte	0x1
	.word	0x2a3
	.byte	0x1
	.long	0xee
	.long	LFB137
	.long	LFE137
	.secrel32	LLST189
	.long	0x5594
	.uleb128 0x4b
	.ascii "kvm\0"
	.byte	0x1
	.word	0x2a1
	.long	0x1e0c
	.secrel32	LLST190
	.uleb128 0x53
	.ascii "mem\0"
	.byte	0x1
	.word	0x2a2
	.long	0x5594
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x4c
	.ascii "r\0"
	.byte	0x1
	.word	0x2a4
	.long	0xee
	.secrel32	LLST191
	.uleb128 0x5b
	.secrel32	LASF26
	.byte	0x1
	.word	0x2a5
	.long	0x12cc
	.secrel32	LLST192
	.uleb128 0x4c
	.ascii "npages\0"
	.byte	0x1
	.word	0x2a6
	.long	0x285
	.secrel32	LLST193
	.uleb128 0x4c
	.ascii "i\0"
	.byte	0x1
	.word	0x2a7
	.long	0x285
	.secrel32	LLST194
	.uleb128 0x5b
	.secrel32	LASF38
	.byte	0x1
	.word	0x2a8
	.long	0x2be9
	.secrel32	LLST195
	.uleb128 0x54
	.ascii "old\0"
	.byte	0x1
	.word	0x2a9
	.long	0x1e6f
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x54
	.ascii "new\0"
	.byte	0x1
	.word	0x2a9
	.long	0x1e6f
	.byte	0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x5b
	.secrel32	LASF25
	.byte	0x1
	.word	0x2aa
	.long	0xee
	.secrel32	LLST196
	.uleb128 0x61
	.ascii "out\0"
	.byte	0x1
	.word	0x331
	.uleb128 0x61
	.ascii "raced\0"
	.byte	0x1
	.word	0x30e
	.uleb128 0x63
	.ascii "out_unlock\0"
	.byte	0x1
	.word	0x32d
	.long	L367
	.uleb128 0x63
	.ascii "out_free\0"
	.byte	0x1
	.word	0x32f
	.long	L372
	.uleb128 0x69
	.secrel32	Ldebug_ranges0+0x348
	.long	0x551e
	.uleb128 0x2e
	.ascii "s\0"
	.byte	0x1
	.word	0x2d4
	.long	0x2be9
	.byte	0x0
	.uleb128 0x69
	.secrel32	Ldebug_ranges0+0x378
	.long	0x5540
	.uleb128 0x4c
	.ascii "dirty_bytes\0"
	.byte	0x1
	.word	0x301
	.long	0x102
	.secrel32	LLST197
	.byte	0x0
	.uleb128 0x5e
	.secrel32	Ldebug_ranges0+0x398
	.uleb128 0x5b
	.secrel32	LASF36
	.byte	0x1
	.word	0x31e
	.long	0x158d
	.secrel32	LLST198
	.uleb128 0x62
	.long	0x313b
	.secrel32	Ldebug_ranges0+0x3b8
	.byte	0x1
	.word	0x320
	.long	0x557b
	.uleb128 0x3a
	.long	0x3164
	.uleb128 0x3a
	.long	0x3158
	.uleb128 0x5e
	.secrel32	Ldebug_ranges0+0x3d8
	.uleb128 0x4e
	.long	0x3171
	.byte	0x0
	.byte	0x0
	.uleb128 0x5d
	.long	0x317e
	.secrel32	Ldebug_ranges0+0x3f8
	.byte	0x1
	.word	0x324
	.uleb128 0x3a
	.long	0x31ab
	.uleb128 0x3a
	.long	0x319f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x973
	.uleb128 0x52
	.byte	0x1
	.ascii "kvm_write_guest\0"
	.byte	0x1
	.word	0x107
	.byte	0x1
	.long	0xee
	.long	LFB115
	.long	LFE115
	.secrel32	LLST199
	.long	0x5673
	.uleb128 0x51
	.secrel32	LASF36
	.byte	0x1
	.word	0x105
	.long	0x158d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5c
	.secrel32	LASF37
	.byte	0x1
	.word	0x105
	.long	0x12b2
	.secrel32	LLST200
	.uleb128 0x5c
	.secrel32	LASF0
	.byte	0x1
	.word	0x105
	.long	0x285
	.secrel32	LLST201
	.uleb128 0x51
	.secrel32	LASF8
	.byte	0x1
	.word	0x106
	.long	0x29a
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x5b
	.secrel32	LASF44
	.byte	0x1
	.word	0x108
	.long	0x2635
	.secrel32	LLST202
	.uleb128 0x37
	.secrel32	LASF45
	.byte	0x1
	.word	0x109
	.long	0x285
	.uleb128 0x5e
	.secrel32	Ldebug_ranges0+0x410
	.uleb128 0x4c
	.ascii "paddr\0"
	.byte	0x1
	.word	0x10e
	.long	0x12e6
	.secrel32	LLST203
	.uleb128 0x4c
	.ascii "now\0"
	.byte	0x1
	.word	0x10f
	.long	0x102
	.secrel32	LLST204
	.uleb128 0x5b
	.secrel32	LASF43
	.byte	0x1
	.word	0x110
	.long	0x102
	.secrel32	LLST205
	.uleb128 0x5b
	.secrel32	LASF46
	.byte	0x1
	.word	0x111
	.long	0x12d9
	.secrel32	LLST206
	.uleb128 0x2e
	.ascii "gfn\0"
	.byte	0x1
	.word	0x112
	.long	0x12cc
	.byte	0x0
	.byte	0x0
	.uleb128 0x41
	.byte	0x1
	.ascii "kvm_read_guest\0"
	.byte	0x1
	.byte	0xe1
	.byte	0x1
	.long	0xee
	.long	LFB114
	.long	LFE114
	.secrel32	LLST207
	.long	0x5735
	.uleb128 0x6a
	.secrel32	LASF36
	.byte	0x1
	.byte	0xdf
	.long	0x158d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x42
	.secrel32	LASF37
	.byte	0x1
	.byte	0xdf
	.long	0x12b2
	.secrel32	LLST208
	.uleb128 0x42
	.secrel32	LASF0
	.byte	0x1
	.byte	0xdf
	.long	0x285
	.secrel32	LLST209
	.uleb128 0x6b
	.ascii "dest\0"
	.byte	0x1
	.byte	0xe0
	.long	0x29a
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x6c
	.secrel32	LASF44
	.byte	0x1
	.byte	0xe2
	.long	0x2635
	.secrel32	LLST210
	.uleb128 0x3b
	.secrel32	LASF45
	.byte	0x1
	.byte	0xe3
	.long	0x285
	.uleb128 0x5e
	.secrel32	Ldebug_ranges0+0x430
	.uleb128 0x44
	.ascii "paddr\0"
	.byte	0x1
	.byte	0xe8
	.long	0x12e6
	.secrel32	LLST211
	.uleb128 0x44
	.ascii "now\0"
	.byte	0x1
	.byte	0xe9
	.long	0x102
	.secrel32	LLST212
	.uleb128 0x6c
	.secrel32	LASF43
	.byte	0x1
	.byte	0xea
	.long	0x102
	.secrel32	LLST213
	.uleb128 0x6c
	.secrel32	LASF46
	.byte	0x1
	.byte	0xeb
	.long	0x12d9
	.secrel32	LLST214
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.long	0x8e4
	.long	0x5745
	.uleb128 0x1b
	.long	0x5a4
	.byte	0xf
	.byte	0x0
	.uleb128 0x17
	.long	0x5735
	.uleb128 0x17
	.long	0x5735
	.uleb128 0x17
	.long	0x5735
	.uleb128 0x1a
	.long	0x8e4
	.long	0x5764
	.uleb128 0x1b
	.long	0x5a4
	.byte	0x12
	.byte	0x0
	.uleb128 0x17
	.long	0x5754
	.uleb128 0x1a
	.long	0x8e4
	.long	0x5779
	.uleb128 0x1b
	.long	0x5a4
	.byte	0x8
	.byte	0x0
	.uleb128 0x17
	.long	0x5769
	.uleb128 0x17
	.long	0x5769
	.uleb128 0x43
	.ascii "kvm_lock\0"
	.byte	0x1
	.byte	0x3e
	.long	0x3d1
	.byte	0x5
	.byte	0x3
	.long	_kvm_lock
	.uleb128 0x43
	.ascii "vm_list\0"
	.byte	0x1
	.byte	0x41
	.long	0x175
	.byte	0x5
	.byte	0x3
	.long	_vm_list
	.uleb128 0x1a
	.long	0x29c8
	.long	0x57be
	.uleb128 0x1b
	.long	0x5a4
	.byte	0xc
	.byte	0x0
	.uleb128 0x33
	.ascii "debugfs_entries\0"
	.byte	0x1
	.byte	0x4b
	.long	0x57ae
	.uleb128 0x33
	.ascii "debugfs_dir\0"
	.byte	0x1
	.byte	0x5b
	.long	0x2a25
	.uleb128 0x13
	.ascii "vfsmount\0"
	.byte	0x1
	.uleb128 0x2e
	.ascii "kvm_vcpu_fops\0"
	.byte	0x1
	.word	0x809
	.long	0x6d2
	.uleb128 0x54
	.ascii "kvm_vm_vm_ops\0"
	.byte	0x1
	.word	0x947
	.long	0x7e6
	.byte	0x5
	.byte	0x3
	.long	_kvm_vm_vm_ops
	.uleb128 0x2e
	.ascii "kvm_vm_fops\0"
	.byte	0x1
	.word	0x951
	.long	0x6d2
	.uleb128 0x2e
	.ascii "kvm_chardev_ops\0"
	.byte	0x1
	.word	0x9bb
	.long	0x6d2
	.uleb128 0x2e
	.ascii "kvm_dev\0"
	.byte	0x1
	.word	0x9c2
	.long	0x897
	.uleb128 0x2e
	.ascii "kvm_reboot_notifier\0"
	.byte	0x1
	.word	0x9d6
	.long	0x8fb
	.uleb128 0x6d
	.secrel32	LASF27
	.byte	0x1
	.byte	0x44
	.long	0x1f23
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	_kvm_stat
	.uleb128 0x6d
	.secrel32	LASF29
	.byte	0x1
	.byte	0x43
	.long	0x415e
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	_kvm_arch_ops
	.uleb128 0x6e
	.ascii "kvmfs_mnt\0"
	.byte	0x1
	.byte	0x5d
	.long	0x58b9
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	_kvmfs_mnt
	.uleb128 0x6
	.byte	0x4
	.long	0x57e8
	.uleb128 0x6f
	.ascii "emulate_ops\0"
	.byte	0x1
	.word	0x4be
	.long	0x268c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	_emulate_ops
	.uleb128 0x1a
	.long	0x15f
	.long	0x58ea
	.uleb128 0x1b
	.long	0x5a4
	.byte	0x4
	.byte	0x0
	.uleb128 0x6f
	.ascii "msrs_to_save\0"
	.byte	0x1
	.word	0x757
	.long	0x58da
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	_msrs_to_save
	.uleb128 0x6f
	.ascii "num_msrs_to_save\0"
	.byte	0x1
	.word	0x760
	.long	0x102
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	_num_msrs_to_save
	.uleb128 0x1a
	.long	0x15f
	.long	0x5936
	.uleb128 0x1b
	.long	0x5a4
	.byte	0x0
	.byte	0x0
	.uleb128 0x6f
	.ascii "emulated_msrs\0"
	.byte	0x1
	.word	0x762
	.long	0x5926
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	_emulated_msrs
	.byte	0x0
	.section	.debug_abbrev,"dr"
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x13
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.uleb128 0x15
	.byte	0x0
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.uleb128 0x15
	.byte	0x0
	.uleb128 0x27
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2a
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.uleb128 0x26
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x34
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.uleb128 0xb
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x39
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x3d
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3e
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x41
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x42
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x45
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x46
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x47
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x4a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x4b
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x4c
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x4d
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x4e
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x4f
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x50
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x51
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x52
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x53
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x54
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x55
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x56
	.uleb128 0x1d
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x57
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x58
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x59
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x5a
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x5b
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x5d
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x5e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x5f
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x60
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x61
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x62
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x63
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x64
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x65
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x66
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x67
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x68
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x69
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x6a
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x6b
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x6c
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x6d
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x6e
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x6f
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"dr"
	.long	0x3f8
	.word	0x2
	.secrel32	Ldebug_info0
	.long	0x5954
	.long	0x31b9
	.ascii "segment_base\0"
	.long	0x3255
	.ascii "gfn_to_memslot\0"
	.long	0x3297
	.ascii "mark_page_dirty\0"
	.long	0x3350
	.ascii "emulate_invlpg\0"
	.long	0x3397
	.ascii "emulate_clts\0"
	.long	0x33da
	.ascii "emulator_set_dr\0"
	.long	0x344f
	.ascii "kvm_hypercall\0"
	.long	0x34ef
	.ascii "realmode_lgdt\0"
	.long	0x354f
	.ascii "realmode_lidt\0"
	.long	0x35af
	.ascii "kvm_resched\0"
	.long	0x35e0
	.ascii "load_msrs\0"
	.long	0x363a
	.ascii "save_msrs\0"
	.long	0x36ab
	.ascii "get_emulated_msrs_array_size\0"
	.long	0x3892
	.ascii "test_1_t\0"
	.long	0x38e9
	.ascii "kvm_get_msr_common\0"
	.long	0x3957
	.ascii "realmode_get_cr\0"
	.long	0x39b1
	.ascii "emulator_get_dr\0"
	.long	0x3a2a
	.ascii "set_cr8\0"
	.long	0x3f69
	.ascii "fx_init\0"
	.long	0x4091
	.ascii "check_function_pointer_test\0"
	.long	0x40dd
	.ascii "kvm_exit_arch\0"
	.long	0x40fd
	.ascii "kvm_init_arch\0"
	.long	0x43af
	.ascii "set_cr3\0"
	.long	0x445b
	.ascii "create_vcpu_fd\0"
	.long	0x45f2
	.ascii "kvm_vcpu_ioctl_interrupt\0"
	.long	0x4682
	.ascii "kvm_vcpu_ioctl_translate\0"
	.long	0x46fb
	.ascii "kvm_vcpu_ioctl_get_sregs\0"
	.long	0x487f
	.ascii "kvm_vcpu_ioctl_set_regs\0"
	.long	0x48d7
	.ascii "kvm_vcpu_ioctl_get_regs\0"
	.long	0x4a42
	.ascii "kvm_dev_ioctl_create_vm\0"
	.long	0x4c3a
	.ascii "kvm_vm_ioctl_create_vcpu\0"
	.long	0x4cc8
	.ascii "kvm_vcpu_ioctl_set_sregs\0"
	.long	0x4e8a
	.ascii "set_cr4\0"
	.long	0x4ef5
	.ascii "set_cr0\0"
	.long	0x4f46
	.ascii "realmode_set_cr\0"
	.long	0x4fbc
	.ascii "lmsw\0"
	.long	0x4ff7
	.ascii "realmode_lmsw\0"
	.long	0x5124
	.ascii "kvm_set_msr_common\0"
	.long	0x51f5
	.ascii "emulate_instruction\0"
	.long	0x539f
	.ascii "kvm_vcpu_ioctl_run\0"
	.long	0x53ff
	.ascii "kvm_vm_ioctl_set_memory_region\0"
	.long	0x559a
	.ascii "kvm_write_guest\0"
	.long	0x5673
	.ascii "kvm_read_guest\0"
	.long	0x587d
	.ascii "kvm_stat\0"
	.long	0x588f
	.ascii "kvm_arch_ops\0"
	.long	0x58a1
	.ascii "kvmfs_mnt\0"
	.long	0x58bf
	.ascii "emulate_ops\0"
	.long	0x58ea
	.ascii "msrs_to_save\0"
	.long	0x5906
	.ascii "num_msrs_to_save\0"
	.long	0x5936
	.ascii "emulated_msrs\0"
	.long	0x0
	.section	.debug_aranges,"dr"
	.long	0x1c
	.word	0x2
	.secrel32	Ldebug_info0
	.byte	0x4
	.byte	0x0
	.word	0x0
	.word	0x0
	.long	Ltext0
	.long	Letext0-Ltext0
	.long	0x0
	.long	0x0
	.section	.debug_ranges,"dr"
Ldebug_ranges0:
	.long	LBB250-Ltext0
	.long	LBE250-Ltext0
	.long	LBB253-Ltext0
	.long	LBE253-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB254-Ltext0
	.long	LBE254-Ltext0
	.long	LBB262-Ltext0
	.long	LBE262-Ltext0
	.long	LBB261-Ltext0
	.long	LBE261-Ltext0
	.long	LBB260-Ltext0
	.long	LBE260-Ltext0
	.long	LBB259-Ltext0
	.long	LBE259-Ltext0
	.long	LBB258-Ltext0
	.long	LBE258-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB271-Ltext0
	.long	LBE271-Ltext0
	.long	LBB281-Ltext0
	.long	LBE281-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB272-Ltext0
	.long	LBE272-Ltext0
	.long	LBB280-Ltext0
	.long	LBE280-Ltext0
	.long	LBB279-Ltext0
	.long	LBE279-Ltext0
	.long	LBB278-Ltext0
	.long	LBE278-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB290-Ltext0
	.long	LBE290-Ltext0
	.long	LBB294-Ltext0
	.long	LBE294-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB291-Ltext0
	.long	LBE291-Ltext0
	.long	LBB293-Ltext0
	.long	LBE293-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB305-Ltext0
	.long	LBE305-Ltext0
	.long	LBB308-Ltext0
	.long	LBE308-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB312-Ltext0
	.long	LBE312-Ltext0
	.long	LBB313-Ltext0
	.long	LBE313-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB314-Ltext0
	.long	LBE314-Ltext0
	.long	LBB320-Ltext0
	.long	LBE320-Ltext0
	.long	LBB319-Ltext0
	.long	LBE319-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB316-Ltext0
	.long	LBE316-Ltext0
	.long	LBB318-Ltext0
	.long	LBE318-Ltext0
	.long	LBB315-Ltext0
	.long	LBE315-Ltext0
	.long	LBB317-Ltext0
	.long	LBE317-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB323-Ltext0
	.long	LBE323-Ltext0
	.long	LBB326-Ltext0
	.long	LBE326-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB353-Ltext0
	.long	LBE353-Ltext0
	.long	LBB369-Ltext0
	.long	LBE369-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB356-Ltext0
	.long	LBE356-Ltext0
	.long	LBB368-Ltext0
	.long	LBE368-Ltext0
	.long	LBB354-Ltext0
	.long	LBE354-Ltext0
	.long	LBB355-Ltext0
	.long	LBE355-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB362-Ltext0
	.long	LBE362-Ltext0
	.long	LBB367-Ltext0
	.long	LBE367-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB370-Ltext0
	.long	LBE370-Ltext0
	.long	LBB376-Ltext0
	.long	LBE376-Ltext0
	.long	LBB375-Ltext0
	.long	LBE375-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB372-Ltext0
	.long	LBE372-Ltext0
	.long	LBB374-Ltext0
	.long	LBE374-Ltext0
	.long	LBB371-Ltext0
	.long	LBE371-Ltext0
	.long	LBB373-Ltext0
	.long	LBE373-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB393-Ltext0
	.long	LBE393-Ltext0
	.long	LBB396-Ltext0
	.long	LBE396-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB397-Ltext0
	.long	LBE397-Ltext0
	.long	LBB404-Ltext0
	.long	LBE404-Ltext0
	.long	LBB403-Ltext0
	.long	LBE403-Ltext0
	.long	LBB402-Ltext0
	.long	LBE402-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB407-Ltext0
	.long	LBE407-Ltext0
	.long	LBB410-Ltext0
	.long	LBE410-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB417-Ltext0
	.long	LBE417-Ltext0
	.long	LBB428-Ltext0
	.long	LBE428-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB422-Ltext0
	.long	LBE422-Ltext0
	.long	LBB427-Ltext0
	.long	LBE427-Ltext0
	.long	LBB426-Ltext0
	.long	LBE426-Ltext0
	.long	LBB425-Ltext0
	.long	LBE425-Ltext0
	.long	LBB424-Ltext0
	.long	LBE424-Ltext0
	.long	LBB423-Ltext0
	.long	LBE423-Ltext0
	.long	LBB418-Ltext0
	.long	LBE418-Ltext0
	.long	LBB419-Ltext0
	.long	LBE419-Ltext0
	.long	LBB420-Ltext0
	.long	LBE420-Ltext0
	.long	LBB421-Ltext0
	.long	LBE421-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB429-Ltext0
	.long	LBE429-Ltext0
	.long	LBB430-Ltext0
	.long	LBE430-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB431-Ltext0
	.long	LBE431-Ltext0
	.long	LBB432-Ltext0
	.long	LBE432-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB433-Ltext0
	.long	LBE433-Ltext0
	.long	LBB434-Ltext0
	.long	LBE434-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB435-Ltext0
	.long	LBE435-Ltext0
	.long	LBB436-Ltext0
	.long	LBE436-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB438-Ltext0
	.long	LBE438-Ltext0
	.long	LBB439-Ltext0
	.long	LBE439-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB442-Ltext0
	.long	LBE442-Ltext0
	.long	LBB443-Ltext0
	.long	LBE443-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB444-Ltext0
	.long	LBE444-Ltext0
	.long	LBB450-Ltext0
	.long	LBE450-Ltext0
	.long	LBB449-Ltext0
	.long	LBE449-Ltext0
	.long	LBB448-Ltext0
	.long	LBE448-Ltext0
	.long	LBB446-Ltext0
	.long	LBE446-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB445-Ltext0
	.long	LBE445-Ltext0
	.long	LBB451-Ltext0
	.long	LBE451-Ltext0
	.long	LBB447-Ltext0
	.long	LBE447-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB452-Ltext0
	.long	LBE452-Ltext0
	.long	LBB464-Ltext0
	.long	LBE464-Ltext0
	.long	LBB463-Ltext0
	.long	LBE463-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB454-Ltext0
	.long	LBE454-Ltext0
	.long	LBB462-Ltext0
	.long	LBE462-Ltext0
	.long	LBB453-Ltext0
	.long	LBE453-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB456-Ltext0
	.long	LBE456-Ltext0
	.long	LBB457-Ltext0
	.long	LBE457-Ltext0
	.long	LBB455-Ltext0
	.long	LBE455-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB458-Ltext0
	.long	LBE458-Ltext0
	.long	LBB461-Ltext0
	.long	LBE461-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB465-Ltext0
	.long	LBE465-Ltext0
	.long	LBB467-Ltext0
	.long	LBE467-Ltext0
	.long	LBB466-Ltext0
	.long	LBE466-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB468-Ltext0
	.long	LBE468-Ltext0
	.long	LBB470-Ltext0
	.long	LBE470-Ltext0
	.long	LBB469-Ltext0
	.long	LBE469-Ltext0
	.long	0x0
	.long	0x0
	.section	.debug_str,"dr"
LASF6:
	.ascii "error_code\0"
LASF31:
	.ascii "vcpu_put\0"
LASF9:
	.ascii "vcpu_fd\0"
LASF37:
	.ascii "addr\0"
LASF13:
	.ascii "limit\0"
LASF30:
	.ascii "vcpu_load\0"
LASF27:
	.ascii "kvm_stat\0"
LASF17:
	.ascii "singlestep\0"
LASF23:
	.ascii "para_state_gpa\0"
LASF41:
	.ascii "bytes\0"
LASF45:
	.ascii "req_size\0"
LASF4:
	.ascii "file_operations\0"
LASF11:
	.ascii "rflags\0"
LASF42:
	.ascii "__FUNCTION__\0"
LASF8:
	.ascii "data\0"
LASF0:
	.ascii "size\0"
LASF26:
	.ascii "base_gfn\0"
LASF5:
	.ascii "exception\0"
LASF46:
	.ascii "guest_buf\0"
LASF33:
	.ascii "get_segment\0"
LASF19:
	.ascii "root_hpa\0"
LASF12:
	.ascii "base\0"
LASF18:
	.ascii "hypercall_gpa\0"
LASF24:
	.ascii "para_state_page\0"
LASF7:
	.ascii "address\0"
LASF20:
	.ascii "root_level\0"
LASF3:
	.ascii "private_data\0"
LASF40:
	.ascii "reported\0"
LASF15:
	.ascii "padding\0"
LASF39:
	.ascii "ctxt\0"
LASF2:
	.ascii "inode\0"
LASF32:
	.ascii "get_segment_base\0"
LASF21:
	.ascii "shadow_root_level\0"
LASF44:
	.ascii "host_buf\0"
LASF34:
	.ascii "set_segment\0"
LASF10:
	.ascii "apic_base\0"
LASF16:
	.ascii "enabled\0"
LASF29:
	.ascii "kvm_arch_ops\0"
LASF22:
	.ascii "pae_root\0"
LASF28:
	.ascii "tlb_flush\0"
LASF43:
	.ascii "offset\0"
LASF25:
	.ascii "memory_config_version\0"
LASF38:
	.ascii "memslot\0"
LASF36:
	.ascii "vcpu\0"
LASF14:
	.ascii "selector\0"
LASF35:
	.ascii "inject_gp\0"
LASF1:
	.ascii "systemVA\0"
	.def	_new_inode;	.scl	2;	.type	32;	.endef
	.def	_get_empty_filp;	.scl	2;	.type	32;	.endef
	.def	_gva_to_hpa;	.scl	2;	.type	32;	.endef
	.def	_kzalloc;	.scl	2;	.type	32;	.endef
	.def	_spin_lock_init;	.scl	2;	.type	32;	.endef
	.def	_mutex_init;	.scl	2;	.type	32;	.endef
	.def	___free_page;	.scl	2;	.type	32;	.endef
	.def	_kvm_mmu_destroy;	.scl	2;	.type	32;	.endef
	.def	_kvm_mmu_slot_remove_write_access;	.scl	2;	.type	32;	.endef
	.def	_wk_alloc_page;	.scl	2;	.type	32;	.endef
	.def	_kvm_mmu_pre_write;	.scl	2;	.type	32;	.endef
	.def	_kvm_mmu_post_write;	.scl	2;	.type	32;	.endef
	.def	_x86_emulate_memop;	.scl	2;	.type	32;	.endef
	.def	_kvm_mmu_unprotect_page_virt;	.scl	2;	.type	32;	.endef
	.def	_gpa_to_hpa;	.scl	2;	.type	32;	.endef
	.def	_kmap_atomic;	.scl	2;	.type	32;	.endef
	.def	_pfn_to_page;	.scl	2;	.type	32;	.endef
	.def	_kunmap_atomic;	.scl	2;	.type	32;	.endef
	.def	_kvm_mmu_reset_context;	.scl	2;	.type	32;	.endef
	.def	_memcpy;	.scl	2;	.type	32;	.endef
	.def	_vmalloc;	.scl	2;	.type	32;	.endef
	.def	_vfree;	.scl	2;	.type	32;	.endef
	.def	_mutex_lock;	.scl	2;	.type	32;	.endef
	.def	_kvm_mmu_create;	.scl	2;	.type	32;	.endef
	.def	_kvm_mmu_setup;	.scl	2;	.type	32;	.endef
	.def	_get_page;	.scl	2;	.type	32;	.endef
	.def	_get_unused_fd;	.scl	2;	.type	32;	.endef
	.def	_fd_install;	.scl	2;	.type	32;	.endef
	.def	_fput;	.scl	2;	.type	32;	.endef
	.def	_iput;	.scl	2;	.type	32;	.endef
	.def	_spin_lock;	.scl	2;	.type	32;	.endef
	.def	_mutex_unlock;	.scl	2;	.type	32;	.endef
	.def	_spin_unlock;	.scl	2;	.type	32;	.endef
	.def	_on_each_cpu;	.scl	2;	.type	32;	.endef
	.def	_kmalloc;	.scl	2;	.type	32;	.endef
	.def	_printk;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_kfree;	.scl	2;	.type	32;	.endef
