	.file	"mmu.c"
	.section	.debug_abbrev,"dr"
Ldebug_abbrev0:
	.section	.debug_info,"dr"
Ldebug_info0:
	.section	.debug_line,"dr"
Ldebug_line0:
	.text
Ltext0:
	.p2align 4,,15
.globl _nonpaging_new_cr3
	.def	_nonpaging_new_cr3;	.scl	2;	.type	32;	.endef
_nonpaging_new_cr3:
LFB148:
	.file 1 "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c"
	.loc 1 786 0
LVL0:
	.loc 1 787 0
	rep
	ret
LFE148:
	.p2align 4,,15
.globl _nonpaging_gva_to_gpa
	.def	_nonpaging_gva_to_gpa;	.scl	2;	.type	32;	.endef
_nonpaging_gva_to_gpa:
LFB152:
	.loc 1 909 0
LVL1:
	.loc 1 911 0
	movl	8(%esp), %eax
	xorl	%edx, %edx
	ret
LFE152:
	.p2align 4,,15
.globl _kvm_mmu_post_write
	.def	_kvm_mmu_post_write;	.scl	2;	.type	32;	.endef
_kvm_mmu_post_write:
LFB190:
	.loc 1 1276 0
LVL2:
	.loc 1 1277 0
	rep
	ret
LFE190:
	.p2align 4,,15
	.def	_kvm_mmu_lookup_page;	.scl	3;	.type	32;	.endef
_kvm_mmu_lookup_page:
LFB138:
	.loc 1 586 0
LVL3:
	pushl	%esi
LCFI0:
	movl	%edx, %esi
	pushl	%ebx
LCFI1:
	subl	$4, %esp
LCFI2:
	.loc 1 595 0
	movl	(%eax), %edx
LVL4:
	movl	%esi, %eax
LVL5:
	andl	$255, %eax
	movl	100(%edx,%eax,4), %ebx
LVL6:
	testl	%ebx, %ebx
	jne	L14
	jmp	L8
LVL7:
	.p2align 4,,7
L12:
	movl	(%ebx), %ebx
	testl	%ebx, %ebx
	je	L8
L14:
	movl	(%ebx), %eax
LVL8:
	movl	%eax, (%esp)
	call	_prefetch
LBB391:
	leal	-8(%ebx), %eax
LVL9:
LBE391:
	.loc 1 596 0
	cmpl	%esi, 16(%eax)
	jne	L12
	testb	$1, 22(%eax)
	jne	L12
	.loc 1 602 0
	addl	$4, %esp
LVL10:
	popl	%ebx
LVL11:
	popl	%esi
LVL12:
	.p2align 4,,1
	ret
LVL13:
	.p2align 4,,7
L8:
	addl	$4, %esp
	.loc 1 596 0
	xorl	%eax, %eax
LVL14:
	.loc 1 602 0
	popl	%ebx
LVL15:
	popl	%esi
LVL16:
	ret
LFE138:
	.section .rdata,"dr"
LC0:
	.ascii "vcpu\0"
	.align 4
LC1:
	.ascii "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c\0"
	.align 4
LC2:
	.ascii "<4>assertion failed %s:%d: %s\12\0"
	.text
	.p2align 4,,15
	.def	_destroy_kvm_mmu;	.scl	3;	.type	32;	.endef
_destroy_kvm_mmu:
LFB186:
	.loc 1 1159 0
LVL17:
	pushl	%ebx
LCFI3:
	movl	%eax, %ebx
	subl	$16, %esp
LCFI4:
	.loc 1 1160 0
	testl	%eax, %eax
	je	L20
LVL18:
L17:
	.loc 1 1161 0
	movl	13540(%ebx), %eax
	andl	13544(%ebx), %eax
	addl	$1, %eax
	je	L19
	.loc 1 1162 0
	movl	%ebx, (%esp)
	call	*13532(%ebx)
	.loc 1 1163 0
	movl	$-1, 13540(%ebx)
	movl	$-1, 13544(%ebx)
L19:
	.loc 1 1165 0
	addl	$16, %esp
	popl	%ebx
LVL19:
	ret
LVL20:
	.p2align 4,,7
L20:
	.loc 1 1160 0
	movl	$LC0, 12(%esp)
	movl	$1160, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
LVL21:
	jmp	L17
LFE186:
	.section .rdata,"dr"
LC3:
	.ascii "<3>%s: %p %llx\12\0"
	.text
	.p2align 4,,15
	.def	_is_empty_shadow_page;	.scl	3;	.type	32;	.endef
_is_empty_shadow_page:
LFB132:
	.loc 1 458 0
LVL22:
	pushl	%esi
LCFI5:
	pushl	%ebx
LCFI6:
	subl	$20, %esp
LCFI7:
	.loc 1 462 0
	movl	%eax, (%esp)
	call	___va
LVL23:
	leal	4096(%eax), %ebx
LVL24:
	jmp	L25
	.p2align 4,,7
L27:
	.loc 1 463 0
	addl	$8, %eax
	cmpl	%eax, %ebx
	je	L30
L25:
	.loc 1 464 0
	movl	4(%eax), %edx
	movl	(%eax), %ecx
	movl	%edx, %esi
	orl	%ecx, %esi
	je	L27
	.loc 1 465 0
	movl	%ecx, 12(%esp)
	movl	%edx, 16(%esp)
	movl	%eax, 8(%esp)
	movl	$___FUNCTION__.2727, 4(%esp)
	movl	$LC3, (%esp)
	call	_printk
LVL25:
	.loc 1 470 0
	addl	$20, %esp
	.loc 1 465 0
	xorl	%eax, %eax
	.loc 1 470 0
	popl	%ebx
LVL26:
	popl	%esi
	ret
LVL27:
L30:
	addl	$20, %esp
	.loc 1 463 0
	movl	$1, %eax
LVL28:
	.loc 1 470 0
	popl	%ebx
LVL29:
	popl	%esi
	ret
LFE132:
	.section .rdata,"dr"
LC4:
	.ascii "VALID_PAGE(root)\0"
	.text
	.p2align 4,,15
	.def	_mmu_free_roots;	.scl	3;	.type	32;	.endef
_mmu_free_roots:
LFB150:
	.loc 1 842 0
LVL30:
	pushl	%ebp
LCFI8:
	movl	%eax, %ebp
	pushl	%edi
LCFI9:
	pushl	%esi
LCFI10:
	pushl	%ebx
LCFI11:
	xorl	%ebx, %ebx
	subl	$16, %esp
LCFI12:
LVL31:
L33:
LBB392:
	.loc 1 858 0
	movl	13556(%ebp), %eax
	movl	(%eax,%ebx), %esi
	movl	4(%eax,%ebx), %edi
	.loc 1 860 0
	movl	%esi, %eax
	andl	%edi, %eax
	addl	$1, %eax
	je	L36
L32:
LBB393:
	.file 2 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h"
	.loc 2 576 0
	movl	%esi, %eax
	movl	%edi, %edx
	andl	$1048575, %edx
	andl	$-4096, %eax
	shrdl	$12, %edx, %eax
	movl	%eax, (%esp)
	call	_pfn_to_page
LBB394:
	.loc 2 578 0
	movl	(%eax), %eax
LVL32:
LBE394:
LBE393:
	.loc 1 863 0
	subl	$1, 44(%eax)
	.loc 1 864 0
	movl	13556(%ebp), %eax
LVL33:
	movl	$-1, (%eax,%ebx)
	movl	$-1, 4(%eax,%ebx)
	addl	$8, %ebx
LBE392:
	.loc 1 857 0
	cmpl	$32, %ebx
	jne	L33
	.loc 1 866 0
	movl	$-1, 13540(%ebp)
	movl	$-1, 13544(%ebp)
	.loc 1 867 0
	addl	$16, %esp
	popl	%ebx
	popl	%esi
LVL34:
	popl	%edi
LVL35:
	popl	%ebp
LVL36:
	ret
LVL37:
	.p2align 4,,7
L36:
LBB395:
	.loc 1 860 0
	movl	$LC4, 12(%esp)
	movl	$860, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	jmp	L32
LBE395:
LFE150:
	.p2align 4,,15
	.def	_nonpaging_free;	.scl	3;	.type	32;	.endef
_nonpaging_free:
LFB154:
	.loc 1 945 0
LVL38:
	.loc 1 945 0
	movl	4(%esp), %eax
	.loc 1 946 0
	jmp	_mmu_free_roots
LFE154:
	.p2align 4,,15
	.def	_paging_free;	.scl	3;	.type	32;	.endef
_paging_free:
LFB162:
	.loc 1 1070 0
LVL39:
	.loc 1 1070 0
	movl	4(%esp), %eax
LBB396:
LBB397:
	.loc 1 946 0
	jmp	_mmu_free_roots
LBE397:
LBE396:
LFE162:
	.section .rdata,"dr"
	.align 4
LC5:
	.ascii "<3>rmap_remove: %p %llx 0->BUG\12\0"
	.align 4
LC6:
	.ascii "<3>rmap_remove:  %p %llx 1->BUG\12\0"
	.text
	.p2align 4,,15
	.def	_rmap_remove;	.scl	3;	.type	32;	.endef
_rmap_remove:
LFB130:
	.loc 1 387 0
LVL40:
	subl	$32, %esp
LCFI13:
	movl	%ebx, 16(%esp)
LCFI14:
	movl	%edx, %ebx
	movl	%edi, 24(%esp)
LCFI15:
	movl	%eax, %edi
	movl	%esi, 20(%esp)
LCFI16:
	movl	%ebp, 28(%esp)
LCFI17:
	.loc 1 393 0
	movl	(%edx), %ecx
	movl	4(%edx), %esi
	movl	%ecx, %eax
LVL41:
	andl	$3, %eax
	cmpl	$3, %eax
	je	L64
LVL42:
L59:
	.loc 1 424 0
	movl	16(%esp), %ebx
LVL43:
	movl	20(%esp), %esi
LVL44:
	movl	24(%esp), %edi
LVL45:
	movl	28(%esp), %ebp
LVL46:
	addl	$32, %esp
	ret
LVL47:
	.p2align 4,,7
L64:
	.loc 1 395 0
	movl	%ecx, %eax
	movl	%esi, %edx
LVL48:
	andl	$1048575, %edx
	andl	$-4096, %eax
	shrdl	$12, %edx, %eax
	movl	%eax, (%esp)
	call	_pfn_to_page
	movl	%eax, %ebp
LVL49:
	.loc 1 396 0
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L65
	.loc 1 399 0
	testb	$1, %al
	jne	L44
	.loc 1 401 0
	cmpl	%eax, %ebx
	je	L45
	.loc 1 402 0
	movl	(%ebx), %eax
	movl	4(%ebx), %edx
	movl	%ebx, 4(%esp)
	movl	$LC6, (%esp)
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	call	_printk
L45:
	.loc 1 406 0
	movl	$0, (%ebp)
	jmp	L59
	.p2align 4,,7
L44:
	.loc 1 411 0
	movl	%eax, %ecx
LVL50:
	.loc 1 412 0
	xorl	%esi, %esi
LVL51:
	.loc 1 411 0
	andl	$-2, %ecx
	je	L59
LVL52:
	.p2align 4,,7
L63:
	.loc 1 412 0
	xorl	%edx, %edx
L56:
	movl	(%ecx,%edx,4), %eax
	testl	%eax, %eax
	je	L55
	.loc 1 413 0
	cmpl	%eax, %ebx
	je	L66
	.loc 1 412 0
	addl	$1, %edx
	cmpl	$4, %edx
	jne	L56
L55:
	.loc 1 420 0
	movl	16(%ecx), %eax
LVL53:
	movl	%ecx, %esi
	.loc 1 411 0
	testl	%eax, %eax
	je	L59
	movl	%eax, %ecx
	jmp	L63
LVL54:
	.p2align 4,,7
L65:
	.loc 1 397 0
	movl	(%ebx), %eax
	movl	4(%ebx), %edx
	movl	%ebx, 4(%esp)
	movl	$LC5, (%esp)
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	call	_printk
	jmp	L59
LVL55:
	.p2align 4,,7
L66:
LBB398:
LBB399:
	.loc 1 370 0
	movl	12(%ecx), %eax
	testl	%eax, %eax
	je	L67
L48:
	.loc 1 372 0
	movl	%eax, (%ecx,%edx,4)
	.loc 1 373 0
	movl	$0, 12(%ecx)
	.p2align 4,,3
	jmp	L59
L67:
	.loc 1 370 0
	cmpl	$2, %edx
	jg	L48
	movb	$3, %al
LVL56:
L49:
	subl	$1, %eax
	movl	(%ecx,%eax,4), %ebx
LVL57:
	testl	%ebx, %ebx
	je	L68
L60:
	.loc 1 374 0
	testl	%eax, %eax
	.loc 1 372 0
	movl	%ebx, (%ecx,%edx,4)
	.loc 1 373 0
	movl	$0, (%ecx,%eax,4)
	.loc 1 374 0
	jne	L59
	.loc 1 376 0
	testl	%esi, %esi
	je	L69
	.loc 1 380 0
	movl	16(%ecx), %eax
LVL58:
	movl	%eax, 16(%esi)
L52:
LBB400:
LBB401:
LBB402:
LBB403:
	.loc 1 276 0
	movl	13644(%edi), %eax
	cmpl	$19, %eax
	jg	L54
	.loc 1 277 0
	movl	%ecx, 13648(%edi,%eax,4)
	addl	$1, %eax
	movl	%eax, 13644(%edi)
	jmp	L59
LVL59:
	.p2align 4,,7
L68:
LBE403:
LBE402:
LBE401:
LBE400:
	.loc 1 370 0
	cmpl	%edx, %eax
	jg	L49
	jmp	L60
LVL60:
L54:
LBB407:
LBB406:
LBB405:
LBB404:
	.loc 1 279 0
	movl	%ecx, (%esp)
	.p2align 4,,7
	call	_kfree
LVL61:
	.p2align 4,,6
	jmp	L59
LVL62:
L69:
LBE404:
LBE405:
LBE406:
LBE407:
	.loc 1 376 0
	movl	16(%ecx), %eax
LVL63:
	testl	%eax, %eax
	.p2align 4,,2
	je	L70
	.loc 1 382 0
	movl	16(%ecx), %eax
	orl	$1, %eax
	movl	%eax, (%ebp)
	jmp	L52
L70:
	.loc 1 377 0
	movl	(%ecx), %eax
	movl	%eax, (%ebp)
	jmp	L52
LBE399:
LBE398:
LFE130:
	.p2align 4,,15
.globl _kvm_mmu_slot_remove_write_access
	.def	_kvm_mmu_slot_remove_write_access;	.scl	2;	.type	32;	.endef
_kvm_mmu_slot_remove_write_access:
LFB198:
	.loc 1 1390 0
LVL64:
	pushl	%ebp
LCFI18:
	pushl	%edi
LCFI19:
	pushl	%esi
LCFI20:
	pushl	%ebx
LCFI21:
	subl	$8, %esp
LCFI22:
	.loc 1 1390 0
	movl	28(%esp), %ebp
	.loc 1 1391 0
	movl	(%ebp), %eax
LVL65:
LBB408:
	.loc 1 1394 0
	movl	88(%eax), %edi
LVL66:
LBE408:
	addl	$88, %eax
LVL67:
	movl	%eax, 4(%esp)
	movl	(%edi), %eax
	movl	%eax, (%esp)
	call	_prefetch
	cmpl	4(%esp), %edi
	je	L79
LVL68:
	.p2align 4,,7
L76:
LBB409:
LBB410:
LBB411:
	.file 3 "include/linux/winkvmstab.h"
	.loc 3 310 0
	movl	32(%esp), %edx
/APP
 # 310 "include/linux/winkvmstab.h" 1
	btl %edx,32(%edi); setc %al
 # 0 "" 2
LVL69:
/NO_APP
LBE411:
LBE410:
	.loc 1 1398 0
	testb	%al, %al
	jne	L80
L73:
LBE409:
LBB412:
	.loc 1 1394 0
	movl	(%edi), %edi
LBE412:
	movl	(%edi), %eax
LVL70:
	movl	%eax, (%esp)
	call	_prefetch
	cmpl	4(%esp), %edi
	jne	L76
L79:
	.loc 1 1409 0
	addl	$8, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
LVL71:
	popl	%ebp
LVL72:
	ret
LVL73:
	.p2align 4,,7
L80:
LBB413:
	.loc 1 1401 0
	movl	24(%edi), %eax
LVL74:
	movl	%eax, (%esp)
	call	___va
	movl	%eax, %ebx
	leal	4096(%eax), %esi
	jmp	L75
	.p2align 4,,7
L74:
	.loc 1 1406 0
	addl	$8, %ebx
	.loc 1 1402 0
	cmpl	%esi, %ebx
	je	L73
L75:
	.loc 1 1404 0
	testb	$2, (%ebx)
	je	L74
	.loc 1 1405 0
	movl	%ebx, %edx
	movl	%ebp, %eax
	call	_rmap_remove
	.loc 1 1406 0
	andl	$-3, (%ebx)
	andl	$-1, 4(%ebx)
	jmp	L74
LBE413:
LFE198:
	.section .rdata,"dr"
LC7:
	.ascii "assert: %s\0"
	.text
	.p2align 4,,15
	.def	_mmu_page_remove_parent_pte;	.scl	3;	.type	32;	.endef
_mmu_page_remove_parent_pte:
LFB137:
	.loc 1 548 0
LVL75:
	pushl	%ebp
LCFI23:
	movl	%edx, %ebp
	pushl	%edi
LCFI24:
	movl	%ecx, %edi
	pushl	%esi
LCFI25:
	pushl	%ebx
LCFI26:
	subl	$12, %esp
LCFI27:
	.loc 1 548 0
	movl	%eax, 8(%esp)
	.loc 1 553 0
	movl	40(%edx), %ecx
LVL76:
	testl	%ecx, %ecx
	jne	L82
LVL77:
	.loc 1 554 0
	cmpl	%edi, 48(%edx)
	je	L100
	movl	$___FUNCTION__.2807, 4(%esp)
	movl	$LC7, (%esp)
	call	_printk
LVL78:
L100:
	.loc 1 576 0
	movl	$0, 48(%ebp)
LVL79:
L97:
	.loc 1 582 0
	addl	$12, %esp
	popl	%ebx
LVL80:
	popl	%esi
LVL81:
	popl	%edi
LVL82:
	popl	%ebp
LVL83:
	ret
LVL84:
	.p2align 4,,7
L82:
	.loc 1 558 0
	movl	48(%edx), %ebx
LVL85:
	testl	%ebx, %ebx
	je	L97
LVL86:
	.p2align 4,,7
L99:
	movl	(%ebx), %eax
LBB414:
	leal	-20(%ebx), %esi
LBE414:
	movl	%eax, (%esp)
	call	_prefetch
LVL87:
LBB415:
	xorl	%edx, %edx
LVL88:
L96:
LBE415:
	.loc 1 560 0
	movl	(%esi,%edx,4), %eax
	testl	%eax, %eax
	je	L86
	.loc 1 562 0
	cmpl	%eax, %edi
	je	L102
	.loc 1 559 0
	addl	$1, %edx
	cmpl	$5, %edx
	jne	L96
L86:
	.loc 1 558 0
	movl	(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L99
	.loc 1 582 0
	addl	$12, %esp
	popl	%ebx
LVL89:
	popl	%esi
LVL90:
	popl	%edi
LVL91:
	popl	%ebp
LVL92:
	ret
LVL93:
	.p2align 4,,7
L102:
	.loc 1 564 0
	cmpl	$3, %edx
	jg	L88
	leal	1(%edx), %ecx
LVL94:
	movl	(%esi,%ecx,4), %eax
	testl	%eax, %eax
	je	L89
	leal	8(%esi,%edx,4), %ebx
LVL95:
	jmp	L92
LVL96:
	.p2align 4,,7
L103:
	movl	(%ebx), %eax
	addl	$4, %ebx
	leal	1(%ecx), %edi
LVL97:
	testl	%eax, %eax
	je	L91
	movl	%ecx, %edx
	movl	%edi, %ecx
LVL98:
L92:
	cmpl	$4, %ecx
	.loc 1 566 0
	movl	%eax, (%esi,%edx,4)
	.loc 1 564 0
	jne	L103
LVL99:
LBB416:
	.loc 1 558 0
	movl	$4, %edx
LVL100:
L88:
LBE416:
	.loc 1 570 0
	movl	$0, (%esi,%edx,4)
	.loc 1 582 0
	addl	$12, %esp
	popl	%ebx
LVL101:
	popl	%esi
LVL102:
	popl	%edi
LVL103:
	popl	%ebp
LVL104:
	ret
LVL105:
	.p2align 4,,7
L91:
	.loc 1 570 0
	movl	$0, (%esi,%ecx,4)
	.loc 1 582 0
	addl	$12, %esp
	popl	%ebx
	popl	%esi
LVL106:
	popl	%edi
LVL107:
	popl	%ebp
LVL108:
	ret
LVL109:
L89:
	.loc 1 571 0
	testl	%edx, %edx
	.loc 1 570 0
	movl	$0, (%esi,%edx,4)
	.loc 1 571 0
	jne	L97
LVL110:
LBB417:
LBB418:
LBB419:
LBB420:
	.file 4 "include/linux/winkvmlist.h"
	.loc 4 734 0
	movl	20(%esi), %eax
LVL111:
	.loc 4 735 0
	movl	24(%esi), %edx
LVL112:
	.loc 4 737 0
	testl	%eax, %eax
	.loc 4 736 0
	movl	%eax, (%edx)
	.loc 4 737 0
	je	L93
	.loc 4 738 0
	movl	%edx, 4(%eax)
L93:
LBE420:
LBE419:
	.loc 4 744 0
	movl	$1048832, 20(%esi)
	.loc 4 745 0
	movl	$2097664, 24(%esi)
LBE418:
LBE417:
LBB421:
LBB422:
LBB423:
LBB424:
	.loc 1 276 0
	movl	8(%esp), %edx
LVL113:
	movl	13560(%edx), %eax
LVL114:
	cmpl	$19, %eax
	jg	L94
LVL115:
	.loc 1 277 0
	movl	%esi, 13564(%edx,%eax,4)
	addl	$1, %eax
	movl	%eax, 13560(%edx)
L95:
LBE424:
LBE423:
LBE422:
LBE421:
	.loc 1 574 0
	movl	48(%ebp), %edx
	testl	%edx, %edx
	jne	L97
	.loc 1 575 0
	movl	$0, 40(%ebp)
	jmp	L100
L94:
LBB428:
LBB427:
LBB426:
LBB425:
	.loc 1 279 0
	movl	%esi, (%esp)
	call	_kfree
LVL116:
	.p2align 4,,4
	jmp	L95
LBE425:
LBE426:
LBE427:
LBE428:
LFE137:
	.section .rdata,"dr"
	.align 4
LC8:
	.ascii "is_empty_shadow_page(page_hpa)\0"
	.text
	.p2align 4,,15
	.def	_kvm_mmu_zap_page;	.scl	3;	.type	32;	.endef
_kvm_mmu_zap_page:
LFB142:
	.loc 1 694 0
LVL117:
	pushl	%ebp
LCFI28:
	pushl	%edi
LCFI29:
	movl	%edx, %edi
	pushl	%esi
LCFI30:
	pushl	%ebx
LCFI31:
	subl	$20, %esp
LCFI32:
	.loc 1 694 0
	movl	%eax, 16(%esp)
	jmp	L105
LVL118:
	.p2align 4,,7
L123:
	.loc 1 697 0
	movl	48(%edi), %ebx
	testl	%ebx, %ebx
	je	L122
L106:
LBB461:
LBB462:
	.loc 1 689 0
	movl	16(%esp), %eax
	movl	%ebx, %ecx
	movl	%edi, %edx
	call	_mmu_page_remove_parent_pte
LBE462:
LBE461:
	.loc 1 709 0
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
LVL119:
L105:
	.loc 1 697 0
	movl	40(%edi), %esi
	testl	%esi, %esi
	je	L123
LBB463:
	.loc 1 703 0
	movl	48(%edi), %eax
	movl	-20(%eax), %ebx
LBE463:
	.loc 1 707 0
	testl	%ebx, %ebx
	jne	L106
	movl	$___FUNCTION__.2951, 4(%esp)
	movl	$LC7, (%esp)
	call	_printk
	jmp	L106
LVL120:
	.p2align 4,,7
L122:
LBB464:
	.loc 1 662 0
	movl	24(%edi), %eax
	movl	%eax, (%esp)
	call	___va
	movl	%eax, %edx
LBB466:
	.loc 1 664 0
	movzbl	20(%edi), %eax
	.loc 1 670 0
	movl	%edx, %ebx
LVL121:
	leal	4096(%edx), %ebp
	.loc 1 664 0
	andl	$-16, %eax
	cmpb	$16, %al
	jne	L119
	jmp	L110
LVL122:
	.p2align 4,,7
L112:
	.loc 1 681 0
	addl	$8, %ebx
	.loc 1 674 0
	cmpl	%ebp, %ebx
	je	L111
L119:
	.loc 1 675 0
	movl	(%ebx), %ecx
	movl	4(%ebx), %esi
	.loc 1 677 0
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
	.loc 1 678 0
	testb	$1, %cl
	je	L112
LBB467:
	.loc 2 576 0
	movl	%ecx, %eax
	movl	%esi, %edx
	andl	$1048575, %edx
	andl	$-4096, %eax
	shrdl	$12, %edx, %eax
	movl	%eax, (%esp)
	call	_pfn_to_page
LVL123:
LBE467:
	.loc 1 681 0
	movl	%ebx, %ecx
	addl	$8, %ebx
	movl	(%eax), %edx
LVL124:
	movl	16(%esp), %eax
LVL125:
	call	_mmu_page_remove_parent_pte
	.loc 1 674 0
	cmpl	%ebp, %ebx
	jne	L119
LVL126:
L111:
LBE466:
LBE464:
	.loc 1 712 0
	movl	44(%edi), %ebx
	testl	%ebx, %ebx
	jne	L114
LBB469:
LBB470:
LBB471:
LBB472:
	.loc 4 734 0
	movl	8(%edi), %eax
LVL127:
	.loc 4 735 0
	movl	12(%edi), %edx
LVL128:
	.loc 4 737 0
	testl	%eax, %eax
	.loc 4 736 0
	movl	%eax, (%edx)
	.loc 4 737 0
	je	L115
	.loc 4 738 0
	movl	%edx, 4(%eax)
L115:
LBE472:
LBE471:
LBE470:
LBE469:
	.loc 1 714 0
	movl	24(%edi), %esi
LVL129:
LBB474:
LBB473:
	.loc 4 744 0
	movl	$1048832, 8(%edi)
	.loc 4 745 0
	movl	$2097664, 12(%edi)
LBE473:
LBE474:
	.loc 1 714 0
	movl	28(%edi), %edi
LVL130:
LBB475:
LBB478:
LBB491:
	.loc 2 576 0
	movl	%esi, %eax
LVL131:
	movl	%edi, %edx
LVL132:
	shrdl	$12, %edx, %eax
	movl	%eax, (%esp)
	call	_pfn_to_page
LVL133:
LBE491:
LBE478:
	.loc 1 476 0
	movl	%edi, %edx
LBB477:
LBB493:
LBB492:
	.loc 2 578 0
	movl	(%eax), %ebx
LVL134:
LBE492:
LBE493:
LBE477:
	.loc 1 476 0
	movl	%esi, %eax
LVL135:
	call	_is_empty_shadow_page
LBB476:
	testl	%eax, %eax
	je	L124
L116:
LBB487:
LBB488:
	.loc 4 175 0
	movl	(%ebx), %edx
	movl	4(%ebx), %eax
LBB489:
LBB490:
	.loc 4 163 0
	movl	%edx, (%eax)
	.loc 4 162 0
	movl	%eax, 4(%edx)
LBE490:
LBE489:
	.loc 4 176 0
	movl	$1048832, (%ebx)
LBE488:
LBE487:
	.loc 1 478 0
	movl	%esi, 24(%ebx)
	movl	%edi, 28(%ebx)
LBB480:
LBB481:
	.loc 4 74 0
	movl	16(%esp), %edx
	movl	204(%edx), %eax
LBB482:
LBB483:
	.loc 4 53 0
	movl	%eax, (%ebx)
	.loc 4 52 0
	movl	%ebx, 4(%eax)
	.loc 4 54 0
	movl	%edx, %eax
	addl	$204, %eax
	movl	%eax, 4(%ebx)
LBE483:
LBE482:
LBE481:
LBE480:
	.loc 1 480 0
	movl	(%edx), %eax
LBB479:
LBB486:
LBB485:
LBB484:
	.loc 4 55 0
	movl	%ebx, 204(%edx)
LBE484:
LBE485:
LBE486:
LBE479:
	.loc 1 480 0
	addl	$1, 96(%eax)
LBE476:
LBE475:
	.loc 1 719 0
	addl	$20, %esp
	popl	%ebx
LVL136:
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
LVL137:
L127:
LBB495:
LBB465:
	.loc 1 667 0
	movl	16(%esp), %eax
	movl	%ebx, %edx
	call	_rmap_remove
L109:
	.loc 1 668 0
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
	addl	$8, %ebx
	.loc 1 665 0
	cmpl	%ebp, %ebx
	je	L125
L110:
LBE465:
	.loc 1 666 0
	testb	$1, (%ebx)
	je	L109
	jmp	L127
LVL138:
L114:
LBE495:
LBB496:
LBB497:
	.loc 4 175 0
	movl	(%edi), %edx
	movl	4(%edi), %eax
LBB498:
LBB499:
	.loc 4 163 0
	movl	%edx, (%eax)
	.loc 4 162 0
	movl	%eax, 4(%edx)
LBE499:
LBE498:
	.loc 4 176 0
	movl	$1048832, (%edi)
	.loc 4 177 0
	movl	$2097664, 4(%edi)
LBE497:
LBE496:
	.loc 1 717 0
	movl	16(%esp), %eax
	movl	(%eax), %edx
LBB500:
LBB501:
	.loc 4 74 0
	movl	88(%edx), %eax
LBB502:
LBB503:
	.loc 4 52 0
	movl	%edi, 4(%eax)
	.loc 4 53 0
	movl	%eax, (%edi)
	.loc 4 54 0
	leal	88(%edx), %eax
	movl	%eax, 4(%edi)
	.loc 4 55 0
	movl	%edi, 88(%edx)
LBE503:
LBE502:
LBE501:
LBE500:
	.loc 1 719 0
	addl	$20, %esp
	popl	%ebx
	popl	%esi
LVL139:
	popl	%edi
LVL140:
	popl	%ebp
	ret
LVL141:
L125:
LBB504:
LBB468:
	.loc 1 670 0
	movl	16(%esp), %eax
	movl	%eax, (%esp)
	movl	_kvm_arch_ops, %eax
	call	*140(%eax)
	jmp	L111
LVL142:
L124:
LBE468:
LBE504:
LBB505:
LBB494:
	.loc 1 476 0
	movl	$LC8, 12(%esp)
	movl	$476, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	jmp	L116
LBE494:
LBE505:
LFE142:
	.p2align 4,,15
.globl _kvm_mmu_free_some_pages
	.def	_kvm_mmu_free_some_pages;	.scl	2;	.type	32;	.endef
_kvm_mmu_free_some_pages:
LFB192:
	.loc 1 1287 0
LVL143:
	pushl	%ebx
LCFI33:
	.loc 1 1287 0
	movl	8(%esp), %ebx
	.loc 1 1289 0
	movl	(%ebx), %eax
	cmpl	$24, 96(%eax)
	jg	L131
LVL144:
	.p2align 4,,7
L132:
LBB506:
	.loc 1 1292 0
	movl	92(%eax), %edx
	movl	%ebx, %eax
	call	_kvm_mmu_zap_page
LBE506:
	.loc 1 1289 0
	movl	(%ebx), %eax
	cmpl	$24, 96(%eax)
	jle	L132
L131:
	.loc 1 1297 0
	popl	%ebx
LVL145:
	ret
LFE192:
	.p2align 4,,15
.globl _kvm_mmu_unprotect_page_virt
	.def	_kvm_mmu_unprotect_page_virt;	.scl	2;	.type	32;	.endef
_kvm_mmu_unprotect_page_virt:
LFB191:
	.loc 1 1280 0
LVL146:
	pushl	%edi
LCFI34:
	pushl	%esi
LCFI35:
	pushl	%ebx
LCFI36:
	subl	$8, %esp
LCFI37:
	.loc 1 1280 0
	movl	24(%esp), %edi
	.loc 1 1281 0
	movl	28(%esp), %eax
	movl	%edi, (%esp)
	movl	%eax, 4(%esp)
	call	*13536(%edi)
	.loc 1 1283 0
	shrdl	$12, %edx, %eax
LVL147:
LBB507:
LBB508:
	.loc 1 733 0
	movl	(%edi), %edx
LVL148:
LBE508:
LBE507:
	.loc 1 1283 0
	movl	%eax, %esi
LBB511:
LBB509:
	.loc 1 733 0
	movl	%esi, %eax
LVL149:
	andl	$255, %eax
	movl	100(%edx,%eax,4), %edx
LVL150:
	.loc 1 734 0
	xorl	%eax, %eax
LVL151:
	.loc 1 733 0
	testl	%edx, %edx
	jne	L136
LVL152:
	jmp	L138
LVL153:
	.p2align 4,,7
L137:
	testl	%ebx, %ebx
	je	L138
L141:
	movl	%ebx, %edx
LVL154:
L136:
	movl	(%edx), %ebx
LVL155:
LBE509:
	subl	$8, %edx
LVL156:
LBB510:
	.loc 1 734 0
	cmpl	16(%edx), %esi
	jne	L137
	testb	$1, 22(%edx)
	jne	L137
	.loc 1 737 0
	movl	%edi, %eax
LVL157:
	call	_kvm_mmu_zap_page
LVL158:
	.loc 1 733 0
	testl	%ebx, %ebx
	.loc 1 737 0
	movl	$1, %eax
LVL159:
	.loc 1 733 0
	jne	L141
LVL160:
	.p2align 4,,7
L138:
LBE510:
LBE511:
	.loc 1 1284 0
	addl	$8, %esp
LVL161:
	popl	%ebx
LVL162:
	popl	%esi
	popl	%edi
LVL163:
	ret
LFE191:
	.p2align 4,,15
.globl _kvm_mmu_pre_write
	.def	_kvm_mmu_pre_write;	.scl	2;	.type	32;	.endef
_kvm_mmu_pre_write:
LFB189:
	.loc 1 1203 0
LVL164:
	pushl	%ebp
LCFI38:
	pushl	%edi
LCFI39:
	pushl	%esi
LCFI40:
	pushl	%ebx
LCFI41:
	subl	$36, %esp
LCFI42:
	.loc 1 1203 0
	movl	60(%esp), %eax
	movl	64(%esp), %edx
LVL165:
	.loc 1 1210 0
	movl	%eax, %ebx
	andl	$4095, %ebx
	.loc 1 1204 0
	movl	%edx, %ecx
	.loc 1 1210 0
	movl	%ebx, 20(%esp)
LVL166:
	.loc 1 1219 0
	movl	56(%esp), %ebx
	.loc 1 1204 0
	movl	%eax, %edx
	shrdl	$12, %ecx, %edx
	movl	%edx, 12(%esp)
LVL167:
	.loc 1 1219 0
	cmpl	%edx, 13728(%ebx)
	je	L164
LVL168:
	.loc 1 1224 0
	movl	56(%esp), %eax
LVL169:
	movl	%edx, 13728(%eax)
	.loc 1 1225 0
	movl	$1, 13732(%eax)
	movl	$0, 24(%esp)
LVL170:
L145:
	.loc 1 1229 0
	movl	56(%esp), %ecx
	movzbl	12(%esp),%eax
	movl	(%ecx), %edx
	movl	100(%edx,%eax,4), %eax
LVL171:
	testl	%eax, %eax
	je	L160
LVL172:
	.loc 1 1254 0
	movl	20(%esp), %ebx
	.loc 1 1261 0
	movl	20(%esp), %edx
	.loc 1 1267 0
	movl	20(%esp), %ecx
	.loc 1 1254 0
	addl	%ebx, %ebx
	.loc 1 1261 0
	sall	$2, %edx
	.loc 1 1254 0
	movl	%ebx, 28(%esp)
LVL173:
	.loc 1 1234 0
	movl	68(%esp), %ebx
	.loc 1 1267 0
	andl	$4088, %ecx
	.loc 1 1261 0
	movl	%edx, 32(%esp)
LVL174:
	.loc 1 1234 0
	movl	20(%esp), %edx
	.loc 1 1267 0
	movl	%ecx, 8(%esp)
	.loc 1 1234 0
	leal	-1(%edx,%ebx), %ebx
	movl	%ebx, 4(%esp)
	jmp	L147
LVL175:
	.p2align 4,,7
L148:
	.loc 1 1270 0
	movl	16(%esp), %eax
	.loc 1 1229 0
	testl	%eax, %eax
	je	L160
LVL176:
L147:
	movl	(%eax), %edx
LBB512:
	leal	-8(%eax), %edi
LBE512:
	.loc 1 1230 0
	movl	12(%esp), %ecx
LVL177:
	.loc 1 1229 0
	movl	%edx, 16(%esp)
LVL178:
	.loc 1 1230 0
	cmpl	%ecx, 16(%edi)
	jne	L148
	testb	$1, 22(%edi)
	jne	L148
	.loc 1 1232 0
	movzbl	20(%edi), %ebx
LVL179:
	xorl	%eax, %eax
LVL180:
	.loc 1 1234 0
	movl	4(%esp), %edx
	.loc 1 1232 0
	movl	%ebx, %ecx
	andl	$15, %ecx
	cmpb	$2, %cl
	sete	%al
	.loc 1 1234 0
	xorl	20(%esp), %edx
	.loc 1 1232 0
	leal	-8(,%eax,4), %eax
	.loc 1 1234 0
	testl	%edx, %eax
	je	L165
L161:
	.loc 1 1247 0
	movl	56(%esp), %eax
	movl	%edi, %edx
	call	_kvm_mmu_zap_page
	.loc 1 1270 0
	movl	16(%esp), %eax
LVL181:
	.loc 1 1229 0
	testl	%eax, %eax
	jne	L147
LVL182:
	.p2align 4,,7
L160:
	.loc 1 1273 0
	addl	$36, %esp
	popl	%ebx
LVL183:
	popl	%esi
LVL184:
	popl	%edi
LVL185:
	popl	%ebp
LVL186:
	ret
LVL187:
	.p2align 4,,7
L165:
	.loc 1 1234 0
	movl	24(%esp), %ebp
LVL188:
	testl	%ebp, %ebp
	jne	L161
	.loc 1 1251 0
	movl	%ebx, %eax
	shrb	$4, %al
	.loc 1 1253 0
	cmpb	$2, %cl
	je	L166
	.loc 1 1266 0
	movl	24(%edi), %eax
	.loc 1 1267 0
	xorl	%ebp, %ebp
LVL189:
	.loc 1 1266 0
	movl	%eax, (%esp)
	call	___va
	.loc 1 1267 0
	movl	8(%esp), %edx
	leal	(%eax,%edx), %ebx
LVL190:
	jmp	L162
LVL191:
	.p2align 4,,7
L157:
LBB513:
LBB515:
LBB516:
	.loc 2 576 0
	movl	%ecx, %eax
	movl	%esi, %edx
	andl	$1048575, %edx
	andl	$-4096, %eax
	shrdl	$12, %edx, %eax
	movl	%eax, (%esp)
	call	_pfn_to_page
LVL192:
LBE516:
	.loc 1 1196 0
	movl	%ebx, %ecx
	movl	(%eax), %edx
LVL193:
	movl	56(%esp), %eax
LVL194:
	call	_mmu_page_remove_parent_pte
LVL195:
L156:
LBE515:
LBE513:
	.loc 1 1268 0
	testl	%ebp, %ebp
LBB518:
LBB514:
	.loc 1 1199 0
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
LBE514:
LBE518:
	.loc 1 1268 0
	je	L148
	.loc 1 1270 0
	addl	$8, %ebx
	xorl	%ebp, %ebp
L162:
LBB519:
LBB517:
	.loc 1 1190 0
	movl	(%ebx), %ecx
	movl	4(%ebx), %esi
	.loc 1 1191 0
	testb	$1, %cl
	je	L156
	.loc 1 1192 0
	movzbl	20(%edi), %eax
	andl	$-16, %eax
	cmpb	$16, %al
	jne	L157
	.loc 1 1193 0
	movl	56(%esp), %eax
	movl	%ebx, %edx
	call	_rmap_remove
LVL196:
	jmp	L156
LVL197:
	.p2align 4,,7
L166:
LBE517:
LBE519:
	.loc 1 1260 0
	cmpb	$2, %al
	movl	32(%esp), %ebx
	movl	$1, %ebp
LVL198:
	je	L155
LVL199:
	movl	28(%esp), %ebx
	xorw	%bp, %bp
LVL200:
L155:
	.loc 1 1266 0
	movl	24(%edi), %eax
	.loc 1 1267 0
	andl	$4088, %ebx
	.loc 1 1266 0
	movl	%eax, (%esp)
	call	___va
	.loc 1 1267 0
	leal	(%eax,%ebx), %ebx
LVL201:
	jmp	L162
LVL202:
	.p2align 4,,7
L164:
	.loc 1 1220 0
	movl	13732(%ebx), %eax
LVL203:
	addl	$1, %eax
	.loc 1 1221 0
	cmpl	$3, %eax
	.loc 1 1220 0
	movl	%eax, 13732(%ebx)
	.loc 1 1221 0
	setge	%al
	movzbl	%al, %eax
	movl	%eax, 24(%esp)
LVL204:
	jmp	L145
LFE189:
	.p2align 4,,15
	.def	_free_mmu_pages;	.scl	3;	.type	32;	.endef
_free_mmu_pages:
LFB193:
	.loc 1 1301 0
LVL205:
	pushl	%edi
LCFI43:
	pushl	%esi
LCFI44:
	movl	%eax, %esi
	pushl	%ebx
LCFI45:
	subl	$4, %esp
LCFI46:
	jmp	L177
LVL206:
	.p2align 4,,7
L178:
	.loc 1 1305 0
	movl	%esi, %eax
	call	_kvm_mmu_zap_page
LVL207:
L177:
	.loc 1 1304 0
	movl	(%esi), %eax
LBB520:
LBB521:
	.loc 4 305 0
	movl	88(%eax), %edx
LBE521:
LBE520:
	.loc 1 1304 0
	addl	$88, %eax
	cmpl	%eax, %edx
	jne	L178
LBB522:
LBB523:
	.loc 4 305 0
	movl	204(%esi), %ebx
LBE523:
LBE522:
	.loc 1 1309 0
	leal	204(%esi), %edi
	cmpl	%ebx, %edi
	je	L170
	.p2align 4,,7
L173:
LBB525:
LBB526:
	.loc 4 175 0
	movl	(%ebx), %edx
	movl	4(%ebx), %eax
LBB527:
LBB528:
	.loc 4 162 0
	movl	%eax, 4(%edx)
	.loc 4 163 0
	movl	%edx, (%eax)
LBE528:
LBE527:
LBE526:
LBE525:
	.loc 1 1313 0
	movl	28(%ebx), %edx
	movl	24(%ebx), %eax
LBB530:
LBB529:
	.loc 4 176 0
	movl	$1048832, (%ebx)
	.loc 4 177 0
	movl	$2097664, 4(%ebx)
LBE529:
LBE530:
	.loc 1 1313 0
	shrdl	$12, %edx, %eax
	movl	%eax, (%esp)
	call	_pfn_to_page
	movl	%eax, (%esp)
	call	___free_page
	.loc 1 1314 0
	movl	$-1, 24(%ebx)
	movl	$-1, 28(%ebx)
LBB531:
LBB524:
	.loc 4 305 0
	movl	204(%esi), %ebx
LBE524:
LBE531:
	.loc 1 1309 0
	cmpl	%edi, %ebx
	jne	L173
L170:
	.loc 1 1316 0
	movl	13556(%esi), %eax
	movl	%eax, (%esp)
	call	_free_page
	.loc 1 1317 0
	addl	$4, %esp
	popl	%ebx
	popl	%esi
LVL208:
	popl	%edi
	ret
LFE193:
	.p2align 4,,15
.globl _kvm_mmu_destroy
	.def	_kvm_mmu_destroy;	.scl	2;	.type	32;	.endef
_kvm_mmu_destroy:
LFB197:
	.loc 1 1381 0
LVL209:
	pushl	%ebx
LCFI47:
	subl	$16, %esp
LCFI48:
	.loc 1 1381 0
	movl	24(%esp), %ebx
	.loc 1 1382 0
	testl	%ebx, %ebx
	je	L191
LVL210:
L180:
	.loc 1 1384 0
	movl	%ebx, %eax
	call	_destroy_kvm_mmu
	.loc 1 1385 0
	movl	%ebx, %eax
	call	_free_mmu_pages
LBB532:
LBB533:
LBB534:
LBB535:
	.loc 1 234 0
	movl	13560(%ebx), %edx
	testl	%edx, %edx
	je	L190
	.p2align 4,,7
L187:
	.loc 1 235 0
	leal	-1(%edx), %eax
	movl	%eax, 13560(%ebx)
	movl	13560(%ebx,%edx,4), %eax
	movl	%eax, (%esp)
	call	_kfree
	.loc 1 234 0
	movl	13560(%ebx), %edx
	testl	%edx, %edx
	jne	L187
LBE535:
LBE534:
LBB536:
LBB537:
	movl	13644(%ebx), %edx
	testl	%edx, %edx
	je	L192
	.p2align 4,,7
L186:
	.loc 1 235 0
	leal	-1(%edx), %eax
	movl	%eax, 13644(%ebx)
	movl	13644(%ebx,%edx,4), %eax
	movl	%eax, (%esp)
	call	_kfree
L190:
	.loc 1 234 0
	movl	13644(%ebx), %edx
	testl	%edx, %edx
	jne	L186
L192:
LBE537:
LBE536:
LBE533:
LBE532:
	.loc 1 1387 0
	addl	$16, %esp
	popl	%ebx
LVL211:
	ret
LVL212:
L191:
	.loc 1 1382 0
	movl	$LC0, 12(%esp)
	movl	$1382, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	jmp	L180
LFE197:
	.p2align 4,,15
	.def	_mmu_alloc_pte_chain;	.scl	3;	.type	32;	.endef
_mmu_alloc_pte_chain:
LFB124:
	.loc 1 284 0
LVL213:
	pushl	%ebx
LCFI49:
	movl	%eax, %ebx
	subl	$12, %esp
LCFI50:
LBB538:
LBB539:
	.loc 1 267 0
	movl	13560(%eax), %edx
	testl	%edx, %edx
	jne	L194
	movl	$___FUNCTION__.2574, 4(%esp)
	movl	$LC7, (%esp)
	call	_printk
LVL214:
	movl	13560(%ebx), %edx
LVL215:
L194:
	.loc 1 268 0
	leal	-1(%edx), %eax
	movl	%eax, 13560(%ebx)
	movl	13560(%ebx,%edx,4), %ebx
LVL216:
	.loc 1 269 0
	movl	$28, 8(%esp)
	movl	$0, 4(%esp)
	movl	%ebx, (%esp)
	call	_memset
LBE539:
LBE538:
	.loc 1 287 0
	movl	%ebx, %eax
	addl	$12, %esp
	popl	%ebx
LVL217:
	ret
LFE124:
	.p2align 4,,15
	.def	_mmu_alloc_rmap_desc;	.scl	3;	.type	32;	.endef
_mmu_alloc_rmap_desc:
LFB126:
	.loc 1 296 0
LVL218:
	pushl	%ebx
LCFI51:
	movl	%eax, %ebx
	subl	$12, %esp
LCFI52:
LBB540:
LBB541:
	.loc 1 267 0
	movl	13644(%eax), %edx
	testl	%edx, %edx
	jne	L197
	movl	$___FUNCTION__.2574, 4(%esp)
	movl	$LC7, (%esp)
	call	_printk
LVL219:
	movl	13644(%ebx), %edx
LVL220:
L197:
	.loc 1 268 0
	leal	-1(%edx), %eax
	movl	%eax, 13644(%ebx)
	movl	13644(%ebx,%edx,4), %ebx
LVL221:
	.loc 1 269 0
	movl	$20, 8(%esp)
	movl	$0, 4(%esp)
	movl	%ebx, (%esp)
	call	_memset
LBE541:
LBE540:
	.loc 1 303 0
	movl	%ebx, %eax
	addl	$12, %esp
	popl	%ebx
LVL222:
	ret
LFE126:
	.p2align 4,,15
	.def	_rmap_add;	.scl	3;	.type	32;	.endef
_rmap_add:
LFB128:
	.loc 1 323 0
LVL223:
	subl	$16, %esp
LCFI53:
	movl	%esi, 8(%esp)
LCFI54:
	movl	%edx, %esi
	movl	%edi, 12(%esp)
LCFI55:
	movl	%eax, %edi
	movl	%ebx, 4(%esp)
LCFI56:
	.loc 1 330 0
	movl	(%edx), %ecx
	movl	4(%edx), %ebx
	movl	%ecx, %eax
LVL224:
	andl	$3, %eax
	cmpl	$3, %eax
	je	L213
LVL225:
L210:
	.loc 1 360 0
	movl	4(%esp), %ebx
LVL226:
	movl	8(%esp), %esi
LVL227:
	movl	12(%esp), %edi
LVL228:
	addl	$16, %esp
	ret
LVL229:
	.p2align 4,,7
L213:
	.loc 1 335 0
	movl	%ecx, %eax
	movl	%ebx, %edx
LVL230:
	andl	$1048575, %edx
	andl	$-4096, %eax
	shrdl	$12, %edx, %eax
	movl	%eax, (%esp)
	call	_pfn_to_page
	movl	%eax, %ebx
LVL231:
	.loc 1 336 0
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L214
	.loc 1 339 0
	testb	$1, %al
	je	L215
	.loc 1 347 0
	movl	%eax, %ebx
LVL232:
	andl	$-2, %ebx
	jmp	L205
	.p2align 4,,7
L216:
	.loc 1 348 0
	movl	16(%ebx), %eax
LVL233:
	testl	%eax, %eax
	je	L204
	movl	%eax, %ebx
LVL234:
L205:
	movl	12(%ebx), %eax
	testl	%eax, %eax
	jne	L216
	movl	%ebx, %eax
LVL235:
L209:
	.loc 1 354 0
	movl	(%eax), %ebx
	xorl	%edx, %edx
LVL236:
	testl	%ebx, %ebx
	je	L207
L211:
	addl	$1, %edx
	movl	(%eax,%edx,4), %ecx
	testl	%ecx, %ecx
	jne	L211
L207:
	.loc 1 356 0
	movl	%esi, (%eax,%edx,4)
	jmp	L210
LVL237:
	.p2align 4,,7
L214:
	.loc 1 338 0
	movl	%esi, (%ebx)
	jmp	L210
LVL238:
	.p2align 4,,7
L204:
	.loc 1 351 0
	movl	%edi, %eax
LVL239:
	.p2align 4,,5
	call	_mmu_alloc_rmap_desc
	movl	%eax, 16(%ebx)
LVL240:
	.p2align 4,,2
	jmp	L209
LVL241:
	.p2align 4,,7
L215:
	.loc 1 341 0
	movl	%edi, %eax
	call	_mmu_alloc_rmap_desc
	.loc 1 342 0
	movl	(%ebx), %edx
	.loc 1 343 0
	movl	%esi, 4(%eax)
LVL242:
	.loc 1 342 0
	movl	%edx, (%eax)
	.loc 1 344 0
	orl	$1, %eax
	movl	%eax, (%ebx)
	jmp	L210
LFE128:
	.p2align 4,,15
	.def	_page_header_update_slot;	.scl	3;	.type	32;	.endef
_page_header_update_slot:
LFB144:
	.loc 1 744 0
LVL243:
	pushl	%esi
LCFI57:
	movl	%eax, %esi
	pushl	%ebx
LCFI58:
	movl	%edx, %ebx
	subl	$8, %esp
LCFI59:
	.loc 1 744 0
	movl	24(%esp), %edx
LVL244:
	movl	20(%esp), %eax
LVL245:
	.loc 1 747 0
	movl	%esi, (%esp)
	shrdl	$12, %edx, %eax
LVL246:
	movl	%eax, 4(%esp)
	call	_gfn_to_memslot
LVL247:
LBB542:
LBB543:
	.loc 2 571 0
	leal	8(%esi), %edx
LBE543:
LBE542:
	.loc 1 748 0
	movl	%ebx, (%esp)
LBB545:
LBB544:
	.loc 2 571 0
	subl	%edx, %eax
	sarl	$2, %eax
	imull	$-858993459, %eax, %esi
LVL248:
LBE544:
LBE545:
	.loc 1 748 0
	call	___pa
LBB546:
	.loc 2 576 0
	shrdl	$12, %edx, %eax
	movl	%eax, (%esp)
	call	_pfn_to_page
LBE546:
LBB547:
LBB548:
	.loc 3 299 0
	movl	(%eax), %edx
LVL249:
	leal	32(%edx), %eax
LVL250:
/APP
 # 299 "include/linux/winkvmstab.h" 1
	btsl %esi,32(%edx)
 # 0 "" 2
/NO_APP
LBE548:
LBE547:
	.loc 1 753 0
	addl	$8, %esp
	popl	%ebx
LVL251:
	popl	%esi
	ret
LFE144:
	.section .rdata,"dr"
	.align 4
LC9:
	.ascii "is_empty_shadow_page(page->page_hpa)\0"
	.text
	.p2align 4,,15
	.def	_kvm_mmu_get_page;	.scl	3;	.type	32;	.endef
_kvm_mmu_get_page:
LFB139:
	.loc 1 610 0
LVL252:
	pushl	%ebp
LCFI60:
	pushl	%edi
LCFI61:
	movl	%edx, %edi
	pushl	%esi
LCFI62:
	pushl	%ebx
LCFI63:
	movl	%ecx, %ebx
	subl	$44, %esp
LCFI64:
	.loc 1 620 0
	movl	$0, 40(%esp)
	.loc 1 610 0
	movl	64(%esp), %esi
	movl	%eax, 28(%esp)
	.loc 1 621 0
	movl	13548(%eax), %ecx
LVL253:
	.loc 1 622 0
	movl	%esi, %edx
LVL254:
	movl	%ecx, %eax
LVL255:
	sall	$4, %edx
	andl	$15, %eax
	orl	%edx, %eax
	.loc 1 623 0
	movzbl	68(%esp), %edx
	.loc 1 622 0
	movb	%al, 40(%esp)
	.loc 1 623 0
	movzbl	42(%esp), %eax
	andl	$1, %edx
	andl	$-2, %eax
	orl	%edx, %eax
	.loc 1 624 0
	cmpl	$2, %ecx
	.loc 1 623 0
	movb	%al, 42(%esp)
	.loc 1 624 0
	jg	L220
LVL256:
	.loc 1 625 0
	leal	12(%esi,%esi,8), %ecx
	.loc 1 627 0
	movzbl	41(%esp), %edx
	movl	$1, %eax
	.loc 1 625 0
	shrl	%cl, %ebx
	.loc 1 627 0
	movl	%esi, %ecx
	sall	%cl, %eax
	subl	$1, %eax
	andl	%ebx, %eax
	andl	$-4, %edx
	andl	$3, %eax
	orl	%eax, %edx
	movb	%dl, 41(%esp)
L220:
	.loc 1 632 0
	movl	28(%esp), %edx
	.loc 1 631 0
	movl	%edi, %eax
LVL257:
	andl	$255, %eax
	.loc 1 633 0
	addl	$24, %eax
LVL258:
	.loc 1 632 0
	movl	(%edx), %edx
	.loc 1 633 0
	movl	%eax, 16(%esp)
	.loc 1 632 0
	movl	%edx, 32(%esp)
	.loc 1 633 0
	movl	4(%edx,%eax,4), %ebx
LVL259:
	testl	%ebx, %ebx
	je	L221
LVL260:
	.loc 1 634 0
	movl	40(%esp), %esi
	jmp	L222
LVL261:
	.p2align 4,,7
L223:
	.loc 1 633 0
	movl	(%ebx), %ebx
	testl	%ebx, %ebx
	je	L221
L222:
	movl	(%ebx), %eax
LBB578:
	leal	-8(%ebx), %ebp
LBE578:
	movl	%eax, (%esp)
	call	_prefetch
	.loc 1 634 0
	cmpl	%edi, 16(%ebp)
	jne	L223
	cmpl	%esi, 20(%ebp)
	jne	L223
LBB579:
LBB584:
	.loc 1 515 0
	movl	72(%esp), %edi
LVL262:
	testl	%edi, %edi
	.p2align 4,,2
	je	L224
	.loc 1 517 0
	movl	40(%ebp), %esi
	testl	%esi, %esi
	je	L255
LVL263:
L225:
	.loc 1 530 0
	movl	48(%ebp), %ebx
LVL264:
	testl	%ebx, %ebx
	jne	L253
	.p2align 4,,3
	jmp	L227
LVL265:
	.p2align 4,,7
L231:
	movl	(%ebx), %ebx
	testl	%ebx, %ebx
	.p2align 4,,3
	je	L227
LVL266:
L253:
	movl	(%ebx), %eax
LVL267:
	movl	%eax, (%esp)
	call	_prefetch
LVL268:
LBE584:
	leal	-20(%ebx), %edx
LVL269:
LBB583:
	.loc 1 531 0
	movl	16(%edx), %eax
	testl	%eax, %eax
	jne	L231
	.loc 1 530 0
	xorl	%eax, %eax
LVL270:
L230:
	.loc 1 534 0
	movl	(%edx,%eax,4), %ecx
	testl	%ecx, %ecx
	je	L256
	.loc 1 533 0
	addl	$1, %eax
	cmpl	$5, %eax
	jne	L230
	.loc 1 530 0
	movl	(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L253
LVL271:
L227:
LBE583:
	.loc 1 539 0
	movl	28(%esp), %eax
LVL272:
	call	_mmu_alloc_pte_chain
LVL273:
LBB582:
	.loc 1 540 0
	testl	%eax, %eax
LVL274:
LBE582:
	.loc 1 539 0
	movl	%eax, %ebx
LVL275:
LBB581:
	.loc 1 540 0
	je	L257
L233:
LBB589:
LBB590:
	.loc 4 804 0
	movl	48(%ebp), %eax
LVL276:
	leal	20(%ebx), %edx
	.loc 4 806 0
	testl	%eax, %eax
	.loc 4 805 0
	movl	%eax, 20(%ebx)
	.loc 4 806 0
	je	L234
	.loc 4 807 0
	movl	%edx, 4(%eax)
L234:
	.loc 4 809 0
	leal	48(%ebp), %eax
LVL277:
	.loc 4 808 0
	movl	%edx, 48(%ebp)
	.loc 4 809 0
	movl	%eax, 24(%ebx)
LBE590:
LBE589:
	.loc 1 542 0
	movl	72(%esp), %eax
	movl	%eax, (%ebx)
LVL278:
	.p2align 4,,7
L224:
LBE581:
LBE579:
	.loc 1 653 0
	addl	$44, %esp
	movl	%ebp, %eax
LVL279:
	popl	%ebx
LVL280:
	popl	%esi
LVL281:
	popl	%edi
LVL282:
	popl	%ebp
LVL283:
	ret
LVL284:
	.p2align 4,,7
L221:
LBB595:
LBB599:
LBB608:
LBB609:
	.loc 4 305 0
	movl	28(%esp), %edx
LBE609:
LBE608:
	.loc 1 493 0
	xorl	%ebp, %ebp
LBB611:
LBB610:
	.loc 4 305 0
	movl	204(%edx), %ebx
LVL285:
LBE610:
LBE611:
	.loc 1 493 0
	movl	%edx, %eax
	addl	$204, %eax
	cmpl	%eax, %ebx
	je	L224
LBB612:
LBB613:
	.loc 4 175 0
	movl	(%ebx), %edx
LBE613:
LBE612:
LBE599:
	.loc 1 496 0
	movl	%ebx, %ebp
LBB598:
LBB607:
LBB616:
	.loc 4 175 0
	movl	4(%ebx), %eax
LBB614:
LBB615:
	.loc 4 162 0
	movl	%eax, 4(%edx)
	.loc 4 163 0
	movl	%edx, (%eax)
LBE615:
LBE614:
	.loc 4 177 0
	movl	$2097664, 4(%ebx)
	.loc 4 176 0
	movl	$1048832, (%ebx)
LBE616:
LBE607:
	.loc 1 498 0
	movl	28(%esp), %ecx
	movl	(%ecx), %edx
LBB600:
LBB601:
	.loc 4 74 0
	movl	88(%edx), %eax
LBB602:
LBB603:
	.loc 4 52 0
	movl	%ebx, 4(%eax)
	.loc 4 53 0
	movl	%eax, (%ebx)
	.loc 4 54 0
	leal	88(%edx), %eax
	.loc 4 55 0
	movl	%ebx, 88(%edx)
LBE603:
LBE602:
LBE601:
LBE600:
LBE598:
	.loc 1 499 0
	movl	28(%ebx), %edx
LBB597:
LBB617:
LBB606:
LBB605:
LBB604:
	.loc 4 54 0
	movl	%eax, 4(%ebx)
LBE604:
LBE605:
LBE606:
LBE617:
LBE597:
	.loc 1 499 0
	movl	24(%ebx), %eax
	call	_is_empty_shadow_page
LBB596:
	testl	%eax, %eax
	je	L258
L237:
	.loc 1 500 0
	movl	$0, 32(%ebx)
	.loc 1 501 0
	movl	$1, 36(%ebx)
	.loc 1 502 0
	movl	$0, 40(%ebx)
	.loc 1 503 0
	movl	72(%esp), %eax
	movl	%eax, 48(%ebx)
	.loc 1 504 0
	movl	28(%esp), %edx
	movl	(%edx), %eax
	subl	$1, 96(%eax)
LBE596:
LBE595:
	.loc 1 646 0
	movl	%edi, 16(%ebx)
	.loc 1 647 0
	movl	40(%esp), %eax
	movl	%eax, 20(%ebx)
LBB619:
LBB620:
	.loc 4 804 0
	movl	32(%esp), %edx
	movl	16(%esp), %ecx
	movl	4(%edx,%ecx,4), %eax
LVL286:
	leal	8(%ebx), %edx
	.loc 4 806 0
	testl	%eax, %eax
	.loc 4 805 0
	movl	%eax, 8(%ebx)
	.loc 4 806 0
	je	L238
	.loc 4 807 0
	movl	%edx, 4(%eax)
L238:
	.loc 4 808 0
	movl	16(%esp), %ecx
	movl	32(%esp), %eax
LVL287:
	movl	%edx, 4(%eax,%ecx,4)
	.loc 4 809 0
	movl	32(%esp), %edx
	leal	4(%edx,%ecx,4), %eax
	movl	%eax, 12(%ebx)
LBE620:
LBE619:
	.loc 1 649 0
	movl	68(%esp), %eax
	testl	%eax, %eax
	jne	L224
LVL288:
LBB621:
	.loc 1 434 0
	movl	28(%esp), %ecx
	movl	%edi, 4(%esp)
	movl	(%ecx), %eax
	movl	%eax, (%esp)
	call	_gfn_to_memslot
LBB623:
	.loc 1 435 0
	testl	%eax, %eax
LVL289:
LBE623:
	.loc 1 434 0
	movl	%eax, %ebx
LVL290:
LBB626:
	.loc 1 435 0
	je	L259
L239:
LBB624:
LBB625:
	.loc 2 438 0
	movl	12(%ebx), %eax
	subl	(%ebx), %edi
	movl	(%eax,%edi,4), %eax
	movl	%eax, 36(%esp)
LVL291:
LBE625:
LBE624:
	.loc 1 438 0
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L250
	jmp	L224
LVL292:
	.p2align 4,,7
L244:
	.loc 1 449 0
	testb	$2, %al
	je	L260
L245:
	.loc 1 451 0
	movl	28(%esp), %eax
	movl	%edi, %edx
	call	_rmap_remove
	.loc 1 452 0
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	movl	_kvm_arch_ops, %eax
	call	*140(%eax)
	.loc 1 453 0
	andl	$-3, (%edi)
	andl	$-1, 4(%edi)
	.loc 1 438 0
	movl	36(%esp), %edx
	movl	(%edx), %eax
	testl	%eax, %eax
	je	L224
LVL293:
L250:
	.loc 1 439 0
	testb	$1, %al
	.loc 1 440 0
	movl	%eax, %edi
LVL294:
	.loc 1 439 0
	je	L241
	.loc 1 443 0
	andl	$-2, %eax
	movl	(%eax), %edi
L241:
	.loc 1 445 0
	testl	%edi, %edi
	je	L261
L242:
	.loc 1 446 0
	movl	(%edi), %eax
	movl	4(%edi), %edx
LBE626:
	movl	36(%esp), %ecx
LBB627:
	andl	$-4096, %eax
	andl	$1048575, %edx
	movl	%edx, 24(%esp)
	movl	24(%esp), %esi
	movl	%eax, 20(%esp)
	movl	20(%esp), %ebx
LVL295:
LBE627:
	movl	%ecx, (%esp)
	call	_page_to_pfn
LBB628:
	shrdl	$12, %esi, %ebx
	shrl	$12, %esi
	movl	%esi, %edx
	xorl	%ebx, %eax
	orl	%eax, %edx
	je	L243
LVL296:
	movl	$___FUNCTION__.2700, 4(%esp)
	movl	$LC7, (%esp)
	call	_printk
L243:
	.loc 1 448 0
	movl	(%edi), %eax
	testb	$1, %al
	jne	L244
	movl	$___FUNCTION__.2700, 4(%esp)
	movl	$LC7, (%esp)
	call	_printk
	movl	(%edi), %eax
	.loc 1 449 0
	testb	$2, %al
	jne	L245
L260:
	movl	$___FUNCTION__.2700, 4(%esp)
	movl	$LC7, (%esp)
	call	_printk
	jmp	L245
LVL297:
	.p2align 4,,7
L258:
LBE628:
LBE621:
LBB630:
LBB618:
	.loc 1 499 0
	movl	$LC9, 12(%esp)
	movl	$499, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	jmp	L237
LVL298:
L255:
LBE618:
LBE630:
LBB631:
LBB592:
LBB586:
	.loc 1 518 0
	movl	48(%ebp), %esi
LVL299:
	.loc 1 520 0
	testl	%esi, %esi
	je	L262
	.loc 1 524 0
	movl	$1, 40(%ebp)
LBE586:
LBE592:
	.loc 1 525 0
	movl	28(%esp), %eax
	call	_mmu_alloc_pte_chain
LBB593:
LBB591:
LBB587:
LBB588:
	.loc 4 808 0
	leal	20(%eax), %edx
LVL300:
	.loc 4 805 0
	movl	$0, 20(%eax)
	.loc 4 808 0
	movl	%edx, 48(%ebp)
	.loc 4 809 0
	leal	40(%ebx), %edx
	movl	%edx, 24(%eax)
LBE588:
LBE587:
	.loc 1 528 0
	movl	%esi, (%eax)
	jmp	L225
LVL301:
	.p2align 4,,7
L261:
LBE591:
LBE593:
LBE631:
LBB632:
LBB622:
	.loc 1 445 0
	movl	$___FUNCTION__.2700, 4(%esp)
	movl	$LC7, (%esp)
	call	_printk
	jmp	L242
LVL302:
L256:
LBE622:
LBE632:
LBB633:
LBB580:
	.loc 1 535 0
	movl	72(%esp), %ecx
	movl	%ecx, (%edx,%eax,4)
	jmp	L224
LVL303:
L262:
LBB585:
	.loc 1 521 0
	movl	72(%esp), %ecx
	movl	%ecx, 48(%ebp)
	jmp	L224
LVL304:
L259:
LBE585:
LBE580:
LBE633:
LBB634:
LBB629:
	.loc 1 435 0
	movl	$___FUNCTION__.2700, 4(%esp)
	movl	$LC7, (%esp)
	call	_printk
	jmp	L239
LVL305:
L257:
LBE629:
LBE634:
LBB635:
LBB594:
	.loc 1 540 0
	movl	$___FUNCTION__.2788, 4(%esp)
	movl	$LC7, (%esp)
	call	_printk
	jmp	L233
LBE594:
LBE635:
LFE139:
	.section .rdata,"dr"
LC10:
	.ascii "!VALID_PAGE(root)\0"
	.text
	.p2align 4,,15
	.def	_mmu_alloc_roots;	.scl	3;	.type	32;	.endef
_mmu_alloc_roots:
LFB151:
	.loc 1 870 0
LVL306:
	pushl	%ebp
LCFI65:
	pushl	%edi
LCFI66:
	pushl	%esi
LCFI67:
	movl	%eax, %esi
	pushl	%ebx
LCFI68:
	.loc 1 875 0
	xorl	%ebx, %ebx
LVL307:
	.loc 1 870 0
	subl	$16, %esp
LCFI69:
	.loc 1 875 0
	movl	104(%eax), %ebp
LVL308:
	shrl	$12, %ebp
LVL309:
L267:
LBB636:
	.loc 1 893 0
	movl	13556(%esi), %edx
LVL310:
LBE636:
	.loc 1 870 0
	leal	0(,%ebx,8), %edi
LBB637:
	.loc 1 893 0
	movl	(%edx,%ebx,8), %eax
	andl	4(%edx,%edi), %eax
	addl	$1, %eax
	je	L264
	movl	$LC10, 12(%esp)
	movl	$893, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
LVL311:
L264:
	.loc 1 894 0
	movl	13548(%esi), %eax
	cmpl	$3, %eax
	je	L270
	.loc 1 896 0
	cmpl	$1, %eax
	sbbl	%eax, %eax
	notl	%eax
	andl	%eax, %ebp
L266:
	.loc 1 898 0
	movl	96(%esi), %eax
	movl	%ebx, %ecx
LVL312:
	movl	%ebp, %edx
	sall	$30, %ecx
LBE637:
	.loc 1 890 0
	addl	$1, %ebx
LBB638:
	.loc 1 898 0
	movl	$0, 8(%esp)
	movl	$2, (%esp)
	notl	%eax
	shrl	$31, %eax
	movl	%eax, 4(%esp)
	movl	%esi, %eax
	call	_kvm_mmu_get_page
	.loc 1 901 0
	movl	24(%eax), %edx
LVL313:
	.loc 1 902 0
	addl	$1, 44(%eax)
	.loc 1 901 0
	movl	28(%eax), %ecx
LVL314:
	.loc 1 903 0
	movl	13556(%esi), %eax
LVL315:
	orl	$1, %edx
LBE638:
	.loc 1 890 0
	cmpl	$4, %ebx
LBB639:
	.loc 1 903 0
	movl	%edx, (%eax,%edi)
	movl	%ecx, 4(%eax,%edi)
LBE639:
	.loc 1 890 0
	jne	L267
	.loc 1 905 0
	movl	13556(%esi), %eax
	movl	%eax, (%esp)
	call	___pa
LVL316:
	movl	%eax, 13540(%esi)
	movl	%edx, 13544(%esi)
	.loc 1 906 0
	addl	$16, %esp
	popl	%ebx
LVL317:
	popl	%esi
LVL318:
	popl	%edi
	popl	%ebp
LVL319:
	ret
LVL320:
	.p2align 4,,7
L270:
LBB640:
	.loc 1 895 0
	movl	136(%esi,%ebx,8), %eax
	movl	140(%esi,%ebx,8), %edx
	shrdl	$12, %edx, %eax
	movl	%eax, %ebp
	jmp	L266
LBE640:
LFE151:
	.section .rdata,"dr"
	.align 4
LC11:
	.ascii "!VALID_PAGE(vcpu->mmu.root_hpa)\0"
LC12:
	.ascii "VALID_PAGE(context->root_hpa)\0"
	.text
	.p2align 4,,15
	.def	_init_kvm_mmu;	.scl	3;	.type	32;	.endef
_init_kvm_mmu:
LFB185:
	.loc 1 1138 0
LVL321:
	pushl	%ebx
LCFI70:
	movl	%eax, %ebx
	subl	$16, %esp
LCFI71:
	.loc 1 1140 0
	testl	%eax, %eax
	je	L281
LVL322:
L272:
	.loc 1 1141 0
	movl	13540(%ebx), %eax
	andl	13544(%ebx), %eax
	addl	$1, %eax
	je	L273
	movl	$LC11, 12(%esp)
	movl	$1141, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
L273:
	.loc 1 1143 0
	movl	96(%ebx), %eax
	testl	%eax, %eax
	js	L274
LBB658:
LBB659:
	.loc 1 961 0
	movl	%ebx, %eax
	.loc 1 955 0
	movl	$_nonpaging_new_cr3, 13524(%ebx)
	.loc 1 956 0
	movl	$_nonpaging_page_fault, 13528(%ebx)
	.loc 1 957 0
	movl	$_nonpaging_gva_to_gpa, 13536(%ebx)
	.loc 1 958 0
	movl	$_nonpaging_free, 13532(%ebx)
	.loc 1 959 0
	movl	$0, 13548(%ebx)
	.loc 1 960 0
	movl	$3, 13552(%ebx)
	.loc 1 961 0
	call	_mmu_alloc_roots
	.loc 1 962 0
	movl	13540(%ebx), %edx
	movl	%edx, %eax
	andl	13544(%ebx), %eax
	addl	$1, %eax
	je	L282
L275:
	.loc 1 963 0
	movl	_kvm_arch_ops, %eax
	movl	%ebx, (%esp)
	movl	%edx, 4(%esp)
	call	*84(%eax)
LBE659:
LBE658:
	.loc 1 1156 0
	xorl	%eax, %eax
	addl	$16, %esp
	popl	%ebx
LVL323:
	ret
LVL324:
	.p2align 4,,7
L274:
	.loc 1 1149 0
	testb	$32, 128(%ebx)
	jne	L283
LBB661:
LBB662:
	.loc 1 1122 0
	movl	%ebx, %eax
	.loc 1 1116 0
	movl	$_paging_new_cr3, 13524(%ebx)
	.loc 1 1117 0
	movl	$_paging32_page_fault, 13528(%ebx)
	.loc 1 1118 0
	movl	$_paging32_gva_to_gpa, 13536(%ebx)
	.loc 1 1119 0
	movl	$_paging_free, 13532(%ebx)
	.loc 1 1120 0
	movl	$2, 13548(%ebx)
	.loc 1 1121 0
	movl	$3, 13552(%ebx)
	.loc 1 1122 0
	call	_mmu_alloc_roots
	.loc 1 1123 0
	movl	13540(%ebx), %edx
	movl	%edx, %eax
	andl	13544(%ebx), %eax
	addl	$1, %eax
	je	L284
L279:
	.loc 1 1124 0
	movl	104(%ebx), %eax
	movl	%ebx, (%esp)
	andl	$24, %eax
	orl	%edx, %eax
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	call	*84(%eax)
LBE662:
LBE661:
	.loc 1 1156 0
	xorl	%eax, %eax
	addl	$16, %esp
	popl	%ebx
LVL325:
	ret
LVL326:
	.p2align 4,,7
L283:
LBB664:
LBB665:
LBB666:
LBB667:
	.loc 1 1095 0
	movl	%ebx, %eax
	.loc 1 1089 0
	movl	$_paging_new_cr3, 13524(%ebx)
	.loc 1 1090 0
	movl	$_paging64_page_fault, 13528(%ebx)
	.loc 1 1091 0
	movl	$_paging64_gva_to_gpa, 13536(%ebx)
	.loc 1 1092 0
	movl	$_paging_free, 13532(%ebx)
	.loc 1 1093 0
	movl	$3, 13548(%ebx)
	.loc 1 1094 0
	movl	$3, 13552(%ebx)
	.loc 1 1095 0
	call	_mmu_alloc_roots
	.loc 1 1096 0
	movl	13540(%ebx), %edx
	movl	%edx, %eax
	andl	13544(%ebx), %eax
	addl	$1, %eax
	jne	L279
	movl	$LC12, 12(%esp)
	movl	$1096, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	movl	13540(%ebx), %edx
	jmp	L279
	.p2align 4,,7
L282:
LBE667:
LBE666:
LBE665:
LBE664:
LBB668:
LBB660:
	.loc 1 962 0
	movl	$LC12, 12(%esp)
	movl	$962, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	movl	13540(%ebx), %edx
	jmp	L275
LVL327:
	.p2align 4,,7
L281:
LBE660:
LBE668:
	.loc 1 1140 0
	movl	$LC0, 12(%esp)
	movl	$1140, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
LVL328:
	jmp	L272
	.p2align 4,,7
L284:
LBB669:
LBB663:
	.loc 1 1123 0
	movl	$LC12, 12(%esp)
	movl	$1123, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	movl	13540(%ebx), %edx
	jmp	L279
LBE663:
LBE669:
LFE185:
	.section .rdata,"dr"
	.align 4
LC13:
	.ascii "!list_empty(&vcpu->free_pages)\0"
	.text
	.p2align 4,,15
.globl _kvm_mmu_setup
	.def	_kvm_mmu_setup;	.scl	2;	.type	32;	.endef
_kvm_mmu_setup:
LFB196:
	.loc 1 1372 0
LVL329:
	pushl	%ebx
LCFI72:
	subl	$16, %esp
LCFI73:
	.loc 1 1372 0
	movl	24(%esp), %ebx
	.loc 1 1373 0
	testl	%ebx, %ebx
	je	L290
LVL330:
L286:
	.loc 1 1374 0
	movl	13540(%ebx), %eax
	andl	13544(%ebx), %eax
	addl	$1, %eax
	je	L287
	movl	$LC11, 12(%esp)
	movl	$1374, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
L287:
	.loc 1 1375 0
	leal	204(%ebx), %eax
	cmpl	%eax, 204(%ebx)
	je	L291
L288:
	.loc 1 1377 0
	movl	%ebx, %eax
	.loc 1 1378 0
	addl	$16, %esp
	popl	%ebx
LVL331:
	.loc 1 1377 0
	jmp	_init_kvm_mmu
LVL332:
	.p2align 4,,7
L291:
	.loc 1 1375 0
	movl	$LC13, 12(%esp)
	movl	$1375, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	jmp	L288
	.p2align 4,,7
L290:
	.loc 1 1373 0
	movl	$LC0, 12(%esp)
	movl	$1373, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	jmp	L286
LFE196:
	.p2align 4,,15
	.def	_paging_new_cr3;	.scl	3;	.type	32;	.endef
_paging_new_cr3:
LFB157:
	.loc 1 979 0
LVL333:
	pushl	%ebx
LCFI74:
	subl	$8, %esp
LCFI75:
	.loc 1 979 0
	movl	16(%esp), %ebx
	.loc 1 981 0
	movl	%ebx, %eax
	call	_mmu_free_roots
	.loc 1 982 0
	movl	(%ebx), %eax
	cmpl	$4, 96(%eax)
	jle	L295
LVL334:
L293:
	.loc 1 984 0
	movl	%ebx, %eax
	call	_mmu_alloc_roots
LBB670:
LBB671:
	.loc 1 975 0
	movl	_kvm_arch_ops, %eax
	.loc 1 974 0
	addl	$1, _kvm_stat+8
	.loc 1 975 0
	movl	%ebx, (%esp)
	call	*140(%eax)
LBE671:
LBE670:
	.loc 1 986 0
	movl	13540(%ebx), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	movl	_kvm_arch_ops, %eax
	call	*84(%eax)
	.loc 1 987 0
	addl	$8, %esp
	popl	%ebx
LVL335:
	ret
LVL336:
L295:
	.loc 1 983 0
	movl	%ebx, (%esp)
	call	_kvm_mmu_free_some_pages
	.p2align 4,,4
	jmp	L293
LFE157:
	.section .rdata,"dr"
LC14:
	.ascii "(gpa & HPA_ERR_MASK) == 0\0"
	.text
	.p2align 4,,15
.globl _gpa_to_hpa
	.def	_gpa_to_hpa;	.scl	2;	.type	32;	.endef
_gpa_to_hpa:
LFB146:
	.loc 1 763 0
LVL337:
	subl	$28, %esp
LCFI76:
	movl	%edi, 24(%esp)
LCFI77:
	movl	40(%esp), %edi
LVL338:
	movl	%esi, 20(%esp)
LCFI78:
	movl	36(%esp), %esi
	movl	%ebx, 16(%esp)
LCFI79:
	.loc 1 767 0
	testl	%edi, %edi
	js	L301
LVL339:
L297:
	.loc 1 768 0
	movl	%edi, %edx
	movl	%esi, %eax
	shrdl	$12, %edx, %eax
	movl	%eax, 4(%esp)
	movl	%eax, %ebx
	movl	32(%esp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_gfn_to_memslot
	.loc 1 769 0
	testl	%eax, %eax
LVL340:
	je	L302
	.loc 1 772 0
	subl	(%eax), %ebx
	movl	12(%eax), %eax
LVL341:
	movl	(%eax,%ebx,4), %eax
	movl	%eax, (%esp)
	call	_page_to_pfn
	xorl	%edx, %edx
	movl	%esi, %ecx
LVL342:
	andl	$4095, %ecx
	shldl	$12, %eax, %edx
	sall	$12, %eax
	orl	%eax, %ecx
LVL343:
L299:
	.loc 1 774 0
	movl	%ecx, %eax
LVL344:
	movl	16(%esp), %ebx
	movl	20(%esp), %esi
	movl	24(%esp), %edi
	addl	$28, %esp
	ret
LVL345:
	.p2align 4,,7
L302:
	.loc 1 770 0
	movl	%edi, %edx
LVL346:
	movl	%esi, %ecx
	orl	$-2147483648, %edx
	jmp	L299
LVL347:
	.p2align 4,,7
L301:
	.loc 1 767 0
	movl	$LC14, 12(%esp)
	movl	$767, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	jmp	L297
LFE146:
	.p2align 4,,15
.globl _gva_to_hpa
	.def	_gva_to_hpa;	.scl	2;	.type	32;	.endef
_gva_to_hpa:
LFB147:
	.loc 1 777 0
LVL348:
	subl	$24, %esp
LCFI80:
	movl	%edi, 20(%esp)
LCFI81:
	.loc 1 778 0
	movl	32(%esp), %eax
	.loc 1 777 0
	movl	28(%esp), %edi
	movl	%ebx, 12(%esp)
LCFI82:
	movl	%esi, 16(%esp)
LCFI83:
	.loc 1 778 0
	movl	%eax, 4(%esp)
	movl	%edi, (%esp)
	call	*13536(%edi)
	.loc 1 780 0
	movl	$-1, %ecx
	.loc 1 778 0
	movl	%eax, %ebx
LVL349:
	.loc 1 780 0
	andl	%edx, %eax
LVL350:
	addl	$1, %eax
	.loc 1 778 0
	movl	%edx, %esi
LVL351:
	.loc 1 780 0
	movl	$-1, %edx
	je	L305
LVL352:
	.loc 1 782 0
	movl	%ebx, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%edi, (%esp)
	call	_gpa_to_hpa
	movl	%edx, %ecx
	movl	%eax, %edx
L305:
	.loc 1 783 0
	movl	%edx, %eax
	movl	12(%esp), %ebx
LVL353:
	movl	%ecx, %edx
	movl	16(%esp), %esi
LVL354:
	movl	20(%esp), %edi
LVL355:
	addl	$24, %esp
	ret
LFE147:
	.p2align 4,,15
.globl _safe_gpa_to_hpa
	.def	_safe_gpa_to_hpa;	.scl	2;	.type	32;	.endef
_safe_gpa_to_hpa:
LFB145:
	.loc 1 756 0
LVL356:
	pushl	%ebx
LCFI84:
	subl	$12, %esp
LCFI85:
	.loc 1 757 0
	movl	28(%esp), %eax
LVL357:
	.loc 1 756 0
	movl	24(%esp), %ebx
	.loc 1 757 0
	movl	%eax, 8(%esp)
	movl	20(%esp), %eax
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	_gpa_to_hpa
	.loc 1 759 0
	testl	%edx, %edx
LVL358:
	jns	L308
LVL359:
	movl	%ebx, %eax
LVL360:
	movl	_bad_page_address+4, %edx
	andl	$4095, %eax
	orl	_bad_page_address, %eax
L308:
	.loc 1 760 0
	addl	$12, %esp
LVL361:
	popl	%ebx
LVL362:
	ret
LFE145:
	.section .rdata,"dr"
	.align 4
LC15:
	.ascii "(!is_long_mode(vcpu) && is_pae(vcpu)) || (vcpu->cr3 & ~(PAGE_MASK | CR3_FLAGS_MASK)) == 0\0"
	.align 4
LC16:
	.ascii "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h\0"
	.align 4
LC17:
	.ascii "((unsigned long)walker->table & PAGE_MASK) == ((unsigned long)ptep & PAGE_MASK)\0"
	.text
	.p2align 4,,15
	.def	_paging64_walk_addr;	.scl	3;	.type	32;	.endef
_paging64_walk_addr:
LFB163:
	.file 5 "/home/ddk50/vmware/winkvm/kvm/kernel/paging_tmpl.h"
	.loc 5 75 0
LVL363:
	pushl	%ebp
LCFI86:
	movl	%edx, %ebp
	pushl	%edi
LCFI87:
	movl	%eax, %edi
	pushl	%esi
LCFI88:
	pushl	%ebx
LCFI89:
	subl	$60, %esp
LCFI90:
	.loc 5 75 0
	movl	%ecx, 40(%esp)
	.loc 5 83 0
	movl	13548(%edx), %ecx
LVL364:
	.loc 5 84 0
	movl	$0, 12(%eax)
	.loc 5 83 0
	movl	%ecx, (%eax)
	.loc 5 88 0
	movl	40(%esp), %eax
LVL365:
	shrl	$30, %eax
	addl	$16, %eax
	leal	8(%edx,%eax,8), %edx
LVL366:
	movl	%edx, 16(%edi)
	.loc 5 89 0
	movl	8(%ebp,%eax,8), %edx
LVL367:
	movl	12(%ebp,%eax,8), %eax
	.loc 5 90 0
	testb	$1, %dl
	.loc 5 89 0
	movl	%eax, 16(%esp)
	.loc 5 90 0
	jne	L331
LVL368:
L311:
	.loc 5 168 0
	movl	$0, 32(%edi)
L326:
	.loc 5 175 0
	movl	80(%esp), %ebx
LVL369:
	testl	%ebx, %ebx
	je	L327
	.loc 5 176 0
	orl	$2, 32(%edi)
L327:
	.loc 5 177 0
	movl	84(%esp), %ecx
	testl	%ecx, %ecx
	je	L328
	.loc 5 178 0
	orl	$4, 32(%edi)
L328:
	.loc 5 179 0
	movl	88(%esp), %edx
LVL370:
	xorl	%eax, %eax
	testl	%edx, %edx
	je	L325
	.loc 5 180 0
	orl	$16, 32(%edi)
	xorl	%eax, %eax
L325:
	.loc 5 182 0
	addl	$60, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
LVL371:
	popl	%ebp
LVL372:
	ret
LVL373:
	.p2align 4,,7
L331:
	.loc 5 92 0
	leal	-1(%ecx), %eax
	.loc 5 95 0
	movl	%edx, %ebx
	.loc 5 92 0
	movl	%eax, (%edi)
	.loc 5 95 0
	movl	16(%esp), %esi
	andl	$-4096, %ebx
	movl	%ebx, %eax
	andl	$1048575, %esi
	movl	%esi, %edx
LVL374:
	shrdl	$12, %edx, %eax
	movl	%eax, 48(%esp)
LVL375:
	.loc 5 96 0
	movl	%eax, -4(%edi,%ecx,4)
	.loc 5 99 0
	movl	%eax, 4(%esp)
	movl	(%ebp), %eax
	movl	%eax, (%esp)
	call	_gfn_to_memslot
	.loc 5 100 0
	movl	%ebx, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%ebp, (%esp)
	call	_safe_gpa_to_hpa
	.loc 5 101 0
	shrdl	$12, %edx, %eax
LVL376:
	movl	%eax, (%esp)
	call	_pfn_to_page
LVL377:
	movl	$3, 4(%esp)
	movl	%eax, (%esp)
	call	_kmap_atomic
	movl	%eax, 12(%edi)
	.loc 5 103 0
	testb	$32, 128(%ebp)
	je	L332
L312:
	.loc 5 106 0
	movl	$6, 20(%edi)
	movl	(%edi), %edx
	movl	$0, 24(%edi)
	jmp	L324
LVL378:
	.p2align 4,,7
L337:
LBB672:
	.loc 5 119 0
	testb	$2, %al
	jne	L314
	.loc 5 120 0
	movl	84(%esp), %ecx
	testl	%ecx, %ecx
	jne	L315
	testb	$1, 98(%ebp)
	.p2align 4,,2
	jne	L315
L316:
	.loc 5 127 0
	movl	88(%esp), %ecx
	testl	%ecx, %ecx
	je	L317
	testb	$8, 169(%ebp)
	je	L317
	testl	%edx, %edx
	js	L315
L317:
	.loc 5 131 0
	testb	$32, %al
	.p2align 4,,2
	je	L333
LVL379:
L318:
	.loc 5 136 0
	movl	(%edi), %eax
	cmpl	$1, %eax
	.p2align 4,,3
	je	L334
	.loc 5 142 0
	cmpl	$2, %eax
	.p2align 4,,3
	je	L335
	.loc 5 151 0
	cmpl	$3, %eax
	.p2align 4,,3
	je	L323
L322:
	.loc 5 152 0
	movl	12(%edi), %eax
	movl	(%eax,%esi,8), %edx
	andl	%edx, 20(%edi)
	movl	44(%esp), %ecx
	movl	4(%eax,%ecx), %eax
	andl	%eax, 24(%edi)
L323:
	.loc 5 153 0
	movl	(%ebx), %eax
	movl	4(%ebx), %edx
	.loc 5 154 0
	movl	%ebp, (%esp)
	.loc 5 153 0
	andl	$-4096, %eax
	andl	$1048575, %edx
	movl	%eax, 52(%esp)
	movl	52(%esp), %eax
	movl	%edx, 56(%esp)
	movl	56(%esp), %edx
	.loc 5 154 0
	movl	56(%esp), %ecx
	.loc 5 153 0
	shrdl	$12, %edx, %eax
	shrl	$12, %edx
	movl	%edx, 28(%esp)
	.loc 5 154 0
	movl	52(%esp), %edx
	movl	%ecx, 8(%esp)
	.loc 5 153 0
	movl	%eax, 24(%esp)
	movl	%eax, 48(%esp)
LVL380:
	.loc 5 154 0
	movl	%edx, 4(%esp)
	call	_safe_gpa_to_hpa
	.loc 5 155 0
	movl	$3, 4(%esp)
	.loc 5 154 0
	movl	%eax, %ebx
LVL381:
	.loc 5 155 0
	movl	12(%edi), %eax
	.loc 5 154 0
	movl	%edx, %esi
LVL382:
	.loc 5 156 0
	shrdl	$12, %esi, %ebx
LVL383:
	.loc 5 155 0
	movl	%eax, (%esp)
	call	_kunmap_atomic
	.loc 5 156 0
	movl	%ebx, (%esp)
	call	_pfn_to_page
	movl	$3, 4(%esp)
	movl	%eax, (%esp)
	call	_kmap_atomic
	.loc 5 158 0
	movl	(%edi), %edx
	.loc 5 156 0
	movl	%eax, 12(%edi)
	.loc 5 158 0
	movl	%edx, %eax
	subl	$1, %edx
	movl	%edx, (%edi)
	.loc 5 159 0
	movl	24(%esp), %ecx
	movl	%ecx, -4(%edi,%eax,4)
L324:
	.loc 5 112 0
	movl	40(%esp), %esi
LVL384:
	leal	3(%edx,%edx,8), %ecx
	movl	12(%edi), %eax
	shrl	%cl, %esi
	andl	$511, %esi
	leal	0(,%esi,8), %edx
	leal	(%eax,%edx), %ebx
LVL385:
	.loc 5 113 0
	xorl	%ebx, %eax
	testl	$-4096, %eax
	.loc 5 112 0
	movl	%edx, 44(%esp)
	.loc 5 113 0
	jne	L336
L313:
	.loc 5 116 0
	movl	(%ebx), %eax
	movl	4(%ebx), %edx
	testb	$1, %al
	je	L311
	.loc 5 119 0
	movl	80(%esp), %ecx
	testl	%ecx, %ecx
	jne	L337
L314:
	.loc 5 123 0
	movl	84(%esp), %ecx
	testl	%ecx, %ecx
	je	L316
	testb	$4, %al
	jne	L316
L315:
LBE672:
	.loc 5 172 0
	movl	$1, 32(%edi)
	.p2align 4,,2
	jmp	L326
	.p2align 4,,7
L336:
LBB673:
	.loc 5 113 0
	movl	$LC17, 12(%esp)
	movl	$114, 8(%esp)
	movl	$LC16, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	jmp	L313
	.p2align 4,,7
L333:
	.loc 5 132 0
	movl	48(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	(%ebp), %eax
	movl	%eax, (%esp)
	call	_mark_page_dirty
	.loc 5 133 0
	orl	$32, (%ebx)
	orl	$0, 4(%ebx)
	jmp	L318
	.p2align 4,,7
L335:
	.loc 5 142 0
	movl	(%ebx), %ecx
	movl	4(%ebx), %edx
	testb	$-128, %cl
	movl	%edx, 20(%esp)
	je	L322
	.loc 5 147 0
	shrl	$12, 40(%esp)
LVL386:
	.loc 5 145 0
	movl	%ecx, %eax
	.loc 5 147 0
	andl	$511, 40(%esp)
LVL387:
	.loc 5 145 0
	andl	$-2097152, %eax
	andl	$1048575, %edx
	shrdl	$12, %edx, %eax
	.loc 5 147 0
	addl	40(%esp), %eax
	movl	%eax, 28(%edi)
	jmp	L320
LVL388:
	.p2align 4,,7
L332:
LBE673:
	.loc 5 103 0
	testl	$4064, 104(%ebp)
	je	L312
	movl	$LC15, 12(%esp)
	movl	$104, 8(%esp)
	movl	$LC16, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	jmp	L312
LVL389:
	.p2align 4,,7
L334:
LBB674:
	.loc 5 137 0
	movl	(%ebx), %eax
	movl	4(%ebx), %edx
	andl	$-4096, %eax
	andl	$1048575, %edx
	movl	%eax, 32(%esp)
	movl	32(%esp), %eax
	movl	%edx, 36(%esp)
	movl	36(%esp), %edx
	shrdl	$12, %edx, %eax
	movl	%eax, 28(%edi)
L320:
LBE674:
	.loc 5 163 0
	movl	%ebx, 16(%edi)
	movl	$1, %eax
	.loc 5 182 0
	addl	$60, %esp
	popl	%ebx
LVL390:
	popl	%esi
	popl	%edi
LVL391:
	popl	%ebp
LVL392:
	ret
LFE163:
	.p2align 4,,15
	.def	_paging64_gva_to_gpa;	.scl	3;	.type	32;	.endef
_paging64_gva_to_gpa:
LFB171:
	.loc 5 454 0
LVL393:
	subl	$60, %esp
LCFI91:
	movl	%edi, 56(%esp)
LCFI92:
	movl	68(%esp), %edi
	.loc 5 459 0
	leal	12(%esp), %eax
	movl	64(%esp), %edx
	.loc 5 454 0
	movl	%ebx, 48(%esp)
LCFI93:
	.loc 5 461 0
	movl	$-1, %ebx
LVL394:
	.loc 5 454 0
	movl	%esi, 52(%esp)
LCFI94:
	.loc 5 461 0
	movl	$-1, %esi
LVL395:
	.loc 5 459 0
	movl	%edi, %ecx
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	call	_paging64_walk_addr
	.loc 5 461 0
	testl	%eax, %eax
LVL396:
	je	L340
LVL397:
	.loc 5 462 0
	movl	40(%esp), %eax
LVL398:
	xorl	%edx, %edx
LVL399:
	.loc 5 463 0
	andl	$4095, %edi
	movl	%edi, %ebx
	.loc 5 462 0
	shldl	$12, %eax, %edx
LVL400:
	sall	$12, %eax
LVL401:
	.loc 5 463 0
	movl	%edx, %esi
	orl	%eax, %ebx
LVL402:
L340:
LBB675:
LBB676:
	.loc 5 186 0
	movl	24(%esp), %eax
LVL403:
	testl	%eax, %eax
	je	L341
	.loc 5 187 0
	movl	$3, 4(%esp)
	movl	%eax, (%esp)
	call	_kunmap_atomic
LVL404:
L341:
LBE676:
LBE675:
	.loc 5 468 0
	movl	%ebx, %eax
	movl	%esi, %edx
	movl	48(%esp), %ebx
LVL405:
	movl	52(%esp), %esi
LVL406:
	movl	56(%esp), %edi
LVL407:
	addl	$60, %esp
	ret
LFE171:
	.p2align 4,,15
	.def	_paging32_walk_addr;	.scl	3;	.type	32;	.endef
_paging32_walk_addr:
LFB172:
	.loc 5 75 0
LVL408:
	pushl	%ebp
LCFI95:
	pushl	%edi
LCFI96:
	movl	%eax, %edi
	pushl	%esi
LCFI97:
	.loc 5 95 0
	xorl	%esi, %esi
	.loc 5 75 0
	pushl	%ebx
LCFI98:
	subl	$32, %esp
LCFI99:
	.loc 5 75 0
	movl	%edx, 28(%esp)
	movl	%ecx, 24(%esp)
	.loc 5 83 0
	movl	13548(%edx), %ecx
LVL409:
	.loc 5 84 0
	movl	$0, 12(%eax)
	.loc 5 83 0
	movl	%ecx, (%eax)
	.loc 5 95 0
	movl	104(%edx), %eax
LVL410:
	movl	%esi, %edx
	movl	%eax, %ebx
	andl	$-4096, %ebx
	movl	%ebx, %eax
	shrdl	$12, %edx, %eax
	.loc 5 96 0
	movl	%eax, (%edi,%ecx,4)
	.loc 5 99 0
	movl	28(%esp), %edx
	.loc 5 95 0
	movl	%eax, %ebp
LVL411:
	.loc 5 99 0
	movl	%eax, 4(%esp)
	movl	(%edx), %eax
	movl	%eax, (%esp)
	call	_gfn_to_memslot
	.loc 5 100 0
	movl	28(%esp), %ecx
	movl	%ebx, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%ecx, (%esp)
	call	_safe_gpa_to_hpa
	.loc 5 101 0
	shrdl	$12, %edx, %eax
LVL412:
	movl	%eax, (%esp)
	call	_pfn_to_page
LVL413:
	movl	$3, 4(%esp)
	movl	%eax, (%esp)
	call	_kmap_atomic
	movl	%eax, 12(%edi)
	.loc 5 103 0
	movl	28(%esp), %ebx
	testb	$32, 128(%ebx)
	jne	L344
LVL414:
	testl	$4064, 104(%ebx)
	jne	L364
L344:
	.loc 5 106 0
	movl	$6, 20(%edi)
	movl	(%edi), %edx
	jmp	L357
LVL415:
	.p2align 4,,7
L369:
LBB677:
	.loc 5 119 0
	testb	$2, %al
	.p2align 4,,3
	jne	L347
	.loc 5 120 0
	movl	56(%esp), %ecx
	testl	%ecx, %ecx
	jne	L348
	movl	28(%esp), %edx
	testb	$1, 98(%edx)
	jne	L348
L349:
	.loc 5 131 0
	testb	$32, %al
	je	L365
	.loc 5 136 0
	movl	(%edi), %eax
	cmpl	$1, %eax
	je	L366
L352:
	.loc 5 142 0
	cmpl	$2, %eax
	.p2align 4,,3
	je	L367
	.loc 5 151 0
	cmpl	$3, %eax
	.p2align 4,,3
	je	L356
L355:
	.loc 5 152 0
	movl	12(%edi), %eax
	movl	(%eax,%esi,4), %eax
	andl	%eax, 20(%edi)
L356:
	.loc 5 153 0
	movl	(%ebx), %eax
	.loc 5 154 0
	movl	28(%esp), %edx
	movl	$0, 8(%esp)
	.loc 5 153 0
	movl	%eax, %ebp
	.loc 5 154 0
	andl	$-4096, %eax
	movl	%eax, 4(%esp)
	.loc 5 153 0
	shrl	$12, %ebp
	.loc 5 154 0
	movl	%edx, (%esp)
	call	_safe_gpa_to_hpa
	.loc 5 155 0
	movl	$3, 4(%esp)
	.loc 5 154 0
	movl	%eax, %ebx
LVL416:
	.loc 5 155 0
	movl	12(%edi), %eax
	.loc 5 154 0
	movl	%edx, %esi
LVL417:
	.loc 5 156 0
	shrdl	$12, %esi, %ebx
LVL418:
	.loc 5 155 0
	movl	%eax, (%esp)
	call	_kunmap_atomic
	.loc 5 156 0
	movl	%ebx, (%esp)
	call	_pfn_to_page
	movl	$3, 4(%esp)
	movl	%eax, (%esp)
	call	_kmap_atomic
	.loc 5 158 0
	movl	(%edi), %edx
	.loc 5 156 0
	movl	%eax, 12(%edi)
	.loc 5 158 0
	movl	%edx, %eax
	subl	$1, %edx
	movl	%edx, (%edi)
	.loc 5 159 0
	movl	%ebp, -4(%edi,%eax,4)
LVL419:
L357:
	.loc 5 112 0
	movl	24(%esp), %esi
LVL420:
	leal	-5(%edx,%edx,4), %ecx
	movl	12(%edi), %eax
	leal	12(%ecx,%ecx), %ecx
	shrl	%cl, %esi
	andl	$1023, %esi
	leal	(%eax,%esi,4), %ebx
LVL421:
	.loc 5 113 0
	xorl	%ebx, %eax
	testl	$-4096, %eax
	jne	L368
LVL422:
	.loc 5 116 0
	movl	(%ebx), %eax
	testb	$1, %al
	je	L346
L370:
	.loc 5 119 0
	movl	52(%esp), %edx
	testl	%edx, %edx
	jne	L369
L347:
	.loc 5 123 0
	movl	56(%esp), %edx
	testl	%edx, %edx
	je	L349
	testb	$4, %al
	jne	L349
L348:
LBE677:
	.loc 5 172 0
	movl	$1, 28(%edi)
L359:
	.loc 5 175 0
	movl	52(%esp), %ebp
LVL423:
	testl	%ebp, %ebp
	je	L360
	.loc 5 176 0
	orl	$2, 28(%edi)
L360:
	.loc 5 177 0
	movl	56(%esp), %esi
	testl	%esi, %esi
	je	L361
	.loc 5 178 0
	orl	$4, 28(%edi)
L361:
	.loc 5 179 0
	movl	60(%esp), %ebx
LVL424:
	xorl	%eax, %eax
	testl	%ebx, %ebx
	je	L358
	.loc 5 180 0
	orl	$16, 28(%edi)
	xorl	%eax, %eax
L358:
	.loc 5 182 0
	addl	$32, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
LVL425:
	popl	%ebp
	ret
LVL426:
	.p2align 4,,7
L368:
LBB678:
	.loc 5 113 0
	movl	$LC17, 12(%esp)
	movl	$114, 8(%esp)
	movl	$LC16, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	.loc 5 116 0
	movl	(%ebx), %eax
	testb	$1, %al
	jne	L370
L346:
LBE678:
	.loc 5 168 0
	movl	$0, 28(%edi)
	jmp	L359
	.p2align 4,,7
L365:
LBB679:
	.loc 5 132 0
	movl	28(%esp), %ecx
	movl	%ebp, 4(%esp)
	movl	(%ecx), %eax
	movl	%eax, (%esp)
	call	_mark_page_dirty
	.loc 5 133 0
	orl	$32, (%ebx)
	.loc 5 136 0
	movl	(%edi), %eax
	cmpl	$1, %eax
	jne	L352
L366:
	.loc 5 137 0
	movl	(%ebx), %eax
	shrl	$12, %eax
	movl	%eax, 24(%edi)
L353:
LBE679:
	.loc 5 163 0
	movl	%ebx, 16(%edi)
	movl	$1, %eax
	.loc 5 182 0
	addl	$32, %esp
	popl	%ebx
LVL427:
	popl	%esi
	popl	%edi
LVL428:
	popl	%ebp
LVL429:
	ret
LVL430:
	.p2align 4,,7
L367:
LBB680:
	.loc 5 142 0
	movl	(%ebx), %eax
	testb	$-128, %al
	je	L355
	movl	28(%esp), %ecx
	testb	$16, 128(%ecx)
	je	L355
	.loc 5 145 0
	movl	%eax, %ecx
	andl	$-4194304, %ecx
	movl	%ecx, 16(%esp)
	movl	16(%esp), %eax
	movl	$0, 20(%esp)
	movl	20(%esp), %edx
	.loc 5 147 0
	shrl	$12, 24(%esp)
LVL431:
	andl	$1023, 24(%esp)
LVL432:
	.loc 5 145 0
	shrdl	$12, %edx, %eax
	movl	%eax, 16(%esp)
	movl	16(%esp), %eax
	shrl	$12, %edx
	.loc 5 147 0
	addl	24(%esp), %eax
	.loc 5 145 0
	movl	%edx, 20(%esp)
	.loc 5 147 0
	movl	%eax, 24(%edi)
	jmp	L353
LVL433:
L364:
LBE680:
	.loc 5 103 0
	movl	$LC15, 12(%esp)
	movl	$104, 8(%esp)
	movl	$LC16, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	jmp	L344
LFE172:
	.p2align 4,,15
	.def	_paging32_gva_to_gpa;	.scl	3;	.type	32;	.endef
_paging32_gva_to_gpa:
LFB180:
	.loc 5 454 0
LVL434:
	subl	$56, %esp
LCFI100:
	movl	%edi, 52(%esp)
LCFI101:
	movl	64(%esp), %edi
	.loc 5 459 0
	leal	12(%esp), %eax
	movl	60(%esp), %edx
	.loc 5 454 0
	movl	%ebx, 44(%esp)
LCFI102:
	.loc 5 461 0
	movl	$-1, %ebx
LVL435:
	.loc 5 454 0
	movl	%esi, 48(%esp)
LCFI103:
	.loc 5 461 0
	movl	$-1, %esi
LVL436:
	.loc 5 459 0
	movl	%edi, %ecx
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	call	_paging32_walk_addr
	.loc 5 461 0
	testl	%eax, %eax
LVL437:
	je	L373
LVL438:
	.loc 5 462 0
	movl	36(%esp), %eax
LVL439:
	xorl	%edx, %edx
LVL440:
	.loc 5 463 0
	andl	$4095, %edi
	movl	%edi, %ebx
	.loc 5 462 0
	shldl	$12, %eax, %edx
LVL441:
	sall	$12, %eax
LVL442:
	.loc 5 463 0
	movl	%edx, %esi
	orl	%eax, %ebx
LVL443:
L373:
LBB681:
LBB682:
	.loc 5 186 0
	movl	24(%esp), %eax
LVL444:
	testl	%eax, %eax
	je	L374
	.loc 5 187 0
	movl	$3, 4(%esp)
	movl	%eax, (%esp)
	call	_kunmap_atomic
LVL445:
L374:
LBE682:
LBE681:
	.loc 5 468 0
	movl	%ebx, %eax
	movl	%esi, %edx
	movl	44(%esp), %ebx
LVL446:
	movl	48(%esp), %esi
LVL447:
	movl	52(%esp), %edi
LVL448:
	addl	$56, %esp
	ret
LFE180:
	.p2align 4,,15
	.def	_mmu_topup_memory_caches;	.scl	3;	.type	32;	.endef
_mmu_topup_memory_caches:
LFB120:
	.loc 1 240 0
LVL449:
	pushl	%ebx
LCFI104:
	movl	%eax, %ebx
	subl	$8, %esp
LCFI105:
LBB683:
LBB684:
	.loc 1 213 0
	movl	13560(%eax), %eax
LVL450:
	cmpl	$3, %eax
	jle	L388
LVL451:
L377:
LBE684:
LBE683:
LBB688:
LBB689:
	movl	13644(%ebx), %eax
	testl	%eax, %eax
	jle	L389
LVL452:
L380:
LBE689:
LBE688:
	.loc 1 251 0
	xorl	%eax, %eax
LVL453:
	.loc 1 254 0
	addl	$8, %esp
LVL454:
	popl	%ebx
LVL455:
	ret
LVL456:
	.p2align 4,,7
L390:
LBB693:
LBB685:
	.loc 1 224 0
	movl	13560(%ebx), %eax
	movl	%edx, 13564(%ebx,%eax,4)
	addl	$1, %eax
	movl	%eax, 13560(%ebx)
L388:
	.loc 1 218 0
	cmpl	$19, %eax
	ja	L377
LBE685:
	.loc 1 219 0
	movl	$0, 4(%esp)
	movl	$28, (%esp)
	call	_kzalloc
LVL457:
LBB686:
	.loc 1 220 0
	testl	%eax, %eax
LVL458:
LBE686:
	.loc 1 219 0
	movl	%eax, %edx
LVL459:
LBB687:
	.loc 1 220 0
	jne	L390
LVL460:
L378:
LBE687:
LBE693:
	.loc 1 251 0
	movl	$-12, %eax
LVL461:
	.loc 1 254 0
	addl	$8, %esp
LVL462:
	popl	%ebx
LVL463:
	ret
LVL464:
	.p2align 4,,7
L389:
LBB694:
LBB690:
	.loc 1 218 0
	cmpl	$19, %eax
	jbe	L384
	.p2align 4,,5
	jmp	L380
LVL465:
	.p2align 4,,7
L391:
	.loc 1 224 0
	movl	13644(%ebx), %eax
	movl	%edx, 13648(%ebx,%eax,4)
	addl	$1, %eax
	.loc 1 218 0
	cmpl	$19, %eax
	.loc 1 224 0
	movl	%eax, 13644(%ebx)
	.loc 1 218 0
	ja	L380
LVL466:
L384:
LBE690:
	.loc 1 219 0
	movl	$0, 4(%esp)
	movl	$20, (%esp)
	call	_kzalloc
LVL467:
LBB691:
	.loc 1 220 0
	testl	%eax, %eax
LVL468:
LBE691:
	.loc 1 219 0
	movl	%eax, %edx
LVL469:
LBB692:
	.loc 1 220 0
	jne	L391
	jmp	L378
LBE692:
LBE694:
LFE120:
	.section .rdata,"dr"
LC18:
	.ascii "*shadow_pte == 0\0"
	.align 4
LC19:
	.ascii "walker->level == PT_PAGE_TABLE_LEVEL\0"
LC20:
	.ascii "*shadow_ent & PT_USER_MASK\0"
	.text
	.p2align 4,,15
	.def	_paging64_page_fault;	.scl	3;	.type	32;	.endef
_paging64_page_fault:
LFB170:
	.loc 5 390 0
LVL470:
	pushl	%ebp
LCFI106:
	pushl	%edi
LCFI107:
	pushl	%esi
LCFI108:
	pushl	%ebx
LCFI109:
	subl	$136, %esp
LCFI110:
	.loc 5 403 0
	movl	156(%esp), %eax
	.loc 5 390 0
	movl	164(%esp), %ebx
	.loc 5 403 0
	call	_mmu_topup_memory_caches
	.loc 5 404 0
	testl	%eax, %eax
LVL471:
	.loc 5 403 0
	movl	%eax, %esi
LVL472:
	.loc 5 404 0
	je	L435
LVL473:
L393:
	.loc 5 451 0
	addl	$136, %esp
	movl	%esi, %eax
	popl	%ebx
LVL474:
	popl	%esi
LVL475:
	popl	%edi
LVL476:
	popl	%ebp
LVL477:
	ret
LVL478:
	.p2align 4,,7
L435:
	.loc 5 392 0
	movl	%ebx, %edx
	.loc 5 410 0
	movl	160(%esp), %ecx
	.loc 5 391 0
	movl	%ebx, %eax
	.loc 5 392 0
	andl	$4, %edx
	.loc 5 391 0
	andl	$2, %eax
	.loc 5 392 0
	movl	%edx, 64(%esp)
LVL479:
	.loc 5 410 0
	leal	100(%esp), %edi
	andl	$16, %ebx
	movl	%edx, 4(%esp)
	movl	156(%esp), %edx
	.loc 5 391 0
	movl	%eax, 60(%esp)
LVL480:
	.loc 5 410 0
	movl	%eax, (%esp)
	movl	%edi, %eax
	movl	%ebx, 8(%esp)
	call	_paging64_walk_addr
	.loc 5 416 0
	testl	%eax, %eax
	.loc 5 410 0
	movl	%eax, %esi
	.loc 5 416 0
	je	L436
LBB754:
LBB758:
	.loc 5 231 0
	movl	116(%esp), %edx
	movl	%edx, 68(%esp)
LVL481:
	.loc 5 233 0
	movl	(%edx), %eax
	andl	$1, %eax
	je	L395
	.loc 5 236 0
	movl	156(%esp), %eax
	movl	13540(%eax), %ecx
LVL482:
	.loc 5 237 0
	movl	13552(%eax), %eax
LVL483:
	.loc 5 238 0
	cmpl	$3, %eax
	je	L437
L396:
	.loc 5 240 0
	leal	-4(%edi,%eax,4), %edi
LVL484:
	movl	%eax, %ebx
LVL485:
	movl	%edi, 92(%esp)
	leal	3(%eax,%eax,8), %esi
LVL486:
	xorl	%edi, %edi
LVL487:
	jmp	L418
LVL488:
	.p2align 4,,7
L397:
LBB762:
	.loc 5 260 0
	cmpl	$1, %ebx
	je	L438
	.loc 5 277 0
	cmpl	$2, %ebx
	je	L439
L416:
	.loc 5 284 0
	movl	92(%esp), %eax
	movl	(%eax), %edx
LVL489:
	xorl	%eax, %eax
LVL490:
L417:
LBE762:
LBE758:
	.loc 5 286 0
	movl	%eax, 4(%esp)
	movl	160(%esp), %ecx
	subl	$1, %ebx
	movl	156(%esp), %eax
LVL491:
	movl	%ebp, 8(%esp)
	movl	%ebx, (%esp)
	call	_kvm_mmu_get_page
LVL492:
LBB821:
LBB761:
	.loc 5 288 0
	movl	24(%eax), %ecx
LVL493:
	movl	28(%eax), %edx
LVL494:
	.loc 5 291 0
	movl	%ecx, %eax
LVL495:
	orl	$39, %eax
	movl	%eax, (%ebp)
	movl	%edx, 4(%ebp)
L399:
	subl	$4, 92(%esp)
	subl	$9, %esi
	movl	%ebp, %edi
LVL496:
L418:
LBE761:
LBE821:
	.loc 5 246 0
	movl	%ecx, (%esp)
	call	___va
LVL497:
LBB822:
LBB817:
	movl	160(%esp), %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	$511, %edx
	leal	(%eax,%edx,8), %ebp
LVL498:
	.loc 5 252 0
	movl	(%ebp), %eax
	movl	4(%ebp), %ecx
	testl	$513, %eax
	movl	%eax, %edx
	movl	%ecx, 32(%esp)
	je	L397
	.loc 5 253 0
	cmpl	$1, %ebx
	je	L398
	.loc 5 255 0
	movl	%eax, %ecx
LVL499:
	subl	$1, %ebx
	andl	$-4096, %ecx
	jmp	L399
LVL500:
	.p2align 4,,7
L436:
LBE817:
LBE822:
LBE754:
LBB826:
LBB827:
	.loc 1 1049 0
	movl	132(%esp), %eax
	movl	160(%esp), %ecx
	movl	%eax, 8(%esp)
	movl	156(%esp), %eax
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	_kvm_arch_ops, %eax
	call	*144(%eax)
LBE827:
LBE826:
LBB828:
LBB829:
	.loc 5 186 0
	movl	112(%esp), %eax
	testl	%eax, %eax
	je	L393
	.loc 5 187 0
	movl	%eax, (%esp)
	movl	$3, 4(%esp)
	call	_kunmap_atomic
LBE829:
LBE828:
	.loc 5 451 0
	addl	$136, %esp
	movl	%esi, %eax
	popl	%ebx
LVL501:
	popl	%esi
LVL502:
	popl	%edi
	popl	%ebp
	ret
LVL503:
	.p2align 4,,7
L438:
LBB830:
LBB757:
LBB760:
	.loc 5 262 0
	movl	100(%esp), %edx
	cmpl	$2, %edx
	je	L440
	.loc 5 269 0
	subl	$1, %edx
	je	L409
	movl	$LC19, 12(%esp)
	movl	$269, 8(%esp)
	movl	$LC16, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	movl	(%ebp), %eax
	movl	4(%ebp), %ecx
L409:
	.loc 5 270 0
	movl	128(%esp), %edx
LBB765:
LBB768:
	.loc 5 199 0
	orl	%eax, %ecx
LBE768:
LBE765:
	.loc 5 270 0
	movl	%edx, 96(%esp)
	movl	120(%esp), %edx
	movl	%edx, 44(%esp)
	movl	124(%esp), %edx
	movl	%edx, 40(%esp)
	movl	68(%esp), %edx
	movl	(%edx), %edx
	movl	%edx, 48(%esp)
	movl	68(%esp), %edx
	movl	4(%edx), %ebx
LBB788:
LBB767:
	.loc 5 199 0
	jne	L441
LVL504:
L410:
	.loc 5 200 0
	movl	40(%esp), %edi
	.loc 5 202 0
	movl	%ebx, %eax
	movl	48(%esp), %ecx
	andl	$1048575, %eax
	.loc 5 200 0
	movl	48(%esp), %esi
	andl	44(%esp), %esi
	.loc 5 202 0
	movl	%eax, 88(%esp)
LBB772:
LBB776:
	.loc 1 1003 0
	movl	48(%esp), %eax
LBE776:
LBE772:
	.loc 5 200 0
	andl	%ebx, %edi
	.loc 5 202 0
	andl	$-4096, %ecx
LBB771:
LBB781:
	.loc 1 1003 0
	andl	$-2147483648, %ebx
LBE781:
LBE771:
	.loc 5 202 0
	movl	%ecx, 84(%esp)
LBB770:
LBB775:
	.loc 1 1003 0
	movl	%esi, %edx
LVL505:
	movl	%edi, %ecx
LVL506:
	shldl	$9, %edx, %ecx
	andl	$353, %eax
	orl	%ecx, %ebx
	sall	$9, %edx
	orl	%edx, %eax
	movl	%eax, (%ebp)
	movl	%ebx, 4(%ebp)
	.loc 1 1004 0
	testb	$64, 48(%esp)
	jne	L411
	.loc 1 1005 0
	movl	%esi, %ecx
LVL507:
	andl	$-3, %ecx
	movl	%ecx, %esi
LVL508:
L411:
LBE775:
	.loc 1 1007 0
	movl	88(%esp), %ecx
	movl	84(%esp), %edx
	movl	%ecx, 8(%esp)
	movl	156(%esp), %ecx
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	call	_gpa_to_hpa
	movl	%eax, 28(%esp)
	movl	%edx, %ebx
LVL509:
LBB774:
	.loc 1 1009 0
	movl	(%ebp), %edx
	movl	4(%ebp), %eax
	orl	%esi, %edx
	orl	%edi, %eax
	movl	%edx, (%ebp)
	.loc 1 1011 0
	andb	$1, %dh
	.loc 1 1009 0
	movl	%eax, 4(%ebp)
	.loc 1 1011 0
	je	L442
L412:
	.loc 1 1014 0
	testl	%ebx, %ebx
	js	L443
	.loc 1 1021 0
	movl	28(%esp), %eax
	orl	%eax, (%ebp)
	orl	%ebx, 4(%ebp)
	.loc 1 1023 0
	andl	$2, %esi
LVL510:
	jne	L444
L414:
	.loc 1 1041 0
	movl	84(%esp), %eax
	movl	88(%esp), %edx
LVL511:
L434:
	movl	156(%esp), %ecx
	movl	%edx, 4(%esp)
	movl	%ebp, %edx
	movl	%eax, (%esp)
	movl	(%ecx), %eax
	call	_page_header_update_slot
	.loc 1 1042 0
	movl	156(%esp), %eax
	movl	%ebp, %edx
	call	_rmap_add
	movl	4(%ebp), %eax
	movl	(%ebp), %edx
	movl	%eax, 32(%esp)
LVL512:
	.p2align 4,,7
L398:
LBE774:
LBE770:
LBE767:
LBE788:
LBE760:
LBE757:
LBE830:
	.loc 5 430 0
	movl	60(%esp), %esi
LVL513:
	testl	%esi, %esi
	jne	L445
LVL514:
LBB831:
LBB832:
	.loc 1 1054 0
	testb	$8, %dh
	je	L420
	testb	$4, %dl
	je	L446
LVL515:
L420:
	.loc 1 1061 0
	xorl	%ebx, %ebx
LVL516:
L424:
LBE832:
LBE831:
LBB834:
LBB835:
	.loc 5 186 0
	movl	112(%esp), %eax
LVL517:
	testl	%eax, %eax
	je	L429
	.loc 5 187 0
	movl	$3, 4(%esp)
	movl	%eax, (%esp)
	call	_kunmap_atomic
L429:
LBE835:
LBE834:
	.loc 5 444 0
	movl	(%ebp), %eax
	movl	$1, %esi
LVL518:
	testb	$2, %ah
	jne	L393
	.loc 5 447 0
	addl	$1, _kvm_stat
	movl	%ebx, %esi
	jmp	L393
LVL519:
	.p2align 4,,7
L439:
LBB836:
LBB823:
LBB818:
	.loc 5 277 0
	cmpl	$2, 100(%esp)
	jne	L416
	.loc 5 280 0
	movl	68(%esp), %edx
	movl	(%edx), %eax
	movl	4(%edx), %edx
	andl	$-4096, %eax
	andl	$1048575, %edx
	movl	%eax, 52(%esp)
	movl	52(%esp), %eax
	movl	%edx, 56(%esp)
	movl	56(%esp), %edx
	shrdl	$12, %edx, %eax
	movl	%eax, %edx
LVL520:
	movl	$1, %eax
LVL521:
	jmp	L417
LVL522:
	.p2align 4,,7
L395:
	.loc 5 291 0
	movl	(%eax), %edx
	xorl	%ebp, %ebp
LVL523:
	movl	4(%eax), %eax
	movl	%eax, 32(%esp)
	jmp	L398
LVL524:
	.p2align 4,,7
L445:
LBE818:
LBE823:
LBE836:
LBB837:
LBB840:
	.loc 5 315 0
	testb	$2, %dl
	jne	L420
	.loc 5 319 0
	movl	64(%esp), %ebx
LVL525:
	.loc 5 318 0
	movl	%edx, %eax
LVL526:
	andl	$1024, %eax
	.loc 5 319 0
	testl	%ebx, %ebx
	je	L421
LVL527:
	.loc 5 324 0
	testb	$8, %dh
	je	L420
	testl	%eax, %eax
	je	L420
	.loc 5 326 0
	andl	$4, %edx
	.p2align 4,,5
	je	L447
L422:
	.loc 5 338 0
	movl	116(%esp), %esi
LVL528:
	.loc 5 340 0
	testb	$1, (%esi)
	.p2align 4,,2
	je	L448
	.loc 5 347 0
	movl	64(%esp), %ecx
	.loc 5 345 0
	movl	128(%esp), %ebx
LVL529:
	.loc 5 347 0
	testl	%ecx, %ecx
	jne	L432
	jmp	L454
LVL530:
	.p2align 4,,7
L427:
	.loc 5 354 0
	movl	%eax, %edx
	movl	156(%esp), %eax
LVL531:
	call	_kvm_mmu_zap_page
LVL532:
L432:
LBE840:
	.loc 5 351 0
	movl	156(%esp), %eax
LVL533:
	movl	%ebx, %edx
	call	_kvm_mmu_lookup_page
LBB839:
	testl	%eax, %eax
LVL534:
	jne	L427
L428:
	.loc 5 365 0
	movl	156(%esp), %edx
	movl	%ebx, 4(%esp)
	.loc 5 369 0
	xorl	%ebx, %ebx
LVL535:
	.loc 5 365 0
	movl	(%edx), %eax
LVL536:
	movl	%eax, (%esp)
	call	_mark_page_dirty
	.loc 5 366 0
	orl	$2, (%ebp)
	orl	$0, 4(%ebp)
LBB843:
LBB844:
	.loc 5 193 0
	movl	100(%esp), %eax
	movl	156(%esp), %ecx
	movl	100(%esp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	(%ecx), %eax
	movl	%eax, (%esp)
	call	_mark_page_dirty
LBE844:
LBE843:
	.loc 5 369 0
	movl	%ebp, %edx
	.loc 5 368 0
	orl	$64, (%esi)
	orl	$0, 4(%esi)
	.loc 5 369 0
	movl	156(%esp), %eax
	call	_rmap_add
	jmp	L424
LVL537:
	.p2align 4,,7
L446:
LBE839:
LBE837:
LBB847:
LBB833:
	.loc 1 1061 0
	orl	$4, %edx
	xorl	%ebx, %ebx
LVL538:
	andl	$-3, %edx
	movl	%edx, (%ebp)
	movl	32(%esp), %eax
	movl	%eax, 4(%ebp)
	jmp	L424
LVL539:
	.p2align 4,,7
L437:
LBE833:
LBE847:
LBB848:
LBB756:
	.loc 5 239 0
	movl	156(%esp), %ecx
LVL540:
	movl	160(%esp), %edx
	movl	13556(%ecx), %eax
LVL541:
	shrl	$30, %edx
	movl	(%eax,%edx,8), %ecx
LVL542:
	.loc 5 240 0
	movl	$2, %eax
LVL543:
	andl	$-4096, %ecx
	jmp	L396
LVL544:
L421:
LBE756:
LBE848:
LBB849:
LBB845:
	.loc 5 332 0
	testl	%eax, %eax
	jne	L422
	.loc 5 333 0
	movl	156(%esp), %ecx
	testb	$1, 98(%ecx)
	jne	L420
	.loc 5 335 0
	andl	$-5, %edx
	movl	%edx, (%ebp)
	movl	32(%esp), %eax
LVL545:
	movl	%eax, 4(%ebp)
	jmp	L422
LVL546:
L448:
	.loc 5 341 0
	movl	$0, (%ebp)
	xorl	%ebx, %ebx
LVL547:
	movl	$0, 4(%ebp)
	jmp	L424
LVL548:
L443:
LBE845:
LBE849:
LBB850:
LBB824:
LBB819:
LBB789:
LBB786:
LBB784:
LBB782:
	.loc 1 1017 0
	movl	84(%esp), %edx
	movl	88(%esp), %eax
	movl	4(%ebp), %ecx
	orb	$2, %dh
	orl	(%ebp), %edx
	orl	%ecx, %eax
	movl	%eax, 32(%esp)
	andl	$-2, %edx
	movl	%edx, (%ebp)
	movl	%eax, 4(%ebp)
	jmp	L398
LVL549:
L440:
LBE782:
LBE784:
LBE786:
LBE789:
	.loc 5 263 0
	testl	%edi, %edi
	je	L402
LVL550:
	.loc 5 264 0
	orl	$512, (%edi)
	orl	$0, 4(%edi)
	movl	(%ebp), %eax
	movl	4(%ebp), %ecx
L402:
	.loc 5 265 0
	movl	128(%esp), %edx
LBB790:
LBB793:
	.loc 5 211 0
	orl	%eax, %ecx
LBE793:
LBE790:
	.loc 5 265 0
	movl	%edx, 72(%esp)
	movl	120(%esp), %edx
	movl	%edx, 20(%esp)
	movl	124(%esp), %edx
	movl	%edx, 16(%esp)
	movl	68(%esp), %edx
	movl	(%edx), %edx
	movl	%edx, 36(%esp)
	movl	68(%esp), %edx
	movl	4(%edx), %ebx
LBB813:
LBB792:
	.loc 5 211 0
	jne	L450
LVL551:
L403:
	.loc 5 213 0
	movl	72(%esp), %ecx
	movl	$0, 80(%esp)
LVL552:
	movl	80(%esp), %edx
	.loc 5 212 0
	movl	16(%esp), %edi
LVL553:
	movl	36(%esp), %esi
	.loc 5 213 0
	movl	%ecx, 76(%esp)
LVL554:
	movl	76(%esp), %eax
	.loc 5 212 0
	andl	20(%esp), %esi
	andl	%ebx, %edi
LBB797:
LBB801:
	.loc 1 1003 0
	andl	$-2147483648, %ebx
	movl	%edi, %ecx
LVL555:
LBE801:
LBE797:
	.loc 5 213 0
	shldl	$12, %eax, %edx
	sall	$12, %eax
	movl	%eax, 76(%esp)
LVL556:
LBB796:
LBB806:
	.loc 1 1003 0
	movl	36(%esp), %eax
LBE806:
LBE796:
	.loc 5 213 0
	movl	%edx, 80(%esp)
LVL557:
LBB795:
LBB800:
	.loc 1 1003 0
	movl	%esi, %edx
LVL558:
	shldl	$9, %edx, %ecx
	sall	$9, %edx
	orl	%ecx, %ebx
	andl	$353, %eax
	orl	%edx, %eax
	movl	%eax, (%ebp)
	movl	%ebx, 4(%ebp)
	.loc 1 1004 0
	testb	$64, 36(%esp)
	jne	L404
	.loc 1 1005 0
	movl	%esi, %ecx
LVL559:
	andl	$-3, %ecx
	movl	%ecx, %esi
LVL560:
L404:
LBE800:
	.loc 1 1007 0
	movl	80(%esp), %edx
	movl	76(%esp), %eax
	andl	$1048575, %edx
	movl	%edx, 8(%esp)
	movl	156(%esp), %edx
	andl	$-4096, %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_gpa_to_hpa
	movl	%eax, 24(%esp)
	movl	%edx, %ebx
LVL561:
LBB799:
	.loc 1 1009 0
	movl	(%ebp), %edx
	movl	4(%ebp), %eax
	orl	%esi, %edx
	orl	%edi, %eax
	movl	%edx, (%ebp)
	.loc 1 1011 0
	andb	$1, %dh
	.loc 1 1009 0
	movl	%eax, 4(%ebp)
	.loc 1 1011 0
	je	L451
LVL562:
L405:
	.loc 1 1014 0
	testl	%ebx, %ebx
	js	L452
	.loc 1 1021 0
	movl	24(%esp), %edx
	orl	%edx, (%ebp)
	orl	%ebx, 4(%ebp)
	.loc 1 1023 0
	andl	$2, %esi
LVL563:
	jne	L453
L407:
	.loc 1 1041 0
	movl	76(%esp), %eax
	movl	80(%esp), %edx
	jmp	L434
LVL564:
L441:
LBE799:
LBE795:
LBE792:
LBE813:
LBB814:
LBB766:
	.loc 5 199 0
	movl	$LC18, 12(%esp)
	movl	$199, 8(%esp)
	movl	$LC16, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	jmp	L410
LVL565:
L442:
LBB769:
LBB773:
LBB777:
	.loc 1 991 0
	movl	%ebp, (%esp)
	call	___pa
LBB778:
LBB779:
	.loc 2 576 0
	shrdl	$12, %edx, %eax
	movl	%eax, (%esp)
	call	_pfn_to_page
LBE779:
	.loc 1 991 0
	movl	(%eax), %eax
LVL566:
	movl	$0, 36(%eax)
	jmp	L412
LVL567:
L452:
LBE778:
LBE777:
LBE773:
LBE769:
LBE766:
LBE814:
LBB815:
LBB811:
LBB809:
LBB807:
	.loc 1 1017 0
	movl	76(%esp), %edx
	movl	80(%esp), %ecx
	movl	4(%ebp), %eax
	orb	$2, %dh
	orl	(%ebp), %edx
	orl	%eax, %ecx
	movl	%ecx, 32(%esp)
	andl	$-2, %edx
	movl	%edx, (%ebp)
	movl	%ecx, 4(%ebp)
	jmp	L398
LVL568:
L454:
LBE807:
LBE809:
LBE811:
LBE815:
LBE819:
LBE824:
LBE850:
LBB851:
	.loc 5 356 0
	movl	156(%esp), %eax
LVL569:
	movl	%ebx, %edx
	call	_kvm_mmu_lookup_page
LBB838:
	testl	%eax, %eax
	je	L428
	.loc 5 359 0
	movl	156(%esp), %edx
	movl	%ebx, 4(%esp)
	.loc 5 361 0
	movl	$1, %ebx
LVL570:
	.loc 5 359 0
	movl	(%edx), %eax
	movl	%eax, (%esp)
	call	_mark_page_dirty
LBB841:
LBB842:
	.loc 5 193 0
	movl	100(%esp), %eax
	movl	156(%esp), %ecx
	movl	100(%esp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	(%ecx), %eax
	movl	%eax, (%esp)
	call	_mark_page_dirty
LBE842:
LBE841:
	.loc 5 361 0
	orl	$64, (%esi)
	orl	$0, 4(%esi)
	jmp	L424
LVL571:
L444:
LBE838:
LBE851:
LBB852:
LBB755:
LBB759:
LBB764:
LBB787:
LBB785:
	.loc 1 1026 0
	movl	96(%esp), %edx
	movl	156(%esp), %eax
	call	_kvm_mmu_lookup_page
LBB783:
LBB780:
	.loc 1 1027 0
	testl	%eax, %eax
LVL572:
	je	L415
	.loc 1 1031 0
	movl	(%ebp), %eax
LVL573:
	testb	$2, %al
	je	L414
	.loc 1 1032 0
	andl	$-3, %eax
	movl	%eax, (%ebp)
	.loc 1 1033 0
	movl	156(%esp), %edx
	movl	_kvm_arch_ops, %eax
	movl	%edx, (%esp)
	call	*140(%eax)
	jmp	L414
LVL574:
L415:
LBE780:
	.loc 1 1039 0
	movl	84(%esp), %eax
LVL575:
	movl	88(%esp), %edx
	movl	156(%esp), %ecx
	shrdl	$12, %edx, %eax
	movl	%eax, 4(%esp)
	movl	(%ecx), %eax
	movl	%eax, (%esp)
	call	_mark_page_dirty
	jmp	L414
LVL576:
L451:
LBE783:
LBE785:
LBE787:
LBE764:
LBB763:
LBB791:
LBB794:
LBB798:
LBB802:
	.loc 1 991 0
	movl	%ebp, (%esp)
	call	___pa
LBB803:
LBB804:
	.loc 2 576 0
	shrdl	$12, %edx, %eax
	movl	%eax, (%esp)
	call	_pfn_to_page
LBE804:
	.loc 1 991 0
	movl	(%eax), %eax
LVL577:
	movl	$0, 36(%eax)
	jmp	L405
LVL578:
L447:
LBE803:
LBE802:
LBE798:
LBE794:
LBE791:
LBE763:
LBE759:
LBE755:
LBE852:
LBB853:
LBB846:
	.loc 5 326 0
	movl	$LC20, 12(%esp)
	movl	$326, 8(%esp)
	movl	$LC16, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
LVL579:
	jmp	L422
LVL580:
L450:
LBE846:
LBE853:
LBB854:
LBB825:
LBB820:
LBB816:
LBB812:
	.loc 5 211 0
	movl	$LC18, 12(%esp)
	movl	$211, 8(%esp)
	movl	$LC16, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	jmp	L403
LVL581:
L453:
LBB810:
	.loc 1 1026 0
	movl	72(%esp), %edx
	movl	156(%esp), %eax
	call	_kvm_mmu_lookup_page
LBB808:
LBB805:
	.loc 1 1027 0
	testl	%eax, %eax
LVL582:
	je	L408
	.loc 1 1031 0
	movl	(%ebp), %eax
LVL583:
	testb	$2, %al
	je	L407
	.loc 1 1032 0
	andl	$-3, %eax
	movl	%eax, (%ebp)
	.loc 1 1033 0
	movl	156(%esp), %ecx
	movl	_kvm_arch_ops, %eax
	movl	%ecx, (%esp)
	call	*140(%eax)
	jmp	L407
LVL584:
L408:
LBE805:
	.loc 1 1039 0
	movl	80(%esp), %edx
	movl	76(%esp), %eax
LVL585:
	shrdl	$12, %edx, %eax
	movl	156(%esp), %edx
	movl	%eax, 4(%esp)
	movl	(%edx), %eax
	movl	%eax, (%esp)
	call	_mark_page_dirty
	jmp	L407
LBE808:
LBE810:
LBE812:
LBE816:
LBE820:
LBE825:
LBE854:
LFE170:
	.p2align 4,,15
	.def	_paging32_page_fault;	.scl	3;	.type	32;	.endef
_paging32_page_fault:
LFB179:
	.loc 5 390 0
LVL586:
	pushl	%ebp
LCFI111:
	pushl	%edi
LCFI112:
	pushl	%esi
LCFI113:
	pushl	%ebx
LCFI114:
	subl	$116, %esp
LCFI115:
	.loc 5 403 0
	movl	136(%esp), %eax
	.loc 5 390 0
	movl	144(%esp), %ebx
	.loc 5 403 0
	call	_mmu_topup_memory_caches
	.loc 5 404 0
	testl	%eax, %eax
LVL587:
	.loc 5 403 0
	movl	%eax, %esi
LVL588:
	.loc 5 404 0
	je	L499
LVL589:
L456:
	.loc 5 451 0
	addl	$116, %esp
	movl	%esi, %eax
	popl	%ebx
LVL590:
	popl	%esi
LVL591:
	popl	%edi
	popl	%ebp
	ret
LVL592:
	.p2align 4,,7
L499:
	.loc 5 392 0
	movl	%ebx, %edx
	.loc 5 410 0
	movl	140(%esp), %ecx
	.loc 5 391 0
	movl	%ebx, %eax
	.loc 5 392 0
	andl	$4, %edx
	.loc 5 391 0
	andl	$2, %eax
	.loc 5 392 0
	movl	%edx, 36(%esp)
LVL593:
	.loc 5 410 0
	leal	84(%esp), %edi
	andl	$16, %ebx
	movl	%edx, 4(%esp)
	movl	136(%esp), %edx
	.loc 5 391 0
	movl	%eax, 32(%esp)
LVL594:
	.loc 5 410 0
	movl	%eax, (%esp)
	movl	%edi, %eax
	movl	%ebx, 8(%esp)
	call	_paging32_walk_addr
	.loc 5 416 0
	testl	%eax, %eax
	.loc 5 410 0
	movl	%eax, %esi
	.loc 5 416 0
	je	L500
LBB915:
LBB919:
	.loc 5 231 0
	movl	100(%esp), %esi
LVL595:
	movl	%esi, 44(%esp)
LVL596:
	.loc 5 233 0
	movl	(%esi), %eax
	andl	$1, %eax
	je	L458
	.loc 5 236 0
	movl	136(%esp), %ebp
	.loc 5 237 0
	movl	13552(%ebp), %eax
LVL597:
	.loc 5 236 0
	movl	13540(%ebp), %ecx
LVL598:
	.loc 5 238 0
	cmpl	$3, %eax
	je	L501
L459:
	.loc 5 240 0
	movl	%eax, %ebx
LVL599:
	leal	3(%eax,%eax,8), %esi
LVL600:
	leal	-4(%edi,%eax,4), %edi
	movl	$0, 24(%esp)
LVL601:
	jmp	L481
LVL602:
	.p2align 4,,7
L460:
LBB923:
	.loc 5 260 0
	cmpl	$1, %ebx
	je	L502
	.loc 5 277 0
	cmpl	$2, %ebx
	je	L503
L479:
	.loc 5 284 0
	movl	(%edi), %edx
LVL603:
	xorl	%eax, %eax
LVL604:
L480:
LBE923:
LBE919:
	.loc 5 286 0
	movl	40(%esp), %ebp
	subl	$1, %ebx
	movl	%eax, 4(%esp)
	movl	140(%esp), %ecx
	movl	136(%esp), %eax
LVL605:
	movl	%ebx, (%esp)
	movl	%ebp, 8(%esp)
	call	_kvm_mmu_get_page
LVL606:
LBB988:
LBB922:
	.loc 5 288 0
	movl	24(%eax), %ecx
LVL607:
	movl	28(%eax), %edx
LVL608:
	.loc 5 291 0
	movl	%ecx, %eax
LVL609:
	orl	$39, %eax
	movl	%eax, (%ebp)
	movl	%edx, 4(%ebp)
L462:
	movl	40(%esp), %eax
	subl	$9, %esi
	subl	$4, %edi
	movl	%eax, 24(%esp)
LVL610:
L481:
LBE922:
LBE988:
	.loc 5 246 0
	movl	%ecx, (%esp)
	call	___va
LVL611:
LBB989:
LBB984:
	movl	140(%esp), %edx
	movl	%esi, %ecx
	shrl	%cl, %edx
	andl	$511, %edx
	leal	(%eax,%edx,8), %edx
	movl	%edx, 40(%esp)
LVL612:
	.loc 5 252 0
	movl	(%edx), %eax
	movl	4(%edx), %edx
	testl	$513, %eax
	movl	%eax, %ecx
	movl	%edx, 28(%esp)
	je	L460
	.loc 5 253 0
	cmpl	$1, %ebx
	je	L461
	.loc 5 255 0
	andl	$-4096, %ecx
LVL613:
	subl	$1, %ebx
	jmp	L462
LVL614:
	.p2align 4,,7
L500:
LBE984:
LBE989:
LBE915:
LBB993:
LBB994:
	.loc 1 1049 0
	movl	112(%esp), %eax
	movl	140(%esp), %ecx
	movl	136(%esp), %ebx
LVL615:
	movl	%eax, 8(%esp)
	movl	_kvm_arch_ops, %eax
	movl	%ecx, 4(%esp)
	movl	%ebx, (%esp)
	call	*144(%eax)
LBE994:
LBE993:
LBB995:
LBB996:
	.loc 5 186 0
	movl	96(%esp), %eax
	testl	%eax, %eax
	je	L456
	.loc 5 187 0
	movl	%eax, (%esp)
	movl	$3, 4(%esp)
	call	_kunmap_atomic
LBE996:
LBE995:
	.loc 5 451 0
	addl	$116, %esp
	movl	%esi, %eax
	popl	%ebx
	popl	%esi
LVL616:
	popl	%edi
	popl	%ebp
	ret
LVL617:
	.p2align 4,,7
L502:
LBB997:
LBB918:
LBB921:
	.loc 5 262 0
	movl	84(%esp), %ecx
	cmpl	$2, %ecx
	je	L504
	.loc 5 269 0
	subl	$1, %ecx
	je	L472
	movl	$LC19, 12(%esp)
	movl	$269, 8(%esp)
	movl	$LC16, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	movl	40(%esp), %ecx
	movl	(%ecx), %eax
	movl	4(%ecx), %edx
L472:
	.loc 5 270 0
	movl	108(%esp), %ebx
LBB926:
LBB929:
	.loc 5 199 0
	orl	%eax, %edx
LBE929:
LBE926:
	.loc 5 270 0
	movl	104(%esp), %esi
	movl	44(%esp), %edi
	movl	%ebx, 68(%esp)
	movl	%esi, 72(%esp)
	movl	(%edi), %ebx
LBB950:
LBB928:
	.loc 5 199 0
	jne	L505
LVL618:
L473:
	.loc 5 200 0
	movl	72(%esp), %edi
	xorl	%ebp, %ebp
LVL619:
	.loc 5 202 0
	movl	%ebx, %eax
	andl	$-4096, %eax
LBB933:
LBB938:
	.loc 1 1003 0
	movl	%ebp, %ecx
LBE938:
LBE933:
	.loc 5 202 0
	movl	%eax, 60(%esp)
LBB932:
LBB943:
	.loc 1 1003 0
	movl	40(%esp), %eax
LBE943:
LBE932:
	.loc 5 202 0
	movl	$0, 64(%esp)
	.loc 5 200 0
	andl	%ebx, %edi
LBB931:
LBB937:
	.loc 1 1003 0
	movl	%edi, %edx
LVL620:
	shldl	$9, %edx, %ecx
	movl	%ecx, 20(%esp)
	movl	%ebx, %ecx
	sall	$9, %edx
	andl	$353, %ecx
	orl	%edx, %ecx
	.loc 1 1004 0
	andl	$64, %ebx
	.loc 1 1003 0
	movl	%edx, 16(%esp)
	movl	%ecx, (%eax)
	movl	20(%esp), %eax
	movl	40(%esp), %edx
	movl	%eax, 4(%edx)
	.loc 1 1004 0
	jne	L474
LVL621:
	.loc 1 1005 0
	movl	%edi, %eax
LVL622:
	xorl	%ebx, %ebx
LVL623:
	andl	$-3, %eax
	movl	%ebx, %ebp
	movl	%eax, %edi
LVL624:
L474:
LBE937:
	.loc 1 1007 0
	movl	60(%esp), %eax
	movl	64(%esp), %edx
	movl	136(%esp), %ecx
	andl	$-4096, %eax
	andl	$1048575, %edx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	call	_gpa_to_hpa
	movl	%eax, %esi
LVL625:
LBB936:
	.loc 1 1009 0
	movl	40(%esp), %eax
LBE936:
	.loc 1 1007 0
	movl	%edx, %ebx
LVL626:
LBB935:
	.loc 1 1009 0
	movl	(%eax), %edx
	movl	%eax, %ecx
	movl	4(%eax), %eax
	orl	%edi, %edx
	orl	%ebp, %eax
	movl	%edx, (%ecx)
	.loc 1 1011 0
	andb	$1, %dh
	.loc 1 1009 0
	movl	%eax, 4(%ecx)
	.loc 1 1011 0
	je	L506
L475:
	.loc 1 1014 0
	testl	%ebx, %ebx
	js	L507
	.loc 1 1021 0
	movl	40(%esp), %eax
	orl	%esi, (%eax)
	orl	%ebx, 4(%eax)
	.loc 1 1023 0
	andl	$2, %edi
LVL627:
	jne	L508
L477:
	.loc 1 1041 0
	movl	60(%esp), %edi
LVL628:
	movl	64(%esp), %ebp
LVL629:
L497:
	movl	%ebp, 4(%esp)
	movl	136(%esp), %ebp
	movl	%edi, (%esp)
	movl	40(%esp), %edx
	movl	(%ebp), %eax
	call	_page_header_update_slot
	.loc 1 1042 0
	movl	40(%esp), %edx
	movl	%ebp, %eax
	call	_rmap_add
	movl	40(%esp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %ecx
	movl	%edx, 28(%esp)
LVL630:
	.p2align 4,,7
L461:
LBE935:
LBE931:
LBE928:
LBE950:
LBE921:
LBE918:
LBE997:
	.loc 5 430 0
	movl	32(%esp), %eax
	testl	%eax, %eax
	jne	L509
LVL631:
LBB998:
LBB999:
	.loc 1 1054 0
	testb	$8, %ch
	je	L483
	testb	$4, %cl
	je	L510
LVL632:
L483:
	.loc 1 1061 0
	xorl	%ebx, %ebx
LVL633:
L487:
LBE999:
LBE998:
LBB1001:
LBB1002:
	.loc 5 186 0
	movl	96(%esp), %eax
LVL634:
	testl	%eax, %eax
	je	L492
	.loc 5 187 0
	movl	$3, 4(%esp)
	movl	%eax, (%esp)
	call	_kunmap_atomic
L492:
LBE1002:
LBE1001:
	.loc 5 444 0
	movl	40(%esp), %ebp
LVL635:
	movl	$1, %esi
LVL636:
	movl	(%ebp), %eax
	testb	$2, %ah
	jne	L456
	.loc 5 447 0
	addl	$1, _kvm_stat
	movl	%ebx, %esi
	jmp	L456
LVL637:
	.p2align 4,,7
L503:
LBB1003:
LBB990:
LBB985:
	.loc 5 277 0
	cmpl	$2, 84(%esp)
	jne	L479
	.loc 5 280 0
	movl	44(%esp), %ecx
	movl	$1, %eax
LVL638:
	movl	(%ecx), %edx
LVL639:
	shrl	$12, %edx
	jmp	L480
LVL640:
	.p2align 4,,7
L458:
	.loc 5 291 0
	movl	(%eax), %ecx
	movl	4(%eax), %eax
	movl	$0, 40(%esp)
LVL641:
	movl	%eax, 28(%esp)
	jmp	L461
LVL642:
	.p2align 4,,7
L509:
LBE985:
LBE990:
LBE1003:
LBB1004:
LBB1007:
	.loc 5 315 0
	testb	$2, %cl
	jne	L483
	.loc 5 319 0
	movl	36(%esp), %ebp
LVL643:
	.loc 5 318 0
	movl	%ecx, %eax
LVL644:
	andl	$1024, %eax
	.loc 5 319 0
	testl	%ebp, %ebp
	je	L484
LVL645:
	.loc 5 324 0
	testb	$8, %ch
	je	L483
	testl	%eax, %eax
	je	L483
	.loc 5 326 0
	andl	$4, %ecx
	.p2align 4,,5
	je	L511
L485:
	.loc 5 338 0
	movl	100(%esp), %esi
LVL646:
	.loc 5 340 0
	testb	$1, (%esi)
	.p2align 4,,2
	je	L512
	.loc 5 347 0
	movl	36(%esp), %edi
	.loc 5 345 0
	movl	108(%esp), %ebx
LVL647:
	.loc 5 347 0
	testl	%edi, %edi
	jne	L495
	jmp	L518
LVL648:
	.p2align 4,,7
L490:
	.loc 5 354 0
	movl	%eax, %edx
	movl	136(%esp), %eax
LVL649:
	call	_kvm_mmu_zap_page
LVL650:
L495:
LBE1007:
	.loc 5 351 0
	movl	136(%esp), %eax
LVL651:
	movl	%ebx, %edx
	call	_kvm_mmu_lookup_page
LBB1006:
	testl	%eax, %eax
LVL652:
	jne	L490
L491:
	.loc 5 365 0
	movl	136(%esp), %edx
	movl	%ebx, 4(%esp)
	movl	(%edx), %eax
LVL653:
	movl	%eax, (%esp)
	call	_mark_page_dirty
	.loc 5 366 0
	movl	40(%esp), %ecx
	orl	$2, (%ecx)
	orl	$0, 4(%ecx)
LBB1010:
LBB1011:
	.loc 5 193 0
	movl	84(%esp), %eax
	movl	136(%esp), %ebx
LVL654:
	movl	84(%esp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	(%ebx), %eax
	movl	%eax, (%esp)
	call	_mark_page_dirty
LBE1011:
LBE1010:
	.loc 5 369 0
	movl	%ebx, %eax
	xorl	%ebx, %ebx
LVL655:
	.loc 5 368 0
	orl	$64, (%esi)
	.loc 5 369 0
	movl	40(%esp), %edx
	call	_rmap_add
	jmp	L487
LVL656:
	.p2align 4,,7
L510:
LBE1006:
LBE1004:
LBB1014:
LBB1000:
	.loc 1 1061 0
	movl	40(%esp), %esi
LVL657:
	orl	$4, %ecx
	xorl	%ebx, %ebx
LVL658:
	andl	$-3, %ecx
	movl	%ecx, (%esi)
	movl	28(%esp), %edi
	movl	%edi, 4(%esi)
	jmp	L487
LVL659:
	.p2align 4,,7
L501:
LBE1000:
LBE1014:
LBB1015:
LBB917:
	.loc 5 239 0
	movl	140(%esp), %edx
	movl	13556(%ebp), %eax
LVL660:
	shrl	$30, %edx
	movl	(%eax,%edx,8), %ecx
	.loc 5 240 0
	movl	$2, %eax
LVL661:
	andl	$-4096, %ecx
	jmp	L459
LVL662:
L484:
LBE917:
LBE1015:
LBB1016:
LBB1012:
	.loc 5 332 0
	testl	%eax, %eax
	jne	L485
	.loc 5 333 0
	movl	136(%esp), %edx
	testb	$1, 98(%edx)
	jne	L483
	.loc 5 335 0
	movl	40(%esp), %ebx
LVL663:
	andl	$-5, %ecx
	movl	%ecx, (%ebx)
	movl	28(%esp), %esi
LVL664:
	movl	%esi, 4(%ebx)
	jmp	L485
LVL665:
L512:
	.loc 5 341 0
	movl	40(%esp), %edi
	xorl	%ebx, %ebx
LVL666:
	movl	$0, (%edi)
	movl	$0, 4(%edi)
	jmp	L487
LVL667:
L507:
LBE1012:
LBE1016:
LBB1017:
LBB991:
LBB986:
LBB951:
LBB948:
LBB946:
LBB944:
	.loc 1 1017 0
	movl	60(%esp), %ecx
	movl	64(%esp), %ebx
LVL668:
	orb	$2, %ch
LVL669:
L498:
	movl	40(%esp), %esi
LVL670:
	movl	4(%esi), %edi
LVL671:
	orl	(%esi), %ecx
	orl	%edi, %ebx
	andl	$-2, %ecx
	movl	%ebx, 28(%esp)
	movl	%ecx, (%esi)
	movl	%ebx, 4(%esi)
	jmp	L461
LVL672:
L504:
LBE944:
LBE946:
LBE948:
LBE951:
	.loc 5 263 0
	movl	24(%esp), %ecx
	testl	%ecx, %ecx
	je	L465
LVL673:
	.loc 5 264 0
	movl	24(%esp), %eax
	orl	$512, (%eax)
	orl	$0, 4(%eax)
	movl	40(%esp), %edx
	movl	(%edx), %eax
	movl	4(%edx), %edx
L465:
	.loc 5 265 0
	movl	108(%esp), %ebx
	movl	44(%esp), %edi
	movl	%ebx, 56(%esp)
	movl	104(%esp), %ebx
	movl	(%edi), %esi
	xorl	%edi, %edi
LBB952:
LBB955:
	.loc 5 211 0
	orl	%eax, %edx
LBE955:
LBE952:
	.loc 5 265 0
	movl	%edi, 52(%esp)
	movl	%esi, 48(%esp)
LBB980:
LBB954:
	.loc 5 211 0
	jne	L514
LVL674:
L466:
	.loc 5 215 0
	movl	48(%esp), %esi
	xorl	%edx, %edx
	.loc 5 212 0
	xorl	%ebp, %ebp
LVL675:
	movl	48(%esp), %edi
	.loc 5 213 0
	movl	56(%esp), %ecx
LVL676:
	.loc 5 215 0
	andl	$122880, %esi
	movl	%esi, %eax
	.loc 5 212 0
	andl	%ebx, %edi
	.loc 5 215 0
	shldl	$19, %eax, %edx
	.loc 5 213 0
	xorl	%ebx, %ebx
LVL677:
	.loc 5 215 0
	sall	$19, %eax
	.loc 5 213 0
	shldl	$12, %ecx, %ebx
LVL678:
	.loc 5 215 0
	movl	%eax, %esi
LBB961:
LBB967:
	.loc 1 1003 0
	movl	48(%esp), %eax
LBE967:
LBE961:
	.loc 5 213 0
	sall	$12, %ecx
LVL679:
	.loc 5 215 0
	orl	%ecx, %esi
LBB960:
LBB972:
	.loc 1 1003 0
	movl	%ebp, %ecx
LVL680:
LBE972:
LBE960:
	.loc 5 215 0
	movl	%esi, 76(%esp)
LVL681:
	movl	%edx, %esi
LBB959:
LBB966:
	.loc 1 1003 0
	movl	%edi, %edx
LVL682:
LBE966:
LBE959:
	.loc 5 215 0
	orl	%ebx, %esi
LBB958:
LBB973:
	.loc 1 1003 0
	movl	40(%esp), %ebx
LVL683:
	andl	$353, %eax
	shldl	$9, %edx, %ecx
	sall	$9, %edx
	orl	%edx, %eax
LBE973:
LBE958:
	.loc 5 215 0
	movl	%esi, 80(%esp)
LVL684:
LBB957:
LBB965:
	.loc 1 1003 0
	movl	%eax, (%ebx)
	movl	%ecx, 4(%ebx)
	.loc 1 1004 0
	testb	$64, 48(%esp)
	jne	L467
LVL685:
	.loc 1 1005 0
	movl	%edi, %eax
LVL686:
	xorl	%ebx, %ebx
LVL687:
	andl	$-3, %eax
	movl	%ebx, %ebp
	movl	%eax, %edi
LVL688:
L467:
LBE965:
	.loc 1 1007 0
	movl	76(%esp), %eax
	movl	80(%esp), %edx
	movl	136(%esp), %esi
	andl	$-4096, %eax
	andl	$1048575, %edx
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	call	_gpa_to_hpa
	movl	%eax, %esi
LVL689:
LBB964:
	.loc 1 1009 0
	movl	40(%esp), %eax
LBE964:
	.loc 1 1007 0
	movl	%edx, %ebx
LVL690:
LBB963:
	.loc 1 1009 0
	movl	(%eax), %edx
	movl	%eax, %ecx
	movl	4(%eax), %eax
	orl	%edi, %edx
	orl	%ebp, %eax
	movl	%edx, (%ecx)
	.loc 1 1011 0
	andb	$1, %dh
	.loc 1 1009 0
	movl	%eax, 4(%ecx)
	.loc 1 1011 0
	je	L515
LVL691:
L468:
	.loc 1 1014 0
	testl	%ebx, %ebx
	js	L516
	.loc 1 1021 0
	movl	40(%esp), %eax
	orl	%esi, (%eax)
	orl	%ebx, 4(%eax)
	.loc 1 1023 0
	andl	$2, %edi
LVL692:
	jne	L517
L470:
	.loc 1 1041 0
	movl	76(%esp), %edi
LVL693:
	movl	80(%esp), %ebp
LVL694:
	jmp	L497
LVL695:
L505:
LBE963:
LBE957:
LBE954:
LBE980:
LBB981:
LBB927:
	.loc 5 199 0
	movl	$LC18, 12(%esp)
	movl	$199, 8(%esp)
	movl	$LC16, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	jmp	L473
LVL696:
L506:
LBB930:
LBB934:
LBB939:
	.loc 1 991 0
	movl	%ecx, (%esp)
	call	___pa
LBB940:
LBB941:
	.loc 2 576 0
	shrdl	$12, %edx, %eax
	movl	%eax, (%esp)
	call	_pfn_to_page
LBE941:
	.loc 1 991 0
	movl	(%eax), %eax
LVL697:
	movl	$0, 36(%eax)
	jmp	L475
LVL698:
L516:
LBE940:
LBE939:
LBE934:
LBE930:
LBE927:
LBE981:
LBB982:
LBB978:
LBB976:
LBB974:
	.loc 1 1017 0
	movl	76(%esp), %ecx
	movl	80(%esp), %ebx
LVL699:
	orb	$2, %ch
	jmp	L498
LVL700:
L518:
LBE974:
LBE976:
LBE978:
LBE982:
LBE986:
LBE991:
LBE1017:
LBB1018:
	.loc 5 356 0
	movl	136(%esp), %eax
LVL701:
	movl	%ebx, %edx
	call	_kvm_mmu_lookup_page
LBB1005:
	testl	%eax, %eax
	je	L491
	.loc 5 359 0
	movl	136(%esp), %ebp
	movl	%ebx, 4(%esp)
	.loc 5 361 0
	movl	$1, %ebx
LVL702:
	.loc 5 359 0
	movl	(%ebp), %eax
	movl	%eax, (%esp)
	call	_mark_page_dirty
LBB1008:
LBB1009:
	.loc 5 193 0
	movl	84(%esp), %eax
	movl	84(%esp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	(%ebp), %eax
	movl	%eax, (%esp)
	call	_mark_page_dirty
LBE1009:
LBE1008:
	.loc 5 361 0
	orl	$64, (%esi)
	jmp	L487
LVL703:
L508:
LBE1005:
LBE1018:
LBB1019:
LBB916:
LBB920:
LBB925:
LBB949:
LBB947:
	.loc 1 1026 0
	movl	68(%esp), %edx
	movl	136(%esp), %eax
	call	_kvm_mmu_lookup_page
LBB945:
LBB942:
	.loc 1 1027 0
	testl	%eax, %eax
LVL704:
	je	L478
	.loc 1 1031 0
	movl	40(%esp), %edx
	movl	(%edx), %eax
LVL705:
	testb	$2, %al
	je	L477
	.loc 1 1032 0
	andl	$-3, %eax
	movl	%eax, (%edx)
	.loc 1 1033 0
	movl	136(%esp), %ebx
LVL706:
	movl	_kvm_arch_ops, %eax
	movl	%ebx, (%esp)
	call	*140(%eax)
	jmp	L477
LVL707:
L478:
LBE942:
	.loc 1 1039 0
	movl	60(%esp), %eax
LVL708:
	movl	64(%esp), %edx
	movl	136(%esp), %esi
LVL709:
	shrdl	$12, %edx, %eax
	movl	%eax, 4(%esp)
	movl	(%esi), %eax
	movl	%eax, (%esp)
	call	_mark_page_dirty
	jmp	L477
LVL710:
L515:
LBE945:
LBE947:
LBE949:
LBE925:
LBB924:
LBB953:
LBB956:
LBB962:
LBB968:
	.loc 1 991 0
	movl	%ecx, (%esp)
	call	___pa
LBB969:
LBB970:
	.loc 2 576 0
	shrdl	$12, %edx, %eax
	movl	%eax, (%esp)
	call	_pfn_to_page
LBE970:
	.loc 1 991 0
	movl	(%eax), %eax
LVL711:
	movl	$0, 36(%eax)
	jmp	L468
LVL712:
L511:
LBE969:
LBE968:
LBE962:
LBE956:
LBE953:
LBE924:
LBE920:
LBE916:
LBE1019:
LBB1020:
LBB1013:
	.loc 5 326 0
	movl	$LC20, 12(%esp)
	movl	$326, 8(%esp)
	movl	$LC16, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
LVL713:
	jmp	L485
LVL714:
L514:
LBE1013:
LBE1020:
LBB1021:
LBB992:
LBB987:
LBB983:
LBB979:
	.loc 5 211 0
	movl	$LC18, 12(%esp)
	movl	$211, 8(%esp)
	movl	$LC16, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	jmp	L466
LVL715:
L517:
LBB977:
	.loc 1 1026 0
	movl	56(%esp), %edx
	movl	136(%esp), %eax
	call	_kvm_mmu_lookup_page
LBB975:
LBB971:
	.loc 1 1027 0
	testl	%eax, %eax
LVL716:
	je	L471
	.loc 1 1031 0
	movl	40(%esp), %edx
	movl	(%edx), %eax
LVL717:
	testb	$2, %al
	je	L470
	.loc 1 1032 0
	andl	$-3, %eax
	movl	%eax, (%edx)
	.loc 1 1033 0
	movl	136(%esp), %ebx
LVL718:
	movl	_kvm_arch_ops, %eax
	movl	%ebx, (%esp)
	call	*140(%eax)
	jmp	L470
LVL719:
L471:
LBE971:
	.loc 1 1039 0
	movl	76(%esp), %eax
LVL720:
	movl	80(%esp), %edx
	movl	136(%esp), %esi
LVL721:
	shrdl	$12, %edx, %eax
	movl	%eax, 4(%esp)
	movl	(%esi), %eax
	movl	%eax, (%esp)
	call	_mark_page_dirty
	jmp	L470
LBE975:
LBE977:
LBE979:
LBE983:
LBE987:
LBE992:
LBE1021:
LFE179:
	.p2align 4,,15
.globl _kvm_mmu_reset_context
	.def	_kvm_mmu_reset_context;	.scl	2;	.type	32;	.endef
_kvm_mmu_reset_context:
LFB187:
	.loc 1 1168 0
LVL722:
	pushl	%ebx
LCFI116:
	.loc 1 1168 0
	movl	8(%esp), %ebx
	.loc 1 1173 0
	movl	%ebx, %eax
	call	_destroy_kvm_mmu
	.loc 1 1174 0
	movl	%ebx, %eax
	call	_init_kvm_mmu
	.loc 1 1175 0
	testl	%eax, %eax
LVL723:
	js	L520
LVL724:
	.loc 1 1177 0
	movl	%ebx, %eax
LVL725:
	.loc 1 1181 0
	popl	%ebx
LVL726:
	.loc 1 1177 0
	jmp	_mmu_topup_memory_caches
LVL727:
	.p2align 4,,7
L520:
LVL728:
	.loc 1 1181 0
	popl	%ebx
LVL729:
	.p2align 4,,2
	ret
LFE187:
	.section .rdata,"dr"
	.align 4
LC21:
	.ascii "VALID_PAGE(vcpu->mmu.root_hpa)\0"
LC22:
	.ascii "VALID_PAGE(table_addr)\0"
	.text
	.p2align 4,,15
.globl _nonpaging_page_fault
	.def	_nonpaging_page_fault;	.scl	2;	.type	32;	.endef
_nonpaging_page_fault:
LFB153:
	.loc 1 915 0
LVL730:
	subl	$60, %esp
LCFI117:
	movl	%ebp, 56(%esp)
LCFI118:
	movl	64(%esp), %ebp
	movl	%ebx, 44(%esp)
LCFI119:
	movl	%esi, 48(%esp)
LCFI120:
	movl	%edi, 52(%esp)
LCFI121:
	.loc 1 922 0
	movl	%ebp, %eax
	call	_mmu_topup_memory_caches
	.loc 1 923 0
	testl	%eax, %eax
	.loc 1 922 0
	movl	%eax, 32(%esp)
LVL731:
	.loc 1 923 0
	jne	L523
LVL732:
	.loc 1 928 0
	testl	%ebp, %ebp
	je	L533
L524:
	.loc 1 929 0
	movl	13540(%ebp), %eax
	andl	13544(%ebp), %eax
	addl	$1, %eax
	je	L534
L525:
	.loc 1 931 0
	movl	68(%esp), %eax
	movl	$0, 8(%esp)
	movl	%ebp, (%esp)
	andl	$-4096, %eax
	movl	%eax, 20(%esp)
	movl	%eax, 4(%esp)
	call	_gpa_to_hpa
	.loc 1 933 0
	testl	%edx, %edx
	.loc 1 931 0
	movl	%eax, 28(%esp)
	movl	%edx, 24(%esp)
	.loc 1 933 0
	jns	L526
	movl	$1, 32(%esp)
LVL733:
L523:
	.loc 1 942 0
	movl	32(%esp), %eax
LVL734:
	movl	44(%esp), %ebx
	movl	48(%esp), %esi
	movl	52(%esp), %edi
LVL735:
	movl	56(%esp), %ebp
LVL736:
	addl	$60, %esp
	ret
LVL737:
	.p2align 4,,7
L526:
LBB1032:
LBB1034:
LBB1037:
LBB1039:
	.loc 1 823 0
	movl	68(%esp), %eax
	xorl	%edx, %edx
	movl	$3, %edi
LVL738:
LBE1039:
LBE1037:
	.loc 1 792 0
	movl	13544(%ebp), %ecx
	movl	13540(%ebp), %esi
LVL739:
LBB1042:
LBB1038:
	.loc 1 823 0
	movl	$30, 40(%esp)
	andl	$-2097152, %eax
	shrdl	$12, %edx, %eax
LBE1038:
LBE1042:
	.loc 1 792 0
	movl	%ecx, 16(%esp)
LBB1043:
LBB1040:
	.loc 1 823 0
	movl	%eax, 36(%esp)
LVL740:
L531:
LBE1040:
	.loc 1 797 0
	movl	20(%esp), %ebx
LVL741:
	subl	$1, %edi
	movzbl	40(%esp), %ecx
	.loc 1 801 0
	andl	%esi, 16(%esp)
	.loc 1 797 0
	shrl	%cl, %ebx
	andl	$511, %ebx
	.loc 1 801 0
	cmpl	$-1, 16(%esp)
	je	L535
L527:
LBE1043:
LBE1034:
	.loc 1 802 0
	movl	%esi, (%esp)
	call	___va
LBB1046:
LBB1036:
	.loc 1 804 0
	testl	%edi, %edi
LBE1036:
LBE1046:
	.loc 1 802 0
	movl	%eax, %esi
LVL742:
LBB1047:
LBB1044:
	.loc 1 804 0
	je	L536
	.loc 1 819 0
	leal	(%eax,%ebx,8), %ebx
LVL743:
	movl	4(%ebx), %eax
	movl	(%ebx), %edx
	movl	%eax, %ecx
	orl	%edx, %ecx
	je	L537
L529:
	.loc 1 837 0
	movl	%edx, %esi
LVL744:
	andl	$1048575, %eax
	andl	$-4096, %esi
	movl	%eax, 16(%esp)
	subl	$9, 40(%esp)
	jmp	L531
LVL745:
	.p2align 4,,7
L534:
LBE1044:
LBE1047:
LBE1032:
	.loc 1 929 0
	movl	$LC21, 12(%esp)
	movl	$929, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	jmp	L525
LVL746:
	.p2align 4,,7
L536:
LBB1049:
LBB1033:
LBB1035:
	.loc 1 805 0
	leal	(%eax,%ebx,8), %ebx
LVL747:
	.loc 1 806 0
	movl	(%ebx), %eax
	andl	$3, %eax
	cmpl	$3, %eax
	je	L523
	.loc 1 810 0
	movl	20(%esp), %eax
	shrl	$12, %eax
	movl	%eax, 4(%esp)
	movl	(%ebp), %eax
	movl	%eax, (%esp)
	call	_mark_page_dirty
	.loc 1 811 0
	movl	20(%esp), %eax
	movl	%esi, %edx
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	movl	(%ebp), %eax
	call	_page_header_update_slot
	.loc 1 814 0
	movl	%ebx, %edx
	.loc 1 812 0
	orl	$7, 28(%esp)
	movl	28(%esp), %ecx
	movl	%ecx, (%ebx)
	movl	24(%esp), %eax
	movl	%eax, 4(%ebx)
	.loc 1 814 0
	movl	%ebp, %eax
	call	_rmap_add
	jmp	L523
LVL748:
	.p2align 4,,7
L535:
	.loc 1 801 0
	movl	$LC22, 12(%esp)
	movl	$801, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	jmp	L527
LVL749:
	.p2align 4,,7
L533:
LBE1035:
LBE1033:
LBE1049:
	.loc 1 928 0
	movl	$LC0, 12(%esp)
	movl	$928, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	jmp	L524
LVL750:
L537:
LBB1050:
	.loc 1 825 0
	movl	20(%esp), %ecx
	movl	%ebp, %eax
	movl	36(%esp), %edx
	movl	%ebx, 8(%esp)
	movl	$1, 4(%esp)
	movl	%edi, (%esp)
	call	_kvm_mmu_get_page
LBB1048:
LBB1045:
LBB1041:
	.loc 1 828 0
	testl	%eax, %eax
LVL751:
	je	L530
LVL752:
	.loc 1 834 0
	movl	24(%eax), %edx
	movl	28(%eax), %eax
LVL753:
	orl	$7, %edx
	movl	%edx, (%ebx)
	movl	%eax, 4(%ebx)
	jmp	L529
LVL754:
L530:
LBE1041:
	.loc 1 837 0
	movl	$-12, 32(%esp)
LVL755:
	jmp	L523
LBE1045:
LBE1048:
LBE1050:
LFE153:
	.section .rdata,"dr"
LC23:
	.ascii "list_empty(&vcpu->free_pages)\0"
	.text
	.p2align 4,,15
.globl _kvm_mmu_create
	.def	_kvm_mmu_create;	.scl	2;	.type	32;	.endef
_kvm_mmu_create:
LFB195:
	.loc 1 1363 0
LVL756:
	pushl	%ebp
LCFI122:
	pushl	%edi
LCFI123:
	pushl	%esi
LCFI124:
	pushl	%ebx
LCFI125:
	subl	$20, %esp
LCFI126:
	.loc 1 1363 0
	movl	40(%esp), %ebp
	.loc 1 1364 0
	testl	%ebp, %ebp
	je	L549
LVL757:
L539:
	.loc 1 1365 0
	movl	13540(%ebp), %eax
	andl	13544(%ebp), %eax
	addl	$1, %eax
	je	L540
	movl	$LC11, 12(%esp)
	movl	$1365, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
L540:
	.loc 1 1366 0
	leal	204(%ebp), %eax
	movl	%eax, 16(%esp)
	cmpl	204(%ebp), %eax
	je	L541
	movl	$LC23, 12(%esp)
	movl	$1366, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
L541:
	movl	%ebp, %ebx
	xorl	%edi, %edi
LVL758:
	.p2align 4,,7
L543:
LBB1062:
LBB1069:
LBB1073:
	.loc 1 1331 0
	imull	$52, %edi, %eax
	leal	212(%ebp,%eax), %esi
LBB1078:
LBB1079:
	.loc 4 37 0
	movl	%esi, 212(%ebx)
	.loc 4 38 0
	movl	%esi, 216(%ebx)
LBE1079:
LBE1078:
LBE1073:
LBE1069:
	.loc 1 1332 0
	movl	$208, (%esp)
	call	_alloc_page
LBB1068:
LBB1072:
	testl	%eax, %eax
LVL759:
	je	L542
	.loc 1 1334 0
	movl	%esi, (%eax)
LBE1072:
	.loc 1 1328 0
	addl	$1, %edi
LBE1068:
	.loc 1 1335 0
	movl	%eax, (%esp)
	call	_page_to_pfn
LVL760:
LBB1067:
LBB1080:
	xorl	%edx, %edx
	shldl	$12, %eax, %edx
	sall	$12, %eax
	movl	%edx, 240(%ebx)
	movl	%eax, 236(%ebx)
LBE1080:
LBE1067:
	.loc 1 1337 0
	movl	%eax, (%esp)
	call	___va
LBB1066:
LBB1071:
	movl	$4096, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
LBB1074:
LBB1075:
	.loc 4 74 0
	movl	204(%ebp), %eax
LBB1076:
LBB1077:
	.loc 4 53 0
	movl	%eax, 212(%ebx)
	.loc 4 52 0
	movl	%esi, 4(%eax)
	.loc 4 54 0
	movl	16(%esp), %eax
	.loc 4 55 0
	movl	%esi, 204(%ebp)
	.loc 4 54 0
	movl	%eax, 216(%ebx)
LBE1077:
LBE1076:
LBE1075:
LBE1074:
	.loc 1 1339 0
	movl	(%ebp), %eax
LBE1071:
	.loc 1 1328 0
	addl	$52, %ebx
LBB1070:
	.loc 1 1339 0
	addl	$1, 96(%eax)
LBE1070:
	.loc 1 1328 0
	cmpl	$256, %edi
	jne	L543
LBE1066:
	.loc 1 1347 0
	movl	$212, (%esp)
	call	_alloc_page
LBB1065:
	.loc 1 1348 0
	testl	%eax, %eax
LVL761:
	je	L542
LBE1065:
	.loc 1 1350 0
	movl	%eax, (%esp)
	call	_page_address
LVL762:
LBB1064:
	xorl	%edx, %edx
	movl	%eax, 13556(%ebp)
L544:
	.loc 1 1352 0
	movl	13556(%ebp), %eax
	movl	$-1, (%eax,%edx)
	movl	$-1, 4(%eax,%edx)
	addl	$8, %edx
	.loc 1 1351 0
	cmpl	$32, %edx
	jne	L544
LBE1064:
LBE1062:
	.loc 1 1369 0
	addl	$20, %esp
LBB1083:
LBB1081:
	.loc 1 1351 0
	xorl	%eax, %eax
LBE1081:
LBE1083:
	.loc 1 1369 0
	popl	%ebx
	popl	%esi
	popl	%edi
LVL763:
	popl	%ebp
LVL764:
	ret
LVL765:
	.p2align 4,,7
L542:
LBB1084:
LBB1063:
	.loc 1 1358 0
	movl	%ebp, %eax
LVL766:
	call	_free_mmu_pages
LBE1063:
LBE1084:
	.loc 1 1369 0
	addl	$20, %esp
LBB1085:
LBB1082:
	.loc 1 1358 0
	movl	$-12, %eax
LBE1082:
LBE1085:
	.loc 1 1369 0
	popl	%ebx
	popl	%esi
	popl	%edi
LVL767:
	popl	%ebp
LVL768:
	ret
LVL769:
L549:
	.loc 1 1364 0
	movl	$LC0, 12(%esp)
	movl	$1364, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
	jmp	L539
LFE195:
	.section .rdata,"dr"
___FUNCTION__.2951:
	.ascii "kvm_mmu_zap_page\0"
___FUNCTION__.2807:
	.ascii "mmu_page_remove_parent_pte\0"
___FUNCTION__.2727:
	.ascii "is_empty_shadow_page\0"
___FUNCTION__.2788:
	.ascii "mmu_page_add_parent_pte\0"
___FUNCTION__.2574:
	.ascii "mmu_memory_cache_alloc\0"
___FUNCTION__.2700:
	.ascii "rmap_write_protect\0"
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
	.long	LFB148
	.long	LFE148-LFB148
	.align 4
LEFDE0:
LSFDE2:
	.long	LEFDE2-LASFDE2
LASFDE2:
	.secrel32	Lframe0
	.long	LFB152
	.long	LFE152-LFB152
	.align 4
LEFDE2:
LSFDE4:
	.long	LEFDE4-LASFDE4
LASFDE4:
	.secrel32	Lframe0
	.long	LFB190
	.long	LFE190-LFB190
	.align 4
LEFDE4:
LSFDE6:
	.long	LEFDE6-LASFDE6
LASFDE6:
	.secrel32	Lframe0
	.long	LFB138
	.long	LFE138-LFB138
	.byte	0x4
	.long	LCFI0-LFB138
	.byte	0xe
	.uleb128 0x8
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	LCFI1-LCFI0
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI2-LCFI1
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x3
	.align 4
LEFDE6:
LSFDE8:
	.long	LEFDE8-LASFDE8
LASFDE8:
	.secrel32	Lframe0
	.long	LFB186
	.long	LFE186-LFB186
	.byte	0x4
	.long	LCFI3-LFB186
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x4
	.long	LCFI4-LCFI3
	.byte	0xe
	.uleb128 0x18
	.align 4
LEFDE8:
LSFDE10:
	.long	LEFDE10-LASFDE10
LASFDE10:
	.secrel32	Lframe0
	.long	LFB132
	.long	LFE132-LFB132
	.byte	0x4
	.long	LCFI5-LFB132
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI6-LCFI5
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI7-LCFI6
	.byte	0xe
	.uleb128 0x20
	.byte	0x83
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.align 4
LEFDE10:
LSFDE12:
	.long	LEFDE12-LASFDE12
LASFDE12:
	.secrel32	Lframe0
	.long	LFB150
	.long	LFE150-LFB150
	.byte	0x4
	.long	LCFI8-LFB150
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI9-LCFI8
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI10-LCFI9
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI11-LCFI10
	.byte	0xe
	.uleb128 0x14
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x4
	.long	LCFI12-LCFI11
	.byte	0xe
	.uleb128 0x24
	.align 4
LEFDE12:
LSFDE14:
	.long	LEFDE14-LASFDE14
LASFDE14:
	.secrel32	Lframe0
	.long	LFB154
	.long	LFE154-LFB154
	.align 4
LEFDE14:
LSFDE16:
	.long	LEFDE16-LASFDE16
LASFDE16:
	.secrel32	Lframe0
	.long	LFB162
	.long	LFE162-LFB162
	.align 4
LEFDE16:
LSFDE18:
	.long	LEFDE18-LASFDE18
LASFDE18:
	.secrel32	Lframe0
	.long	LFB130
	.long	LFE130-LFB130
	.byte	0x4
	.long	LCFI13-LFB130
	.byte	0xe
	.uleb128 0x24
	.byte	0x4
	.long	LCFI14-LCFI13
	.byte	0x83
	.uleb128 0x5
	.byte	0x4
	.long	LCFI15-LCFI14
	.byte	0x87
	.uleb128 0x3
	.byte	0x4
	.long	LCFI17-LCFI15
	.byte	0x85
	.uleb128 0x2
	.byte	0x86
	.uleb128 0x4
	.align 4
LEFDE18:
LSFDE20:
	.long	LEFDE20-LASFDE20
LASFDE20:
	.secrel32	Lframe0
	.long	LFB198
	.long	LFE198-LFB198
	.byte	0x4
	.long	LCFI18-LFB198
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI19-LCFI18
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI20-LCFI19
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI21-LCFI20
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI22-LCFI21
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
LEFDE20:
LSFDE22:
	.long	LEFDE22-LASFDE22
LASFDE22:
	.secrel32	Lframe0
	.long	LFB137
	.long	LFE137-LFB137
	.byte	0x4
	.long	LCFI23-LFB137
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI24-LCFI23
	.byte	0xe
	.uleb128 0xc
	.byte	0x87
	.uleb128 0x3
	.byte	0x4
	.long	LCFI25-LCFI24
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI26-LCFI25
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI27-LCFI26
	.byte	0xe
	.uleb128 0x20
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.align 4
LEFDE22:
LSFDE24:
	.long	LEFDE24-LASFDE24
LASFDE24:
	.secrel32	Lframe0
	.long	LFB142
	.long	LFE142-LFB142
	.byte	0x4
	.long	LCFI28-LFB142
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI29-LCFI28
	.byte	0xe
	.uleb128 0xc
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI30-LCFI29
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI31-LCFI30
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI32-LCFI31
	.byte	0xe
	.uleb128 0x28
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.align 4
LEFDE24:
LSFDE26:
	.long	LEFDE26-LASFDE26
LASFDE26:
	.secrel32	Lframe0
	.long	LFB192
	.long	LFE192-LFB192
	.byte	0x4
	.long	LCFI33-LFB192
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE26:
LSFDE28:
	.long	LEFDE28-LASFDE28
LASFDE28:
	.secrel32	Lframe0
	.long	LFB191
	.long	LFE191-LFB191
	.byte	0x4
	.long	LCFI34-LFB191
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI35-LCFI34
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI36-LCFI35
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI37-LCFI36
	.byte	0xe
	.uleb128 0x18
	.byte	0x83
	.uleb128 0x4
	.byte	0x86
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.align 4
LEFDE28:
LSFDE30:
	.long	LEFDE30-LASFDE30
LASFDE30:
	.secrel32	Lframe0
	.long	LFB189
	.long	LFE189-LFB189
	.byte	0x4
	.long	LCFI38-LFB189
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI39-LCFI38
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI40-LCFI39
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI41-LCFI40
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI42-LCFI41
	.byte	0xe
	.uleb128 0x38
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.align 4
LEFDE30:
LSFDE32:
	.long	LEFDE32-LASFDE32
LASFDE32:
	.secrel32	Lframe0
	.long	LFB193
	.long	LFE193-LFB193
	.byte	0x4
	.long	LCFI43-LFB193
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI44-LCFI43
	.byte	0xe
	.uleb128 0xc
	.byte	0x86
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x4
	.long	LCFI45-LCFI44
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI46-LCFI45
	.byte	0xe
	.uleb128 0x14
	.byte	0x83
	.uleb128 0x4
	.align 4
LEFDE32:
LSFDE34:
	.long	LEFDE34-LASFDE34
LASFDE34:
	.secrel32	Lframe0
	.long	LFB197
	.long	LFE197-LFB197
	.byte	0x4
	.long	LCFI47-LFB197
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI48-LCFI47
	.byte	0xe
	.uleb128 0x18
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE34:
LSFDE36:
	.long	LEFDE36-LASFDE36
LASFDE36:
	.secrel32	Lframe0
	.long	LFB124
	.long	LFE124-LFB124
	.byte	0x4
	.long	LCFI49-LFB124
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x4
	.long	LCFI50-LCFI49
	.byte	0xe
	.uleb128 0x14
	.align 4
LEFDE36:
LSFDE38:
	.long	LEFDE38-LASFDE38
LASFDE38:
	.secrel32	Lframe0
	.long	LFB126
	.long	LFE126-LFB126
	.byte	0x4
	.long	LCFI51-LFB126
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x4
	.long	LCFI52-LCFI51
	.byte	0xe
	.uleb128 0x14
	.align 4
LEFDE38:
LSFDE40:
	.long	LEFDE40-LASFDE40
LASFDE40:
	.secrel32	Lframe0
	.long	LFB128
	.long	LFE128-LFB128
	.byte	0x4
	.long	LCFI53-LFB128
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI54-LCFI53
	.byte	0x86
	.uleb128 0x3
	.byte	0x4
	.long	LCFI55-LCFI54
	.byte	0x87
	.uleb128 0x2
	.byte	0x4
	.long	LCFI56-LCFI55
	.byte	0x83
	.uleb128 0x4
	.align 4
LEFDE40:
LSFDE42:
	.long	LEFDE42-LASFDE42
LASFDE42:
	.secrel32	Lframe0
	.long	LFB144
	.long	LFE144-LFB144
	.byte	0x4
	.long	LCFI57-LFB144
	.byte	0xe
	.uleb128 0x8
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	LCFI58-LCFI57
	.byte	0xe
	.uleb128 0xc
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	LCFI59-LCFI58
	.byte	0xe
	.uleb128 0x14
	.align 4
LEFDE42:
LSFDE44:
	.long	LEFDE44-LASFDE44
LASFDE44:
	.secrel32	Lframe0
	.long	LFB139
	.long	LFE139-LFB139
	.byte	0x4
	.long	LCFI60-LFB139
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI61-LCFI60
	.byte	0xe
	.uleb128 0xc
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI62-LCFI61
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI63-LCFI62
	.byte	0xe
	.uleb128 0x14
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x4
	.long	LCFI64-LCFI63
	.byte	0xe
	.uleb128 0x40
	.align 4
LEFDE44:
LSFDE46:
	.long	LEFDE46-LASFDE46
LASFDE46:
	.secrel32	Lframe0
	.long	LFB151
	.long	LFE151-LFB151
	.byte	0x4
	.long	LCFI65-LFB151
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI66-LCFI65
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI67-LCFI66
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI68-LCFI67
	.byte	0xe
	.uleb128 0x14
	.byte	0x83
	.uleb128 0x5
	.byte	0x4
	.long	LCFI69-LCFI68
	.byte	0xe
	.uleb128 0x24
	.align 4
LEFDE46:
LSFDE48:
	.long	LEFDE48-LASFDE48
LASFDE48:
	.secrel32	Lframe0
	.long	LFB185
	.long	LFE185-LFB185
	.byte	0x4
	.long	LCFI70-LFB185
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x4
	.long	LCFI71-LCFI70
	.byte	0xe
	.uleb128 0x18
	.align 4
LEFDE48:
LSFDE50:
	.long	LEFDE50-LASFDE50
LASFDE50:
	.secrel32	Lframe0
	.long	LFB196
	.long	LFE196-LFB196
	.byte	0x4
	.long	LCFI72-LFB196
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI73-LCFI72
	.byte	0xe
	.uleb128 0x18
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE50:
LSFDE52:
	.long	LEFDE52-LASFDE52
LASFDE52:
	.secrel32	Lframe0
	.long	LFB157
	.long	LFE157-LFB157
	.byte	0x4
	.long	LCFI74-LFB157
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI75-LCFI74
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE52:
LSFDE54:
	.long	LEFDE54-LASFDE54
LASFDE54:
	.secrel32	Lframe0
	.long	LFB146
	.long	LFE146-LFB146
	.byte	0x4
	.long	LCFI76-LFB146
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.long	LCFI77-LCFI76
	.byte	0x87
	.uleb128 0x2
	.byte	0x4
	.long	LCFI78-LCFI77
	.byte	0x86
	.uleb128 0x3
	.byte	0x4
	.long	LCFI79-LCFI78
	.byte	0x83
	.uleb128 0x4
	.align 4
LEFDE54:
LSFDE56:
	.long	LEFDE56-LASFDE56
LASFDE56:
	.secrel32	Lframe0
	.long	LFB147
	.long	LFE147-LFB147
	.byte	0x4
	.long	LCFI80-LFB147
	.byte	0xe
	.uleb128 0x1c
	.byte	0x4
	.long	LCFI81-LCFI80
	.byte	0x87
	.uleb128 0x2
	.byte	0x4
	.long	LCFI83-LCFI81
	.byte	0x86
	.uleb128 0x3
	.byte	0x83
	.uleb128 0x4
	.align 4
LEFDE56:
LSFDE58:
	.long	LEFDE58-LASFDE58
LASFDE58:
	.secrel32	Lframe0
	.long	LFB145
	.long	LFE145-LFB145
	.byte	0x4
	.long	LCFI84-LFB145
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI85-LCFI84
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
	.long	LFB163
	.long	LFE163-LFB163
	.byte	0x4
	.long	LCFI86-LFB163
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI87-LCFI86
	.byte	0xe
	.uleb128 0xc
	.byte	0x87
	.uleb128 0x3
	.byte	0x4
	.long	LCFI88-LCFI87
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI89-LCFI88
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI90-LCFI89
	.byte	0xe
	.uleb128 0x50
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.align 4
LEFDE60:
LSFDE62:
	.long	LEFDE62-LASFDE62
LASFDE62:
	.secrel32	Lframe0
	.long	LFB171
	.long	LFE171-LFB171
	.byte	0x4
	.long	LCFI91-LFB171
	.byte	0xe
	.uleb128 0x40
	.byte	0x4
	.long	LCFI92-LCFI91
	.byte	0x87
	.uleb128 0x2
	.byte	0x4
	.long	LCFI93-LCFI92
	.byte	0x83
	.uleb128 0x4
	.byte	0x4
	.long	LCFI94-LCFI93
	.byte	0x86
	.uleb128 0x3
	.align 4
LEFDE62:
LSFDE64:
	.long	LEFDE64-LASFDE64
LASFDE64:
	.secrel32	Lframe0
	.long	LFB172
	.long	LFE172-LFB172
	.byte	0x4
	.long	LCFI95-LFB172
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI96-LCFI95
	.byte	0xe
	.uleb128 0xc
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI97-LCFI96
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x4
	.byte	0x4
	.long	LCFI98-LCFI97
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI99-LCFI98
	.byte	0xe
	.uleb128 0x34
	.byte	0x83
	.uleb128 0x5
	.align 4
LEFDE64:
LSFDE66:
	.long	LEFDE66-LASFDE66
LASFDE66:
	.secrel32	Lframe0
	.long	LFB180
	.long	LFE180-LFB180
	.byte	0x4
	.long	LCFI100-LFB180
	.byte	0xe
	.uleb128 0x3c
	.byte	0x4
	.long	LCFI101-LCFI100
	.byte	0x87
	.uleb128 0x2
	.byte	0x4
	.long	LCFI102-LCFI101
	.byte	0x83
	.uleb128 0x4
	.byte	0x4
	.long	LCFI103-LCFI102
	.byte	0x86
	.uleb128 0x3
	.align 4
LEFDE66:
LSFDE68:
	.long	LEFDE68-LASFDE68
LASFDE68:
	.secrel32	Lframe0
	.long	LFB120
	.long	LFE120-LFB120
	.byte	0x4
	.long	LCFI104-LFB120
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x4
	.long	LCFI105-LCFI104
	.byte	0xe
	.uleb128 0x10
	.align 4
LEFDE68:
LSFDE70:
	.long	LEFDE70-LASFDE70
LASFDE70:
	.secrel32	Lframe0
	.long	LFB170
	.long	LFE170-LFB170
	.byte	0x4
	.long	LCFI106-LFB170
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI107-LCFI106
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI108-LCFI107
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI109-LCFI108
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI110-LCFI109
	.byte	0xe
	.uleb128 0x9c
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
	.long	LFB179
	.long	LFE179-LFB179
	.byte	0x4
	.long	LCFI111-LFB179
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI112-LCFI111
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI113-LCFI112
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI114-LCFI113
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI115-LCFI114
	.byte	0xe
	.uleb128 0x88
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.align 4
LEFDE72:
LSFDE74:
	.long	LEFDE74-LASFDE74
LASFDE74:
	.secrel32	Lframe0
	.long	LFB187
	.long	LFE187-LFB187
	.byte	0x4
	.long	LCFI116-LFB187
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE74:
LSFDE76:
	.long	LEFDE76-LASFDE76
LASFDE76:
	.secrel32	Lframe0
	.long	LFB153
	.long	LFE153-LFB153
	.byte	0x4
	.long	LCFI117-LFB153
	.byte	0xe
	.uleb128 0x40
	.byte	0x4
	.long	LCFI118-LCFI117
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI121-LCFI118
	.byte	0x87
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x4
	.byte	0x83
	.uleb128 0x5
	.align 4
LEFDE76:
LSFDE78:
	.long	LEFDE78-LASFDE78
LASFDE78:
	.secrel32	Lframe0
	.long	LFB195
	.long	LFE195-LFB195
	.byte	0x4
	.long	LCFI122-LFB195
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI123-LCFI122
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI124-LCFI123
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI125-LCFI124
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI126-LCFI125
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
LEFDE78:
	.text
Letext0:
	.section	.debug_loc,"dr"
Ldebug_loc0:
LLST3:
	.long	LFB138-Ltext0
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
	.long	LCFI2-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI2-Ltext0
	.long	LFE138-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST4:
	.long	LVL3-Ltext0
	.long	LVL5-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST5:
	.long	LVL3-Ltext0
	.long	LVL4-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL4-Ltext0
	.long	LVL12-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL13-Ltext0
	.long	LVL16-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST6:
	.long	LVL7-Ltext0
	.long	LVL8-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL9-Ltext0
	.long	LVL10-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL13-Ltext0
	.long	LVL14-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST7:
	.long	LVL6-Ltext0
	.long	LVL11-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL13-Ltext0
	.long	LVL15-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST8:
	.long	LFB186-Ltext0
	.long	LCFI3-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI3-Ltext0
	.long	LCFI4-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI4-Ltext0
	.long	LFE186-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST9:
	.long	LVL17-Ltext0
	.long	LVL18-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL18-Ltext0
	.long	LVL19-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL20-Ltext0
	.long	LVL21-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL21-Ltext0
	.long	LFE186-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST10:
	.long	LFB132-Ltext0
	.long	LCFI5-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI5-Ltext0
	.long	LCFI6-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI6-Ltext0
	.long	LCFI7-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI7-Ltext0
	.long	LFE132-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 32
	.long	0x0
	.long	0x0
LLST11:
	.long	LVL22-Ltext0
	.long	LVL23-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST12:
	.long	LVL24-Ltext0
	.long	LVL25-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL27-Ltext0
	.long	LVL28-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST13:
	.long	LVL24-Ltext0
	.long	LVL26-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL27-Ltext0
	.long	LVL29-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST14:
	.long	LFB150-Ltext0
	.long	LCFI8-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI8-Ltext0
	.long	LCFI9-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI9-Ltext0
	.long	LCFI10-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI10-Ltext0
	.long	LCFI11-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI11-Ltext0
	.long	LCFI12-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI12-Ltext0
	.long	LFE150-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	0x0
	.long	0x0
LLST15:
	.long	LVL30-Ltext0
	.long	LVL31-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL31-Ltext0
	.long	LVL36-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL37-Ltext0
	.long	LFE150-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST16:
	.long	LVL32-Ltext0
	.long	LVL33-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST17:
	.long	LVL31-Ltext0
	.long	LVL34-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	LVL37-Ltext0
	.long	LFE150-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST20:
	.long	LFB130-Ltext0
	.long	LCFI13-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI13-Ltext0
	.long	LFE130-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	0x0
	.long	0x0
LLST21:
	.long	LVL40-Ltext0
	.long	LVL41-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL41-Ltext0
	.long	LVL45-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL47-Ltext0
	.long	LFE130-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST22:
	.long	LVL40-Ltext0
	.long	LVL42-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL42-Ltext0
	.long	LVL43-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL43-Ltext0
	.long	LVL48-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL48-Ltext0
	.long	LVL57-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST23:
	.long	LVL42-Ltext0
	.long	LVL46-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL49-Ltext0
	.long	LFE130-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST24:
	.long	LVL42-Ltext0
	.long	LVL47-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL50-Ltext0
	.long	LVL53-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL53-Ltext0
	.long	LVL54-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL55-Ltext0
	.long	LVL61-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL62-Ltext0
	.long	LFE130-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST25:
	.long	LVL42-Ltext0
	.long	LVL44-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL51-Ltext0
	.long	LVL54-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL55-Ltext0
	.long	LFE130-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST26:
	.long	LVL42-Ltext0
	.long	LVL47-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL52-Ltext0
	.long	LVL54-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL55-Ltext0
	.long	LVL61-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL62-Ltext0
	.long	LFE130-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST27:
	.long	LVL42-Ltext0
	.long	LVL47-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL56-Ltext0
	.long	LVL58-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL59-Ltext0
	.long	LVL60-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL62-Ltext0
	.long	LVL63-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST28:
	.long	LFB198-Ltext0
	.long	LCFI18-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI18-Ltext0
	.long	LCFI19-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI19-Ltext0
	.long	LCFI20-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI20-Ltext0
	.long	LCFI21-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI21-Ltext0
	.long	LCFI22-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI22-Ltext0
	.long	LFE198-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 28
	.long	0x0
	.long	0x0
LLST29:
	.long	LVL64-Ltext0
	.long	LVL68-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL68-Ltext0
	.long	LVL72-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL72-Ltext0
	.long	LVL73-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL73-Ltext0
	.long	LFE198-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST30:
	.long	LVL65-Ltext0
	.long	LVL67-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST31:
	.long	LVL66-Ltext0
	.long	LVL71-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL73-Ltext0
	.long	LFE198-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST32:
	.long	LVL69-Ltext0
	.long	LVL70-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL73-Ltext0
	.long	LVL74-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST33:
	.long	LFB137-Ltext0
	.long	LCFI23-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI23-Ltext0
	.long	LCFI24-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI24-Ltext0
	.long	LCFI25-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI25-Ltext0
	.long	LCFI26-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI26-Ltext0
	.long	LCFI27-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI27-Ltext0
	.long	LFE137-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 32
	.long	0x0
	.long	0x0
LLST34:
	.long	LVL75-Ltext0
	.long	LVL77-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL77-Ltext0
	.long	LVL115-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LVL115-Ltext0
	.long	LFE137-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -24
	.long	0x0
	.long	0x0
LLST35:
	.long	LVL75-Ltext0
	.long	LVL78-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL78-Ltext0
	.long	LVL83-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL83-Ltext0
	.long	LVL86-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL86-Ltext0
	.long	LVL92-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL93-Ltext0
	.long	LVL104-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL105-Ltext0
	.long	LVL108-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL109-Ltext0
	.long	LFE137-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST36:
	.long	LVL75-Ltext0
	.long	LVL76-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL76-Ltext0
	.long	LVL82-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL84-Ltext0
	.long	LVL91-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL93-Ltext0
	.long	LVL97-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL98-Ltext0
	.long	LVL103-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL109-Ltext0
	.long	LFE137-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST37:
	.long	LVL78-Ltext0
	.long	LVL81-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL86-Ltext0
	.long	LVL90-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL93-Ltext0
	.long	LVL102-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL105-Ltext0
	.long	LVL106-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL109-Ltext0
	.long	LFE137-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST38:
	.long	LVL78-Ltext0
	.long	LVL80-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL85-Ltext0
	.long	LVL89-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL93-Ltext0
	.long	LVL95-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL100-Ltext0
	.long	LVL101-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL109-Ltext0
	.long	LFE137-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST39:
	.long	LVL78-Ltext0
	.long	LVL84-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL86-Ltext0
	.long	LVL87-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL88-Ltext0
	.long	LVL94-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL94-Ltext0
	.long	LVL96-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL96-Ltext0
	.long	LVL97-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL97-Ltext0
	.long	LVL98-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL98-Ltext0
	.long	LVL99-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL99-Ltext0
	.long	LVL105-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL105-Ltext0
	.long	LVL107-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL107-Ltext0
	.long	LVL110-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL110-Ltext0
	.long	LVL112-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL112-Ltext0
	.long	LVL116-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST40:
	.long	LVL111-Ltext0
	.long	LVL114-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST41:
	.long	LVL112-Ltext0
	.long	LVL113-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST42:
	.long	LFB142-Ltext0
	.long	LCFI28-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI28-Ltext0
	.long	LCFI29-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI29-Ltext0
	.long	LCFI30-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI30-Ltext0
	.long	LCFI31-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI31-Ltext0
	.long	LCFI32-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI32-Ltext0
	.long	LFE142-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 40
	.long	0x0
	.long	0x0
LLST43:
	.long	LVL117-Ltext0
	.long	LVL118-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL118-Ltext0
	.long	LFE142-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST44:
	.long	LVL117-Ltext0
	.long	LVL118-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL118-Ltext0
	.long	LVL130-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL137-Ltext0
	.long	LVL140-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL141-Ltext0
	.long	LVL142-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST45:
	.long	LVL118-Ltext0
	.long	LVL121-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST46:
	.long	LVL122-Ltext0
	.long	LVL123-Ltext0
	.word	0x6
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	LVL126-Ltext0
	.long	LVL129-Ltext0
	.word	0x6
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	LVL138-Ltext0
	.long	LVL139-Ltext0
	.word	0x6
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST47:
	.long	LVL127-Ltext0
	.long	LVL131-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST48:
	.long	LVL128-Ltext0
	.long	LVL132-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST49:
	.long	LVL134-Ltext0
	.long	LVL136-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL142-Ltext0
	.long	LFE142-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST50:
	.long	LVL134-Ltext0
	.long	LVL135-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST51:
	.long	LFB192-Ltext0
	.long	LCFI33-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI33-Ltext0
	.long	LFE192-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	0x0
	.long	0x0
LLST52:
	.long	LVL143-Ltext0
	.long	LVL144-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL144-Ltext0
	.long	LVL145-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL145-Ltext0
	.long	LFE192-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST53:
	.long	LFB191-Ltext0
	.long	LCFI34-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI34-Ltext0
	.long	LCFI35-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI35-Ltext0
	.long	LCFI36-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI36-Ltext0
	.long	LCFI37-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI37-Ltext0
	.long	LFE191-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST54:
	.long	LVL146-Ltext0
	.long	LVL152-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL152-Ltext0
	.long	LVL163-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL163-Ltext0
	.long	LFE191-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST55:
	.long	0x0
	.long	0x0
LLST56:
	.long	LVL153-Ltext0
	.long	LVL154-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL156-Ltext0
	.long	LVL158-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL160-Ltext0
	.long	LFE191-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST57:
	.long	LVL150-Ltext0
	.long	LVL153-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL153-Ltext0
	.long	LVL154-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL154-Ltext0
	.long	LVL155-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL155-Ltext0
	.long	LVL162-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL162-Ltext0
	.long	LFE191-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST58:
	.long	LVL151-Ltext0
	.long	LVL157-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL159-Ltext0
	.long	LVL161-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST59:
	.long	LFB189-Ltext0
	.long	LCFI38-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI38-Ltext0
	.long	LCFI39-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI39-Ltext0
	.long	LCFI40-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI40-Ltext0
	.long	LCFI41-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI41-Ltext0
	.long	LCFI42-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI42-Ltext0
	.long	LFE189-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 56
	.long	0x0
	.long	0x0
LLST60:
	.long	LVL164-Ltext0
	.long	LVL165-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL165-Ltext0
	.long	LVL169-Ltext0
	.word	0x7
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 8
	.byte	0x93
	.uleb128 0x4
	.long	LVL169-Ltext0
	.long	LVL202-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL202-Ltext0
	.long	LVL203-Ltext0
	.word	0x7
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 8
	.byte	0x93
	.uleb128 0x4
	.long	LVL203-Ltext0
	.long	LFE189-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST61:
	.long	LVL167-Ltext0
	.long	LVL172-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LVL172-Ltext0
	.long	LVL202-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -44
	.long	LVL202-Ltext0
	.long	LFE189-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
LLST62:
	.long	LVL175-Ltext0
	.long	LVL185-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL187-Ltext0
	.long	LVL202-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST63:
	.long	LVL171-Ltext0
	.long	LVL180-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL181-Ltext0
	.long	LVL187-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST64:
	.long	LVL175-Ltext0
	.long	LVL176-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LVL176-Ltext0
	.long	LVL178-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -40
	.long	LVL178-Ltext0
	.long	LVL182-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LVL182-Ltext0
	.long	LVL187-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -40
	.long	LVL187-Ltext0
	.long	LVL202-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST65:
	.long	LVL175-Ltext0
	.long	LVL179-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL182-Ltext0
	.long	LVL183-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL190-Ltext0
	.long	LVL197-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL201-Ltext0
	.long	LVL202-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST66:
	.long	LVL166-Ltext0
	.long	LVL175-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LVL175-Ltext0
	.long	LVL182-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -36
	.long	LVL182-Ltext0
	.long	LVL187-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LVL187-Ltext0
	.long	LVL202-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -36
	.long	LVL202-Ltext0
	.long	LFE189-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST67:
	.long	LVL173-Ltext0
	.long	LVL174-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 28
	.long	LVL174-Ltext0
	.long	LVL199-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 32
	.long	LVL199-Ltext0
	.long	LVL201-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST68:
	.long	LVL170-Ltext0
	.long	LVL202-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -32
	.long	LVL204-Ltext0
	.long	LFE189-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST69:
	.long	LVL175-Ltext0
	.long	LVL186-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL187-Ltext0
	.long	LVL188-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL189-Ltext0
	.long	LVL197-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL198-Ltext0
	.long	LVL200-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL200-Ltext0
	.long	LVL202-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST70:
	.long	LVL175-Ltext0
	.long	LVL177-Ltext0
	.word	0x6
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	LVL182-Ltext0
	.long	LVL184-Ltext0
	.word	0x6
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	LVL191-Ltext0
	.long	LVL192-Ltext0
	.word	0x6
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	LVL195-Ltext0
	.long	LVL196-Ltext0
	.word	0x6
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST71:
	.long	LFB193-Ltext0
	.long	LCFI43-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI43-Ltext0
	.long	LCFI44-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI44-Ltext0
	.long	LCFI45-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI45-Ltext0
	.long	LCFI46-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI46-Ltext0
	.long	LFE193-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST72:
	.long	LVL205-Ltext0
	.long	LVL206-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL206-Ltext0
	.long	LVL208-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST73:
	.long	LFB197-Ltext0
	.long	LCFI47-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI47-Ltext0
	.long	LCFI48-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI48-Ltext0
	.long	LFE197-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST74:
	.long	LVL209-Ltext0
	.long	LVL210-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL210-Ltext0
	.long	LVL211-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL211-Ltext0
	.long	LVL212-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL212-Ltext0
	.long	LFE197-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST75:
	.long	LFB124-Ltext0
	.long	LCFI49-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI49-Ltext0
	.long	LCFI50-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI50-Ltext0
	.long	LFE124-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST76:
	.long	LVL213-Ltext0
	.long	LVL214-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL214-Ltext0
	.long	LVL216-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST77:
	.long	LVL216-Ltext0
	.long	LVL217-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST78:
	.long	LFB126-Ltext0
	.long	LCFI51-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI51-Ltext0
	.long	LCFI52-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI52-Ltext0
	.long	LFE126-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST79:
	.long	LVL218-Ltext0
	.long	LVL219-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL219-Ltext0
	.long	LVL221-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST80:
	.long	LVL221-Ltext0
	.long	LVL222-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST81:
	.long	LFB128-Ltext0
	.long	LCFI53-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI53-Ltext0
	.long	LFE128-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST82:
	.long	LVL223-Ltext0
	.long	LVL224-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL224-Ltext0
	.long	LVL228-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL229-Ltext0
	.long	LFE128-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST83:
	.long	LVL223-Ltext0
	.long	LVL225-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL225-Ltext0
	.long	LVL227-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL227-Ltext0
	.long	LVL230-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL230-Ltext0
	.long	LFE128-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST84:
	.long	LVL225-Ltext0
	.long	LVL226-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL231-Ltext0
	.long	LVL232-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL237-Ltext0
	.long	LVL238-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL241-Ltext0
	.long	LFE128-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST85:
	.long	LVL225-Ltext0
	.long	LVL229-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL232-Ltext0
	.long	LVL233-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL233-Ltext0
	.long	LVL234-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL234-Ltext0
	.long	LVL235-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL235-Ltext0
	.long	LVL237-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL238-Ltext0
	.long	LVL239-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL240-Ltext0
	.long	LVL241-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL242-Ltext0
	.long	LFE128-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST86:
	.long	LVL225-Ltext0
	.long	LVL229-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL236-Ltext0
	.long	LVL237-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST87:
	.long	LFB144-Ltext0
	.long	LCFI57-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI57-Ltext0
	.long	LCFI58-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI58-Ltext0
	.long	LCFI59-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI59-Ltext0
	.long	LFE144-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST88:
	.long	LVL243-Ltext0
	.long	LVL245-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL245-Ltext0
	.long	LVL248-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST89:
	.long	LVL243-Ltext0
	.long	LVL244-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL244-Ltext0
	.long	LVL251-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST90:
	.long	LVL243-Ltext0
	.long	LVL246-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL246-Ltext0
	.long	LVL247-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST91:
	.long	LFB139-Ltext0
	.long	LCFI60-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI60-Ltext0
	.long	LCFI61-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI61-Ltext0
	.long	LCFI62-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI62-Ltext0
	.long	LCFI63-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI63-Ltext0
	.long	LCFI64-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI64-Ltext0
	.long	LFE139-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 64
	.long	0x0
	.long	0x0
LLST92:
	.long	LVL252-Ltext0
	.long	LVL255-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL255-Ltext0
	.long	LVL260-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 28
	.long	LVL260-Ltext0
	.long	LFE139-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -36
	.long	0x0
	.long	0x0
LLST93:
	.long	LVL252-Ltext0
	.long	LVL254-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL254-Ltext0
	.long	LVL262-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL278-Ltext0
	.long	LVL282-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL284-Ltext0
	.long	LVL292-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL293-Ltext0
	.long	LVL294-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL297-Ltext0
	.long	LVL298-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL304-Ltext0
	.long	LVL305-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST94:
	.long	LVL252-Ltext0
	.long	LVL253-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL253-Ltext0
	.long	LVL259-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST95:
	.long	LVL252-Ltext0
	.long	LVL256-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL288-Ltext0
	.long	LVL297-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL301-Ltext0
	.long	LVL302-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL304-Ltext0
	.long	LVL305-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST96:
	.long	LVL257-Ltext0
	.long	LVL258-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST97:
	.long	LVL261-Ltext0
	.long	LVL283-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL284-Ltext0
	.long	LFE139-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST98:
	.long	LVL259-Ltext0
	.long	LVL264-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL278-Ltext0
	.long	LVL280-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL284-Ltext0
	.long	LVL285-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL298-Ltext0
	.long	LVL301-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL303-Ltext0
	.long	LVL304-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST99:
	.long	LVL263-Ltext0
	.long	LVL265-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL265-Ltext0
	.long	LVL268-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL269-Ltext0
	.long	LVL273-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL274-Ltext0
	.long	LVL275-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL278-Ltext0
	.long	LVL280-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL280-Ltext0
	.long	LVL284-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL300-Ltext0
	.long	LVL301-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL302-Ltext0
	.long	LVL303-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL305-Ltext0
	.long	LFE139-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST100:
	.long	LVL264-Ltext0
	.long	LVL275-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL278-Ltext0
	.long	LVL280-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL302-Ltext0
	.long	LVL303-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST101:
	.long	LVL266-Ltext0
	.long	LVL267-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL270-Ltext0
	.long	LVL272-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL278-Ltext0
	.long	LVL279-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL302-Ltext0
	.long	LVL303-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST102:
	.long	LVL263-Ltext0
	.long	LVL281-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL299-Ltext0
	.long	LVL301-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL302-Ltext0
	.long	LVL304-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL305-Ltext0
	.long	LFE139-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST103:
	.long	LVL276-Ltext0
	.long	LVL277-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST104:
	.long	LVL286-Ltext0
	.long	LVL287-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST105:
	.long	LVL278-Ltext0
	.long	LVL284-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	LVL291-Ltext0
	.long	LVL292-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	LVL292-Ltext0
	.long	LVL293-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -28
	.long	LVL293-Ltext0
	.long	LVL296-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	LVL296-Ltext0
	.long	LVL297-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -28
	.long	LVL301-Ltext0
	.long	LVL302-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	0x0
	.long	0x0
LLST106:
	.long	LVL278-Ltext0
	.long	LVL280-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL289-Ltext0
	.long	LVL290-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL293-Ltext0
	.long	LVL295-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL301-Ltext0
	.long	LVL302-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL304-Ltext0
	.long	LVL305-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST107:
	.long	LVL278-Ltext0
	.long	LVL282-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL292-Ltext0
	.long	LVL297-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL301-Ltext0
	.long	LVL302-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST108:
	.long	LFB151-Ltext0
	.long	LCFI65-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI65-Ltext0
	.long	LCFI66-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI66-Ltext0
	.long	LCFI67-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI67-Ltext0
	.long	LCFI68-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI68-Ltext0
	.long	LCFI69-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI69-Ltext0
	.long	LFE151-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	0x0
	.long	0x0
LLST109:
	.long	LVL306-Ltext0
	.long	LVL309-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL309-Ltext0
	.long	LVL318-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL320-Ltext0
	.long	LFE151-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST110:
	.long	LVL307-Ltext0
	.long	LVL317-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL320-Ltext0
	.long	LFE151-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST111:
	.long	LVL308-Ltext0
	.long	LVL319-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL320-Ltext0
	.long	LFE151-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST112:
	.long	LVL313-Ltext0
	.long	LVL315-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST113:
	.long	LVL309-Ltext0
	.long	LVL310-Ltext0
	.word	0x6
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.long	LVL314-Ltext0
	.long	LVL316-Ltext0
	.word	0x6
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST114:
	.long	LFB185-Ltext0
	.long	LCFI70-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI70-Ltext0
	.long	LCFI71-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI71-Ltext0
	.long	LFE185-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST115:
	.long	LVL321-Ltext0
	.long	LVL322-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL322-Ltext0
	.long	LVL323-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL324-Ltext0
	.long	LVL325-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL326-Ltext0
	.long	LVL327-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL327-Ltext0
	.long	LVL328-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL328-Ltext0
	.long	LFE185-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST116:
	.long	LFB196-Ltext0
	.long	LCFI72-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI72-Ltext0
	.long	LCFI73-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI73-Ltext0
	.long	LFE196-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST117:
	.long	LVL329-Ltext0
	.long	LVL330-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL330-Ltext0
	.long	LVL331-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL331-Ltext0
	.long	LVL332-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL332-Ltext0
	.long	LFE196-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST118:
	.long	LFB157-Ltext0
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
	.long	LFE157-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST119:
	.long	LVL333-Ltext0
	.long	LVL334-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL334-Ltext0
	.long	LVL335-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL335-Ltext0
	.long	LVL336-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL336-Ltext0
	.long	LFE157-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST120:
	.long	LFB146-Ltext0
	.long	LCFI76-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI76-Ltext0
	.long	LFE146-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 32
	.long	0x0
	.long	0x0
LLST121:
	.long	LVL337-Ltext0
	.long	LVL339-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL339-Ltext0
	.long	LVL342-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	LVL342-Ltext0
	.long	LVL343-Ltext0
	.word	0x7
	.byte	0x91
	.sleb128 4
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	LVL343-Ltext0
	.long	LVL345-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL345-Ltext0
	.long	LVL346-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	LVL346-Ltext0
	.long	LVL347-Ltext0
	.word	0x7
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 8
	.byte	0x93
	.uleb128 0x4
	.long	LVL347-Ltext0
	.long	LFE146-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST122:
	.long	LVL340-Ltext0
	.long	LVL341-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL343-Ltext0
	.long	LVL344-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL345-Ltext0
	.long	LVL347-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST123:
	.long	LFB147-Ltext0
	.long	LCFI80-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI80-Ltext0
	.long	LFE147-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 28
	.long	0x0
	.long	0x0
LLST124:
	.long	LVL348-Ltext0
	.long	LVL352-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL352-Ltext0
	.long	LVL355-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL355-Ltext0
	.long	LFE147-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST125:
	.long	LVL350-Ltext0
	.long	LVL351-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST126:
	.long	LFB145-Ltext0
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
	.long	LFE145-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST127:
	.long	LVL356-Ltext0
	.long	LVL359-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL359-Ltext0
	.long	LVL362-Ltext0
	.word	0x7
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 8
	.byte	0x93
	.uleb128 0x4
	.long	LVL362-Ltext0
	.long	LFE145-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST128:
	.long	LVL360-Ltext0
	.long	LVL361-Ltext0
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
	.long	LFB163-Ltext0
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
	.long	LCFI88-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI88-Ltext0
	.long	LCFI89-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI89-Ltext0
	.long	LCFI90-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI90-Ltext0
	.long	LFE163-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 80
	.long	0x0
	.long	0x0
LLST130:
	.long	LVL363-Ltext0
	.long	LVL365-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL365-Ltext0
	.long	LVL371-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL373-Ltext0
	.long	LVL391-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST131:
	.long	LVL363-Ltext0
	.long	LVL366-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL366-Ltext0
	.long	LVL372-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL373-Ltext0
	.long	LVL392-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST132:
	.long	LVL363-Ltext0
	.long	LVL364-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL364-Ltext0
	.long	LVL368-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 40
	.long	LVL368-Ltext0
	.long	LFE163-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -40
	.long	0x0
	.long	0x0
LLST133:
	.long	0x0
	.long	0x0
LLST134:
	.long	LVL368-Ltext0
	.long	LVL369-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL378-Ltext0
	.long	LVL381-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL385-Ltext0
	.long	LVL388-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL389-Ltext0
	.long	LVL390-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST135:
	.long	LVL368-Ltext0
	.long	LVL373-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 48
	.long	LVL375-Ltext0
	.long	LFE163-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 48
	.long	0x0
	.long	0x0
LLST136:
	.long	LVL382-Ltext0
	.long	LVL384-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST137:
	.long	LFB171-Ltext0
	.long	LCFI91-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI91-Ltext0
	.long	LFE171-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 64
	.long	0x0
	.long	0x0
LLST138:
	.long	LVL393-Ltext0
	.long	LVL397-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL397-Ltext0
	.long	LVL407-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL407-Ltext0
	.long	LFE171-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST139:
	.long	LVL395-Ltext0
	.long	LVL398-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	LVL398-Ltext0
	.long	LVL399-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	LVL399-Ltext0
	.long	LVL402-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	LVL402-Ltext0
	.long	LVL403-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	LVL403-Ltext0
	.long	LVL405-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST140:
	.long	LVL396-Ltext0
	.long	LVL398-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL402-Ltext0
	.long	LVL403-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST141:
	.long	LFB172-Ltext0
	.long	LCFI95-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI95-Ltext0
	.long	LCFI96-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI96-Ltext0
	.long	LCFI97-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI97-Ltext0
	.long	LCFI98-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI98-Ltext0
	.long	LCFI99-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI99-Ltext0
	.long	LFE172-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 52
	.long	0x0
	.long	0x0
LLST142:
	.long	LVL408-Ltext0
	.long	LVL410-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL410-Ltext0
	.long	LVL425-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL426-Ltext0
	.long	LVL428-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL430-Ltext0
	.long	LFE172-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST143:
	.long	LVL408-Ltext0
	.long	LVL410-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL410-Ltext0
	.long	LVL414-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 28
	.long	LVL414-Ltext0
	.long	LFE172-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -24
	.long	0x0
	.long	0x0
LLST144:
	.long	LVL408-Ltext0
	.long	LVL409-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL409-Ltext0
	.long	LVL415-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	LVL415-Ltext0
	.long	LVL419-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -28
	.long	LVL419-Ltext0
	.long	LVL422-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	LVL422-Ltext0
	.long	LVL433-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -28
	.long	LVL433-Ltext0
	.long	LFE172-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST145:
	.long	0x0
	.long	0x0
LLST146:
	.long	LVL415-Ltext0
	.long	LVL416-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL421-Ltext0
	.long	LVL424-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL426-Ltext0
	.long	LVL427-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL430-Ltext0
	.long	LVL433-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST147:
	.long	LVL411-Ltext0
	.long	LVL423-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL426-Ltext0
	.long	LVL429-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL430-Ltext0
	.long	LFE172-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST148:
	.long	LVL417-Ltext0
	.long	LVL420-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST149:
	.long	LFB180-Ltext0
	.long	LCFI100-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI100-Ltext0
	.long	LFE180-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 60
	.long	0x0
	.long	0x0
LLST150:
	.long	LVL434-Ltext0
	.long	LVL438-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL438-Ltext0
	.long	LVL448-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL448-Ltext0
	.long	LFE180-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST151:
	.long	LVL436-Ltext0
	.long	LVL439-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	LVL439-Ltext0
	.long	LVL440-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	LVL440-Ltext0
	.long	LVL443-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	LVL443-Ltext0
	.long	LVL444-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	LVL444-Ltext0
	.long	LVL446-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST152:
	.long	LVL437-Ltext0
	.long	LVL439-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL443-Ltext0
	.long	LVL444-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST153:
	.long	LFB120-Ltext0
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
	.long	LFE120-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST154:
	.long	LVL449-Ltext0
	.long	LVL450-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL450-Ltext0
	.long	LVL455-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL456-Ltext0
	.long	LVL463-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL464-Ltext0
	.long	LFE120-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST155:
	.long	LVL453-Ltext0
	.long	LVL454-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL461-Ltext0
	.long	LVL462-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST156:
	.long	LVL451-Ltext0
	.long	LVL457-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL458-Ltext0
	.long	LVL459-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL466-Ltext0
	.long	LVL467-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST157:
	.long	LVL452-Ltext0
	.long	LVL456-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL460-Ltext0
	.long	LVL464-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL465-Ltext0
	.long	LVL467-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL468-Ltext0
	.long	LVL469-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST158:
	.long	LFB170-Ltext0
	.long	LCFI106-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI106-Ltext0
	.long	LCFI107-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI107-Ltext0
	.long	LCFI108-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI108-Ltext0
	.long	LCFI109-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI109-Ltext0
	.long	LCFI110-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI110-Ltext0
	.long	LFE170-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 156
	.long	0x0
	.long	0x0
LLST159:
	.long	LVL470-Ltext0
	.long	LVL473-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL473-Ltext0
	.long	LVL474-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL474-Ltext0
	.long	LVL478-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL478-Ltext0
	.long	LVL485-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL500-Ltext0
	.long	LVL501-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL512-Ltext0
	.long	LVL516-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL522-Ltext0
	.long	LVL525-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL537-Ltext0
	.long	LVL538-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL539-Ltext0
	.long	LVL544-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST160:
	.long	LVL473-Ltext0
	.long	LVL478-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 60
	.long	LVL480-Ltext0
	.long	LVL514-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 60
	.long	LVL514-Ltext0
	.long	LVL519-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -96
	.long	LVL519-Ltext0
	.long	LVL524-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 60
	.long	LVL524-Ltext0
	.long	LVL539-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -96
	.long	LVL539-Ltext0
	.long	LVL544-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 60
	.long	LVL544-Ltext0
	.long	LVL548-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -96
	.long	LVL548-Ltext0
	.long	LVL568-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 60
	.long	LVL568-Ltext0
	.long	LVL571-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -96
	.long	LVL571-Ltext0
	.long	LVL578-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 60
	.long	LVL578-Ltext0
	.long	LVL580-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -96
	.long	LVL580-Ltext0
	.long	LFE170-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 60
	.long	0x0
	.long	0x0
LLST161:
	.long	LVL473-Ltext0
	.long	LVL478-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 64
	.long	LVL479-Ltext0
	.long	LVL527-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 64
	.long	LVL527-Ltext0
	.long	LVL537-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -92
	.long	LVL537-Ltext0
	.long	LVL544-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 64
	.long	LVL544-Ltext0
	.long	LVL548-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -92
	.long	LVL548-Ltext0
	.long	LVL568-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 64
	.long	LVL568-Ltext0
	.long	LVL571-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -92
	.long	LVL571-Ltext0
	.long	LVL578-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 64
	.long	LVL578-Ltext0
	.long	LVL580-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -92
	.long	LVL580-Ltext0
	.long	LFE170-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 64
	.long	0x0
	.long	0x0
LLST162:
	.long	LVL473-Ltext0
	.long	LVL477-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL487-Ltext0
	.long	LVL488-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL488-Ltext0
	.long	LVL496-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL496-Ltext0
	.long	LVL498-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL498-Ltext0
	.long	LVL500-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL503-Ltext0
	.long	LVL522-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL523-Ltext0
	.long	LVL539-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL544-Ltext0
	.long	LVL550-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL550-Ltext0
	.long	LVL553-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL553-Ltext0
	.long	LVL580-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL580-Ltext0
	.long	LVL581-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL581-Ltext0
	.long	LFE170-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST163:
	.long	LVL473-Ltext0
	.long	LVL474-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL516-Ltext0
	.long	LVL519-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL535-Ltext0
	.long	LVL537-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL538-Ltext0
	.long	LVL539-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL547-Ltext0
	.long	LVL548-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL570-Ltext0
	.long	LVL571-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST164:
	.long	LVL471-Ltext0
	.long	LVL472-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL478-Ltext0
	.long	LVL486-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL500-Ltext0
	.long	LVL502-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL512-Ltext0
	.long	LVL513-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL518-Ltext0
	.long	LVL519-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL522-Ltext0
	.long	LVL524-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL539-Ltext0
	.long	LVL544-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST165:
	.long	LVL494-Ltext0
	.long	LVL497-Ltext0
	.word	0x6
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST166:
	.long	LVL483-Ltext0
	.long	LVL484-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL485-Ltext0
	.long	LVL486-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL539-Ltext0
	.long	LVL541-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL543-Ltext0
	.long	LVL544-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST167:
	.long	LVL473-Ltext0
	.long	LVL478-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 68
	.long	LVL481-Ltext0
	.long	LVL500-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 68
	.long	LVL503-Ltext0
	.long	LVL504-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 68
	.long	LVL504-Ltext0
	.long	LVL512-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -88
	.long	LVL512-Ltext0
	.long	LVL548-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 68
	.long	LVL548-Ltext0
	.long	LVL549-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -88
	.long	LVL549-Ltext0
	.long	LVL551-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 68
	.long	LVL551-Ltext0
	.long	LVL568-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -88
	.long	LVL568-Ltext0
	.long	LVL571-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 68
	.long	LVL571-Ltext0
	.long	LVL578-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -88
	.long	LVL578-Ltext0
	.long	LVL580-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 68
	.long	LVL580-Ltext0
	.long	LFE170-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -88
	.long	0x0
	.long	0x0
LLST168:
	.long	LVL493-Ltext0
	.long	LVL495-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST169:
	.long	LVL490-Ltext0
	.long	LVL491-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL521-Ltext0
	.long	LVL522-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST170:
	.long	LVL489-Ltext0
	.long	LVL492-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL520-Ltext0
	.long	LVL522-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST171:
	.long	LVL506-Ltext0
	.long	LVL507-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	LVL508-Ltext0
	.long	LVL513-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	LVL548-Ltext0
	.long	LVL549-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	LVL565-Ltext0
	.long	LVL567-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	LVL571-Ltext0
	.long	LVL576-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST172:
	.long	LVL572-Ltext0
	.long	LVL573-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL574-Ltext0
	.long	LVL575-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST173:
	.long	LVL511-Ltext0
	.long	LVL513-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	LVL558-Ltext0
	.long	LVL559-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	LVL560-Ltext0
	.long	LVL564-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	LVL567-Ltext0
	.long	LVL568-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	LVL576-Ltext0
	.long	LVL578-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	LVL581-Ltext0
	.long	LFE170-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST174:
	.long	LVL473-Ltext0
	.long	LVL478-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -80
	.long	LVL511-Ltext0
	.long	LVL519-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -80
	.long	LVL524-Ltext0
	.long	LVL539-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -80
	.long	LVL544-Ltext0
	.long	LVL548-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -80
	.long	LVL554-Ltext0
	.long	LVL557-Ltext0
	.word	0xa
	.byte	0x74
	.sleb128 76
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -76
	.byte	0x93
	.uleb128 0x4
	.long	LVL557-Ltext0
	.long	LVL562-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 76
	.long	LVL562-Ltext0
	.long	LVL564-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -80
	.long	LVL567-Ltext0
	.long	LVL571-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -80
	.long	LVL576-Ltext0
	.long	LVL580-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -80
	.long	LVL581-Ltext0
	.long	LFE170-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -80
	.long	0x0
	.long	0x0
LLST175:
	.long	LVL582-Ltext0
	.long	LVL583-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL584-Ltext0
	.long	LVL585-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST176:
	.long	LVL516-Ltext0
	.long	LVL518-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL528-Ltext0
	.long	LVL537-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL546-Ltext0
	.long	LVL548-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL568-Ltext0
	.long	LVL571-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST177:
	.long	LVL515-Ltext0
	.long	LVL517-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL526-Ltext0
	.long	LVL530-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL532-Ltext0
	.long	LVL533-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL544-Ltext0
	.long	LVL545-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL546-Ltext0
	.long	LVL548-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL568-Ltext0
	.long	LVL569-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL578-Ltext0
	.long	LVL579-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST178:
	.long	LVL529-Ltext0
	.long	LVL535-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL568-Ltext0
	.long	LVL570-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST179:
	.long	LVL530-Ltext0
	.long	LVL531-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL534-Ltext0
	.long	LVL536-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST180:
	.long	LFB179-Ltext0
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
	.long	LCFI114-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI114-Ltext0
	.long	LCFI115-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI115-Ltext0
	.long	LFE179-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 136
	.long	0x0
	.long	0x0
LLST181:
	.long	LVL586-Ltext0
	.long	LVL589-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL589-Ltext0
	.long	LVL590-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL590-Ltext0
	.long	LVL592-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL592-Ltext0
	.long	LVL599-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL614-Ltext0
	.long	LVL615-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL630-Ltext0
	.long	LVL633-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL640-Ltext0
	.long	LVL647-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL656-Ltext0
	.long	LVL658-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL659-Ltext0
	.long	LVL663-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL665-Ltext0
	.long	LVL666-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL712-Ltext0
	.long	LVL714-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST182:
	.long	LVL589-Ltext0
	.long	LVL592-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 32
	.long	LVL594-Ltext0
	.long	LVL631-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 32
	.long	LVL631-Ltext0
	.long	LVL637-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -104
	.long	LVL637-Ltext0
	.long	LVL642-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 32
	.long	LVL642-Ltext0
	.long	LVL659-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -104
	.long	LVL659-Ltext0
	.long	LVL662-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 32
	.long	LVL662-Ltext0
	.long	LVL667-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -104
	.long	LVL667-Ltext0
	.long	LVL700-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 32
	.long	LVL700-Ltext0
	.long	LVL703-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -104
	.long	LVL703-Ltext0
	.long	LVL712-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 32
	.long	LVL712-Ltext0
	.long	LVL714-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -104
	.long	LVL714-Ltext0
	.long	LFE179-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 32
	.long	0x0
	.long	0x0
LLST183:
	.long	LVL589-Ltext0
	.long	LVL592-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	LVL593-Ltext0
	.long	LVL645-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	LVL645-Ltext0
	.long	LVL656-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -100
	.long	LVL656-Ltext0
	.long	LVL662-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	LVL662-Ltext0
	.long	LVL667-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -100
	.long	LVL667-Ltext0
	.long	LVL700-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	LVL700-Ltext0
	.long	LVL703-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -100
	.long	LVL703-Ltext0
	.long	LVL712-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	LVL712-Ltext0
	.long	LVL714-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -100
	.long	LVL714-Ltext0
	.long	LFE179-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	0x0
	.long	0x0
LLST184:
	.long	LVL589-Ltext0
	.long	LVL592-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -96
	.long	LVL601-Ltext0
	.long	LVL602-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -112
	.long	LVL602-Ltext0
	.long	LVL610-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 40
	.long	LVL610-Ltext0
	.long	LVL612-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	LVL612-Ltext0
	.long	LVL614-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 40
	.long	LVL617-Ltext0
	.long	LVL621-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 40
	.long	LVL621-Ltext0
	.long	LVL637-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -96
	.long	LVL637-Ltext0
	.long	LVL640-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 40
	.long	LVL641-Ltext0
	.long	LVL659-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -96
	.long	LVL662-Ltext0
	.long	LVL672-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -96
	.long	LVL672-Ltext0
	.long	LVL673-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 40
	.long	LVL673-Ltext0
	.long	LVL685-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -112
	.long	LVL685-Ltext0
	.long	LVL695-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -96
	.long	LVL695-Ltext0
	.long	LVL696-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 40
	.long	LVL696-Ltext0
	.long	LVL714-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -96
	.long	LVL714-Ltext0
	.long	LVL715-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -112
	.long	LVL715-Ltext0
	.long	LFE179-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -96
	.long	0x0
	.long	0x0
LLST185:
	.long	LVL589-Ltext0
	.long	LVL590-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL633-Ltext0
	.long	LVL637-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL655-Ltext0
	.long	LVL656-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL658-Ltext0
	.long	LVL659-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL666-Ltext0
	.long	LVL667-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL702-Ltext0
	.long	LVL703-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST186:
	.long	LVL587-Ltext0
	.long	LVL588-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL592-Ltext0
	.long	LVL595-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL614-Ltext0
	.long	LVL616-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL636-Ltext0
	.long	LVL637-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST187:
	.long	LVL608-Ltext0
	.long	LVL611-Ltext0
	.word	0x6
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST188:
	.long	LVL597-Ltext0
	.long	LVL600-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL659-Ltext0
	.long	LVL660-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL661-Ltext0
	.long	LVL662-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST189:
	.long	LVL589-Ltext0
	.long	LVL592-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 44
	.long	LVL596-Ltext0
	.long	LVL614-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 44
	.long	LVL617-Ltext0
	.long	LVL618-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 44
	.long	LVL618-Ltext0
	.long	LVL630-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -92
	.long	LVL630-Ltext0
	.long	LVL667-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 44
	.long	LVL667-Ltext0
	.long	LVL672-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -92
	.long	LVL672-Ltext0
	.long	LVL674-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 44
	.long	LVL674-Ltext0
	.long	LVL700-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -92
	.long	LVL700-Ltext0
	.long	LVL703-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 44
	.long	LVL703-Ltext0
	.long	LVL712-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -92
	.long	LVL712-Ltext0
	.long	LVL714-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 44
	.long	LVL714-Ltext0
	.long	LFE179-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -92
	.long	0x0
	.long	0x0
LLST190:
	.long	LVL607-Ltext0
	.long	LVL609-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST191:
	.long	LVL604-Ltext0
	.long	LVL605-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL638-Ltext0
	.long	LVL640-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST192:
	.long	LVL603-Ltext0
	.long	LVL606-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL639-Ltext0
	.long	LVL640-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST193:
	.long	LVL620-Ltext0
	.long	LVL622-Ltext0
	.word	0x6
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.long	LVL623-Ltext0
	.long	LVL624-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL624-Ltext0
	.long	LVL628-Ltext0
	.word	0x6
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.long	LVL667-Ltext0
	.long	LVL671-Ltext0
	.word	0x6
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.long	LVL696-Ltext0
	.long	LVL698-Ltext0
	.word	0x6
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.long	LVL703-Ltext0
	.long	LVL710-Ltext0
	.word	0x6
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST194:
	.long	LVL626-Ltext0
	.long	LVL633-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL642-Ltext0
	.long	LVL646-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL656-Ltext0
	.long	LVL657-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL662-Ltext0
	.long	LVL663-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL667-Ltext0
	.long	LVL668-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL696-Ltext0
	.long	LVL698-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL703-Ltext0
	.long	LVL706-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL707-Ltext0
	.long	LVL709-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL712-Ltext0
	.long	LVL714-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST195:
	.long	LVL704-Ltext0
	.long	LVL705-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL707-Ltext0
	.long	LVL708-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST196:
	.long	LVL669-Ltext0
	.long	LVL671-Ltext0
	.word	0x6
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.long	LVL682-Ltext0
	.long	LVL686-Ltext0
	.word	0x6
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.long	LVL687-Ltext0
	.long	LVL688-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL688-Ltext0
	.long	LVL693-Ltext0
	.word	0x6
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.long	LVL698-Ltext0
	.long	LVL700-Ltext0
	.word	0x6
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.long	LVL710-Ltext0
	.long	LVL712-Ltext0
	.word	0x6
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.long	LVL715-Ltext0
	.long	LFE179-Ltext0
	.word	0x6
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST197:
	.long	LVL589-Ltext0
	.long	LVL592-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -60
	.long	LVL629-Ltext0
	.long	LVL637-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -60
	.long	LVL642-Ltext0
	.long	LVL659-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -60
	.long	LVL662-Ltext0
	.long	LVL667-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -60
	.long	LVL669-Ltext0
	.long	LVL672-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -60
	.long	LVL677-Ltext0
	.long	LVL680-Ltext0
	.word	0x6
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL681-Ltext0
	.long	LVL683-Ltext0
	.word	0x8
	.byte	0x74
	.sleb128 76
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL684-Ltext0
	.long	LVL691-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 76
	.long	LVL691-Ltext0
	.long	LVL695-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -60
	.long	LVL698-Ltext0
	.long	LVL703-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -60
	.long	LVL710-Ltext0
	.long	LVL714-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -60
	.long	LVL715-Ltext0
	.long	LFE179-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -60
	.long	0x0
	.long	0x0
LLST198:
	.long	LVL629-Ltext0
	.long	LVL633-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL642-Ltext0
	.long	LVL646-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL656-Ltext0
	.long	LVL657-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL662-Ltext0
	.long	LVL663-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL690-Ltext0
	.long	LVL695-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL698-Ltext0
	.long	LVL699-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL710-Ltext0
	.long	LVL714-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL715-Ltext0
	.long	LVL718-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	LVL719-Ltext0
	.long	LVL721-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST199:
	.long	LVL716-Ltext0
	.long	LVL717-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL719-Ltext0
	.long	LVL720-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST200:
	.long	LVL633-Ltext0
	.long	LVL636-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL646-Ltext0
	.long	LVL656-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL665-Ltext0
	.long	LVL667-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL700-Ltext0
	.long	LVL703-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST201:
	.long	LVL632-Ltext0
	.long	LVL634-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL644-Ltext0
	.long	LVL648-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL650-Ltext0
	.long	LVL651-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL662-Ltext0
	.long	LVL667-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL700-Ltext0
	.long	LVL701-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL712-Ltext0
	.long	LVL713-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST202:
	.long	LVL647-Ltext0
	.long	LVL654-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL700-Ltext0
	.long	LVL702-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST203:
	.long	LVL648-Ltext0
	.long	LVL649-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL652-Ltext0
	.long	LVL653-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST204:
	.long	LFB187-Ltext0
	.long	LCFI116-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI116-Ltext0
	.long	LFE187-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	0x0
	.long	0x0
LLST205:
	.long	LVL722-Ltext0
	.long	LVL724-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL724-Ltext0
	.long	LVL726-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL726-Ltext0
	.long	LVL727-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL727-Ltext0
	.long	LVL729-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL729-Ltext0
	.long	LFE187-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST206:
	.long	LVL723-Ltext0
	.long	LVL725-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL727-Ltext0
	.long	LVL728-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST207:
	.long	LFB153-Ltext0
	.long	LCFI117-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI117-Ltext0
	.long	LFE153-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 64
	.long	0x0
	.long	0x0
LLST208:
	.long	LVL730-Ltext0
	.long	LVL732-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL732-Ltext0
	.long	LVL736-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL736-Ltext0
	.long	LVL737-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL737-Ltext0
	.long	LFE153-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST209:
	.long	LVL731-Ltext0
	.long	LVL733-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 32
	.long	LVL733-Ltext0
	.long	LVL737-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -32
	.long	LVL737-Ltext0
	.long	LVL755-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 32
	.long	LVL755-Ltext0
	.long	LFE153-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -32
	.long	0x0
	.long	0x0
LLST210:
	.long	LVL733-Ltext0
	.long	LVL735-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL738-Ltext0
	.long	LVL745-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL746-Ltext0
	.long	LVL749-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL750-Ltext0
	.long	LFE153-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST211:
	.long	LVL741-Ltext0
	.long	LVL743-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL746-Ltext0
	.long	LVL747-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL748-Ltext0
	.long	LVL749-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST212:
	.long	LVL733-Ltext0
	.long	LVL734-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL751-Ltext0
	.long	LVL753-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL754-Ltext0
	.long	LFE153-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST213:
	.long	LVL733-Ltext0
	.long	LVL737-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	LVL740-Ltext0
	.long	LVL745-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	LVL746-Ltext0
	.long	LVL749-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	LVL750-Ltext0
	.long	LVL752-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	LVL752-Ltext0
	.long	LFE153-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -28
	.long	0x0
	.long	0x0
LLST214:
	.long	LFB195-Ltext0
	.long	LCFI122-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI122-Ltext0
	.long	LCFI123-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI123-Ltext0
	.long	LCFI124-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI124-Ltext0
	.long	LCFI125-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI125-Ltext0
	.long	LCFI126-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI126-Ltext0
	.long	LFE195-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 40
	.long	0x0
	.long	0x0
LLST215:
	.long	LVL756-Ltext0
	.long	LVL757-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL757-Ltext0
	.long	LVL764-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL764-Ltext0
	.long	LVL765-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL765-Ltext0
	.long	LVL768-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL768-Ltext0
	.long	LVL769-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL769-Ltext0
	.long	LFE195-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST216:
	.long	LVL759-Ltext0
	.long	LVL760-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL761-Ltext0
	.long	LVL762-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL765-Ltext0
	.long	LVL766-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST217:
	.long	LVL758-Ltext0
	.long	LVL763-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL765-Ltext0
	.long	LVL767-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
	.file 6 "include/linux/winkvmint.h"
	.file 7 "include/linux/winkvm.h"
	.file 8 "include/linux/kvm.h"
	.section	.debug_info,"dr"
	.long	0x574b
	.word	0x2
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C 4.3.4 20090804 (release) 1\0"
	.byte	0x1
	.ascii "/home/ddk50/vmware/winkvm/kvm/kernel/mmu.c\0"
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
	.long	0xa8
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
	.long	0xd3
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
	.long	0xfd
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
	.long	0x12b
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x3
	.ascii "u8\0"
	.byte	0x6
	.byte	0x1a
	.long	0xa8
	.uleb128 0x3
	.ascii "u16\0"
	.byte	0x6
	.byte	0x1b
	.long	0xd3
	.uleb128 0x3
	.ascii "u32\0"
	.byte	0x6
	.byte	0x1c
	.long	0xfd
	.uleb128 0x3
	.ascii "u64\0"
	.byte	0x6
	.byte	0x1d
	.long	0x11e
	.uleb128 0x3
	.ascii "size_t\0"
	.byte	0x6
	.byte	0x3a
	.long	0xfd
	.uleb128 0x4
	.secrel32	LASF0
	.byte	0x8
	.byte	0x4
	.byte	0x1a
	.long	0x1a9
	.uleb128 0x5
	.ascii "next\0"
	.byte	0x4
	.byte	0x1b
	.long	0x1a9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "prev\0"
	.byte	0x4
	.byte	0x1b
	.long	0x1a9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x17e
	.uleb128 0x7
	.secrel32	LASF1
	.byte	0x4
	.byte	0x4
	.word	0x2c1
	.long	0x1ce
	.uleb128 0x8
	.ascii "first\0"
	.byte	0x4
	.word	0x2c2
	.long	0x1fd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.secrel32	LASF2
	.byte	0x8
	.byte	0x4
	.word	0x2c2
	.long	0x1fd
	.uleb128 0x8
	.ascii "next\0"
	.byte	0x4
	.word	0x2c6
	.long	0x1fd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "pprev\0"
	.byte	0x4
	.word	0x2c6
	.long	0x203
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1ce
	.uleb128 0x6
	.byte	0x4
	.long	0x1fd
	.uleb128 0x9
	.ascii "page_mapped\0"
	.byte	0x18
	.byte	0x7
	.byte	0xd
	.long	0x27b
	.uleb128 0x5
	.ascii "size\0"
	.byte	0x7
	.byte	0xe
	.long	0x27b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.secrel32	LASF3
	.byte	0x7
	.byte	0xf
	.long	0x290
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "h_pfn\0"
	.byte	0x7
	.byte	0x10
	.long	0x27b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "g_pfn\0"
	.byte	0x7
	.byte	0x11
	.long	0x27b
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "pMdl\0"
	.byte	0x7
	.byte	0x12
	.long	0x290
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "userVA\0"
	.byte	0x7
	.byte	0x13
	.long	0x290
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0x0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.uleb128 0xb
	.byte	0x4
	.uleb128 0x9
	.ascii "page_independed\0"
	.byte	0x10
	.byte	0x7
	.byte	0x16
	.long	0x2ec
	.uleb128 0x5
	.ascii "size\0"
	.byte	0x7
	.byte	0x17
	.long	0x27b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.secrel32	LASF3
	.byte	0x7
	.byte	0x18
	.long	0x290
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "h_pfn\0"
	.byte	0x7
	.byte	0x19
	.long	0x27b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "head_page\0"
	.byte	0x7
	.byte	0x1a
	.long	0x32b
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x4
	.secrel32	LASF4
	.byte	0x24
	.byte	0x7
	.byte	0xb
	.long	0x32b
	.uleb128 0xc
	.long	0x331
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.secrel32	LASF5
	.byte	0x7
	.byte	0x22
	.long	0x27b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "page_type\0"
	.byte	0x7
	.byte	0x23
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xc
	.long	0x35a
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2ec
	.uleb128 0xd
	.byte	0x4
	.byte	0x7
	.byte	0x1e
	.long	0x35a
	.uleb128 0xe
	.ascii "private\0"
	.byte	0x7
	.byte	0x1f
	.long	0x27b
	.uleb128 0xe
	.ascii "__mapping\0"
	.byte	0x7
	.byte	0x20
	.long	0x290
	.byte	0x0
	.uleb128 0xd
	.byte	0x18
	.byte	0x7
	.byte	0x24
	.long	0x383
	.uleb128 0xe
	.ascii "mapped\0"
	.byte	0x7
	.byte	0x25
	.long	0x209
	.uleb128 0xe
	.ascii "independed\0"
	.byte	0x7
	.byte	0x26
	.long	0x292
	.byte	0x0
	.uleb128 0x9
	.ascii "inode\0"
	.byte	0x4
	.byte	0x7
	.byte	0x2a
	.long	0x3a4
	.uleb128 0x5
	.ascii "__inode\0"
	.byte	0x7
	.byte	0x2b
	.long	0x290
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.byte	0x4
	.byte	0x7
	.byte	0x2e
	.long	0x3c7
	.uleb128 0x5
	.ascii "spinlock_number\0"
	.byte	0x7
	.byte	0x2f
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x3
	.ascii "spinlock_t\0"
	.byte	0x7
	.byte	0x30
	.long	0x3a4
	.uleb128 0x9
	.ascii "mutex\0"
	.byte	0x4
	.byte	0x7
	.byte	0x32
	.long	0x3ff
	.uleb128 0x5
	.ascii "mutex_number\0"
	.byte	0x7
	.byte	0x33
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x9
	.ascii "file\0"
	.byte	0x18
	.byte	0x7
	.byte	0x3b
	.long	0x485
	.uleb128 0x5
	.ascii "private_data\0"
	.byte	0x7
	.byte	0x3c
	.long	0x290
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "__private_data_type\0"
	.byte	0x7
	.byte	0x3d
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "fd\0"
	.byte	0x7
	.byte	0x3e
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "f_count\0"
	.byte	0x7
	.byte	0x3f
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "__inode\0"
	.byte	0x7
	.byte	0x40
	.long	0x485
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "r_flags\0"
	.byte	0x7
	.byte	0x41
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x383
	.uleb128 0x10
	.ascii "km_type\0"
	.byte	0x4
	.byte	0x7
	.byte	0x4a
	.long	0x561
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
	.uleb128 0x6
	.byte	0x4
	.long	0x3ff
	.uleb128 0x6
	.byte	0x4
	.long	0xe9
	.uleb128 0x6
	.byte	0x4
	.long	0x582
	.uleb128 0x13
	.long	0x587
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0xf
	.byte	0x4
	.byte	0x8
	.byte	0x92
	.long	0x5b7
	.uleb128 0x5
	.ascii "hardware_exit_reason\0"
	.byte	0x8
	.byte	0x93
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.byte	0x8
	.byte	0x8
	.byte	0x96
	.long	0x5e2
	.uleb128 0x5
	.ascii "exception\0"
	.byte	0x8
	.byte	0x97
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.secrel32	LASF6
	.byte	0x8
	.byte	0x98
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.byte	0x8
	.byte	0x8
	.byte	0xa6
	.long	0x607
	.uleb128 0xe
	.ascii "address\0"
	.byte	0x8
	.byte	0xa7
	.long	0x11e
	.uleb128 0xe
	.ascii "value\0"
	.byte	0x8
	.byte	0xa8
	.long	0xf0
	.byte	0x0
	.uleb128 0xf
	.byte	0x18
	.byte	0x8
	.byte	0x9b
	.long	0x69d
	.uleb128 0x5
	.ascii "direction\0"
	.byte	0x8
	.byte	0x9e
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "size\0"
	.byte	0x8
	.byte	0x9f
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x5
	.ascii "string\0"
	.byte	0x8
	.byte	0xa0
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x5
	.ascii "string_down\0"
	.byte	0x8
	.byte	0xa1
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x5
	.ascii "rep\0"
	.byte	0x8
	.byte	0xa2
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "pad\0"
	.byte	0x8
	.byte	0xa3
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x5
	.ascii "port\0"
	.byte	0x8
	.byte	0xa4
	.long	0xc6
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x5
	.ascii "count\0"
	.byte	0x8
	.byte	0xa5
	.long	0x11e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xc
	.long	0x5e2
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0xf
	.byte	0x15
	.byte	0x8
	.byte	0xb0
	.long	0x6ea
	.uleb128 0x5
	.ascii "phys_addr\0"
	.byte	0x8
	.byte	0xb1
	.long	0x11e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "data\0"
	.byte	0x8
	.byte	0xb2
	.long	0x6ea
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "len\0"
	.byte	0x8
	.byte	0xb3
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "is_write\0"
	.byte	0x8
	.byte	0xb4
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0x0
	.uleb128 0x14
	.long	0x9c
	.long	0x6fa
	.uleb128 0x15
	.long	0x56d
	.byte	0x7
	.byte	0x0
	.uleb128 0xd
	.byte	0x18
	.byte	0x8
	.byte	0x90
	.long	0x72d
	.uleb128 0xe
	.ascii "hw\0"
	.byte	0x8
	.byte	0x94
	.long	0x58f
	.uleb128 0xe
	.ascii "ex\0"
	.byte	0x8
	.byte	0x99
	.long	0x5b7
	.uleb128 0xe
	.ascii "io\0"
	.byte	0x8
	.byte	0xaa
	.long	0x607
	.uleb128 0xe
	.ascii "mmio\0"
	.byte	0x8
	.byte	0xb5
	.long	0x69d
	.byte	0x0
	.uleb128 0x9
	.ascii "kvm_run\0"
	.byte	0x54
	.byte	0x8
	.byte	0x78
	.long	0x88d
	.uleb128 0x5
	.ascii "vcpu_fd\0"
	.byte	0x8
	.byte	0x7a
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "_errno\0"
	.byte	0x8
	.byte	0x7b
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "ioctl_r\0"
	.byte	0x8
	.byte	0x7c
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "emulated\0"
	.byte	0x8
	.byte	0x7f
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "mmio_completed\0"
	.byte	0x8
	.byte	0x80
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "request_interrupt_window\0"
	.byte	0x8
	.byte	0x81
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.ascii "padding1\0"
	.byte	0x8
	.byte	0x82
	.long	0x88d
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0x5
	.ascii "exit_type\0"
	.byte	0x8
	.byte	0x85
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.ascii "exit_reason\0"
	.byte	0x8
	.byte	0x86
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x5
	.ascii "instruction_length\0"
	.byte	0x8
	.byte	0x87
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x5
	.ascii "ready_for_interrupt_injection\0"
	.byte	0x8
	.byte	0x88
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x5
	.ascii "if_flag\0"
	.byte	0x8
	.byte	0x89
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x29
	.uleb128 0x5
	.ascii "padding2\0"
	.byte	0x8
	.byte	0x8a
	.long	0xc6
	.byte	0x2
	.byte	0x23
	.uleb128 0x2a
	.uleb128 0x5
	.ascii "cr8\0"
	.byte	0x8
	.byte	0x8d
	.long	0x11e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0xa
	.secrel32	LASF7
	.byte	0x8
	.byte	0x8e
	.long	0x11e
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0xc
	.long	0x6fa
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.byte	0x0
	.uleb128 0x14
	.long	0x9c
	.long	0x89d
	.uleb128 0x15
	.long	0x56d
	.byte	0x6
	.byte	0x0
	.uleb128 0x9
	.ascii "kvm_segment\0"
	.byte	0x18
	.byte	0x8
	.byte	0xc6
	.long	0x972
	.uleb128 0x5
	.ascii "base\0"
	.byte	0x8
	.byte	0xc7
	.long	0x11e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "limit\0"
	.byte	0x8
	.byte	0xc8
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.secrel32	LASF8
	.byte	0x8
	.byte	0xc9
	.long	0xc6
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "type\0"
	.byte	0x8
	.byte	0xca
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0x5
	.ascii "present\0"
	.byte	0x8
	.byte	0xcb
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.uleb128 0x5
	.ascii "dpl\0"
	.byte	0x8
	.byte	0xcb
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "db\0"
	.byte	0x8
	.byte	0xcb
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x11
	.uleb128 0x5
	.ascii "s\0"
	.byte	0x8
	.byte	0xcb
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x5
	.ascii "l\0"
	.byte	0x8
	.byte	0xcb
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0x5
	.ascii "g\0"
	.byte	0x8
	.byte	0xcb
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.ascii "avl\0"
	.byte	0x8
	.byte	0xcb
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0x5
	.ascii "unusable\0"
	.byte	0x8
	.byte	0xcc
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0x5
	.ascii "padding\0"
	.byte	0x8
	.byte	0xcd
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.byte	0x0
	.uleb128 0x9
	.ascii "kvm_msr_entry\0"
	.byte	0x10
	.byte	0x8
	.byte	0xe5
	.long	0x9b9
	.uleb128 0xa
	.secrel32	LASF5
	.byte	0x8
	.byte	0xe6
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "reserved\0"
	.byte	0x8
	.byte	0xe7
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "data\0"
	.byte	0x8
	.byte	0xe8
	.long	0x11e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x16
	.ascii "kvm_breakpoint\0"
	.byte	0x10
	.byte	0x8
	.word	0x112
	.long	0xa07
	.uleb128 0x17
	.secrel32	LASF9
	.byte	0x8
	.word	0x113
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "padding\0"
	.byte	0x8
	.word	0x114
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.ascii "address\0"
	.byte	0x8
	.word	0x115
	.long	0x11e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x16
	.ascii "kvm_debug_guest\0"
	.byte	0x4c
	.byte	0x8
	.word	0x119
	.long	0xa65
	.uleb128 0x17
	.secrel32	LASF9
	.byte	0x8
	.word	0x11b
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "pad\0"
	.byte	0x8
	.word	0x11c
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.ascii "breakpoints\0"
	.byte	0x8
	.word	0x11d
	.long	0xa65
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x17
	.secrel32	LASF10
	.byte	0x8
	.word	0x11e
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.byte	0x0
	.uleb128 0x14
	.long	0x9b9
	.long	0xa75
	.uleb128 0x15
	.long	0x56d
	.byte	0x3
	.byte	0x0
	.uleb128 0x3
	.ascii "gva_t\0"
	.byte	0x2
	.byte	0x5b
	.long	0x27b
	.uleb128 0x3
	.ascii "gpa_t\0"
	.byte	0x2
	.byte	0x5c
	.long	0x165
	.uleb128 0x3
	.ascii "gfn_t\0"
	.byte	0x2
	.byte	0x5d
	.long	0x27b
	.uleb128 0x3
	.ascii "hpa_t\0"
	.byte	0x2
	.byte	0x60
	.long	0x165
	.uleb128 0x9
	.ascii "kvm_pte_chain\0"
	.byte	0x1c
	.byte	0x2
	.byte	0x67
	.long	0xadd
	.uleb128 0xa
	.secrel32	LASF11
	.byte	0x2
	.byte	0x68
	.long	0xadd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "link\0"
	.byte	0x2
	.byte	0x69
	.long	0x1ce
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0x0
	.uleb128 0x14
	.long	0xaed
	.long	0xaed
	.uleb128 0x15
	.long	0x56d
	.byte	0x4
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x165
	.uleb128 0xf
	.byte	0x3
	.byte	0x2
	.byte	0x76
	.long	0xb69
	.uleb128 0x18
	.ascii "glevels\0"
	.byte	0x2
	.byte	0x77
	.long	0xfd
	.byte	0x4
	.byte	0x4
	.byte	0x1c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x19
	.secrel32	LASF12
	.byte	0x2
	.byte	0x78
	.long	0xfd
	.byte	0x4
	.byte	0x4
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x19
	.secrel32	LASF13
	.byte	0x2
	.byte	0x79
	.long	0xfd
	.byte	0x4
	.byte	0x2
	.byte	0x16
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x18
	.ascii "pad_for_nice_hex_output\0"
	.byte	0x2
	.byte	0x7a
	.long	0xfd
	.byte	0x4
	.byte	0x6
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x19
	.secrel32	LASF14
	.byte	0x2
	.byte	0x7b
	.long	0xfd
	.byte	0x4
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x1a
	.ascii "kvm_mmu_page_role\0"
	.byte	0x4
	.byte	0x2
	.byte	0x74
	.long	0xb95
	.uleb128 0xe
	.ascii "word\0"
	.byte	0x2
	.byte	0x75
	.long	0xfd
	.uleb128 0x1b
	.long	0xaf3
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.byte	0x2
	.byte	0x91
	.long	0xbb4
	.uleb128 0x1c
	.secrel32	LASF15
	.byte	0x2
	.byte	0x92
	.long	0xaed
	.uleb128 0x1c
	.secrel32	LASF11
	.byte	0x2
	.byte	0x93
	.long	0x1af
	.byte	0x0
	.uleb128 0x9
	.ascii "kvm_mmu_page\0"
	.byte	0x34
	.byte	0x2
	.byte	0x7f
	.long	0xc72
	.uleb128 0x5
	.ascii "link\0"
	.byte	0x2
	.byte	0x80
	.long	0x17e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "hash_link\0"
	.byte	0x2
	.byte	0x81
	.long	0x1ce
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "gfn\0"
	.byte	0x2
	.byte	0x87
	.long	0xa8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "role\0"
	.byte	0x2
	.byte	0x88
	.long	0xb69
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.secrel32	LASF16
	.byte	0x2
	.byte	0x8a
	.long	0xa9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.ascii "slot_bitmap\0"
	.byte	0x2
	.byte	0x8b
	.long	0x27b
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x5
	.ascii "global\0"
	.byte	0x2
	.byte	0x8e
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x5
	.ascii "multimapped\0"
	.byte	0x2
	.byte	0x8f
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x5
	.ascii "root_count\0"
	.byte	0x2
	.byte	0x90
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0xc
	.long	0xb95
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.byte	0x0
	.uleb128 0x9
	.ascii "vmcs\0"
	.byte	0x8
	.byte	0x2
	.byte	0x97
	.long	0xcb5
	.uleb128 0x5
	.ascii "revision_id\0"
	.byte	0x2
	.byte	0x98
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "abort\0"
	.byte	0x2
	.byte	0x99
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "data\0"
	.byte	0x2
	.byte	0x9a
	.long	0xcb5
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x14
	.long	0x587
	.long	0xcc4
	.uleb128 0x1d
	.long	0x56d
	.byte	0x0
	.uleb128 0x9
	.ascii "kvm_mmu\0"
	.byte	0x24
	.byte	0x2
	.byte	0xa6
	.long	0xd77
	.uleb128 0x5
	.ascii "new_cr3\0"
	.byte	0x2
	.byte	0xa7
	.long	0x1166
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "page_fault\0"
	.byte	0x2
	.byte	0xa8
	.long	0x1186
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "free\0"
	.byte	0x2
	.byte	0xa9
	.long	0x1166
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "gva_to_gpa\0"
	.byte	0x2
	.byte	0xaa
	.long	0x11a1
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "root_hpa\0"
	.byte	0x2
	.byte	0xab
	.long	0xa9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "root_level\0"
	.byte	0x2
	.byte	0xac
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.ascii "shadow_root_level\0"
	.byte	0x2
	.byte	0xad
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.ascii "pae_root\0"
	.byte	0x2
	.byte	0xae
	.long	0xaed
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0x0
	.uleb128 0x1e
	.byte	0x1
	.long	0xd83
	.uleb128 0x1f
	.long	0xd83
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xd89
	.uleb128 0x20
	.ascii "kvm_vcpu\0"
	.word	0x3a47
	.byte	0x2
	.byte	0x9f
	.long	0x1166
	.uleb128 0x5
	.ascii "kvm\0"
	.byte	0x2
	.byte	0xee
	.long	0x146c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xc
	.long	0x1249
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "mutex\0"
	.byte	0x2
	.byte	0xf3
	.long	0x3d9
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "cpu\0"
	.byte	0x2
	.byte	0xf4
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "launched\0"
	.byte	0x2
	.byte	0xf5
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "interrupt_window_open\0"
	.byte	0x2
	.byte	0xf6
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.ascii "irq_summary\0"
	.byte	0x2
	.byte	0xf7
	.long	0x27b
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.ascii "irq_pending\0"
	.byte	0x2
	.byte	0xf9
	.long	0x1472
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.ascii "regs\0"
	.byte	0x2
	.byte	0xfa
	.long	0x1472
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x5
	.ascii "rip\0"
	.byte	0x2
	.byte	0xfb
	.long	0x27b
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x5
	.ascii "cr0\0"
	.byte	0x2
	.byte	0xfd
	.long	0x27b
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x5
	.ascii "cr2\0"
	.byte	0x2
	.byte	0xfe
	.long	0x27b
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x5
	.ascii "cr3\0"
	.byte	0x2
	.byte	0xff
	.long	0x27b
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x8
	.ascii "para_state_gpa\0"
	.byte	0x2
	.word	0x100
	.long	0xa82
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x8
	.ascii "para_state_page\0"
	.byte	0x2
	.word	0x101
	.long	0x32b
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x8
	.ascii "hypercall_gpa\0"
	.byte	0x2
	.word	0x102
	.long	0xa82
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x8
	.ascii "cr4\0"
	.byte	0x2
	.word	0x103
	.long	0x27b
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x8
	.ascii "cr8\0"
	.byte	0x2
	.word	0x104
	.long	0x27b
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0x8
	.ascii "pdptrs\0"
	.byte	0x2
	.word	0x105
	.long	0x1482
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0x8
	.ascii "shadow_efer\0"
	.byte	0x2
	.word	0x106
	.long	0x165
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x17
	.secrel32	LASF7
	.byte	0x2
	.word	0x107
	.long	0x165
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x8
	.ascii "ia32_misc_enable_msr\0"
	.byte	0x2
	.word	0x108
	.long	0x165
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.uleb128 0x8
	.ascii "nmsrs\0"
	.byte	0x2
	.word	0x109
	.long	0xe9
	.byte	0x3
	.byte	0x23
	.uleb128 0xc0
	.uleb128 0x8
	.ascii "guest_msrs\0"
	.byte	0x2
	.word	0x10a
	.long	0x1492
	.byte	0x3
	.byte	0x23
	.uleb128 0xc4
	.uleb128 0x8
	.ascii "host_msrs\0"
	.byte	0x2
	.word	0x10b
	.long	0x1492
	.byte	0x3
	.byte	0x23
	.uleb128 0xc8
	.uleb128 0x8
	.ascii "free_pages\0"
	.byte	0x2
	.word	0x10d
	.long	0x17e
	.byte	0x3
	.byte	0x23
	.uleb128 0xcc
	.uleb128 0x8
	.ascii "page_header_buf\0"
	.byte	0x2
	.word	0x10e
	.long	0x1498
	.byte	0x3
	.byte	0x23
	.uleb128 0xd4
	.uleb128 0x8
	.ascii "mmu\0"
	.byte	0x2
	.word	0x10f
	.long	0xcc4
	.byte	0x3
	.byte	0x23
	.uleb128 0x34d4
	.uleb128 0x8
	.ascii "mmu_pte_chain_cache\0"
	.byte	0x2
	.word	0x111
	.long	0x11a7
	.byte	0x3
	.byte	0x23
	.uleb128 0x34f8
	.uleb128 0x8
	.ascii "mmu_rmap_desc_cache\0"
	.byte	0x2
	.word	0x112
	.long	0x11a7
	.byte	0x3
	.byte	0x23
	.uleb128 0x354c
	.uleb128 0x8
	.ascii "last_pt_write_gfn\0"
	.byte	0x2
	.word	0x114
	.long	0xa8f
	.byte	0x3
	.byte	0x23
	.uleb128 0x35a0
	.uleb128 0x8
	.ascii "last_pt_write_count\0"
	.byte	0x2
	.word	0x115
	.long	0xe9
	.byte	0x3
	.byte	0x23
	.uleb128 0x35a4
	.uleb128 0x8
	.ascii "guest_debug\0"
	.byte	0x2
	.word	0x117
	.long	0x11f7
	.byte	0x3
	.byte	0x23
	.uleb128 0x35a8
	.uleb128 0x8
	.ascii "fx_buf\0"
	.byte	0x2
	.word	0x119
	.long	0x14a8
	.byte	0x3
	.byte	0x23
	.uleb128 0x35c0
	.uleb128 0x8
	.ascii "host_fx_image\0"
	.byte	0x2
	.word	0x11a
	.long	0x14b9
	.byte	0x3
	.byte	0x23
	.uleb128 0x39d0
	.uleb128 0x8
	.ascii "guest_fx_image\0"
	.byte	0x2
	.word	0x11b
	.long	0x14b9
	.byte	0x3
	.byte	0x23
	.uleb128 0x39d4
	.uleb128 0x8
	.ascii "mmio_needed\0"
	.byte	0x2
	.word	0x11d
	.long	0xe9
	.byte	0x3
	.byte	0x23
	.uleb128 0x39d8
	.uleb128 0x8
	.ascii "mmio_read_completed\0"
	.byte	0x2
	.word	0x11e
	.long	0xe9
	.byte	0x3
	.byte	0x23
	.uleb128 0x39dc
	.uleb128 0x8
	.ascii "mmio_is_write\0"
	.byte	0x2
	.word	0x11f
	.long	0xe9
	.byte	0x3
	.byte	0x23
	.uleb128 0x39e0
	.uleb128 0x8
	.ascii "mmio_size\0"
	.byte	0x2
	.word	0x120
	.long	0xe9
	.byte	0x3
	.byte	0x23
	.uleb128 0x39e4
	.uleb128 0x8
	.ascii "mmio_data\0"
	.byte	0x2
	.word	0x121
	.long	0x14bf
	.byte	0x3
	.byte	0x23
	.uleb128 0x39e8
	.uleb128 0x8
	.ascii "mmio_phys_addr\0"
	.byte	0x2
	.word	0x122
	.long	0xa82
	.byte	0x3
	.byte	0x23
	.uleb128 0x39f0
	.uleb128 0x8
	.ascii "mmio_fault_cr2\0"
	.byte	0x2
	.word	0x123
	.long	0xa75
	.byte	0x3
	.byte	0x23
	.uleb128 0x39f8
	.uleb128 0x8
	.ascii "rmode\0"
	.byte	0x2
	.word	0x12e
	.long	0x12d9
	.byte	0x3
	.byte	0x23
	.uleb128 0x39fc
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xd77
	.uleb128 0x21
	.byte	0x1
	.long	0xe9
	.long	0x1186
	.uleb128 0x1f
	.long	0xd83
	.uleb128 0x1f
	.long	0xa75
	.uleb128 0x1f
	.long	0x15a
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x116c
	.uleb128 0x21
	.byte	0x1
	.long	0xa82
	.long	0x11a1
	.uleb128 0x1f
	.long	0xd83
	.uleb128 0x1f
	.long	0xa75
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x118c
	.uleb128 0x9
	.ascii "kvm_mmu_memory_cache\0"
	.byte	0x54
	.byte	0x2
	.byte	0xbd
	.long	0x11e7
	.uleb128 0x5
	.ascii "nobjs\0"
	.byte	0x2
	.byte	0xbe
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "objects\0"
	.byte	0x2
	.byte	0xbf
	.long	0x11e7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x14
	.long	0x290
	.long	0x11f7
	.uleb128 0x15
	.long	0x56d
	.byte	0x13
	.byte	0x0
	.uleb128 0x9
	.ascii "kvm_guest_debug\0"
	.byte	0x18
	.byte	0x2
	.byte	0xc6
	.long	0x1239
	.uleb128 0xa
	.secrel32	LASF9
	.byte	0x2
	.byte	0xc7
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "bp\0"
	.byte	0x2
	.byte	0xc8
	.long	0x1239
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.secrel32	LASF10
	.byte	0x2
	.byte	0xc9
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0x0
	.uleb128 0x14
	.long	0x27b
	.long	0x1249
	.uleb128 0x15
	.long	0x56d
	.byte	0x3
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.byte	0x2
	.byte	0xef
	.long	0x1269
	.uleb128 0xe
	.ascii "vmcs\0"
	.byte	0x2
	.byte	0xf0
	.long	0x1269
	.uleb128 0xe
	.ascii "svm\0"
	.byte	0x2
	.byte	0xf1
	.long	0x127a
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xc72
	.uleb128 0x22
	.ascii "vcpu_svm\0"
	.byte	0x1
	.uleb128 0x6
	.byte	0x4
	.long	0x126f
	.uleb128 0x16
	.ascii "kvm_save_segment\0"
	.byte	0xe
	.byte	0x2
	.word	0x128
	.long	0x12d9
	.uleb128 0x17
	.secrel32	LASF8
	.byte	0x2
	.word	0x129
	.long	0x14f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "base\0"
	.byte	0x2
	.word	0x12a
	.long	0x27b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x8
	.ascii "limit\0"
	.byte	0x2
	.word	0x12b
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x8
	.ascii "ar\0"
	.byte	0x2
	.word	0x12c
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x23
	.byte	0x4b
	.byte	0x2
	.word	0x125
	.long	0x1350
	.uleb128 0x8
	.ascii "active\0"
	.byte	0x2
	.word	0x126
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "save_iopl\0"
	.byte	0x2
	.word	0x127
	.long	0x145
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.ascii "tr\0"
	.byte	0x2
	.word	0x12d
	.long	0x1280
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x8
	.ascii "es\0"
	.byte	0x2
	.word	0x12d
	.long	0x1280
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0x8
	.ascii "ds\0"
	.byte	0x2
	.word	0x12d
	.long	0x1280
	.byte	0x2
	.byte	0x23
	.uleb128 0x21
	.uleb128 0x8
	.ascii "fs\0"
	.byte	0x2
	.word	0x12d
	.long	0x1280
	.byte	0x2
	.byte	0x23
	.uleb128 0x2f
	.uleb128 0x8
	.ascii "gs\0"
	.byte	0x2
	.word	0x12d
	.long	0x1280
	.byte	0x2
	.byte	0x23
	.uleb128 0x3d
	.byte	0x0
	.uleb128 0x20
	.ascii "kvm\0"
	.word	0x3ec3
	.byte	0x2
	.byte	0xee
	.long	0x146c
	.uleb128 0x8
	.ascii "lock\0"
	.byte	0x2
	.word	0x13a
	.long	0x3c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "nmemslots\0"
	.byte	0x2
	.word	0x13b
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.ascii "memslots\0"
	.byte	0x2
	.word	0x13c
	.long	0x1558
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.ascii "active_mmu_pages\0"
	.byte	0x2
	.word	0x140
	.long	0x17e
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x8
	.ascii "n_free_mmu_pages\0"
	.byte	0x2
	.word	0x141
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x8
	.ascii "mmu_page_hash\0"
	.byte	0x2
	.word	0x142
	.long	0x1568
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x8
	.ascii "vcpus\0"
	.byte	0x2
	.word	0x143
	.long	0x1578
	.byte	0x3
	.byte	0x23
	.uleb128 0x464
	.uleb128 0x8
	.ascii "memory_config_version\0"
	.byte	0x2
	.word	0x144
	.long	0xe9
	.byte	0x3
	.byte	0x23
	.uleb128 0x3eab
	.uleb128 0x8
	.ascii "busy\0"
	.byte	0x2
	.word	0x145
	.long	0xe9
	.byte	0x3
	.byte	0x23
	.uleb128 0x3eaf
	.uleb128 0x8
	.ascii "rmap_overflow\0"
	.byte	0x2
	.word	0x146
	.long	0x27b
	.byte	0x3
	.byte	0x23
	.uleb128 0x3eb3
	.uleb128 0x8
	.ascii "vm_list\0"
	.byte	0x2
	.word	0x147
	.long	0x17e
	.byte	0x3
	.byte	0x23
	.uleb128 0x3eb7
	.uleb128 0x8
	.ascii "filp\0"
	.byte	0x2
	.word	0x148
	.long	0x570
	.byte	0x3
	.byte	0x23
	.uleb128 0x3ebf
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1350
	.uleb128 0x14
	.long	0x27b
	.long	0x1482
	.uleb128 0x15
	.long	0x56d
	.byte	0x7
	.byte	0x0
	.uleb128 0x14
	.long	0x165
	.long	0x1492
	.uleb128 0x15
	.long	0x56d
	.byte	0x3
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x972
	.uleb128 0x14
	.long	0xbb4
	.long	0x14a8
	.uleb128 0x15
	.long	0x56d
	.byte	0xff
	.byte	0x0
	.uleb128 0x14
	.long	0x587
	.long	0x14b9
	.uleb128 0x24
	.long	0x56d
	.word	0x40f
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x587
	.uleb128 0x14
	.long	0xa8
	.long	0x14cf
	.uleb128 0x15
	.long	0x56d
	.byte	0x7
	.byte	0x0
	.uleb128 0x16
	.ascii "kvm_memory_slot\0"
	.byte	0x14
	.byte	0x2
	.word	0x131
	.long	0x154c
	.uleb128 0x8
	.ascii "base_gfn\0"
	.byte	0x2
	.word	0x132
	.long	0xa8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "npages\0"
	.byte	0x2
	.word	0x133
	.long	0x27b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.ascii "flags\0"
	.byte	0x2
	.word	0x134
	.long	0x27b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.ascii "phys_mem\0"
	.byte	0x2
	.word	0x135
	.long	0x154c
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.ascii "dirty_bitmap\0"
	.byte	0x2
	.word	0x136
	.long	0x1552
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x32b
	.uleb128 0x6
	.byte	0x4
	.long	0x27b
	.uleb128 0x14
	.long	0x14cf
	.long	0x1568
	.uleb128 0x15
	.long	0x56d
	.byte	0x3
	.byte	0x0
	.uleb128 0x14
	.long	0x1af
	.long	0x1578
	.uleb128 0x15
	.long	0x56d
	.byte	0xff
	.byte	0x0
	.uleb128 0x14
	.long	0xd89
	.long	0x1588
	.uleb128 0x15
	.long	0x56d
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.secrel32	LASF17
	.byte	0x30
	.byte	0x2
	.word	0x14b
	.long	0x1696
	.uleb128 0x8
	.ascii "pf_fixed\0"
	.byte	0x2
	.word	0x14c
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "pf_guest\0"
	.byte	0x2
	.word	0x14d
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x17
	.secrel32	LASF18
	.byte	0x2
	.word	0x14e
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.ascii "invlpg\0"
	.byte	0x2
	.word	0x14f
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.ascii "exits\0"
	.byte	0x2
	.word	0x151
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.ascii "io_exits\0"
	.byte	0x2
	.word	0x152
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.ascii "mmio_exits\0"
	.byte	0x2
	.word	0x153
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x8
	.ascii "signal_exits\0"
	.byte	0x2
	.word	0x154
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x8
	.ascii "irq_window_exits\0"
	.byte	0x2
	.word	0x155
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x8
	.ascii "halt_exits\0"
	.byte	0x2
	.word	0x156
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x8
	.ascii "request_irq_exits\0"
	.byte	0x2
	.word	0x157
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.ascii "irq_exits\0"
	.byte	0x2
	.word	0x158
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.byte	0x0
	.uleb128 0x16
	.ascii "descriptor_table\0"
	.byte	0x6
	.byte	0x2
	.word	0x15b
	.long	0x16d2
	.uleb128 0x8
	.ascii "limit\0"
	.byte	0x2
	.word	0x15c
	.long	0x14f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "base\0"
	.byte	0x2
	.word	0x15d
	.long	0x27b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x7
	.secrel32	LASF19
	.byte	0xa8
	.byte	0x2
	.word	0x160
	.long	0x1aae
	.uleb128 0x8
	.ascii "cpu_has_kvm_support\0"
	.byte	0x2
	.word	0x161
	.long	0x1ab4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "disabled_by_bios\0"
	.byte	0x2
	.word	0x162
	.long	0x1ab4
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.ascii "hardware_enable\0"
	.byte	0x2
	.word	0x163
	.long	0x1ac6
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.ascii "hardware_disable\0"
	.byte	0x2
	.word	0x164
	.long	0x1ac6
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.ascii "hardware_setup\0"
	.byte	0x2
	.word	0x165
	.long	0x1ab4
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.ascii "hardware_unsetup\0"
	.byte	0x2
	.word	0x166
	.long	0x1ace
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.ascii "vcpu_create\0"
	.byte	0x2
	.word	0x168
	.long	0x1ae4
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x8
	.ascii "vcpu_free\0"
	.byte	0x2
	.word	0x169
	.long	0x1166
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x8
	.ascii "vcpu_load\0"
	.byte	0x2
	.word	0x16b
	.long	0x1166
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x8
	.ascii "vcpu_put\0"
	.byte	0x2
	.word	0x16c
	.long	0x1166
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x8
	.ascii "vcpu_decache\0"
	.byte	0x2
	.word	0x16d
	.long	0x1166
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.ascii "set_guest_debug\0"
	.byte	0x2
	.word	0x16f
	.long	0x1b05
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x8
	.ascii "get_msr\0"
	.byte	0x2
	.word	0x171
	.long	0x1b25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x8
	.ascii "set_msr\0"
	.byte	0x2
	.word	0x172
	.long	0x1b45
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x8
	.ascii "get_segment_base\0"
	.byte	0x2
	.word	0x173
	.long	0x1b60
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x8
	.ascii "get_segment\0"
	.byte	0x2
	.word	0x174
	.long	0x1b82
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x8
	.ascii "set_segment\0"
	.byte	0x2
	.word	0x176
	.long	0x1b82
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x8
	.ascii "get_cs_db_l_bits\0"
	.byte	0x2
	.word	0x178
	.long	0x1b9e
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x8
	.ascii "decache_cr0_cr4_guest_bits\0"
	.byte	0x2
	.word	0x179
	.long	0x1166
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x8
	.ascii "set_cr0\0"
	.byte	0x2
	.word	0x17a
	.long	0x1bb5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x8
	.ascii "set_cr0_no_modeswitch\0"
	.byte	0x2
	.word	0x17b
	.long	0x1bb5
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x8
	.ascii "set_cr3\0"
	.byte	0x2
	.word	0x17d
	.long	0x1bb5
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x8
	.ascii "set_cr4\0"
	.byte	0x2
	.word	0x17e
	.long	0x1bb5
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x8
	.ascii "set_efer\0"
	.byte	0x2
	.word	0x17f
	.long	0x1bcc
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x8
	.ascii "get_idt\0"
	.byte	0x2
	.word	0x180
	.long	0x1be9
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x8
	.ascii "set_idt\0"
	.byte	0x2
	.word	0x181
	.long	0x1be9
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x8
	.ascii "get_gdt\0"
	.byte	0x2
	.word	0x182
	.long	0x1be9
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x8
	.ascii "set_gdt\0"
	.byte	0x2
	.word	0x183
	.long	0x1be9
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x8
	.ascii "get_dr\0"
	.byte	0x2
	.word	0x184
	.long	0x1c04
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x8
	.ascii "set_dr\0"
	.byte	0x2
	.word	0x185
	.long	0x1c25
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x8
	.ascii "cache_regs\0"
	.byte	0x2
	.word	0x187
	.long	0x1166
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x8
	.ascii "decache_regs\0"
	.byte	0x2
	.word	0x188
	.long	0x1166
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0x8
	.ascii "get_rflags\0"
	.byte	0x2
	.word	0x189
	.long	0x1c3b
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x8
	.ascii "set_rflags\0"
	.byte	0x2
	.word	0x18a
	.long	0x1bb5
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0x8
	.ascii "invlpg\0"
	.byte	0x2
	.word	0x18c
	.long	0x1c52
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0x17
	.secrel32	LASF18
	.byte	0x2
	.word	0x18d
	.long	0x1166
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0x17
	.secrel32	LASF20
	.byte	0x2
	.word	0x18e
	.long	0x1c6e
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0x8
	.ascii "inject_gp\0"
	.byte	0x2
	.word	0x191
	.long	0x1c85
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0x8
	.ascii "run\0"
	.byte	0x2
	.word	0x193
	.long	0x1ca6
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0x8
	.ascii "vcpu_setup\0"
	.byte	0x2
	.word	0x194
	.long	0x1ae4
	.byte	0x3
	.byte	0x23
	.uleb128 0x9c
	.uleb128 0x8
	.ascii "skip_emulated_instruction\0"
	.byte	0x2
	.word	0x195
	.long	0x1166
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x8
	.ascii "patch_hypercall\0"
	.byte	0x2
	.word	0x196
	.long	0x1cc3
	.byte	0x3
	.byte	0x23
	.uleb128 0xa4
	.byte	0x0
	.uleb128 0x25
	.byte	0x1
	.long	0xe9
	.uleb128 0x6
	.byte	0x4
	.long	0x1aae
	.uleb128 0x1e
	.byte	0x1
	.long	0x1ac6
	.uleb128 0x1f
	.long	0x290
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1aba
	.uleb128 0x26
	.byte	0x1
	.uleb128 0x6
	.byte	0x4
	.long	0x1acc
	.uleb128 0x21
	.byte	0x1
	.long	0xe9
	.long	0x1ae4
	.uleb128 0x1f
	.long	0xd83
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1ad4
	.uleb128 0x21
	.byte	0x1
	.long	0xe9
	.long	0x1aff
	.uleb128 0x1f
	.long	0xd83
	.uleb128 0x1f
	.long	0x1aff
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xa07
	.uleb128 0x6
	.byte	0x4
	.long	0x1aea
	.uleb128 0x21
	.byte	0x1
	.long	0xe9
	.long	0x1b25
	.uleb128 0x1f
	.long	0xd83
	.uleb128 0x1f
	.long	0x15a
	.uleb128 0x1f
	.long	0xaed
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1b0b
	.uleb128 0x21
	.byte	0x1
	.long	0xe9
	.long	0x1b45
	.uleb128 0x1f
	.long	0xd83
	.uleb128 0x1f
	.long	0x15a
	.uleb128 0x1f
	.long	0x165
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1b2b
	.uleb128 0x21
	.byte	0x1
	.long	0x165
	.long	0x1b60
	.uleb128 0x1f
	.long	0xd83
	.uleb128 0x1f
	.long	0xe9
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1b4b
	.uleb128 0x1e
	.byte	0x1
	.long	0x1b7c
	.uleb128 0x1f
	.long	0xd83
	.uleb128 0x1f
	.long	0x1b7c
	.uleb128 0x1f
	.long	0xe9
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x89d
	.uleb128 0x6
	.byte	0x4
	.long	0x1b66
	.uleb128 0x1e
	.byte	0x1
	.long	0x1b9e
	.uleb128 0x1f
	.long	0xd83
	.uleb128 0x1f
	.long	0x576
	.uleb128 0x1f
	.long	0x576
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1b88
	.uleb128 0x1e
	.byte	0x1
	.long	0x1bb5
	.uleb128 0x1f
	.long	0xd83
	.uleb128 0x1f
	.long	0x27b
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1ba4
	.uleb128 0x1e
	.byte	0x1
	.long	0x1bcc
	.uleb128 0x1f
	.long	0xd83
	.uleb128 0x1f
	.long	0x165
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1bbb
	.uleb128 0x1e
	.byte	0x1
	.long	0x1be3
	.uleb128 0x1f
	.long	0xd83
	.uleb128 0x1f
	.long	0x1be3
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1696
	.uleb128 0x6
	.byte	0x4
	.long	0x1bd2
	.uleb128 0x21
	.byte	0x1
	.long	0x27b
	.long	0x1c04
	.uleb128 0x1f
	.long	0xd83
	.uleb128 0x1f
	.long	0xe9
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1bef
	.uleb128 0x1e
	.byte	0x1
	.long	0x1c25
	.uleb128 0x1f
	.long	0xd83
	.uleb128 0x1f
	.long	0xe9
	.uleb128 0x1f
	.long	0x27b
	.uleb128 0x1f
	.long	0x576
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1c0a
	.uleb128 0x21
	.byte	0x1
	.long	0x27b
	.long	0x1c3b
	.uleb128 0x1f
	.long	0xd83
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1c2b
	.uleb128 0x1e
	.byte	0x1
	.long	0x1c52
	.uleb128 0x1f
	.long	0xd83
	.uleb128 0x1f
	.long	0xa75
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1c41
	.uleb128 0x1e
	.byte	0x1
	.long	0x1c6e
	.uleb128 0x1f
	.long	0xd83
	.uleb128 0x1f
	.long	0x27b
	.uleb128 0x1f
	.long	0x15a
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1c58
	.uleb128 0x1e
	.byte	0x1
	.long	0x1c85
	.uleb128 0x1f
	.long	0xd83
	.uleb128 0x1f
	.long	0xfd
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1c74
	.uleb128 0x21
	.byte	0x1
	.long	0xe9
	.long	0x1ca0
	.uleb128 0x1f
	.long	0xd83
	.uleb128 0x1f
	.long	0x1ca0
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x72d
	.uleb128 0x6
	.byte	0x4
	.long	0x1c8b
	.uleb128 0x1e
	.byte	0x1
	.long	0x1cbd
	.uleb128 0x1f
	.long	0xd83
	.uleb128 0x1f
	.long	0x1cbd
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xa8
	.uleb128 0x6
	.byte	0x4
	.long	0x1cac
	.uleb128 0x9
	.ascii "kvm_rmap_desc\0"
	.byte	0x14
	.byte	0x1
	.byte	0xa5
	.long	0x1d05
	.uleb128 0x5
	.ascii "shadow_ptes\0"
	.byte	0x1
	.byte	0xa6
	.long	0x1d05
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "more\0"
	.byte	0x1
	.byte	0xa7
	.long	0x1d15
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x14
	.long	0xaed
	.long	0x1d15
	.uleb128 0x15
	.long	0x56d
	.byte	0x3
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1cc9
	.uleb128 0x9
	.ascii "guest_walker64\0"
	.byte	0x24
	.byte	0x5
	.byte	0x3b
	.long	0x1d98
	.uleb128 0xa
	.secrel32	LASF12
	.byte	0x5
	.byte	0x3c
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.secrel32	LASF21
	.byte	0x5
	.byte	0x3d
	.long	0x1d98
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "table\0"
	.byte	0x5
	.byte	0x3e
	.long	0xaed
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "ptep\0"
	.byte	0x5
	.byte	0x3f
	.long	0xaed
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.secrel32	LASF22
	.byte	0x5
	.byte	0x40
	.long	0x165
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.ascii "gfn\0"
	.byte	0x5
	.byte	0x41
	.long	0xa8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xa
	.secrel32	LASF6
	.byte	0x5
	.byte	0x42
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0x0
	.uleb128 0x14
	.long	0xa8f
	.long	0x1da8
	.uleb128 0x15
	.long	0x56d
	.byte	0x1
	.byte	0x0
	.uleb128 0x9
	.ascii "guest_walker32\0"
	.byte	0x20
	.byte	0x5
	.byte	0x3b
	.long	0x1e25
	.uleb128 0xa
	.secrel32	LASF12
	.byte	0x5
	.byte	0x3c
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.secrel32	LASF21
	.byte	0x5
	.byte	0x3d
	.long	0x1d98
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "table\0"
	.byte	0x5
	.byte	0x3e
	.long	0x1e25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "ptep\0"
	.byte	0x5
	.byte	0x3f
	.long	0x1e25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.secrel32	LASF22
	.byte	0x5
	.byte	0x40
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.ascii "gfn\0"
	.byte	0x5
	.byte	0x41
	.long	0xa8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xa
	.secrel32	LASF6
	.byte	0x5
	.byte	0x42
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x15a
	.uleb128 0x27
	.ascii "__list_add\0"
	.byte	0x4
	.byte	0x33
	.byte	0x1
	.byte	0x3
	.long	0x1e63
	.uleb128 0x28
	.ascii "new\0"
	.byte	0x4
	.byte	0x30
	.long	0x1a9
	.uleb128 0x28
	.ascii "prev\0"
	.byte	0x4
	.byte	0x31
	.long	0x1a9
	.uleb128 0x28
	.ascii "next\0"
	.byte	0x4
	.byte	0x32
	.long	0x1a9
	.byte	0x0
	.uleb128 0x27
	.ascii "__list_del\0"
	.byte	0x4
	.byte	0xa1
	.byte	0x1
	.byte	0x3
	.long	0x1e90
	.uleb128 0x28
	.ascii "prev\0"
	.byte	0x4
	.byte	0xa0
	.long	0x1a9
	.uleb128 0x28
	.ascii "next\0"
	.byte	0x4
	.byte	0xa0
	.long	0x1a9
	.byte	0x0
	.uleb128 0x29
	.ascii "__hlist_del\0"
	.byte	0x4
	.word	0x2dd
	.byte	0x1
	.byte	0x3
	.long	0x1ecc
	.uleb128 0x2a
	.ascii "n\0"
	.byte	0x4
	.word	0x2dc
	.long	0x1fd
	.uleb128 0x2b
	.ascii "next\0"
	.byte	0x4
	.word	0x2de
	.long	0x1fd
	.uleb128 0x2b
	.ascii "pprev\0"
	.byte	0x4
	.word	0x2df
	.long	0x203
	.byte	0x0
	.uleb128 0x2c
	.ascii "kvm_page_table_hashfn\0"
	.byte	0x1
	.word	0x1e4
	.byte	0x1
	.long	0xfd
	.byte	0x0
	.long	0x1efd
	.uleb128 0x2a
	.ascii "gfn\0"
	.byte	0x1
	.word	0x1e3
	.long	0xa8f
	.byte	0x0
	.uleb128 0x2d
	.secrel32	LASF23
	.byte	0x2
	.word	0x23f
	.byte	0x1
	.long	0x1f28
	.byte	0x3
	.long	0x1f28
	.uleb128 0x2e
	.secrel32	LASF24
	.byte	0x2
	.word	0x23e
	.long	0xa9c
	.uleb128 0x2f
	.secrel32	LASF4
	.byte	0x2
	.word	0x240
	.long	0x32b
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xbb4
	.uleb128 0x27
	.ascii "list_del\0"
	.byte	0x4
	.byte	0xae
	.byte	0x1
	.byte	0x3
	.long	0x1f5a
	.uleb128 0x28
	.ascii "entry\0"
	.byte	0x4
	.byte	0xad
	.long	0x1a9
	.uleb128 0x30
	.uleb128 0x31
	.long	0x1e83
	.uleb128 0x31
	.long	0x1e77
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.ascii "list_add\0"
	.byte	0x4
	.byte	0x49
	.byte	0x1
	.byte	0x3
	.long	0x1f95
	.uleb128 0x28
	.ascii "new\0"
	.byte	0x4
	.byte	0x48
	.long	0x1a9
	.uleb128 0x28
	.ascii "head\0"
	.byte	0x4
	.byte	0x48
	.long	0x1a9
	.uleb128 0x30
	.uleb128 0x31
	.long	0x1e56
	.uleb128 0x31
	.long	0x1e4a
	.uleb128 0x31
	.long	0x1e3f
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.ascii "list_empty\0"
	.byte	0x4
	.word	0x130
	.byte	0x1
	.long	0xe9
	.byte	0x3
	.long	0x1fbc
	.uleb128 0x2a
	.ascii "head\0"
	.byte	0x4
	.word	0x12f
	.long	0x1fbc
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1fc2
	.uleb128 0x32
	.secrel32	LASF0
	.long	0x17e
	.uleb128 0x29
	.ascii "nonpaging_free\0"
	.byte	0x1
	.word	0x3b1
	.byte	0x1
	.byte	0x0
	.long	0x1ff1
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x3b0
	.long	0xd83
	.byte	0x0
	.uleb128 0x29
	.ascii "mmu_memory_cache_free\0"
	.byte	0x1
	.word	0x112
	.byte	0x1
	.byte	0x0
	.long	0x2029
	.uleb128 0x2a
	.ascii "mc\0"
	.byte	0x1
	.word	0x111
	.long	0x2029
	.uleb128 0x2a
	.ascii "obj\0"
	.byte	0x1
	.word	0x111
	.long	0x290
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x11a7
	.uleb128 0x29
	.ascii "mmu_free_rmap_desc\0"
	.byte	0x1
	.word	0x133
	.byte	0x1
	.byte	0x0
	.long	0x2070
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x131
	.long	0xd83
	.uleb128 0x2a
	.ascii "rd\0"
	.byte	0x1
	.word	0x132
	.long	0x1d15
	.uleb128 0x30
	.uleb128 0x31
	.long	0x201c
	.uleb128 0x31
	.long	0x2011
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.ascii "is_rmap_pte\0"
	.byte	0x1
	.byte	0xc9
	.byte	0x1
	.long	0xe9
	.byte	0x0
	.long	0x2095
	.uleb128 0x28
	.ascii "pte\0"
	.byte	0x1
	.byte	0xc8
	.long	0x165
	.byte	0x0
	.uleb128 0x29
	.ascii "rmap_desc_remove_entry\0"
	.byte	0x1
	.word	0x16f
	.byte	0x1
	.byte	0x0
	.long	0x2114
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x16a
	.long	0xd83
	.uleb128 0x2e
	.secrel32	LASF4
	.byte	0x1
	.word	0x16b
	.long	0x32b
	.uleb128 0x2a
	.ascii "desc\0"
	.byte	0x1
	.word	0x16c
	.long	0x1d15
	.uleb128 0x2a
	.ascii "i\0"
	.byte	0x1
	.word	0x16d
	.long	0xe9
	.uleb128 0x2e
	.secrel32	LASF26
	.byte	0x1
	.word	0x16e
	.long	0x1d15
	.uleb128 0x2b
	.ascii "j\0"
	.byte	0x1
	.word	0x170
	.long	0xe9
	.uleb128 0x30
	.uleb128 0x31
	.long	0x2058
	.uleb128 0x31
	.long	0x204c
	.uleb128 0x30
	.uleb128 0x31
	.long	0x201c
	.uleb128 0x31
	.long	0x2011
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.ascii "test_bit\0"
	.byte	0x3
	.word	0x132
	.byte	0x1
	.long	0xe9
	.byte	0x3
	.long	0x2157
	.uleb128 0x2a
	.ascii "nr\0"
	.byte	0x3
	.word	0x131
	.long	0xe9
	.uleb128 0x2e
	.secrel32	LASF27
	.byte	0x3
	.word	0x131
	.long	0x2157
	.uleb128 0x2b
	.ascii "v\0"
	.byte	0x3
	.word	0x133
	.long	0x145
	.uleb128 0x2b
	.ascii "p\0"
	.byte	0x3
	.word	0x134
	.long	0x215e
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x215d
	.uleb128 0x34
	.uleb128 0x6
	.byte	0x4
	.long	0x2164
	.uleb128 0x13
	.long	0x15a
	.uleb128 0x29
	.ascii "hlist_del\0"
	.byte	0x4
	.word	0x2e6
	.byte	0x1
	.byte	0x3
	.long	0x219b
	.uleb128 0x2a
	.ascii "n\0"
	.byte	0x4
	.word	0x2e5
	.long	0x1fd
	.uleb128 0x30
	.uleb128 0x31
	.long	0x1ea6
	.uleb128 0x30
	.uleb128 0x35
	.long	0x1eb0
	.uleb128 0x35
	.long	0x1ebd
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
	.ascii "mmu_free_pte_chain\0"
	.byte	0x1
	.word	0x123
	.byte	0x1
	.byte	0x0
	.long	0x21dc
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x121
	.long	0xd83
	.uleb128 0x2a
	.ascii "pc\0"
	.byte	0x1
	.word	0x122
	.long	0x21dc
	.uleb128 0x30
	.uleb128 0x31
	.long	0x201c
	.uleb128 0x31
	.long	0x2011
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xaa9
	.uleb128 0x2c
	.ascii "hlist_empty\0"
	.byte	0x4
	.word	0x2d8
	.byte	0x1
	.long	0xe9
	.byte	0x3
	.long	0x2207
	.uleb128 0x2a
	.ascii "h\0"
	.byte	0x4
	.word	0x2d7
	.long	0x2207
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x220d
	.uleb128 0x32
	.secrel32	LASF1
	.long	0x1af
	.uleb128 0x29
	.ascii "kvm_mmu_put_page\0"
	.byte	0x1
	.word	0x2b0
	.byte	0x1
	.byte	0x0
	.long	0x2256
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x2ad
	.long	0xd83
	.uleb128 0x2e
	.secrel32	LASF4
	.byte	0x1
	.word	0x2ae
	.long	0x1f28
	.uleb128 0x2e
	.secrel32	LASF15
	.byte	0x1
	.word	0x2af
	.long	0xaed
	.byte	0x0
	.uleb128 0x29
	.ascii "kvm_mmu_free_page\0"
	.byte	0x1
	.word	0x1d9
	.byte	0x1
	.byte	0x0
	.long	0x22dd
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x1d8
	.long	0xd83
	.uleb128 0x2e
	.secrel32	LASF16
	.byte	0x1
	.word	0x1d8
	.long	0xa9c
	.uleb128 0x2f
	.secrel32	LASF28
	.byte	0x1
	.word	0x1da
	.long	0x1f28
	.uleb128 0x36
	.long	0x22a8
	.uleb128 0x31
	.long	0x1f0f
	.uleb128 0x30
	.uleb128 0x35
	.long	0x1f1b
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.long	0x22bf
	.uleb128 0x31
	.long	0x1f40
	.uleb128 0x30
	.uleb128 0x31
	.long	0x1e83
	.uleb128 0x31
	.long	0x1e77
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x31
	.long	0x1f77
	.uleb128 0x31
	.long	0x1f6c
	.uleb128 0x30
	.uleb128 0x31
	.long	0x1e56
	.uleb128 0x31
	.long	0x1e4a
	.uleb128 0x31
	.long	0x1e3f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.ascii "kvm_mmu_unprotect_page\0"
	.byte	0x1
	.word	0x2d2
	.byte	0x1
	.long	0xe9
	.byte	0x0
	.long	0x2372
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x2d1
	.long	0xd83
	.uleb128 0x2a
	.ascii "gfn\0"
	.byte	0x1
	.word	0x2d1
	.long	0xa8f
	.uleb128 0x2f
	.secrel32	LASF5
	.byte	0x1
	.word	0x2d3
	.long	0xfd
	.uleb128 0x2f
	.secrel32	LASF29
	.byte	0x1
	.word	0x2d4
	.long	0x2372
	.uleb128 0x2f
	.secrel32	LASF4
	.byte	0x1
	.word	0x2d5
	.long	0x1f28
	.uleb128 0x2f
	.secrel32	LASF30
	.byte	0x1
	.word	0x2d6
	.long	0x1fd
	.uleb128 0x2b
	.ascii "n\0"
	.byte	0x1
	.word	0x2d6
	.long	0x1fd
	.uleb128 0x2b
	.ascii "r\0"
	.byte	0x1
	.word	0x2d7
	.long	0xe9
	.uleb128 0x36
	.long	0x2370
	.uleb128 0x2f
	.secrel32	LASF31
	.byte	0x1
	.word	0x2dd
	.long	0x2378
	.byte	0x0
	.uleb128 0x37
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1af
	.uleb128 0x6
	.byte	0x4
	.long	0x237e
	.uleb128 0x32
	.secrel32	LASF2
	.long	0x1ce
	.uleb128 0x33
	.ascii "is_present_pte\0"
	.byte	0x1
	.byte	0xba
	.byte	0x1
	.long	0xe9
	.byte	0x0
	.long	0x23af
	.uleb128 0x28
	.ascii "pte\0"
	.byte	0x1
	.byte	0xb9
	.long	0x27b
	.byte	0x0
	.uleb128 0x29
	.ascii "mmu_pre_write_zap_pte\0"
	.byte	0x1
	.word	0x4a2
	.byte	0x1
	.byte	0x0
	.long	0x2428
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x49f
	.long	0xd83
	.uleb128 0x2e
	.secrel32	LASF4
	.byte	0x1
	.word	0x4a0
	.long	0x1f28
	.uleb128 0x2a
	.ascii "spte\0"
	.byte	0x1
	.word	0x4a1
	.long	0xaed
	.uleb128 0x2b
	.ascii "pte\0"
	.byte	0x1
	.word	0x4a3
	.long	0x165
	.uleb128 0x2b
	.ascii "child\0"
	.byte	0x1
	.word	0x4a4
	.long	0x1f28
	.uleb128 0x36
	.long	0x2419
	.uleb128 0x31
	.long	0x23a3
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x31
	.long	0x1f0f
	.uleb128 0x30
	.uleb128 0x35
	.long	0x1f1b
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.ascii "mmu_free_memory_cache\0"
	.byte	0x1
	.byte	0xe8
	.byte	0x1
	.byte	0x0
	.long	0x2452
	.uleb128 0x28
	.ascii "mc\0"
	.byte	0x1
	.byte	0xe7
	.long	0x2029
	.byte	0x0
	.uleb128 0x29
	.ascii "mmu_free_memory_caches\0"
	.byte	0x1
	.word	0x101
	.byte	0x1
	.byte	0x0
	.long	0x2492
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x100
	.long	0xd83
	.uleb128 0x36
	.long	0x248a
	.uleb128 0x31
	.long	0x2447
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x31
	.long	0x2447
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.ascii "mmu_memory_cache_alloc\0"
	.byte	0x1
	.word	0x108
	.byte	0x1
	.long	0x290
	.byte	0x0
	.long	0x24ea
	.uleb128 0x2a
	.ascii "mc\0"
	.byte	0x1
	.word	0x106
	.long	0x2029
	.uleb128 0x2a
	.ascii "size\0"
	.byte	0x1
	.word	0x107
	.long	0x170
	.uleb128 0x2b
	.ascii "p\0"
	.byte	0x1
	.word	0x109
	.long	0x290
	.uleb128 0x38
	.secrel32	LASF32
	.long	0x56b8
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.2574
	.byte	0x0
	.uleb128 0x29
	.ascii "hlist_add_head\0"
	.byte	0x4
	.word	0x323
	.byte	0x1
	.byte	0x3
	.long	0x2526
	.uleb128 0x2a
	.ascii "n\0"
	.byte	0x4
	.word	0x322
	.long	0x1fd
	.uleb128 0x2a
	.ascii "h\0"
	.byte	0x4
	.word	0x322
	.long	0x2372
	.uleb128 0x2b
	.ascii "first\0"
	.byte	0x4
	.word	0x324
	.long	0x1fd
	.byte	0x0
	.uleb128 0x2c
	.ascii "memslot_id\0"
	.byte	0x2
	.word	0x23a
	.byte	0x1
	.long	0xe9
	.byte	0x3
	.long	0x2558
	.uleb128 0x2a
	.ascii "kvm\0"
	.byte	0x2
	.word	0x239
	.long	0x146c
	.uleb128 0x2e
	.secrel32	LASF33
	.byte	0x2
	.word	0x239
	.long	0x2558
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x14cf
	.uleb128 0x29
	.ascii "__set_bit\0"
	.byte	0x3
	.word	0x12a
	.byte	0x1
	.byte	0x3
	.long	0x258a
	.uleb128 0x2a
	.ascii "nr\0"
	.byte	0x3
	.word	0x129
	.long	0xe9
	.uleb128 0x2e
	.secrel32	LASF27
	.byte	0x3
	.word	0x129
	.long	0x258a
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2590
	.uleb128 0x39
	.long	0x27b
	.uleb128 0x2c
	.ascii "gfn_to_page\0"
	.byte	0x2
	.word	0x1b5
	.byte	0x1
	.long	0x32b
	.byte	0x3
	.long	0x25c8
	.uleb128 0x2e
	.secrel32	LASF33
	.byte	0x2
	.word	0x1b4
	.long	0x2558
	.uleb128 0x2a
	.ascii "gfn\0"
	.byte	0x2
	.word	0x1b4
	.long	0xa8f
	.byte	0x0
	.uleb128 0x29
	.ascii "mmu_page_add_parent_pte\0"
	.byte	0x1
	.word	0x1fe
	.byte	0x1
	.byte	0x0
	.long	0x268f
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x1fc
	.long	0xd83
	.uleb128 0x2e
	.secrel32	LASF4
	.byte	0x1
	.word	0x1fd
	.long	0x1f28
	.uleb128 0x2e
	.secrel32	LASF15
	.byte	0x1
	.word	0x1fd
	.long	0xaed
	.uleb128 0x2f
	.secrel32	LASF34
	.byte	0x1
	.word	0x1ff
	.long	0x21dc
	.uleb128 0x2f
	.secrel32	LASF30
	.byte	0x1
	.word	0x200
	.long	0x1fd
	.uleb128 0x2b
	.ascii "i\0"
	.byte	0x1
	.word	0x201
	.long	0xe9
	.uleb128 0x36
	.long	0x2655
	.uleb128 0x2b
	.ascii "old\0"
	.byte	0x1
	.word	0x206
	.long	0xaed
	.uleb128 0x30
	.uleb128 0x31
	.long	0x250d
	.uleb128 0x31
	.long	0x2503
	.uleb128 0x30
	.uleb128 0x35
	.long	0x2517
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.long	0x2667
	.uleb128 0x2f
	.secrel32	LASF31
	.byte	0x1
	.word	0x212
	.long	0x2378
	.byte	0x0
	.uleb128 0x36
	.long	0x267e
	.uleb128 0x31
	.long	0x250d
	.uleb128 0x31
	.long	0x2503
	.uleb128 0x30
	.uleb128 0x35
	.long	0x2517
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.secrel32	LASF32
	.long	0x56cd
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.2788
	.byte	0x0
	.uleb128 0x2c
	.ascii "kvm_mmu_alloc_page\0"
	.byte	0x1
	.word	0x1ea
	.byte	0x1
	.long	0x1f28
	.byte	0x0
	.long	0x2726
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x1e8
	.long	0xd83
	.uleb128 0x2e
	.secrel32	LASF15
	.byte	0x1
	.word	0x1e9
	.long	0xaed
	.uleb128 0x2f
	.secrel32	LASF4
	.byte	0x1
	.word	0x1eb
	.long	0x1f28
	.uleb128 0x36
	.long	0x26e6
	.uleb128 0x2f
	.secrel32	LASF31
	.byte	0x1
	.word	0x1f0
	.long	0x1fbc
	.byte	0x0
	.uleb128 0x36
	.long	0x26f1
	.uleb128 0x31
	.long	0x1fae
	.byte	0x0
	.uleb128 0x36
	.long	0x2708
	.uleb128 0x31
	.long	0x1f40
	.uleb128 0x30
	.uleb128 0x31
	.long	0x1e83
	.uleb128 0x31
	.long	0x1e77
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x31
	.long	0x1f77
	.uleb128 0x31
	.long	0x1f6c
	.uleb128 0x30
	.uleb128 0x31
	.long	0x1e56
	.uleb128 0x31
	.long	0x1e4a
	.uleb128 0x31
	.long	0x1e3f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.ascii "is_paging\0"
	.byte	0x2
	.word	0x235
	.byte	0x1
	.long	0xe9
	.byte	0x3
	.long	0x274b
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x2
	.word	0x234
	.long	0xd83
	.byte	0x0
	.uleb128 0x29
	.ascii "dump_context\0"
	.byte	0x2
	.word	0x1fc
	.byte	0x1
	.byte	0x3
	.long	0x276f
	.uleb128 0x2e
	.secrel32	LASF35
	.byte	0x2
	.word	0x1fb
	.long	0x276f
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xcc4
	.uleb128 0x2c
	.ascii "is_pae\0"
	.byte	0x2
	.word	0x22b
	.byte	0x1
	.long	0xe9
	.byte	0x3
	.long	0x2797
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x2
	.word	0x22a
	.long	0xd83
	.byte	0x0
	.uleb128 0x2c
	.ascii "nonpaging_init_context\0"
	.byte	0x1
	.word	0x3b6
	.byte	0x1
	.long	0xe9
	.byte	0x0
	.long	0x27d6
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x3b5
	.long	0xd83
	.uleb128 0x2f
	.secrel32	LASF35
	.byte	0x1
	.word	0x3b7
	.long	0x276f
	.uleb128 0x37
	.byte	0x0
	.uleb128 0x2c
	.ascii "is_long_mode\0"
	.byte	0x2
	.word	0x222
	.byte	0x1
	.long	0xe9
	.byte	0x3
	.long	0x27fe
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x2
	.word	0x221
	.long	0xd83
	.byte	0x0
	.uleb128 0x2c
	.ascii "paging64_init_context\0"
	.byte	0x1
	.word	0x452
	.byte	0x1
	.long	0xe9
	.byte	0x0
	.long	0x282f
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x451
	.long	0xd83
	.byte	0x0
	.uleb128 0x2c
	.ascii "paging32E_init_context\0"
	.byte	0x1
	.word	0x46d
	.byte	0x1
	.long	0xe9
	.byte	0x0
	.long	0x2861
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x46c
	.long	0xd83
	.byte	0x0
	.uleb128 0x2c
	.ascii "paging32_init_context\0"
	.byte	0x1
	.word	0x457
	.byte	0x1
	.long	0xe9
	.byte	0x0
	.long	0x289e
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x456
	.long	0xd83
	.uleb128 0x2f
	.secrel32	LASF35
	.byte	0x1
	.word	0x458
	.long	0x276f
	.byte	0x0
	.uleb128 0x2c
	.ascii "is_error_hpa\0"
	.byte	0x2
	.word	0x1ad
	.byte	0x1
	.long	0xe9
	.byte	0x3
	.long	0x28c6
	.uleb128 0x2a
	.ascii "hpa\0"
	.byte	0x2
	.word	0x1ad
	.long	0xa9c
	.byte	0x0
	.uleb128 0x29
	.ascii "mark_pagetable_nonglobal\0"
	.byte	0x1
	.word	0x3de
	.byte	0x1
	.byte	0x0
	.long	0x2904
	.uleb128 0x2e
	.secrel32	LASF36
	.byte	0x1
	.word	0x3dd
	.long	0x290
	.uleb128 0x30
	.uleb128 0x31
	.long	0x1f0f
	.uleb128 0x30
	.uleb128 0x35
	.long	0x1f1b
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.ascii "is_writeble_pte\0"
	.byte	0x1
	.byte	0xbf
	.byte	0x1
	.long	0xe9
	.byte	0x0
	.long	0x292d
	.uleb128 0x28
	.ascii "pte\0"
	.byte	0x1
	.byte	0xbe
	.long	0x27b
	.byte	0x0
	.uleb128 0x29
	.ascii "set_pte_common\0"
	.byte	0x1
	.word	0x3e8
	.byte	0x1
	.byte	0x3
	.long	0x29d9
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x3e2
	.long	0xd83
	.uleb128 0x2e
	.secrel32	LASF36
	.byte	0x1
	.word	0x3e3
	.long	0xaed
	.uleb128 0x2e
	.secrel32	LASF37
	.byte	0x1
	.word	0x3e4
	.long	0xa82
	.uleb128 0x2a
	.ascii "dirty\0"
	.byte	0x1
	.word	0x3e5
	.long	0xe9
	.uleb128 0x2e
	.secrel32	LASF38
	.byte	0x1
	.word	0x3e6
	.long	0x165
	.uleb128 0x2a
	.ascii "gfn\0"
	.byte	0x1
	.word	0x3e7
	.long	0xa8f
	.uleb128 0x2f
	.secrel32	LASF39
	.byte	0x1
	.word	0x3e9
	.long	0xa9c
	.uleb128 0x36
	.long	0x29b8
	.uleb128 0x2b
	.ascii "shadow\0"
	.byte	0x1
	.word	0x400
	.long	0x1f28
	.uleb128 0x30
	.uleb128 0x31
	.long	0x2921
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.long	0x29d1
	.uleb128 0x31
	.long	0x28e9
	.uleb128 0x30
	.uleb128 0x31
	.long	0x1f0f
	.uleb128 0x30
	.uleb128 0x35
	.long	0x1f1b
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x31
	.long	0x28b9
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.ascii "is_io_pte\0"
	.byte	0x1
	.byte	0xc4
	.byte	0x1
	.long	0xe9
	.byte	0x0
	.long	0x29fc
	.uleb128 0x28
	.ascii "pte\0"
	.byte	0x1
	.byte	0xc3
	.long	0x27b
	.byte	0x0
	.uleb128 0x3a
	.ascii "is_cpuid_PSE36\0"
	.byte	0x1
	.byte	0xb0
	.byte	0x1
	.long	0xe9
	.byte	0x0
	.uleb128 0x33
	.ascii "is_write_protection\0"
	.byte	0x1
	.byte	0xab
	.byte	0x1
	.long	0xe9
	.byte	0x0
	.long	0x2a41
	.uleb128 0x3b
	.secrel32	LASF25
	.byte	0x1
	.byte	0xaa
	.long	0xd83
	.byte	0x0
	.uleb128 0x27
	.ascii "paging64_mark_pagetable_dirty\0"
	.byte	0x5
	.byte	0xc0
	.byte	0x1
	.byte	0x0
	.long	0x2a7f
	.uleb128 0x28
	.ascii "kvm\0"
	.byte	0x5
	.byte	0xbe
	.long	0x146c
	.uleb128 0x3b
	.secrel32	LASF40
	.byte	0x5
	.byte	0xbf
	.long	0x2a7f
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1d1b
	.uleb128 0x27
	.ascii "paging32_mark_pagetable_dirty\0"
	.byte	0x5
	.byte	0xc0
	.byte	0x1
	.byte	0x0
	.long	0x2ac3
	.uleb128 0x28
	.ascii "kvm\0"
	.byte	0x5
	.byte	0xbe
	.long	0x146c
	.uleb128 0x3b
	.secrel32	LASF40
	.byte	0x5
	.byte	0xbf
	.long	0x2ac3
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1da8
	.uleb128 0x33
	.ascii "is_nx\0"
	.byte	0x1
	.byte	0xb5
	.byte	0x1
	.long	0xe9
	.byte	0x0
	.long	0x2ae8
	.uleb128 0x3b
	.secrel32	LASF25
	.byte	0x1
	.byte	0xb4
	.long	0xd83
	.byte	0x0
	.uleb128 0x27
	.ascii "paging64_release_walker\0"
	.byte	0x5
	.byte	0xb9
	.byte	0x1
	.byte	0x0
	.long	0x2b15
	.uleb128 0x3b
	.secrel32	LASF40
	.byte	0x5
	.byte	0xb8
	.long	0x2a7f
	.byte	0x0
	.uleb128 0x2c
	.ascii "is_pse\0"
	.byte	0x2
	.word	0x230
	.byte	0x1
	.long	0xe9
	.byte	0x3
	.long	0x2b37
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x2
	.word	0x22f
	.long	0xd83
	.byte	0x0
	.uleb128 0x27
	.ascii "paging32_release_walker\0"
	.byte	0x5
	.byte	0xb9
	.byte	0x1
	.byte	0x0
	.long	0x2b64
	.uleb128 0x3b
	.secrel32	LASF40
	.byte	0x5
	.byte	0xb8
	.long	0x2ac3
	.byte	0x0
	.uleb128 0x33
	.ascii "mmu_topup_memory_cache\0"
	.byte	0x1
	.byte	0xd0
	.byte	0x1
	.long	0xe9
	.byte	0x0
	.long	0x2bbb
	.uleb128 0x28
	.ascii "cache\0"
	.byte	0x1
	.byte	0xce
	.long	0x2029
	.uleb128 0x28
	.ascii "objsize\0"
	.byte	0x1
	.byte	0xcf
	.long	0x170
	.uleb128 0x28
	.ascii "min\0"
	.byte	0x1
	.byte	0xcf
	.long	0xe9
	.uleb128 0x3c
	.ascii "obj\0"
	.byte	0x1
	.byte	0xd1
	.long	0x290
	.byte	0x0
	.uleb128 0x27
	.ascii "kvm_mmu_audit\0"
	.byte	0x1
	.byte	0x2c
	.byte	0x1
	.byte	0x0
	.long	0x2be9
	.uleb128 0x3b
	.secrel32	LASF25
	.byte	0x1
	.byte	0x2c
	.long	0xd83
	.uleb128 0x28
	.ascii "msg\0"
	.byte	0x1
	.byte	0x2c
	.long	0x57c
	.byte	0x0
	.uleb128 0x3d
	.secrel32	LASF20
	.byte	0x1
	.word	0x418
	.byte	0x1
	.byte	0x0
	.long	0x2c21
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x415
	.long	0xd83
	.uleb128 0x2e
	.secrel32	LASF27
	.byte	0x1
	.word	0x416
	.long	0x165
	.uleb128 0x2a
	.ascii "err_code\0"
	.byte	0x1
	.word	0x417
	.long	0x15a
	.byte	0x0
	.uleb128 0x2c
	.ascii "fix_read_pf\0"
	.byte	0x1
	.word	0x41d
	.byte	0x1
	.long	0xe9
	.byte	0x3
	.long	0x2c48
	.uleb128 0x2e
	.secrel32	LASF41
	.byte	0x1
	.word	0x41c
	.long	0xaed
	.byte	0x0
	.uleb128 0x29
	.ascii "kvm_mmu_flush_tlb\0"
	.byte	0x1
	.word	0x3cd
	.byte	0x1
	.byte	0x0
	.long	0x2c71
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x3cc
	.long	0xd83
	.byte	0x0
	.uleb128 0x27
	.ascii "INIT_LIST_HEAD\0"
	.byte	0x4
	.byte	0x24
	.byte	0x1
	.byte	0x3
	.long	0x2c96
	.uleb128 0x28
	.ascii "list\0"
	.byte	0x4
	.byte	0x23
	.long	0x1a9
	.byte	0x0
	.uleb128 0x3e
	.byte	0x1
	.ascii "nonpaging_new_cr3\0"
	.byte	0x1
	.word	0x312
	.byte	0x1
	.long	LFB148
	.long	LFE148
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x2ccd
	.uleb128 0x3f
	.secrel32	LASF25
	.byte	0x1
	.word	0x311
	.long	0xd83
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0x0
	.uleb128 0x40
	.byte	0x1
	.ascii "nonpaging_gva_to_gpa\0"
	.byte	0x1
	.word	0x38d
	.byte	0x1
	.long	0xa82
	.long	LFB152
	.long	LFE152
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x2d1c
	.uleb128 0x3f
	.secrel32	LASF25
	.byte	0x1
	.word	0x38c
	.long	0xd83
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x41
	.ascii "vaddr\0"
	.byte	0x1
	.word	0x38c
	.long	0xa75
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0x0
	.uleb128 0x3e
	.byte	0x1
	.ascii "kvm_mmu_post_write\0"
	.byte	0x1
	.word	0x4fc
	.byte	0x1
	.long	LFB190
	.long	LFE190
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x2d74
	.uleb128 0x3f
	.secrel32	LASF25
	.byte	0x1
	.word	0x4fb
	.long	0xd83
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x41
	.ascii "gpa\0"
	.byte	0x1
	.word	0x4fb
	.long	0xa82
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x41
	.ascii "bytes\0"
	.byte	0x1
	.word	0x4fb
	.long	0xe9
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.byte	0x0
	.uleb128 0x42
	.ascii "kvm_mmu_lookup_page\0"
	.byte	0x1
	.word	0x24a
	.byte	0x1
	.long	0x1f28
	.long	LFB138
	.long	LFE138
	.secrel32	LLST3
	.long	0x2e10
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x248
	.long	0xd83
	.secrel32	LLST4
	.uleb128 0x44
	.ascii "gfn\0"
	.byte	0x1
	.word	0x249
	.long	0xa8f
	.secrel32	LLST5
	.uleb128 0x2f
	.secrel32	LASF5
	.byte	0x1
	.word	0x24b
	.long	0xfd
	.uleb128 0x2f
	.secrel32	LASF29
	.byte	0x1
	.word	0x24c
	.long	0x2372
	.uleb128 0x45
	.secrel32	LASF4
	.byte	0x1
	.word	0x24d
	.long	0x1f28
	.secrel32	LLST6
	.uleb128 0x45
	.secrel32	LASF30
	.byte	0x1
	.word	0x24e
	.long	0x1fd
	.secrel32	LLST7
	.uleb128 0x46
	.long	LBB391
	.long	LBE391
	.uleb128 0x2f
	.secrel32	LASF31
	.byte	0x1
	.word	0x253
	.long	0x2378
	.byte	0x0
	.byte	0x0
	.uleb128 0x47
	.ascii "destroy_kvm_mmu\0"
	.byte	0x1
	.word	0x487
	.byte	0x1
	.long	LFB186
	.long	LFE186
	.secrel32	LLST8
	.long	0x2e46
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x486
	.long	0xd83
	.secrel32	LLST9
	.byte	0x0
	.uleb128 0x42
	.ascii "is_empty_shadow_page\0"
	.byte	0x1
	.word	0x1ca
	.byte	0x1
	.long	0xe9
	.long	LFB132
	.long	LFE132
	.secrel32	LLST10
	.long	0x2eb5
	.uleb128 0x43
	.secrel32	LASF16
	.byte	0x1
	.word	0x1c9
	.long	0xa9c
	.secrel32	LLST11
	.uleb128 0x48
	.ascii "pos\0"
	.byte	0x1
	.word	0x1cb
	.long	0xaed
	.secrel32	LLST12
	.uleb128 0x48
	.ascii "end\0"
	.byte	0x1
	.word	0x1cc
	.long	0xaed
	.secrel32	LLST13
	.uleb128 0x38
	.secrel32	LASF32
	.long	0x56e2
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.2727
	.byte	0x0
	.uleb128 0x47
	.ascii "mmu_free_roots\0"
	.byte	0x1
	.word	0x34a
	.byte	0x1
	.long	LFB150
	.long	LFE150
	.secrel32	LLST14
	.long	0x2f42
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x349
	.long	0xd83
	.secrel32	LLST15
	.uleb128 0x2b
	.ascii "i\0"
	.byte	0x1
	.word	0x34b
	.long	0xe9
	.uleb128 0x45
	.secrel32	LASF4
	.byte	0x1
	.word	0x34c
	.long	0x1f28
	.secrel32	LLST16
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x0
	.uleb128 0x48
	.ascii "root\0"
	.byte	0x1
	.word	0x35a
	.long	0xa9c
	.secrel32	LLST17
	.uleb128 0x4a
	.long	0x1efd
	.long	LBB393
	.long	LBE393
	.byte	0x1
	.word	0x35e
	.uleb128 0x31
	.long	0x1f0f
	.uleb128 0x46
	.long	LBB394
	.long	LBE394
	.uleb128 0x4b
	.long	0x1f1b
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x4c
	.long	0x1fcb
	.long	LFB154
	.long	LFE154
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x2f5f
	.uleb128 0x4d
	.long	0x1fe4
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0x0
	.uleb128 0x4e
	.ascii "paging_free\0"
	.byte	0x1
	.word	0x42e
	.byte	0x1
	.long	LFB162
	.long	LFE162
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x2fa5
	.uleb128 0x3f
	.secrel32	LASF25
	.byte	0x1
	.word	0x42d
	.long	0xd83
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4a
	.long	0x1fcb
	.long	LBB396
	.long	LBE396
	.byte	0x1
	.word	0x42f
	.uleb128 0x31
	.long	0x2f56
	.byte	0x0
	.byte	0x0
	.uleb128 0x47
	.ascii "rmap_remove\0"
	.byte	0x1
	.word	0x183
	.byte	0x1
	.long	LFB130
	.long	LFE130
	.secrel32	LLST20
	.long	0x3092
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x182
	.long	0xd83
	.secrel32	LLST21
	.uleb128 0x44
	.ascii "spte\0"
	.byte	0x1
	.word	0x182
	.long	0xaed
	.secrel32	LLST22
	.uleb128 0x45
	.secrel32	LASF4
	.byte	0x1
	.word	0x184
	.long	0x32b
	.secrel32	LLST23
	.uleb128 0x48
	.ascii "desc\0"
	.byte	0x1
	.word	0x185
	.long	0x1d15
	.secrel32	LLST24
	.uleb128 0x45
	.secrel32	LASF26
	.byte	0x1
	.word	0x186
	.long	0x1d15
	.secrel32	LLST25
	.uleb128 0x48
	.ascii "i\0"
	.byte	0x1
	.word	0x187
	.long	0xe9
	.secrel32	LLST26
	.uleb128 0x4a
	.long	0x2095
	.long	LBB398
	.long	LBE398
	.byte	0x1
	.word	0x19e
	.uleb128 0x31
	.long	0x20e5
	.uleb128 0x31
	.long	0x20db
	.uleb128 0x31
	.long	0x20ce
	.uleb128 0x31
	.long	0x20c2
	.uleb128 0x31
	.long	0x20b6
	.uleb128 0x46
	.long	LBB399
	.long	LBE399
	.uleb128 0x4f
	.long	0x20f1
	.secrel32	LLST27
	.uleb128 0x50
	.long	0x202f
	.secrel32	Ldebug_ranges0+0x18
	.byte	0x1
	.word	0x17f
	.uleb128 0x31
	.long	0x2058
	.uleb128 0x31
	.long	0x204c
	.uleb128 0x50
	.long	0x1ff1
	.secrel32	Ldebug_ranges0+0x30
	.byte	0x1
	.word	0x135
	.uleb128 0x31
	.long	0x201c
	.uleb128 0x31
	.long	0x2011
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x51
	.byte	0x1
	.ascii "kvm_mmu_slot_remove_write_access\0"
	.byte	0x1
	.word	0x56e
	.byte	0x1
	.long	LFB198
	.long	LFE198
	.secrel32	LLST28
	.long	0x3181
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x56d
	.long	0xd83
	.secrel32	LLST29
	.uleb128 0x3f
	.secrel32	LASF33
	.byte	0x1
	.word	0x56d
	.long	0xe9
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x48
	.ascii "kvm\0"
	.byte	0x1
	.word	0x56f
	.long	0x146c
	.secrel32	LLST30
	.uleb128 0x45
	.secrel32	LASF4
	.byte	0x1
	.word	0x570
	.long	0x1f28
	.secrel32	LLST31
	.uleb128 0x52
	.long	LBB408
	.long	LBE408
	.long	0x3122
	.uleb128 0x2f
	.secrel32	LASF31
	.byte	0x1
	.word	0x572
	.long	0x1fbc
	.byte	0x0
	.uleb128 0x53
	.secrel32	Ldebug_ranges0+0x48
	.long	0x316a
	.uleb128 0x2b
	.ascii "i\0"
	.byte	0x1
	.word	0x573
	.long	0xe9
	.uleb128 0x2b
	.ascii "pt\0"
	.byte	0x1
	.word	0x574
	.long	0xaed
	.uleb128 0x4a
	.long	0x2114
	.long	LBB410
	.long	LBE410
	.byte	0x1
	.word	0x576
	.uleb128 0x46
	.long	LBB411
	.long	LBE411
	.uleb128 0x4f
	.long	0x2142
	.secrel32	LLST32
	.uleb128 0x35
	.long	0x214c
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x46
	.long	LBB412
	.long	LBE412
	.uleb128 0x2f
	.secrel32	LASF31
	.byte	0x1
	.word	0x572
	.long	0x1fbc
	.byte	0x0
	.byte	0x0
	.uleb128 0x47
	.ascii "mmu_page_remove_parent_pte\0"
	.byte	0x1
	.word	0x224
	.byte	0x1
	.long	LFB137
	.long	LFE137
	.secrel32	LLST33
	.long	0x32b4
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x221
	.long	0xd83
	.secrel32	LLST34
	.uleb128 0x43
	.secrel32	LASF4
	.byte	0x1
	.word	0x222
	.long	0x1f28
	.secrel32	LLST35
	.uleb128 0x43
	.secrel32	LASF15
	.byte	0x1
	.word	0x223
	.long	0xaed
	.secrel32	LLST36
	.uleb128 0x45
	.secrel32	LASF34
	.byte	0x1
	.word	0x225
	.long	0x21dc
	.secrel32	LLST37
	.uleb128 0x45
	.secrel32	LASF30
	.byte	0x1
	.word	0x226
	.long	0x1fd
	.secrel32	LLST38
	.uleb128 0x48
	.ascii "i\0"
	.byte	0x1
	.word	0x227
	.long	0xe9
	.secrel32	LLST39
	.uleb128 0x53
	.secrel32	Ldebug_ranges0+0x60
	.long	0x3225
	.uleb128 0x2f
	.secrel32	LASF31
	.byte	0x1
	.word	0x22e
	.long	0x2378
	.byte	0x0
	.uleb128 0x54
	.long	0x2169
	.long	LBB417
	.long	LBE417
	.byte	0x1
	.word	0x23c
	.long	0x3271
	.uleb128 0x31
	.long	0x217d
	.uleb128 0x4a
	.long	0x1e90
	.long	LBB419
	.long	LBE419
	.byte	0x4
	.word	0x2e7
	.uleb128 0x31
	.long	0x1ea6
	.uleb128 0x46
	.long	LBB420
	.long	LBE420
	.uleb128 0x4f
	.long	0x1eb0
	.secrel32	LLST40
	.uleb128 0x4f
	.long	0x1ebd
	.secrel32	LLST41
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x55
	.long	0x219b
	.secrel32	Ldebug_ranges0+0x80
	.byte	0x1
	.word	0x23d
	.long	0x32a3
	.uleb128 0x31
	.long	0x21c4
	.uleb128 0x31
	.long	0x21b8
	.uleb128 0x50
	.long	0x1ff1
	.secrel32	Ldebug_ranges0+0x98
	.byte	0x1
	.word	0x124
	.uleb128 0x31
	.long	0x201c
	.uleb128 0x31
	.long	0x2011
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.secrel32	LASF32
	.long	0x56f7
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.2807
	.byte	0x0
	.uleb128 0x29
	.ascii "kvm_mmu_page_unlink_children\0"
	.byte	0x1
	.word	0x291
	.byte	0x1
	.byte	0x1
	.long	0x3323
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x28f
	.long	0xd83
	.uleb128 0x2e
	.secrel32	LASF4
	.byte	0x1
	.word	0x290
	.long	0x1f28
	.uleb128 0x2b
	.ascii "i\0"
	.byte	0x1
	.word	0x292
	.long	0xfd
	.uleb128 0x2b
	.ascii "pt\0"
	.byte	0x1
	.word	0x293
	.long	0xaed
	.uleb128 0x2b
	.ascii "ent\0"
	.byte	0x1
	.word	0x294
	.long	0x165
	.uleb128 0x30
	.uleb128 0x31
	.long	0x1f0f
	.uleb128 0x30
	.uleb128 0x35
	.long	0x1f1b
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x47
	.ascii "kvm_mmu_zap_page\0"
	.byte	0x1
	.word	0x2b6
	.byte	0x1
	.long	LFB142
	.long	LFE142
	.secrel32	LLST42
	.long	0x3587
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x2b4
	.long	0xd83
	.secrel32	LLST43
	.uleb128 0x43
	.secrel32	LASF4
	.byte	0x1
	.word	0x2b5
	.long	0x1f28
	.secrel32	LLST44
	.uleb128 0x45
	.secrel32	LASF15
	.byte	0x1
	.word	0x2b7
	.long	0xaed
	.secrel32	LLST45
	.uleb128 0x54
	.long	0x2216
	.long	LBB461
	.long	LBE461
	.byte	0x1
	.word	0x2c4
	.long	0x339d
	.uleb128 0x31
	.long	0x2249
	.uleb128 0x31
	.long	0x223d
	.uleb128 0x31
	.long	0x2231
	.byte	0x0
	.uleb128 0x52
	.long	LBB463
	.long	LBE463
	.long	0x33b9
	.uleb128 0x2b
	.ascii "chain\0"
	.byte	0x1
	.word	0x2bd
	.long	0x21dc
	.byte	0x0
	.uleb128 0x55
	.long	0x32b4
	.secrel32	Ldebug_ranges0+0xb0
	.byte	0x1
	.word	0x2c7
	.long	0x3403
	.uleb128 0x31
	.long	0x32e7
	.uleb128 0x31
	.long	0x32db
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0xd0
	.uleb128 0x35
	.long	0x32f3
	.uleb128 0x35
	.long	0x32fd
	.uleb128 0x4f
	.long	0x3308
	.secrel32	LLST46
	.uleb128 0x4a
	.long	0x1efd
	.long	LBB467
	.long	LBE467
	.byte	0x1
	.word	0x2a9
	.uleb128 0x31
	.long	0x1f0f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x55
	.long	0x2169
	.secrel32	Ldebug_ranges0+0xf0
	.byte	0x1
	.word	0x2c9
	.long	0x344b
	.uleb128 0x31
	.long	0x217d
	.uleb128 0x4a
	.long	0x1e90
	.long	LBB471
	.long	LBE471
	.byte	0x4
	.word	0x2e7
	.uleb128 0x31
	.long	0x1ea6
	.uleb128 0x46
	.long	LBB472
	.long	LBE472
	.uleb128 0x4f
	.long	0x1eb0
	.secrel32	LLST47
	.uleb128 0x4f
	.long	0x1ebd
	.secrel32	LLST48
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x55
	.long	0x2256
	.secrel32	Ldebug_ranges0+0x108
	.byte	0x1
	.word	0x2ca
	.long	0x3504
	.uleb128 0x31
	.long	0x227e
	.uleb128 0x31
	.long	0x2272
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x120
	.uleb128 0x4f
	.long	0x228a
	.secrel32	LLST49
	.uleb128 0x55
	.long	0x1f5a
	.secrel32	Ldebug_ranges0+0x148
	.byte	0x1
	.word	0x1df
	.long	0x34a9
	.uleb128 0x31
	.long	0x1f77
	.uleb128 0x31
	.long	0x1f6c
	.uleb128 0x56
	.long	0x1e2b
	.secrel32	Ldebug_ranges0+0x160
	.byte	0x4
	.byte	0x4a
	.uleb128 0x31
	.long	0x1e56
	.uleb128 0x31
	.long	0x1e4a
	.uleb128 0x31
	.long	0x1e3f
	.byte	0x0
	.byte	0x0
	.uleb128 0x54
	.long	0x1f2e
	.long	LBB487
	.long	LBE487
	.byte	0x1
	.word	0x1dd
	.long	0x34dd
	.uleb128 0x31
	.long	0x1f40
	.uleb128 0x57
	.long	0x1e63
	.long	LBB489
	.long	LBE489
	.byte	0x4
	.byte	0xaf
	.uleb128 0x31
	.long	0x1e83
	.uleb128 0x31
	.long	0x1e77
	.byte	0x0
	.byte	0x0
	.uleb128 0x50
	.long	0x1efd
	.secrel32	Ldebug_ranges0+0x178
	.byte	0x1
	.word	0x1da
	.uleb128 0x31
	.long	0x1f0f
	.uleb128 0x46
	.long	LBB492
	.long	LBE492
	.uleb128 0x4f
	.long	0x1f1b
	.secrel32	LLST50
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x54
	.long	0x1f2e
	.long	LBB496
	.long	LBE496
	.byte	0x1
	.word	0x2cc
	.long	0x3538
	.uleb128 0x31
	.long	0x1f40
	.uleb128 0x57
	.long	0x1e63
	.long	LBB498
	.long	LBE498
	.byte	0x4
	.byte	0xaf
	.uleb128 0x31
	.long	0x1e83
	.uleb128 0x31
	.long	0x1e77
	.byte	0x0
	.byte	0x0
	.uleb128 0x54
	.long	0x1f5a
	.long	LBB500
	.long	LBE500
	.byte	0x1
	.word	0x2cd
	.long	0x3576
	.uleb128 0x31
	.long	0x1f77
	.uleb128 0x31
	.long	0x1f6c
	.uleb128 0x57
	.long	0x1e2b
	.long	LBB502
	.long	LBE502
	.byte	0x4
	.byte	0x4a
	.uleb128 0x31
	.long	0x1e56
	.uleb128 0x31
	.long	0x1e4a
	.uleb128 0x31
	.long	0x1e3f
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.secrel32	LASF32
	.long	0x570c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.2951
	.byte	0x0
	.uleb128 0x51
	.byte	0x1
	.ascii "kvm_mmu_free_some_pages\0"
	.byte	0x1
	.word	0x507
	.byte	0x1
	.long	LFB192
	.long	LFE192
	.secrel32	LLST51
	.long	0x35dc
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x506
	.long	0xd83
	.secrel32	LLST52
	.uleb128 0x46
	.long	LBB506
	.long	LBE506
	.uleb128 0x2f
	.secrel32	LASF4
	.byte	0x1
	.word	0x50a
	.long	0x1f28
	.byte	0x0
	.byte	0x0
	.uleb128 0x58
	.byte	0x1
	.ascii "kvm_mmu_unprotect_page_virt\0"
	.byte	0x1
	.word	0x500
	.byte	0x1
	.long	0xe9
	.long	LFB191
	.long	LFE191
	.secrel32	LLST53
	.long	0x3689
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x4ff
	.long	0xd83
	.secrel32	LLST54
	.uleb128 0x41
	.ascii "gva\0"
	.byte	0x1
	.word	0x4ff
	.long	0xa75
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x48
	.ascii "gpa\0"
	.byte	0x1
	.word	0x501
	.long	0xa82
	.secrel32	LLST55
	.uleb128 0x50
	.long	0x22dd
	.secrel32	Ldebug_ranges0+0x190
	.byte	0x1
	.word	0x503
	.uleb128 0x31
	.long	0x230e
	.uleb128 0x31
	.long	0x2302
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x1a8
	.uleb128 0x35
	.long	0x231a
	.uleb128 0x35
	.long	0x2326
	.uleb128 0x4f
	.long	0x2332
	.secrel32	LLST56
	.uleb128 0x4f
	.long	0x233e
	.secrel32	LLST57
	.uleb128 0x35
	.long	0x234a
	.uleb128 0x4f
	.long	0x2354
	.secrel32	LLST58
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x51
	.byte	0x1
	.ascii "kvm_mmu_pre_write\0"
	.byte	0x1
	.word	0x4b3
	.byte	0x1
	.long	LFB189
	.long	LFE189
	.secrel32	LLST59
	.long	0x3829
	.uleb128 0x3f
	.secrel32	LASF25
	.byte	0x1
	.word	0x4b2
	.long	0xd83
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x44
	.ascii "gpa\0"
	.byte	0x1
	.word	0x4b2
	.long	0xa82
	.secrel32	LLST60
	.uleb128 0x41
	.ascii "bytes\0"
	.byte	0x1
	.word	0x4b2
	.long	0xe9
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x48
	.ascii "gfn\0"
	.byte	0x1
	.word	0x4b4
	.long	0xa8f
	.secrel32	LLST61
	.uleb128 0x45
	.secrel32	LASF4
	.byte	0x1
	.word	0x4b5
	.long	0x1f28
	.secrel32	LLST62
	.uleb128 0x45
	.secrel32	LASF30
	.byte	0x1
	.word	0x4b6
	.long	0x1fd
	.secrel32	LLST63
	.uleb128 0x48
	.ascii "n\0"
	.byte	0x1
	.word	0x4b6
	.long	0x1fd
	.secrel32	LLST64
	.uleb128 0x2f
	.secrel32	LASF29
	.byte	0x1
	.word	0x4b7
	.long	0x2372
	.uleb128 0x2f
	.secrel32	LASF5
	.byte	0x1
	.word	0x4b8
	.long	0xfd
	.uleb128 0x48
	.ascii "spte\0"
	.byte	0x1
	.word	0x4b9
	.long	0xaed
	.secrel32	LLST65
	.uleb128 0x48
	.ascii "offset\0"
	.byte	0x1
	.word	0x4ba
	.long	0xfd
	.secrel32	LLST66
	.uleb128 0x2b
	.ascii "pte_size\0"
	.byte	0x1
	.word	0x4bb
	.long	0xfd
	.uleb128 0x48
	.ascii "page_offset\0"
	.byte	0x1
	.word	0x4bc
	.long	0xfd
	.secrel32	LLST67
	.uleb128 0x2b
	.ascii "misaligned\0"
	.byte	0x1
	.word	0x4bd
	.long	0xfd
	.uleb128 0x2f
	.secrel32	LASF12
	.byte	0x1
	.word	0x4be
	.long	0xe9
	.uleb128 0x48
	.ascii "flooded\0"
	.byte	0x1
	.word	0x4bf
	.long	0xe9
	.secrel32	LLST68
	.uleb128 0x48
	.ascii "npte\0"
	.byte	0x1
	.word	0x4c0
	.long	0xe9
	.secrel32	LLST69
	.uleb128 0x52
	.long	LBB512
	.long	LBE512
	.long	0x37e2
	.uleb128 0x2f
	.secrel32	LASF31
	.byte	0x1
	.word	0x4cd
	.long	0x2378
	.byte	0x0
	.uleb128 0x50
	.long	0x23af
	.secrel32	Ldebug_ranges0+0x1c8
	.byte	0x1
	.word	0x4f5
	.uleb128 0x31
	.long	0x23e7
	.uleb128 0x31
	.long	0x23db
	.uleb128 0x31
	.long	0x23cf
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x1e8
	.uleb128 0x4f
	.long	0x23f4
	.secrel32	LLST70
	.uleb128 0x35
	.long	0x2400
	.uleb128 0x4a
	.long	0x1efd
	.long	LBB516
	.long	LBE516
	.byte	0x1
	.word	0x4ab
	.uleb128 0x31
	.long	0x1f0f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x47
	.ascii "free_mmu_pages\0"
	.byte	0x1
	.word	0x515
	.byte	0x1
	.long	LFB193
	.long	LFE193
	.secrel32	LLST71
	.long	0x38c6
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x514
	.long	0xd83
	.secrel32	LLST72
	.uleb128 0x2f
	.secrel32	LASF4
	.byte	0x1
	.word	0x516
	.long	0x1f28
	.uleb128 0x54
	.long	0x1f95
	.long	LBB520
	.long	LBE520
	.byte	0x1
	.word	0x518
	.long	0x3883
	.uleb128 0x31
	.long	0x1fae
	.byte	0x0
	.uleb128 0x55
	.long	0x1f95
	.secrel32	Ldebug_ranges0+0x208
	.byte	0x1
	.word	0x51d
	.long	0x3899
	.uleb128 0x31
	.long	0x1fae
	.byte	0x0
	.uleb128 0x50
	.long	0x1f2e
	.secrel32	Ldebug_ranges0+0x220
	.byte	0x1
	.word	0x520
	.uleb128 0x31
	.long	0x1f40
	.uleb128 0x57
	.long	0x1e63
	.long	LBB527
	.long	LBE527
	.byte	0x4
	.byte	0xaf
	.uleb128 0x31
	.long	0x1e83
	.uleb128 0x31
	.long	0x1e77
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x51
	.byte	0x1
	.ascii "kvm_mmu_destroy\0"
	.byte	0x1
	.word	0x565
	.byte	0x1
	.long	LFB197
	.long	LFE197
	.secrel32	LLST73
	.long	0x3943
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x564
	.long	0xd83
	.secrel32	LLST74
	.uleb128 0x4a
	.long	0x2452
	.long	LBB532
	.long	LBE532
	.byte	0x1
	.word	0x56a
	.uleb128 0x31
	.long	0x2473
	.uleb128 0x54
	.long	0x2428
	.long	LBB534
	.long	LBE534
	.byte	0x1
	.word	0x102
	.long	0x392b
	.uleb128 0x31
	.long	0x2447
	.byte	0x0
	.uleb128 0x4a
	.long	0x2428
	.long	LBB536
	.long	LBE536
	.byte	0x1
	.word	0x103
	.uleb128 0x31
	.long	0x2447
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x42
	.ascii "mmu_alloc_pte_chain\0"
	.byte	0x1
	.word	0x11c
	.byte	0x1
	.long	0x21dc
	.long	LFB124
	.long	LFE124
	.secrel32	LLST75
	.long	0x39af
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x11b
	.long	0xd83
	.secrel32	LLST76
	.uleb128 0x4a
	.long	0x2492
	.long	LBB538
	.long	LBE538
	.byte	0x1
	.word	0x11d
	.uleb128 0x31
	.long	0x24c2
	.uleb128 0x31
	.long	0x24b7
	.uleb128 0x46
	.long	LBB539
	.long	LBE539
	.uleb128 0x4f
	.long	0x24cf
	.secrel32	LLST77
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x42
	.ascii "mmu_alloc_rmap_desc\0"
	.byte	0x1
	.word	0x128
	.byte	0x1
	.long	0x1d15
	.long	LFB126
	.long	LFE126
	.secrel32	LLST78
	.long	0x3a27
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x127
	.long	0xd83
	.secrel32	LLST79
	.uleb128 0x48
	.ascii "ptr\0"
	.byte	0x1
	.word	0x129
	.long	0x290
	.secrel32	LLST80
	.uleb128 0x4a
	.long	0x2492
	.long	LBB540
	.long	LBE540
	.byte	0x1
	.word	0x12b
	.uleb128 0x31
	.long	0x24c2
	.uleb128 0x31
	.long	0x24b7
	.uleb128 0x46
	.long	LBB541
	.long	LBE541
	.uleb128 0x35
	.long	0x24cf
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x47
	.ascii "rmap_add\0"
	.byte	0x1
	.word	0x143
	.byte	0x1
	.long	LFB128
	.long	LFE128
	.secrel32	LLST81
	.long	0x3a96
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x142
	.long	0xd83
	.secrel32	LLST82
	.uleb128 0x44
	.ascii "spte\0"
	.byte	0x1
	.word	0x142
	.long	0xaed
	.secrel32	LLST83
	.uleb128 0x45
	.secrel32	LASF4
	.byte	0x1
	.word	0x144
	.long	0x32b
	.secrel32	LLST84
	.uleb128 0x48
	.ascii "desc\0"
	.byte	0x1
	.word	0x145
	.long	0x1d15
	.secrel32	LLST85
	.uleb128 0x48
	.ascii "i\0"
	.byte	0x1
	.word	0x146
	.long	0xe9
	.secrel32	LLST86
	.byte	0x0
	.uleb128 0x47
	.ascii "page_header_update_slot\0"
	.byte	0x1
	.word	0x2e8
	.byte	0x1
	.long	LFB144
	.long	LFE144
	.secrel32	LLST87
	.long	0x3b5c
	.uleb128 0x44
	.ascii "kvm\0"
	.byte	0x1
	.word	0x2e7
	.long	0x146c
	.secrel32	LLST88
	.uleb128 0x44
	.ascii "pte\0"
	.byte	0x1
	.word	0x2e7
	.long	0x290
	.secrel32	LLST89
	.uleb128 0x44
	.ascii "gpa\0"
	.byte	0x1
	.word	0x2e7
	.long	0xa82
	.secrel32	LLST90
	.uleb128 0x2f
	.secrel32	LASF33
	.byte	0x1
	.word	0x2eb
	.long	0xe9
	.uleb128 0x2f
	.secrel32	LASF28
	.byte	0x1
	.word	0x2ec
	.long	0x1f28
	.uleb128 0x55
	.long	0x2526
	.secrel32	Ldebug_ranges0+0x238
	.byte	0x1
	.word	0x2eb
	.long	0x3b26
	.uleb128 0x31
	.long	0x254b
	.uleb128 0x31
	.long	0x253f
	.byte	0x0
	.uleb128 0x54
	.long	0x1efd
	.long	LBB546
	.long	LBE546
	.byte	0x1
	.word	0x2ec
	.long	0x3b40
	.uleb128 0x31
	.long	0x1f0f
	.byte	0x0
	.uleb128 0x4a
	.long	0x255e
	.long	LBB547
	.long	LBE547
	.byte	0x1
	.word	0x2ee
	.uleb128 0x31
	.long	0x257d
	.uleb128 0x31
	.long	0x2572
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
	.ascii "rmap_write_protect\0"
	.byte	0x1
	.word	0x1ab
	.byte	0x1
	.byte	0x1
	.long	0x3bf0
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x1aa
	.long	0xd83
	.uleb128 0x2a
	.ascii "gfn\0"
	.byte	0x1
	.word	0x1aa
	.long	0x165
	.uleb128 0x2b
	.ascii "kvm\0"
	.byte	0x1
	.word	0x1ac
	.long	0x146c
	.uleb128 0x2f
	.secrel32	LASF4
	.byte	0x1
	.word	0x1ad
	.long	0x32b
	.uleb128 0x2f
	.secrel32	LASF33
	.byte	0x1
	.word	0x1ae
	.long	0x2558
	.uleb128 0x2b
	.ascii "desc\0"
	.byte	0x1
	.word	0x1af
	.long	0x1d15
	.uleb128 0x2b
	.ascii "spte\0"
	.byte	0x1
	.word	0x1b0
	.long	0xaed
	.uleb128 0x36
	.long	0x3bdf
	.uleb128 0x31
	.long	0x25bb
	.uleb128 0x31
	.long	0x25af
	.byte	0x0
	.uleb128 0x38
	.secrel32	LASF32
	.long	0x56a3
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.2700
	.byte	0x0
	.uleb128 0x42
	.ascii "kvm_mmu_get_page\0"
	.byte	0x1
	.word	0x262
	.byte	0x1
	.long	0x1f28
	.long	LFB139
	.long	LFE139
	.secrel32	LLST91
	.long	0x3ec4
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x25c
	.long	0xd83
	.secrel32	LLST92
	.uleb128 0x44
	.ascii "gfn\0"
	.byte	0x1
	.word	0x25d
	.long	0xa8f
	.secrel32	LLST93
	.uleb128 0x43
	.secrel32	LASF37
	.byte	0x1
	.word	0x25e
	.long	0xa75
	.secrel32	LLST94
	.uleb128 0x3f
	.secrel32	LASF12
	.byte	0x1
	.word	0x25f
	.long	0xfd
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x43
	.secrel32	LASF14
	.byte	0x1
	.word	0x260
	.long	0xe9
	.secrel32	LLST95
	.uleb128 0x3f
	.secrel32	LASF15
	.byte	0x1
	.word	0x261
	.long	0xaed
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x59
	.ascii "role\0"
	.byte	0x1
	.word	0x263
	.long	0xb69
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x45
	.secrel32	LASF5
	.byte	0x1
	.word	0x264
	.long	0xfd
	.secrel32	LLST96
	.uleb128 0x2f
	.secrel32	LASF13
	.byte	0x1
	.word	0x265
	.long	0xfd
	.uleb128 0x2f
	.secrel32	LASF29
	.byte	0x1
	.word	0x266
	.long	0x2372
	.uleb128 0x45
	.secrel32	LASF4
	.byte	0x1
	.word	0x267
	.long	0x1f28
	.secrel32	LLST97
	.uleb128 0x45
	.secrel32	LASF30
	.byte	0x1
	.word	0x268
	.long	0x1fd
	.secrel32	LLST98
	.uleb128 0x52
	.long	LBB578
	.long	LBE578
	.long	0x3cea
	.uleb128 0x2f
	.secrel32	LASF31
	.byte	0x1
	.word	0x279
	.long	0x2378
	.byte	0x0
	.uleb128 0x55
	.long	0x25c8
	.secrel32	Ldebug_ranges0+0x250
	.byte	0x1
	.word	0x27b
	.long	0x3d96
	.uleb128 0x31
	.long	0x2602
	.uleb128 0x31
	.long	0x25f6
	.uleb128 0x31
	.long	0x25ea
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x278
	.uleb128 0x4f
	.long	0x260e
	.secrel32	LLST99
	.uleb128 0x4f
	.long	0x261a
	.secrel32	LLST100
	.uleb128 0x4f
	.long	0x2626
	.secrel32	LLST101
	.uleb128 0x53
	.secrel32	Ldebug_ranges0+0x2c0
	.long	0x3d66
	.uleb128 0x4f
	.long	0x2635
	.secrel32	LLST102
	.uleb128 0x4a
	.long	0x24ea
	.long	LBB587
	.long	LBE587
	.byte	0x1
	.word	0x20f
	.uleb128 0x31
	.long	0x250d
	.uleb128 0x31
	.long	0x2503
	.uleb128 0x46
	.long	LBB588
	.long	LBE588
	.uleb128 0x35
	.long	0x2517
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x4a
	.long	0x24ea
	.long	LBB589
	.long	LBE589
	.byte	0x1
	.word	0x21d
	.uleb128 0x31
	.long	0x250d
	.uleb128 0x31
	.long	0x2503
	.uleb128 0x46
	.long	LBB590
	.long	LBE590
	.uleb128 0x4f
	.long	0x2517
	.secrel32	LLST103
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x55
	.long	0x268f
	.secrel32	Ldebug_ranges0+0x2e0
	.byte	0x1
	.word	0x280
	.long	0x3e34
	.uleb128 0x31
	.long	0x26bc
	.uleb128 0x31
	.long	0x26b0
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x2f8
	.uleb128 0x35
	.long	0x26c8
	.uleb128 0x55
	.long	0x1f5a
	.secrel32	Ldebug_ranges0+0x328
	.byte	0x1
	.word	0x1f2
	.long	0x3df0
	.uleb128 0x31
	.long	0x1f77
	.uleb128 0x31
	.long	0x1f6c
	.uleb128 0x56
	.long	0x1e2b
	.secrel32	Ldebug_ranges0+0x340
	.byte	0x4
	.byte	0x4a
	.uleb128 0x31
	.long	0x1e56
	.uleb128 0x31
	.long	0x1e4a
	.uleb128 0x31
	.long	0x1e3f
	.byte	0x0
	.byte	0x0
	.uleb128 0x55
	.long	0x1f95
	.secrel32	Ldebug_ranges0+0x358
	.byte	0x1
	.word	0x1ed
	.long	0x3e06
	.uleb128 0x31
	.long	0x1fae
	.byte	0x0
	.uleb128 0x50
	.long	0x1f2e
	.secrel32	Ldebug_ranges0+0x370
	.byte	0x1
	.word	0x1f1
	.uleb128 0x31
	.long	0x1f40
	.uleb128 0x57
	.long	0x1e63
	.long	LBB614
	.long	LBE614
	.byte	0x4
	.byte	0xaf
	.uleb128 0x31
	.long	0x1e83
	.uleb128 0x31
	.long	0x1e77
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x54
	.long	0x24ea
	.long	LBB619
	.long	LBE619
	.byte	0x1
	.word	0x288
	.long	0x3e66
	.uleb128 0x31
	.long	0x250d
	.uleb128 0x31
	.long	0x2503
	.uleb128 0x46
	.long	LBB620
	.long	LBE620
	.uleb128 0x4f
	.long	0x2517
	.secrel32	LLST104
	.byte	0x0
	.byte	0x0
	.uleb128 0x50
	.long	0x3b5c
	.secrel32	Ldebug_ranges0+0x388
	.byte	0x1
	.word	0x28a
	.uleb128 0x31
	.long	0x3b85
	.uleb128 0x31
	.long	0x3b79
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x3a8
	.uleb128 0x35
	.long	0x3b91
	.uleb128 0x4f
	.long	0x3b9d
	.secrel32	LLST105
	.uleb128 0x4f
	.long	0x3ba9
	.secrel32	LLST106
	.uleb128 0x35
	.long	0x3bb5
	.uleb128 0x4f
	.long	0x3bc2
	.secrel32	LLST107
	.uleb128 0x4a
	.long	0x2595
	.long	LBB624
	.long	LBE624
	.byte	0x1
	.word	0x1b4
	.uleb128 0x31
	.long	0x25bb
	.uleb128 0x31
	.long	0x25af
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x47
	.ascii "mmu_alloc_roots\0"
	.byte	0x1
	.word	0x366
	.byte	0x1
	.long	LFB151
	.long	LFE151
	.secrel32	LLST108
	.long	0x3f44
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x365
	.long	0xd83
	.secrel32	LLST109
	.uleb128 0x48
	.ascii "i\0"
	.byte	0x1
	.word	0x367
	.long	0xe9
	.secrel32	LLST110
	.uleb128 0x48
	.ascii "root_gfn\0"
	.byte	0x1
	.word	0x368
	.long	0xa8f
	.secrel32	LLST111
	.uleb128 0x45
	.secrel32	LASF4
	.byte	0x1
	.word	0x369
	.long	0x1f28
	.secrel32	LLST112
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x3e0
	.uleb128 0x48
	.ascii "root\0"
	.byte	0x1
	.word	0x37b
	.long	0xa9c
	.secrel32	LLST113
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.ascii "paging64_init_context_common\0"
	.byte	0x1
	.word	0x43b
	.byte	0x1
	.long	0xe9
	.byte	0x1
	.long	0x3f9b
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x43a
	.long	0xd83
	.uleb128 0x2e
	.secrel32	LASF12
	.byte	0x1
	.word	0x43a
	.long	0xe9
	.uleb128 0x2f
	.secrel32	LASF35
	.byte	0x1
	.word	0x43c
	.long	0x276f
	.uleb128 0x30
	.uleb128 0x31
	.long	0x278a
	.byte	0x0
	.byte	0x0
	.uleb128 0x42
	.ascii "init_kvm_mmu\0"
	.byte	0x1
	.word	0x472
	.byte	0x1
	.long	0xe9
	.long	LFB185
	.long	LFE185
	.secrel32	LLST114
	.long	0x404f
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x471
	.long	0xd83
	.secrel32	LLST115
	.uleb128 0x55
	.long	0x2797
	.secrel32	Ldebug_ranges0+0x410
	.byte	0x1
	.word	0x479
	.long	0x3ff2
	.uleb128 0x31
	.long	0x27bc
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x428
	.uleb128 0x35
	.long	0x27c8
	.byte	0x0
	.byte	0x0
	.uleb128 0x55
	.long	0x2861
	.secrel32	Ldebug_ranges0+0x440
	.byte	0x1
	.word	0x482
	.long	0x4013
	.uleb128 0x31
	.long	0x2885
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x458
	.uleb128 0x35
	.long	0x2891
	.byte	0x0
	.byte	0x0
	.uleb128 0x4a
	.long	0x282f
	.long	LBB664
	.long	LBE664
	.byte	0x1
	.word	0x47f
	.uleb128 0x4a
	.long	0x3f44
	.long	LBB666
	.long	LBE666
	.byte	0x1
	.word	0x46e
	.uleb128 0x31
	.long	0x3f7b
	.uleb128 0x31
	.long	0x3f6f
	.uleb128 0x46
	.long	LBB667
	.long	LBE667
	.uleb128 0x35
	.long	0x3f87
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x58
	.byte	0x1
	.ascii "kvm_mmu_setup\0"
	.byte	0x1
	.word	0x55c
	.byte	0x1
	.long	0xe9
	.long	LFB196
	.long	LFE196
	.secrel32	LLST116
	.long	0x4088
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x55b
	.long	0xd83
	.secrel32	LLST117
	.byte	0x0
	.uleb128 0x47
	.ascii "paging_new_cr3\0"
	.byte	0x1
	.word	0x3d3
	.byte	0x1
	.long	LFB157
	.long	LFE157
	.secrel32	LLST118
	.long	0x40d3
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x3d2
	.long	0xd83
	.secrel32	LLST119
	.uleb128 0x4a
	.long	0x2c48
	.long	LBB670
	.long	LBE670
	.byte	0x1
	.word	0x3d9
	.uleb128 0x31
	.long	0x2c64
	.byte	0x0
	.byte	0x0
	.uleb128 0x58
	.byte	0x1
	.ascii "gpa_to_hpa\0"
	.byte	0x1
	.word	0x2fb
	.byte	0x1
	.long	0xa9c
	.long	LFB146
	.long	LFE146
	.secrel32	LLST120
	.long	0x4134
	.uleb128 0x3f
	.secrel32	LASF25
	.byte	0x1
	.word	0x2fa
	.long	0xd83
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x44
	.ascii "gpa\0"
	.byte	0x1
	.word	0x2fa
	.long	0xa82
	.secrel32	LLST121
	.uleb128 0x45
	.secrel32	LASF33
	.byte	0x1
	.word	0x2fc
	.long	0x2558
	.secrel32	LLST122
	.uleb128 0x2f
	.secrel32	LASF4
	.byte	0x1
	.word	0x2fd
	.long	0x32b
	.byte	0x0
	.uleb128 0x58
	.byte	0x1
	.ascii "gva_to_hpa\0"
	.byte	0x1
	.word	0x309
	.byte	0x1
	.long	0xa9c
	.long	LFB147
	.long	LFE147
	.secrel32	LLST123
	.long	0x4189
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x308
	.long	0xd83
	.secrel32	LLST124
	.uleb128 0x41
	.ascii "gva\0"
	.byte	0x1
	.word	0x308
	.long	0xa75
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x48
	.ascii "gpa\0"
	.byte	0x1
	.word	0x30a
	.long	0xa82
	.secrel32	LLST125
	.byte	0x0
	.uleb128 0x58
	.byte	0x1
	.ascii "safe_gpa_to_hpa\0"
	.byte	0x1
	.word	0x2f4
	.byte	0x1
	.long	0xa9c
	.long	LFB145
	.long	LFE145
	.secrel32	LLST126
	.long	0x41e3
	.uleb128 0x3f
	.secrel32	LASF25
	.byte	0x1
	.word	0x2f3
	.long	0xd83
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x44
	.ascii "gpa\0"
	.byte	0x1
	.word	0x2f3
	.long	0xa82
	.secrel32	LLST127
	.uleb128 0x48
	.ascii "hpa\0"
	.byte	0x1
	.word	0x2f5
	.long	0xa9c
	.secrel32	LLST128
	.byte	0x0
	.uleb128 0x5a
	.ascii "paging64_walk_addr\0"
	.byte	0x5
	.byte	0x4b
	.byte	0x1
	.long	0xe9
	.long	LFB163
	.long	LFE163
	.secrel32	LLST129
	.long	0x42f4
	.uleb128 0x5b
	.secrel32	LASF40
	.byte	0x5
	.byte	0x48
	.long	0x2a7f
	.secrel32	LLST130
	.uleb128 0x5b
	.secrel32	LASF25
	.byte	0x5
	.byte	0x49
	.long	0xd83
	.secrel32	LLST131
	.uleb128 0x5b
	.secrel32	LASF27
	.byte	0x5
	.byte	0x49
	.long	0xa75
	.secrel32	LLST132
	.uleb128 0x5c
	.secrel32	LASF42
	.byte	0x5
	.byte	0x4a
	.long	0xe9
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5c
	.secrel32	LASF43
	.byte	0x5
	.byte	0x4a
	.long	0xe9
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x5c
	.secrel32	LASF44
	.byte	0x5
	.byte	0x4a
	.long	0xe9
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x5d
	.ascii "hpa\0"
	.byte	0x5
	.byte	0x4c
	.long	0xa9c
	.secrel32	LLST133
	.uleb128 0x5e
	.secrel32	LASF33
	.byte	0x5
	.byte	0x4d
	.long	0x2558
	.uleb128 0x5d
	.ascii "ptep\0"
	.byte	0x5
	.byte	0x4e
	.long	0xaed
	.secrel32	LLST134
	.uleb128 0x5f
	.ascii "root\0"
	.byte	0x5
	.byte	0x4f
	.long	0x165
	.byte	0x7
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.byte	0x74
	.sleb128 16
	.byte	0x93
	.uleb128 0x4
	.uleb128 0x60
	.secrel32	LASF21
	.byte	0x5
	.byte	0x50
	.long	0xa8f
	.secrel32	LLST135
	.uleb128 0x61
	.secrel32	LASF45
	.byte	0x5
	.byte	0xa7
	.long	L311
	.uleb128 0x61
	.secrel32	LASF46
	.byte	0x5
	.byte	0xab
	.long	L315
	.uleb128 0x62
	.ascii "err\0"
	.byte	0x5
	.byte	0xae
	.long	L326
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x470
	.uleb128 0x5e
	.secrel32	LASF5
	.byte	0x5
	.byte	0x6d
	.long	0xe9
	.uleb128 0x60
	.secrel32	LASF39
	.byte	0x5
	.byte	0x6e
	.long	0xa9c
	.secrel32	LLST136
	.byte	0x0
	.byte	0x0
	.uleb128 0x42
	.ascii "paging64_gva_to_gpa\0"
	.byte	0x5
	.word	0x1c6
	.byte	0x1
	.long	0xa82
	.long	LFB171
	.long	LFE171
	.secrel32	LLST137
	.long	0x4386
	.uleb128 0x3f
	.secrel32	LASF25
	.byte	0x5
	.word	0x1c5
	.long	0xd83
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x44
	.ascii "vaddr\0"
	.byte	0x5
	.word	0x1c5
	.long	0xa75
	.secrel32	LLST138
	.uleb128 0x63
	.secrel32	LASF40
	.byte	0x5
	.word	0x1c7
	.long	0x1d1b
	.byte	0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x48
	.ascii "gpa\0"
	.byte	0x5
	.word	0x1c8
	.long	0xa82
	.secrel32	LLST139
	.uleb128 0x48
	.ascii "r\0"
	.byte	0x5
	.word	0x1c9
	.long	0xe9
	.secrel32	LLST140
	.uleb128 0x4a
	.long	0x2ae8
	.long	LBB675
	.long	LBE675
	.byte	0x5
	.word	0x1d2
	.uleb128 0x31
	.long	0x2b09
	.byte	0x0
	.byte	0x0
	.uleb128 0x5a
	.ascii "paging32_walk_addr\0"
	.byte	0x5
	.byte	0x4b
	.byte	0x1
	.long	0xe9
	.long	LFB172
	.long	LFE172
	.secrel32	LLST141
	.long	0x448f
	.uleb128 0x5b
	.secrel32	LASF40
	.byte	0x5
	.byte	0x48
	.long	0x2ac3
	.secrel32	LLST142
	.uleb128 0x5b
	.secrel32	LASF25
	.byte	0x5
	.byte	0x49
	.long	0xd83
	.secrel32	LLST143
	.uleb128 0x5b
	.secrel32	LASF27
	.byte	0x5
	.byte	0x49
	.long	0xa75
	.secrel32	LLST144
	.uleb128 0x5c
	.secrel32	LASF42
	.byte	0x5
	.byte	0x4a
	.long	0xe9
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5c
	.secrel32	LASF43
	.byte	0x5
	.byte	0x4a
	.long	0xe9
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x5c
	.secrel32	LASF44
	.byte	0x5
	.byte	0x4a
	.long	0xe9
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x5d
	.ascii "hpa\0"
	.byte	0x5
	.byte	0x4c
	.long	0xa9c
	.secrel32	LLST145
	.uleb128 0x5e
	.secrel32	LASF33
	.byte	0x5
	.byte	0x4d
	.long	0x2558
	.uleb128 0x5d
	.ascii "ptep\0"
	.byte	0x5
	.byte	0x4e
	.long	0x1e25
	.secrel32	LLST146
	.uleb128 0x3c
	.ascii "root\0"
	.byte	0x5
	.byte	0x4f
	.long	0x15a
	.uleb128 0x60
	.secrel32	LASF21
	.byte	0x5
	.byte	0x50
	.long	0xa8f
	.secrel32	LLST147
	.uleb128 0x61
	.secrel32	LASF45
	.byte	0x5
	.byte	0xa7
	.long	L346
	.uleb128 0x61
	.secrel32	LASF46
	.byte	0x5
	.byte	0xab
	.long	L348
	.uleb128 0x62
	.ascii "err\0"
	.byte	0x5
	.byte	0xae
	.long	L359
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x490
	.uleb128 0x5e
	.secrel32	LASF5
	.byte	0x5
	.byte	0x6d
	.long	0xe9
	.uleb128 0x60
	.secrel32	LASF39
	.byte	0x5
	.byte	0x6e
	.long	0xa9c
	.secrel32	LLST148
	.byte	0x0
	.byte	0x0
	.uleb128 0x42
	.ascii "paging32_gva_to_gpa\0"
	.byte	0x5
	.word	0x1c6
	.byte	0x1
	.long	0xa82
	.long	LFB180
	.long	LFE180
	.secrel32	LLST149
	.long	0x4521
	.uleb128 0x3f
	.secrel32	LASF25
	.byte	0x5
	.word	0x1c5
	.long	0xd83
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x44
	.ascii "vaddr\0"
	.byte	0x5
	.word	0x1c5
	.long	0xa75
	.secrel32	LLST150
	.uleb128 0x63
	.secrel32	LASF40
	.byte	0x5
	.word	0x1c7
	.long	0x1da8
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x48
	.ascii "gpa\0"
	.byte	0x5
	.word	0x1c8
	.long	0xa82
	.secrel32	LLST151
	.uleb128 0x48
	.ascii "r\0"
	.byte	0x5
	.word	0x1c9
	.long	0xe9
	.secrel32	LLST152
	.uleb128 0x4a
	.long	0x2b37
	.long	LBB681
	.long	LBE681
	.byte	0x5
	.word	0x1d2
	.uleb128 0x31
	.long	0x2b58
	.byte	0x0
	.byte	0x0
	.uleb128 0x5a
	.ascii "mmu_topup_memory_caches\0"
	.byte	0x1
	.byte	0xf0
	.byte	0x1
	.long	0xe9
	.long	LFB120
	.long	LFE120
	.secrel32	LLST153
	.long	0x45d1
	.uleb128 0x5b
	.secrel32	LASF25
	.byte	0x1
	.byte	0xef
	.long	0xd83
	.secrel32	LLST154
	.uleb128 0x5d
	.ascii "r\0"
	.byte	0x1
	.byte	0xf1
	.long	0xe9
	.secrel32	LLST155
	.uleb128 0x62
	.ascii "out\0"
	.byte	0x1
	.byte	0xfb
	.long	L378
	.uleb128 0x64
	.long	0x2b64
	.secrel32	Ldebug_ranges0+0x4b8
	.byte	0x1
	.byte	0xf5
	.long	0x45a6
	.uleb128 0x31
	.long	0x2ba4
	.uleb128 0x31
	.long	0x2b95
	.uleb128 0x31
	.long	0x2b88
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x4d0
	.uleb128 0x4f
	.long	0x2baf
	.secrel32	LLST156
	.byte	0x0
	.byte	0x0
	.uleb128 0x56
	.long	0x2b64
	.secrel32	Ldebug_ranges0+0x4f8
	.byte	0x1
	.byte	0xf9
	.uleb128 0x31
	.long	0x2ba4
	.uleb128 0x31
	.long	0x2b95
	.uleb128 0x31
	.long	0x2b88
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x510
	.uleb128 0x4f
	.long	0x2baf
	.secrel32	LLST157
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.ascii "paging64_fetch\0"
	.byte	0x5
	.byte	0xe3
	.byte	0x1
	.long	0xaed
	.byte	0x1
	.long	0x469c
	.uleb128 0x3b
	.secrel32	LASF25
	.byte	0x5
	.byte	0xe1
	.long	0xd83
	.uleb128 0x3b
	.secrel32	LASF27
	.byte	0x5
	.byte	0xe1
	.long	0xa75
	.uleb128 0x3b
	.secrel32	LASF40
	.byte	0x5
	.byte	0xe2
	.long	0x2a7f
	.uleb128 0x5e
	.secrel32	LASF47
	.byte	0x5
	.byte	0xe4
	.long	0xa9c
	.uleb128 0x5e
	.secrel32	LASF12
	.byte	0x5
	.byte	0xe5
	.long	0xe9
	.uleb128 0x5e
	.secrel32	LASF48
	.byte	0x5
	.byte	0xe6
	.long	0xaed
	.uleb128 0x5e
	.secrel32	LASF49
	.byte	0x5
	.byte	0xe7
	.long	0xaed
	.uleb128 0x36
	.long	0x4694
	.uleb128 0x5e
	.secrel32	LASF5
	.byte	0x5
	.byte	0xf5
	.long	0x15a
	.uleb128 0x5e
	.secrel32	LASF41
	.byte	0x5
	.byte	0xf6
	.long	0xaed
	.uleb128 0x5e
	.secrel32	LASF24
	.byte	0x5
	.byte	0xf7
	.long	0x1f28
	.uleb128 0x5e
	.secrel32	LASF36
	.byte	0x5
	.byte	0xf8
	.long	0x165
	.uleb128 0x5e
	.secrel32	LASF14
	.byte	0x5
	.byte	0xf9
	.long	0xe9
	.uleb128 0x5e
	.secrel32	LASF21
	.byte	0x5
	.byte	0xfa
	.long	0xa8f
	.uleb128 0x36
	.long	0x468c
	.uleb128 0x31
	.long	0x23a3
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x31
	.long	0x29f0
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x31
	.long	0x23a3
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.ascii "paging64_set_pde\0"
	.byte	0x5
	.byte	0xd0
	.byte	0x1
	.byte	0x1
	.long	0x4752
	.uleb128 0x3b
	.secrel32	LASF25
	.byte	0x5
	.byte	0xce
	.long	0xd83
	.uleb128 0x3b
	.secrel32	LASF50
	.byte	0x5
	.byte	0xce
	.long	0x165
	.uleb128 0x3b
	.secrel32	LASF36
	.byte	0x5
	.byte	0xcf
	.long	0xaed
	.uleb128 0x3b
	.secrel32	LASF38
	.byte	0x5
	.byte	0xcf
	.long	0x165
	.uleb128 0x28
	.ascii "gfn\0"
	.byte	0x5
	.byte	0xcf
	.long	0xa8f
	.uleb128 0x5e
	.secrel32	LASF37
	.byte	0x5
	.byte	0xd1
	.long	0xa82
	.uleb128 0x30
	.uleb128 0x31
	.long	0x2984
	.uleb128 0x31
	.long	0x2978
	.uleb128 0x31
	.long	0x296a
	.uleb128 0x31
	.long	0x295e
	.uleb128 0x31
	.long	0x2952
	.uleb128 0x31
	.long	0x2946
	.uleb128 0x30
	.uleb128 0x35
	.long	0x2990
	.uleb128 0x36
	.long	0x472f
	.uleb128 0x35
	.long	0x29a1
	.uleb128 0x30
	.uleb128 0x31
	.long	0x2921
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.long	0x4748
	.uleb128 0x31
	.long	0x28e9
	.uleb128 0x30
	.uleb128 0x31
	.long	0x1f0f
	.uleb128 0x30
	.uleb128 0x35
	.long	0x1f1b
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x31
	.long	0x28b9
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.ascii "paging64_set_pte\0"
	.byte	0x5
	.byte	0xc6
	.byte	0x1
	.byte	0x1
	.long	0x47fd
	.uleb128 0x3b
	.secrel32	LASF25
	.byte	0x5
	.byte	0xc4
	.long	0xd83
	.uleb128 0x3b
	.secrel32	LASF51
	.byte	0x5
	.byte	0xc4
	.long	0x165
	.uleb128 0x3b
	.secrel32	LASF36
	.byte	0x5
	.byte	0xc5
	.long	0xaed
	.uleb128 0x3b
	.secrel32	LASF38
	.byte	0x5
	.byte	0xc5
	.long	0x165
	.uleb128 0x28
	.ascii "gfn\0"
	.byte	0x5
	.byte	0xc5
	.long	0xa8f
	.uleb128 0x30
	.uleb128 0x31
	.long	0x2984
	.uleb128 0x31
	.long	0x2978
	.uleb128 0x31
	.long	0x296a
	.uleb128 0x31
	.long	0x295e
	.uleb128 0x31
	.long	0x2952
	.uleb128 0x31
	.long	0x2946
	.uleb128 0x30
	.uleb128 0x35
	.long	0x2990
	.uleb128 0x36
	.long	0x47da
	.uleb128 0x35
	.long	0x29a1
	.uleb128 0x30
	.uleb128 0x31
	.long	0x2921
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.long	0x47f3
	.uleb128 0x31
	.long	0x28e9
	.uleb128 0x30
	.uleb128 0x31
	.long	0x1f0f
	.uleb128 0x30
	.uleb128 0x35
	.long	0x1f1b
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x31
	.long	0x28b9
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.ascii "paging64_fix_write_pf\0"
	.byte	0x5
	.word	0x135
	.byte	0x1
	.long	0xe9
	.byte	0x1
	.long	0x48d8
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x5
	.word	0x12f
	.long	0xd83
	.uleb128 0x2e
	.secrel32	LASF41
	.byte	0x5
	.word	0x130
	.long	0xaed
	.uleb128 0x2e
	.secrel32	LASF40
	.byte	0x5
	.word	0x131
	.long	0x2a7f
	.uleb128 0x2e
	.secrel32	LASF27
	.byte	0x5
	.word	0x132
	.long	0xa75
	.uleb128 0x2a
	.ascii "user\0"
	.byte	0x5
	.word	0x133
	.long	0xe9
	.uleb128 0x2e
	.secrel32	LASF52
	.byte	0x5
	.word	0x134
	.long	0x576
	.uleb128 0x2f
	.secrel32	LASF49
	.byte	0x5
	.word	0x136
	.long	0xaed
	.uleb128 0x2f
	.secrel32	LASF53
	.byte	0x5
	.word	0x137
	.long	0xe9
	.uleb128 0x2b
	.ascii "gfn\0"
	.byte	0x5
	.word	0x138
	.long	0xa8f
	.uleb128 0x2f
	.secrel32	LASF4
	.byte	0x5
	.word	0x139
	.long	0x1f28
	.uleb128 0x36
	.long	0x48a5
	.uleb128 0x31
	.long	0x2921
	.byte	0x0
	.uleb128 0x36
	.long	0x48b0
	.uleb128 0x31
	.long	0x2a35
	.byte	0x0
	.uleb128 0x36
	.long	0x48bb
	.uleb128 0x31
	.long	0x23a3
	.byte	0x0
	.uleb128 0x36
	.long	0x48cb
	.uleb128 0x31
	.long	0x2a73
	.uleb128 0x31
	.long	0x2a68
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x31
	.long	0x2a73
	.uleb128 0x31
	.long	0x2a68
	.byte	0x0
	.byte	0x0
	.uleb128 0x42
	.ascii "paging64_page_fault\0"
	.byte	0x5
	.word	0x186
	.byte	0x1
	.long	0xe9
	.long	LFB170
	.long	LFE170
	.secrel32	LLST158
	.long	0x4c85
	.uleb128 0x3f
	.secrel32	LASF25
	.byte	0x5
	.word	0x184
	.long	0xd83
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x3f
	.secrel32	LASF27
	.byte	0x5
	.word	0x184
	.long	0xa75
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x43
	.secrel32	LASF6
	.byte	0x5
	.word	0x185
	.long	0x15a
	.secrel32	LLST159
	.uleb128 0x45
	.secrel32	LASF42
	.byte	0x5
	.word	0x187
	.long	0xe9
	.secrel32	LLST160
	.uleb128 0x45
	.secrel32	LASF43
	.byte	0x5
	.word	0x188
	.long	0xe9
	.secrel32	LLST161
	.uleb128 0x2f
	.secrel32	LASF44
	.byte	0x5
	.word	0x189
	.long	0xe9
	.uleb128 0x63
	.secrel32	LASF40
	.byte	0x5
	.word	0x18a
	.long	0x1d1b
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x45
	.secrel32	LASF36
	.byte	0x5
	.word	0x18b
	.long	0xaed
	.secrel32	LLST162
	.uleb128 0x2b
	.ascii "fixed\0"
	.byte	0x5
	.word	0x18c
	.long	0xe9
	.uleb128 0x45
	.secrel32	LASF52
	.byte	0x5
	.word	0x18d
	.long	0xe9
	.secrel32	LLST163
	.uleb128 0x48
	.ascii "r\0"
	.byte	0x5
	.word	0x18e
	.long	0xe9
	.secrel32	LLST164
	.uleb128 0x55
	.long	0x45d1
	.secrel32	Ldebug_ranges0+0x538
	.byte	0x5
	.word	0x1a7
	.long	0x4b87
	.uleb128 0x31
	.long	0x4603
	.uleb128 0x31
	.long	0x45f8
	.uleb128 0x31
	.long	0x45ed
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x578
	.uleb128 0x4f
	.long	0x460e
	.secrel32	LLST165
	.uleb128 0x4f
	.long	0x4619
	.secrel32	LLST166
	.uleb128 0x35
	.long	0x4624
	.uleb128 0x4f
	.long	0x462f
	.secrel32	LLST167
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x5c8
	.uleb128 0x35
	.long	0x463f
	.uleb128 0x35
	.long	0x464a
	.uleb128 0x4f
	.long	0x4655
	.secrel32	LLST168
	.uleb128 0x35
	.long	0x4660
	.uleb128 0x4f
	.long	0x466b
	.secrel32	LLST169
	.uleb128 0x4f
	.long	0x4676
	.secrel32	LLST170
	.uleb128 0x55
	.long	0x4752
	.secrel32	Ldebug_ranges0+0x610
	.byte	0x5
	.word	0x10e
	.long	0x4acb
	.uleb128 0x31
	.long	0x4798
	.uleb128 0x65
	.long	0x478d
	.secrel32	LLST171
	.uleb128 0x31
	.long	0x4782
	.uleb128 0x31
	.long	0x4777
	.uleb128 0x31
	.long	0x476c
	.uleb128 0x56
	.long	0x292d
	.secrel32	Ldebug_ranges0+0x640
	.byte	0x5
	.byte	0xca
	.uleb128 0x31
	.long	0x2984
	.uleb128 0x31
	.long	0x2978
	.uleb128 0x31
	.long	0x296a
	.uleb128 0x31
	.long	0x295e
	.uleb128 0x31
	.long	0x2952
	.uleb128 0x31
	.long	0x2946
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x678
	.uleb128 0x4b
	.long	0x2990
	.byte	0x7
	.byte	0x74
	.sleb128 28
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.uleb128 0x54
	.long	0x28c6
	.long	LBB777
	.long	LBE777
	.byte	0x1
	.word	0x3f4
	.long	0x4ab5
	.uleb128 0x31
	.long	0x28e9
	.uleb128 0x4a
	.long	0x1efd
	.long	LBB779
	.long	LBE779
	.byte	0x1
	.word	0x3df
	.uleb128 0x31
	.long	0x1f0f
	.byte	0x0
	.byte	0x0
	.uleb128 0x46
	.long	LBB780
	.long	LBE780
	.uleb128 0x4f
	.long	0x29a1
	.secrel32	LLST172
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x50
	.long	0x469c
	.secrel32	Ldebug_ranges0+0x6b8
	.byte	0x5
	.word	0x109
	.uleb128 0x31
	.long	0x46e2
	.uleb128 0x65
	.long	0x46d7
	.secrel32	LLST173
	.uleb128 0x31
	.long	0x46cc
	.uleb128 0x31
	.long	0x46c1
	.uleb128 0x31
	.long	0x46b6
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x6e8
	.uleb128 0x4f
	.long	0x46ed
	.secrel32	LLST174
	.uleb128 0x56
	.long	0x292d
	.secrel32	Ldebug_ranges0+0x718
	.byte	0x5
	.byte	0xda
	.uleb128 0x31
	.long	0x2984
	.uleb128 0x31
	.long	0x2978
	.uleb128 0x31
	.long	0x296a
	.uleb128 0x31
	.long	0x295e
	.uleb128 0x31
	.long	0x2952
	.uleb128 0x31
	.long	0x2946
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x750
	.uleb128 0x4b
	.long	0x2990
	.byte	0x7
	.byte	0x74
	.sleb128 24
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.uleb128 0x54
	.long	0x28c6
	.long	LBB802
	.long	LBE802
	.byte	0x1
	.word	0x3f4
	.long	0x4b6d
	.uleb128 0x31
	.long	0x28e9
	.uleb128 0x4a
	.long	0x1efd
	.long	LBB804
	.long	LBE804
	.byte	0x1
	.word	0x3df
	.uleb128 0x31
	.long	0x1f0f
	.byte	0x0
	.byte	0x0
	.uleb128 0x46
	.long	LBB805
	.long	LBE805
	.uleb128 0x4f
	.long	0x29a1
	.secrel32	LLST175
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x54
	.long	0x2be9
	.long	LBB826
	.long	LBE826
	.byte	0x5
	.word	0x1a2
	.long	0x4bab
	.uleb128 0x31
	.long	0x2c0f
	.uleb128 0x31
	.long	0x2c03
	.uleb128 0x31
	.long	0x2bf7
	.byte	0x0
	.uleb128 0x54
	.long	0x2ae8
	.long	LBB828
	.long	LBE828
	.byte	0x5
	.word	0x1a3
	.long	0x4bc5
	.uleb128 0x31
	.long	0x2b09
	.byte	0x0
	.uleb128 0x55
	.long	0x2c21
	.secrel32	Ldebug_ranges0+0x790
	.byte	0x5
	.word	0x1b2
	.long	0x4bdb
	.uleb128 0x31
	.long	0x2c3b
	.byte	0x0
	.uleb128 0x54
	.long	0x2ae8
	.long	LBB834
	.long	LBE834
	.byte	0x5
	.word	0x1b7
	.long	0x4bf5
	.uleb128 0x31
	.long	0x2b09
	.byte	0x0
	.uleb128 0x50
	.long	0x47fd
	.secrel32	Ldebug_ranges0+0x7a8
	.byte	0x5
	.word	0x1af
	.uleb128 0x31
	.long	0x485e
	.uleb128 0x31
	.long	0x4851
	.uleb128 0x31
	.long	0x4845
	.uleb128 0x31
	.long	0x4839
	.uleb128 0x31
	.long	0x482d
	.uleb128 0x31
	.long	0x4821
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x7d0
	.uleb128 0x4f
	.long	0x486a
	.secrel32	LLST176
	.uleb128 0x4f
	.long	0x4876
	.secrel32	LLST177
	.uleb128 0x4f
	.long	0x4882
	.secrel32	LLST178
	.uleb128 0x4f
	.long	0x488e
	.secrel32	LLST179
	.uleb128 0x54
	.long	0x2a41
	.long	LBB841
	.long	LBE841
	.byte	0x5
	.word	0x168
	.long	0x4c67
	.uleb128 0x31
	.long	0x2a73
	.uleb128 0x31
	.long	0x2a68
	.byte	0x0
	.uleb128 0x4a
	.long	0x2a41
	.long	LBB843
	.long	LBE843
	.byte	0x5
	.word	0x16f
	.uleb128 0x31
	.long	0x2a73
	.uleb128 0x31
	.long	0x2a68
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.ascii "paging32_fetch\0"
	.byte	0x5
	.byte	0xe3
	.byte	0x1
	.long	0xaed
	.byte	0x1
	.long	0x4d50
	.uleb128 0x3b
	.secrel32	LASF25
	.byte	0x5
	.byte	0xe1
	.long	0xd83
	.uleb128 0x3b
	.secrel32	LASF27
	.byte	0x5
	.byte	0xe1
	.long	0xa75
	.uleb128 0x3b
	.secrel32	LASF40
	.byte	0x5
	.byte	0xe2
	.long	0x2ac3
	.uleb128 0x5e
	.secrel32	LASF47
	.byte	0x5
	.byte	0xe4
	.long	0xa9c
	.uleb128 0x5e
	.secrel32	LASF12
	.byte	0x5
	.byte	0xe5
	.long	0xe9
	.uleb128 0x5e
	.secrel32	LASF48
	.byte	0x5
	.byte	0xe6
	.long	0xaed
	.uleb128 0x5e
	.secrel32	LASF49
	.byte	0x5
	.byte	0xe7
	.long	0x1e25
	.uleb128 0x36
	.long	0x4d48
	.uleb128 0x5e
	.secrel32	LASF5
	.byte	0x5
	.byte	0xf5
	.long	0x15a
	.uleb128 0x5e
	.secrel32	LASF41
	.byte	0x5
	.byte	0xf6
	.long	0xaed
	.uleb128 0x5e
	.secrel32	LASF24
	.byte	0x5
	.byte	0xf7
	.long	0x1f28
	.uleb128 0x5e
	.secrel32	LASF36
	.byte	0x5
	.byte	0xf8
	.long	0x165
	.uleb128 0x5e
	.secrel32	LASF14
	.byte	0x5
	.byte	0xf9
	.long	0xe9
	.uleb128 0x5e
	.secrel32	LASF21
	.byte	0x5
	.byte	0xfa
	.long	0xa8f
	.uleb128 0x36
	.long	0x4d40
	.uleb128 0x31
	.long	0x23a3
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x31
	.long	0x29f0
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x31
	.long	0x23a3
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.ascii "paging32_set_pde\0"
	.byte	0x5
	.byte	0xd0
	.byte	0x1
	.byte	0x1
	.long	0x4e07
	.uleb128 0x3b
	.secrel32	LASF25
	.byte	0x5
	.byte	0xce
	.long	0xd83
	.uleb128 0x3b
	.secrel32	LASF50
	.byte	0x5
	.byte	0xce
	.long	0x165
	.uleb128 0x3b
	.secrel32	LASF36
	.byte	0x5
	.byte	0xcf
	.long	0xaed
	.uleb128 0x3b
	.secrel32	LASF38
	.byte	0x5
	.byte	0xcf
	.long	0x165
	.uleb128 0x28
	.ascii "gfn\0"
	.byte	0x5
	.byte	0xcf
	.long	0xa8f
	.uleb128 0x5e
	.secrel32	LASF37
	.byte	0x5
	.byte	0xd1
	.long	0xa82
	.uleb128 0x37
	.uleb128 0x30
	.uleb128 0x31
	.long	0x2984
	.uleb128 0x31
	.long	0x2978
	.uleb128 0x31
	.long	0x296a
	.uleb128 0x31
	.long	0x295e
	.uleb128 0x31
	.long	0x2952
	.uleb128 0x31
	.long	0x2946
	.uleb128 0x30
	.uleb128 0x35
	.long	0x2990
	.uleb128 0x36
	.long	0x4de4
	.uleb128 0x35
	.long	0x29a1
	.uleb128 0x30
	.uleb128 0x31
	.long	0x2921
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.long	0x4dfd
	.uleb128 0x31
	.long	0x28e9
	.uleb128 0x30
	.uleb128 0x31
	.long	0x1f0f
	.uleb128 0x30
	.uleb128 0x35
	.long	0x1f1b
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x31
	.long	0x28b9
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.ascii "paging32_set_pte\0"
	.byte	0x5
	.byte	0xc6
	.byte	0x1
	.byte	0x1
	.long	0x4eb2
	.uleb128 0x3b
	.secrel32	LASF25
	.byte	0x5
	.byte	0xc4
	.long	0xd83
	.uleb128 0x3b
	.secrel32	LASF51
	.byte	0x5
	.byte	0xc4
	.long	0x165
	.uleb128 0x3b
	.secrel32	LASF36
	.byte	0x5
	.byte	0xc5
	.long	0xaed
	.uleb128 0x3b
	.secrel32	LASF38
	.byte	0x5
	.byte	0xc5
	.long	0x165
	.uleb128 0x28
	.ascii "gfn\0"
	.byte	0x5
	.byte	0xc5
	.long	0xa8f
	.uleb128 0x30
	.uleb128 0x31
	.long	0x2984
	.uleb128 0x31
	.long	0x2978
	.uleb128 0x31
	.long	0x296a
	.uleb128 0x31
	.long	0x295e
	.uleb128 0x31
	.long	0x2952
	.uleb128 0x31
	.long	0x2946
	.uleb128 0x30
	.uleb128 0x35
	.long	0x2990
	.uleb128 0x36
	.long	0x4e8f
	.uleb128 0x35
	.long	0x29a1
	.uleb128 0x30
	.uleb128 0x31
	.long	0x2921
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.long	0x4ea8
	.uleb128 0x31
	.long	0x28e9
	.uleb128 0x30
	.uleb128 0x31
	.long	0x1f0f
	.uleb128 0x30
	.uleb128 0x35
	.long	0x1f1b
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x31
	.long	0x28b9
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.ascii "paging32_fix_write_pf\0"
	.byte	0x5
	.word	0x135
	.byte	0x1
	.long	0xe9
	.byte	0x1
	.long	0x4f8d
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x5
	.word	0x12f
	.long	0xd83
	.uleb128 0x2e
	.secrel32	LASF41
	.byte	0x5
	.word	0x130
	.long	0xaed
	.uleb128 0x2e
	.secrel32	LASF40
	.byte	0x5
	.word	0x131
	.long	0x2ac3
	.uleb128 0x2e
	.secrel32	LASF27
	.byte	0x5
	.word	0x132
	.long	0xa75
	.uleb128 0x2a
	.ascii "user\0"
	.byte	0x5
	.word	0x133
	.long	0xe9
	.uleb128 0x2e
	.secrel32	LASF52
	.byte	0x5
	.word	0x134
	.long	0x576
	.uleb128 0x2f
	.secrel32	LASF49
	.byte	0x5
	.word	0x136
	.long	0x1e25
	.uleb128 0x2f
	.secrel32	LASF53
	.byte	0x5
	.word	0x137
	.long	0xe9
	.uleb128 0x2b
	.ascii "gfn\0"
	.byte	0x5
	.word	0x138
	.long	0xa8f
	.uleb128 0x2f
	.secrel32	LASF4
	.byte	0x5
	.word	0x139
	.long	0x1f28
	.uleb128 0x36
	.long	0x4f5a
	.uleb128 0x31
	.long	0x2921
	.byte	0x0
	.uleb128 0x36
	.long	0x4f65
	.uleb128 0x31
	.long	0x2a35
	.byte	0x0
	.uleb128 0x36
	.long	0x4f70
	.uleb128 0x31
	.long	0x23a3
	.byte	0x0
	.uleb128 0x36
	.long	0x4f80
	.uleb128 0x31
	.long	0x2ab7
	.uleb128 0x31
	.long	0x2aac
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x31
	.long	0x2ab7
	.uleb128 0x31
	.long	0x2aac
	.byte	0x0
	.byte	0x0
	.uleb128 0x42
	.ascii "paging32_page_fault\0"
	.byte	0x5
	.word	0x186
	.byte	0x1
	.long	0xe9
	.long	LFB179
	.long	LFE179
	.secrel32	LLST180
	.long	0x5332
	.uleb128 0x3f
	.secrel32	LASF25
	.byte	0x5
	.word	0x184
	.long	0xd83
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x3f
	.secrel32	LASF27
	.byte	0x5
	.word	0x184
	.long	0xa75
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x43
	.secrel32	LASF6
	.byte	0x5
	.word	0x185
	.long	0x15a
	.secrel32	LLST181
	.uleb128 0x45
	.secrel32	LASF42
	.byte	0x5
	.word	0x187
	.long	0xe9
	.secrel32	LLST182
	.uleb128 0x45
	.secrel32	LASF43
	.byte	0x5
	.word	0x188
	.long	0xe9
	.secrel32	LLST183
	.uleb128 0x2f
	.secrel32	LASF44
	.byte	0x5
	.word	0x189
	.long	0xe9
	.uleb128 0x63
	.secrel32	LASF40
	.byte	0x5
	.word	0x18a
	.long	0x1da8
	.byte	0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x45
	.secrel32	LASF36
	.byte	0x5
	.word	0x18b
	.long	0xaed
	.secrel32	LLST184
	.uleb128 0x2b
	.ascii "fixed\0"
	.byte	0x5
	.word	0x18c
	.long	0xe9
	.uleb128 0x45
	.secrel32	LASF52
	.byte	0x5
	.word	0x18d
	.long	0xe9
	.secrel32	LLST185
	.uleb128 0x48
	.ascii "r\0"
	.byte	0x5
	.word	0x18e
	.long	0xe9
	.secrel32	LLST186
	.uleb128 0x55
	.long	0x4c85
	.secrel32	Ldebug_ranges0+0x800
	.byte	0x5
	.word	0x1a7
	.long	0x5234
	.uleb128 0x31
	.long	0x4cb7
	.uleb128 0x31
	.long	0x4cac
	.uleb128 0x31
	.long	0x4ca1
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x840
	.uleb128 0x4f
	.long	0x4cc2
	.secrel32	LLST187
	.uleb128 0x4f
	.long	0x4ccd
	.secrel32	LLST188
	.uleb128 0x35
	.long	0x4cd8
	.uleb128 0x4f
	.long	0x4ce3
	.secrel32	LLST189
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x890
	.uleb128 0x35
	.long	0x4cf3
	.uleb128 0x35
	.long	0x4cfe
	.uleb128 0x4f
	.long	0x4d09
	.secrel32	LLST190
	.uleb128 0x35
	.long	0x4d14
	.uleb128 0x4f
	.long	0x4d1f
	.secrel32	LLST191
	.uleb128 0x4f
	.long	0x4d2a
	.secrel32	LLST192
	.uleb128 0x55
	.long	0x4e07
	.secrel32	Ldebug_ranges0+0x8d8
	.byte	0x5
	.word	0x10e
	.long	0x517c
	.uleb128 0x31
	.long	0x4e4d
	.uleb128 0x65
	.long	0x4e42
	.secrel32	LLST193
	.uleb128 0x31
	.long	0x4e37
	.uleb128 0x31
	.long	0x4e2c
	.uleb128 0x31
	.long	0x4e21
	.uleb128 0x56
	.long	0x292d
	.secrel32	Ldebug_ranges0+0x908
	.byte	0x5
	.byte	0xca
	.uleb128 0x31
	.long	0x2984
	.uleb128 0x31
	.long	0x2978
	.uleb128 0x31
	.long	0x296a
	.uleb128 0x31
	.long	0x295e
	.uleb128 0x31
	.long	0x2952
	.uleb128 0x31
	.long	0x2946
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x940
	.uleb128 0x4f
	.long	0x2990
	.secrel32	LLST194
	.uleb128 0x54
	.long	0x28c6
	.long	LBB939
	.long	LBE939
	.byte	0x1
	.word	0x3f4
	.long	0x5166
	.uleb128 0x31
	.long	0x28e9
	.uleb128 0x4a
	.long	0x1efd
	.long	LBB941
	.long	LBE941
	.byte	0x1
	.word	0x3df
	.uleb128 0x31
	.long	0x1f0f
	.byte	0x0
	.byte	0x0
	.uleb128 0x46
	.long	LBB942
	.long	LBE942
	.uleb128 0x4f
	.long	0x29a1
	.secrel32	LLST195
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x50
	.long	0x4d50
	.secrel32	Ldebug_ranges0+0x988
	.byte	0x5
	.word	0x109
	.uleb128 0x31
	.long	0x4d96
	.uleb128 0x65
	.long	0x4d8b
	.secrel32	LLST196
	.uleb128 0x31
	.long	0x4d80
	.uleb128 0x31
	.long	0x4d75
	.uleb128 0x31
	.long	0x4d6a
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0x9b8
	.uleb128 0x4f
	.long	0x4da1
	.secrel32	LLST197
	.uleb128 0x56
	.long	0x292d
	.secrel32	Ldebug_ranges0+0x9e8
	.byte	0x5
	.byte	0xda
	.uleb128 0x31
	.long	0x2984
	.uleb128 0x31
	.long	0x2978
	.uleb128 0x31
	.long	0x296a
	.uleb128 0x31
	.long	0x295e
	.uleb128 0x31
	.long	0x2952
	.uleb128 0x31
	.long	0x2946
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0xa30
	.uleb128 0x4f
	.long	0x2990
	.secrel32	LLST198
	.uleb128 0x54
	.long	0x28c6
	.long	LBB968
	.long	LBE968
	.byte	0x1
	.word	0x3f4
	.long	0x521a
	.uleb128 0x31
	.long	0x28e9
	.uleb128 0x4a
	.long	0x1efd
	.long	LBB970
	.long	LBE970
	.byte	0x1
	.word	0x3df
	.uleb128 0x31
	.long	0x1f0f
	.byte	0x0
	.byte	0x0
	.uleb128 0x46
	.long	LBB971
	.long	LBE971
	.uleb128 0x4f
	.long	0x29a1
	.secrel32	LLST199
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x54
	.long	0x2be9
	.long	LBB993
	.long	LBE993
	.byte	0x5
	.word	0x1a2
	.long	0x5258
	.uleb128 0x31
	.long	0x2c0f
	.uleb128 0x31
	.long	0x2c03
	.uleb128 0x31
	.long	0x2bf7
	.byte	0x0
	.uleb128 0x54
	.long	0x2b37
	.long	LBB995
	.long	LBE995
	.byte	0x5
	.word	0x1a3
	.long	0x5272
	.uleb128 0x31
	.long	0x2b58
	.byte	0x0
	.uleb128 0x55
	.long	0x2c21
	.secrel32	Ldebug_ranges0+0xa88
	.byte	0x5
	.word	0x1b2
	.long	0x5288
	.uleb128 0x31
	.long	0x2c3b
	.byte	0x0
	.uleb128 0x54
	.long	0x2b37
	.long	LBB1001
	.long	LBE1001
	.byte	0x5
	.word	0x1b7
	.long	0x52a2
	.uleb128 0x31
	.long	0x2b58
	.byte	0x0
	.uleb128 0x50
	.long	0x4eb2
	.secrel32	Ldebug_ranges0+0xaa0
	.byte	0x5
	.word	0x1af
	.uleb128 0x31
	.long	0x4f13
	.uleb128 0x31
	.long	0x4f06
	.uleb128 0x31
	.long	0x4efa
	.uleb128 0x31
	.long	0x4eee
	.uleb128 0x31
	.long	0x4ee2
	.uleb128 0x31
	.long	0x4ed6
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0xac8
	.uleb128 0x4f
	.long	0x4f1f
	.secrel32	LLST200
	.uleb128 0x4f
	.long	0x4f2b
	.secrel32	LLST201
	.uleb128 0x4f
	.long	0x4f37
	.secrel32	LLST202
	.uleb128 0x4f
	.long	0x4f43
	.secrel32	LLST203
	.uleb128 0x54
	.long	0x2a85
	.long	LBB1008
	.long	LBE1008
	.byte	0x5
	.word	0x168
	.long	0x5314
	.uleb128 0x31
	.long	0x2ab7
	.uleb128 0x31
	.long	0x2aac
	.byte	0x0
	.uleb128 0x4a
	.long	0x2a85
	.long	LBB1010
	.long	LBE1010
	.byte	0x5
	.word	0x16f
	.uleb128 0x31
	.long	0x2ab7
	.uleb128 0x31
	.long	0x2aac
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x58
	.byte	0x1
	.ascii "kvm_mmu_reset_context\0"
	.byte	0x1
	.word	0x490
	.byte	0x1
	.long	0xe9
	.long	LFB187
	.long	LFE187
	.secrel32	LLST204
	.long	0x538d
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x48f
	.long	0xd83
	.secrel32	LLST205
	.uleb128 0x48
	.ascii "r\0"
	.byte	0x1
	.word	0x491
	.long	0xe9
	.secrel32	LLST206
	.uleb128 0x66
	.ascii "out\0"
	.byte	0x1
	.word	0x49a
	.long	L520
	.byte	0x0
	.uleb128 0x2c
	.ascii "nonpaging_map\0"
	.byte	0x1
	.word	0x316
	.byte	0x1
	.long	0xe9
	.byte	0x1
	.long	0x544e
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x315
	.long	0xd83
	.uleb128 0x2a
	.ascii "v\0"
	.byte	0x1
	.word	0x315
	.long	0xa75
	.uleb128 0x2a
	.ascii "p\0"
	.byte	0x1
	.word	0x315
	.long	0xa9c
	.uleb128 0x2f
	.secrel32	LASF12
	.byte	0x1
	.word	0x317
	.long	0xe9
	.uleb128 0x2b
	.ascii "table_addr\0"
	.byte	0x1
	.word	0x318
	.long	0xa9c
	.uleb128 0x30
	.uleb128 0x2f
	.secrel32	LASF5
	.byte	0x1
	.word	0x31d
	.long	0x15a
	.uleb128 0x2b
	.ascii "table\0"
	.byte	0x1
	.word	0x31e
	.long	0xaed
	.uleb128 0x2b
	.ascii "pte\0"
	.byte	0x1
	.word	0x31f
	.long	0x165
	.uleb128 0x36
	.long	0x543a
	.uleb128 0x2b
	.ascii "new_table\0"
	.byte	0x1
	.word	0x334
	.long	0x1f28
	.uleb128 0x2b
	.ascii "pseudo_gfn\0"
	.byte	0x1
	.word	0x335
	.long	0xa8f
	.byte	0x0
	.uleb128 0x36
	.long	0x5445
	.uleb128 0x31
	.long	0x23a3
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x31
	.long	0x2921
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x58
	.byte	0x1
	.ascii "nonpaging_page_fault\0"
	.byte	0x1
	.word	0x393
	.byte	0x1
	.long	0xe9
	.long	LFB153
	.long	LFE153
	.secrel32	LLST207
	.long	0x5544
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x391
	.long	0xd83
	.secrel32	LLST208
	.uleb128 0x41
	.ascii "gva\0"
	.byte	0x1
	.word	0x391
	.long	0xa75
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x3f
	.secrel32	LASF6
	.byte	0x1
	.word	0x392
	.long	0x15a
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x2f
	.secrel32	LASF27
	.byte	0x1
	.word	0x394
	.long	0xa82
	.uleb128 0x63
	.secrel32	LASF39
	.byte	0x1
	.word	0x395
	.long	0xa9c
	.byte	0x8
	.byte	0x74
	.sleb128 28
	.byte	0x93
	.uleb128 0x4
	.byte	0x74
	.sleb128 24
	.byte	0x93
	.uleb128 0x4
	.uleb128 0x48
	.ascii "r\0"
	.byte	0x1
	.word	0x396
	.long	0xe9
	.secrel32	LLST209
	.uleb128 0x50
	.long	0x538d
	.secrel32	Ldebug_ranges0+0xaf8
	.byte	0x1
	.word	0x3aa
	.uleb128 0x31
	.long	0x53bf
	.uleb128 0x31
	.long	0x53b5
	.uleb128 0x31
	.long	0x53a9
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0xb18
	.uleb128 0x4f
	.long	0x53c9
	.secrel32	LLST210
	.uleb128 0x4b
	.long	0x53d5
	.byte	0x7
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x74
	.sleb128 16
	.byte	0x93
	.uleb128 0x4
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0xb48
	.uleb128 0x4f
	.long	0x53e9
	.secrel32	LLST211
	.uleb128 0x35
	.long	0x53f5
	.uleb128 0x35
	.long	0x5403
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0xb88
	.uleb128 0x4f
	.long	0x5414
	.secrel32	LLST212
	.uleb128 0x4f
	.long	0x5426
	.secrel32	LLST213
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.ascii "alloc_mmu_pages\0"
	.byte	0x1
	.word	0x528
	.byte	0x1
	.long	0xe9
	.byte	0x1
	.long	0x55c7
	.uleb128 0x2e
	.secrel32	LASF25
	.byte	0x1
	.word	0x527
	.long	0xd83
	.uleb128 0x2f
	.secrel32	LASF4
	.byte	0x1
	.word	0x529
	.long	0x32b
	.uleb128 0x2b
	.ascii "i\0"
	.byte	0x1
	.word	0x52a
	.long	0xe9
	.uleb128 0x67
	.ascii "error_1\0"
	.byte	0x1
	.word	0x54d
	.uleb128 0x30
	.uleb128 0x2f
	.secrel32	LASF23
	.byte	0x1
	.word	0x531
	.long	0x1f28
	.uleb128 0x36
	.long	0x55a8
	.uleb128 0x31
	.long	0x2c89
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x31
	.long	0x1f77
	.uleb128 0x31
	.long	0x1f6c
	.uleb128 0x30
	.uleb128 0x31
	.long	0x1e56
	.uleb128 0x31
	.long	0x1e4a
	.uleb128 0x31
	.long	0x1e3f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x58
	.byte	0x1
	.ascii "kvm_mmu_create\0"
	.byte	0x1
	.word	0x553
	.byte	0x1
	.long	0xe9
	.long	LFB195
	.long	LFE195
	.secrel32	LLST214
	.long	0x5693
	.uleb128 0x43
	.secrel32	LASF25
	.byte	0x1
	.word	0x552
	.long	0xd83
	.secrel32	LLST215
	.uleb128 0x50
	.long	0x5544
	.secrel32	Ldebug_ranges0+0xbb0
	.byte	0x1
	.word	0x558
	.uleb128 0x31
	.long	0x5562
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0xbd8
	.uleb128 0x4f
	.long	0x556e
	.secrel32	LLST216
	.uleb128 0x4f
	.long	0x557a
	.secrel32	LLST217
	.uleb128 0x68
	.long	0x5584
	.long	L542
	.uleb128 0x49
	.secrel32	Ldebug_ranges0+0xc28
	.uleb128 0x35
	.long	0x5591
	.uleb128 0x54
	.long	0x1f5a
	.long	LBB1074
	.long	LBE1074
	.byte	0x1
	.word	0x53a
	.long	0x5679
	.uleb128 0x31
	.long	0x1f77
	.uleb128 0x31
	.long	0x1f6c
	.uleb128 0x57
	.long	0x1e2b
	.long	LBB1076
	.long	LBE1076
	.byte	0x4
	.byte	0x4a
	.uleb128 0x31
	.long	0x1e56
	.uleb128 0x31
	.long	0x1e4a
	.uleb128 0x31
	.long	0x1e3f
	.byte	0x0
	.byte	0x0
	.uleb128 0x4a
	.long	0x2c71
	.long	LBB1078
	.long	LBE1078
	.byte	0x1
	.word	0x533
	.uleb128 0x31
	.long	0x2c89
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.long	0x587
	.long	0x56a3
	.uleb128 0x15
	.long	0x56d
	.byte	0x12
	.byte	0x0
	.uleb128 0x13
	.long	0x5693
	.uleb128 0x14
	.long	0x587
	.long	0x56b8
	.uleb128 0x15
	.long	0x56d
	.byte	0x16
	.byte	0x0
	.uleb128 0x13
	.long	0x56a8
	.uleb128 0x14
	.long	0x587
	.long	0x56cd
	.uleb128 0x15
	.long	0x56d
	.byte	0x17
	.byte	0x0
	.uleb128 0x13
	.long	0x56bd
	.uleb128 0x14
	.long	0x587
	.long	0x56e2
	.uleb128 0x15
	.long	0x56d
	.byte	0x14
	.byte	0x0
	.uleb128 0x13
	.long	0x56d2
	.uleb128 0x14
	.long	0x587
	.long	0x56f7
	.uleb128 0x15
	.long	0x56d
	.byte	0x1a
	.byte	0x0
	.uleb128 0x13
	.long	0x56e7
	.uleb128 0x14
	.long	0x587
	.long	0x570c
	.uleb128 0x15
	.long	0x56d
	.byte	0x10
	.byte	0x0
	.uleb128 0x13
	.long	0x56fc
	.uleb128 0x69
	.secrel32	LASF17
	.byte	0x2
	.word	0x19a
	.long	0x1588
	.byte	0x1
	.byte	0x1
	.uleb128 0x69
	.secrel32	LASF19
	.byte	0x2
	.word	0x19b
	.long	0x572d
	.byte	0x1
	.byte	0x1
	.uleb128 0x6
	.byte	0x4
	.long	0x16d2
	.uleb128 0x6a
	.ascii "bad_page_address\0"
	.byte	0x2
	.word	0x1b2
	.long	0xa9c
	.byte	0x1
	.byte	0x1
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x13
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3c
	.uleb128 0xc
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
	.uleb128 0x15
	.byte	0x0
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.uleb128 0x15
	.byte	0x0
	.uleb128 0x27
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.uleb128 0x2d
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
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x30
	.uleb128 0xb
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
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
	.uleb128 0x34
	.uleb128 0x26
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
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
	.uleb128 0x39
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.uleb128 0x2e
	.byte	0x0
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
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
	.uleb128 0x3c
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
	.uleb128 0x3d
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
	.uleb128 0x3e
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
	.uleb128 0x3f
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
	.uleb128 0x40
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
	.uleb128 0x41
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
	.uleb128 0x42
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
	.uleb128 0x43
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
	.uleb128 0x44
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
	.uleb128 0x45
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
	.uleb128 0x46
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x47
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
	.uleb128 0x48
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
	.uleb128 0x49
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x4a
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
	.uleb128 0x4b
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x4c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
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
	.uleb128 0x4d
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x4e
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
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x4f
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x50
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
	.uleb128 0x51
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
	.uleb128 0x52
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x53
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x54
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
	.uleb128 0x55
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
	.uleb128 0x56
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x57
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
	.uleb128 0x58
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
	.uleb128 0x59
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
	.uleb128 0x5a
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
	.uleb128 0x5b
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
	.uleb128 0x5c
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
	.uleb128 0x5d
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
	.uleb128 0x5e
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
	.uleb128 0x5f
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
	.uleb128 0x60
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
	.uleb128 0x61
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x62
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x63
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
	.uleb128 0x64
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x65
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x66
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
	.uleb128 0x67
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x6a
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"dr"
	.long	0x169
	.word	0x2
	.secrel32	Ldebug_info0
	.long	0x574f
	.long	0x2c96
	.ascii "nonpaging_new_cr3\0"
	.long	0x2ccd
	.ascii "nonpaging_gva_to_gpa\0"
	.long	0x2d1c
	.ascii "kvm_mmu_post_write\0"
	.long	0x3092
	.ascii "kvm_mmu_slot_remove_write_access\0"
	.long	0x3587
	.ascii "kvm_mmu_free_some_pages\0"
	.long	0x35dc
	.ascii "kvm_mmu_unprotect_page_virt\0"
	.long	0x3689
	.ascii "kvm_mmu_pre_write\0"
	.long	0x38c6
	.ascii "kvm_mmu_destroy\0"
	.long	0x404f
	.ascii "kvm_mmu_setup\0"
	.long	0x40d3
	.ascii "gpa_to_hpa\0"
	.long	0x4134
	.ascii "gva_to_hpa\0"
	.long	0x4189
	.ascii "safe_gpa_to_hpa\0"
	.long	0x5332
	.ascii "kvm_mmu_reset_context\0"
	.long	0x544e
	.ascii "nonpaging_page_fault\0"
	.long	0x55c7
	.ascii "kvm_mmu_create\0"
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
	.long	LBB392-Ltext0
	.long	LBE392-Ltext0
	.long	LBB395-Ltext0
	.long	LBE395-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB400-Ltext0
	.long	LBE400-Ltext0
	.long	LBB407-Ltext0
	.long	LBE407-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB402-Ltext0
	.long	LBE402-Ltext0
	.long	LBB405-Ltext0
	.long	LBE405-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB409-Ltext0
	.long	LBE409-Ltext0
	.long	LBB413-Ltext0
	.long	LBE413-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB414-Ltext0
	.long	LBE414-Ltext0
	.long	LBB416-Ltext0
	.long	LBE416-Ltext0
	.long	LBB415-Ltext0
	.long	LBE415-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB421-Ltext0
	.long	LBE421-Ltext0
	.long	LBB428-Ltext0
	.long	LBE428-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB423-Ltext0
	.long	LBE423-Ltext0
	.long	LBB426-Ltext0
	.long	LBE426-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB464-Ltext0
	.long	LBE464-Ltext0
	.long	LBB504-Ltext0
	.long	LBE504-Ltext0
	.long	LBB495-Ltext0
	.long	LBE495-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB466-Ltext0
	.long	LBE466-Ltext0
	.long	LBB468-Ltext0
	.long	LBE468-Ltext0
	.long	LBB465-Ltext0
	.long	LBE465-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB469-Ltext0
	.long	LBE469-Ltext0
	.long	LBB474-Ltext0
	.long	LBE474-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB475-Ltext0
	.long	LBE475-Ltext0
	.long	LBB505-Ltext0
	.long	LBE505-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB478-Ltext0
	.long	LBE478-Ltext0
	.long	LBB494-Ltext0
	.long	LBE494-Ltext0
	.long	LBB476-Ltext0
	.long	LBE476-Ltext0
	.long	LBB477-Ltext0
	.long	LBE477-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB480-Ltext0
	.long	LBE480-Ltext0
	.long	LBB479-Ltext0
	.long	LBE479-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB482-Ltext0
	.long	LBE482-Ltext0
	.long	LBB485-Ltext0
	.long	LBE485-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB491-Ltext0
	.long	LBE491-Ltext0
	.long	LBB493-Ltext0
	.long	LBE493-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB507-Ltext0
	.long	LBE507-Ltext0
	.long	LBB511-Ltext0
	.long	LBE511-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB508-Ltext0
	.long	LBE508-Ltext0
	.long	LBB510-Ltext0
	.long	LBE510-Ltext0
	.long	LBB509-Ltext0
	.long	LBE509-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB513-Ltext0
	.long	LBE513-Ltext0
	.long	LBB519-Ltext0
	.long	LBE519-Ltext0
	.long	LBB518-Ltext0
	.long	LBE518-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB515-Ltext0
	.long	LBE515-Ltext0
	.long	LBB517-Ltext0
	.long	LBE517-Ltext0
	.long	LBB514-Ltext0
	.long	LBE514-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB522-Ltext0
	.long	LBE522-Ltext0
	.long	LBB531-Ltext0
	.long	LBE531-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB525-Ltext0
	.long	LBE525-Ltext0
	.long	LBB530-Ltext0
	.long	LBE530-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB542-Ltext0
	.long	LBE542-Ltext0
	.long	LBB545-Ltext0
	.long	LBE545-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB579-Ltext0
	.long	LBE579-Ltext0
	.long	LBB635-Ltext0
	.long	LBE635-Ltext0
	.long	LBB633-Ltext0
	.long	LBE633-Ltext0
	.long	LBB631-Ltext0
	.long	LBE631-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB584-Ltext0
	.long	LBE584-Ltext0
	.long	LBB594-Ltext0
	.long	LBE594-Ltext0
	.long	LBB580-Ltext0
	.long	LBE580-Ltext0
	.long	LBB593-Ltext0
	.long	LBE593-Ltext0
	.long	LBB592-Ltext0
	.long	LBE592-Ltext0
	.long	LBB581-Ltext0
	.long	LBE581-Ltext0
	.long	LBB582-Ltext0
	.long	LBE582-Ltext0
	.long	LBB583-Ltext0
	.long	LBE583-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB586-Ltext0
	.long	LBE586-Ltext0
	.long	LBB585-Ltext0
	.long	LBE585-Ltext0
	.long	LBB591-Ltext0
	.long	LBE591-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB595-Ltext0
	.long	LBE595-Ltext0
	.long	LBB630-Ltext0
	.long	LBE630-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB599-Ltext0
	.long	LBE599-Ltext0
	.long	LBB618-Ltext0
	.long	LBE618-Ltext0
	.long	LBB596-Ltext0
	.long	LBE596-Ltext0
	.long	LBB597-Ltext0
	.long	LBE597-Ltext0
	.long	LBB598-Ltext0
	.long	LBE598-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB600-Ltext0
	.long	LBE600-Ltext0
	.long	LBB617-Ltext0
	.long	LBE617-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB602-Ltext0
	.long	LBE602-Ltext0
	.long	LBB605-Ltext0
	.long	LBE605-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB608-Ltext0
	.long	LBE608-Ltext0
	.long	LBB611-Ltext0
	.long	LBE611-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB612-Ltext0
	.long	LBE612-Ltext0
	.long	LBB607-Ltext0
	.long	LBE607-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB621-Ltext0
	.long	LBE621-Ltext0
	.long	LBB634-Ltext0
	.long	LBE634-Ltext0
	.long	LBB632-Ltext0
	.long	LBE632-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB623-Ltext0
	.long	LBE623-Ltext0
	.long	LBB629-Ltext0
	.long	LBE629-Ltext0
	.long	LBB622-Ltext0
	.long	LBE622-Ltext0
	.long	LBB628-Ltext0
	.long	LBE628-Ltext0
	.long	LBB627-Ltext0
	.long	LBE627-Ltext0
	.long	LBB626-Ltext0
	.long	LBE626-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB636-Ltext0
	.long	LBE636-Ltext0
	.long	LBB640-Ltext0
	.long	LBE640-Ltext0
	.long	LBB639-Ltext0
	.long	LBE639-Ltext0
	.long	LBB638-Ltext0
	.long	LBE638-Ltext0
	.long	LBB637-Ltext0
	.long	LBE637-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB658-Ltext0
	.long	LBE658-Ltext0
	.long	LBB668-Ltext0
	.long	LBE668-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB659-Ltext0
	.long	LBE659-Ltext0
	.long	LBB660-Ltext0
	.long	LBE660-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB661-Ltext0
	.long	LBE661-Ltext0
	.long	LBB669-Ltext0
	.long	LBE669-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB662-Ltext0
	.long	LBE662-Ltext0
	.long	LBB663-Ltext0
	.long	LBE663-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB672-Ltext0
	.long	LBE672-Ltext0
	.long	LBB674-Ltext0
	.long	LBE674-Ltext0
	.long	LBB673-Ltext0
	.long	LBE673-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB677-Ltext0
	.long	LBE677-Ltext0
	.long	LBB680-Ltext0
	.long	LBE680-Ltext0
	.long	LBB679-Ltext0
	.long	LBE679-Ltext0
	.long	LBB678-Ltext0
	.long	LBE678-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB683-Ltext0
	.long	LBE683-Ltext0
	.long	LBB693-Ltext0
	.long	LBE693-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB684-Ltext0
	.long	LBE684-Ltext0
	.long	LBB687-Ltext0
	.long	LBE687-Ltext0
	.long	LBB686-Ltext0
	.long	LBE686-Ltext0
	.long	LBB685-Ltext0
	.long	LBE685-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB688-Ltext0
	.long	LBE688-Ltext0
	.long	LBB694-Ltext0
	.long	LBE694-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB689-Ltext0
	.long	LBE689-Ltext0
	.long	LBB692-Ltext0
	.long	LBE692-Ltext0
	.long	LBB691-Ltext0
	.long	LBE691-Ltext0
	.long	LBB690-Ltext0
	.long	LBE690-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB754-Ltext0
	.long	LBE754-Ltext0
	.long	LBB854-Ltext0
	.long	LBE854-Ltext0
	.long	LBB852-Ltext0
	.long	LBE852-Ltext0
	.long	LBB850-Ltext0
	.long	LBE850-Ltext0
	.long	LBB848-Ltext0
	.long	LBE848-Ltext0
	.long	LBB836-Ltext0
	.long	LBE836-Ltext0
	.long	LBB830-Ltext0
	.long	LBE830-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB758-Ltext0
	.long	LBE758-Ltext0
	.long	LBB825-Ltext0
	.long	LBE825-Ltext0
	.long	LBB755-Ltext0
	.long	LBE755-Ltext0
	.long	LBB824-Ltext0
	.long	LBE824-Ltext0
	.long	LBB756-Ltext0
	.long	LBE756-Ltext0
	.long	LBB823-Ltext0
	.long	LBE823-Ltext0
	.long	LBB757-Ltext0
	.long	LBE757-Ltext0
	.long	LBB822-Ltext0
	.long	LBE822-Ltext0
	.long	LBB821-Ltext0
	.long	LBE821-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB762-Ltext0
	.long	LBE762-Ltext0
	.long	LBB820-Ltext0
	.long	LBE820-Ltext0
	.long	LBB759-Ltext0
	.long	LBE759-Ltext0
	.long	LBB819-Ltext0
	.long	LBE819-Ltext0
	.long	LBB818-Ltext0
	.long	LBE818-Ltext0
	.long	LBB760-Ltext0
	.long	LBE760-Ltext0
	.long	LBB817-Ltext0
	.long	LBE817-Ltext0
	.long	LBB761-Ltext0
	.long	LBE761-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB765-Ltext0
	.long	LBE765-Ltext0
	.long	LBB764-Ltext0
	.long	LBE764-Ltext0
	.long	LBB814-Ltext0
	.long	LBE814-Ltext0
	.long	LBB789-Ltext0
	.long	LBE789-Ltext0
	.long	LBB788-Ltext0
	.long	LBE788-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB772-Ltext0
	.long	LBE772-Ltext0
	.long	LBB785-Ltext0
	.long	LBE785-Ltext0
	.long	LBB769-Ltext0
	.long	LBE769-Ltext0
	.long	LBB784-Ltext0
	.long	LBE784-Ltext0
	.long	LBB770-Ltext0
	.long	LBE770-Ltext0
	.long	LBB771-Ltext0
	.long	LBE771-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB776-Ltext0
	.long	LBE776-Ltext0
	.long	LBB783-Ltext0
	.long	LBE783-Ltext0
	.long	LBB773-Ltext0
	.long	LBE773-Ltext0
	.long	LBB782-Ltext0
	.long	LBE782-Ltext0
	.long	LBB774-Ltext0
	.long	LBE774-Ltext0
	.long	LBB775-Ltext0
	.long	LBE775-Ltext0
	.long	LBB781-Ltext0
	.long	LBE781-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB790-Ltext0
	.long	LBE790-Ltext0
	.long	LBB816-Ltext0
	.long	LBE816-Ltext0
	.long	LBB763-Ltext0
	.long	LBE763-Ltext0
	.long	LBB815-Ltext0
	.long	LBE815-Ltext0
	.long	LBB813-Ltext0
	.long	LBE813-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB793-Ltext0
	.long	LBE793-Ltext0
	.long	LBB812-Ltext0
	.long	LBE812-Ltext0
	.long	LBB791-Ltext0
	.long	LBE791-Ltext0
	.long	LBB811-Ltext0
	.long	LBE811-Ltext0
	.long	LBB792-Ltext0
	.long	LBE792-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB797-Ltext0
	.long	LBE797-Ltext0
	.long	LBB810-Ltext0
	.long	LBE810-Ltext0
	.long	LBB794-Ltext0
	.long	LBE794-Ltext0
	.long	LBB809-Ltext0
	.long	LBE809-Ltext0
	.long	LBB795-Ltext0
	.long	LBE795-Ltext0
	.long	LBB796-Ltext0
	.long	LBE796-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB801-Ltext0
	.long	LBE801-Ltext0
	.long	LBB808-Ltext0
	.long	LBE808-Ltext0
	.long	LBB798-Ltext0
	.long	LBE798-Ltext0
	.long	LBB807-Ltext0
	.long	LBE807-Ltext0
	.long	LBB799-Ltext0
	.long	LBE799-Ltext0
	.long	LBB800-Ltext0
	.long	LBE800-Ltext0
	.long	LBB806-Ltext0
	.long	LBE806-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB831-Ltext0
	.long	LBE831-Ltext0
	.long	LBB847-Ltext0
	.long	LBE847-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB837-Ltext0
	.long	LBE837-Ltext0
	.long	LBB853-Ltext0
	.long	LBE853-Ltext0
	.long	LBB851-Ltext0
	.long	LBE851-Ltext0
	.long	LBB849-Ltext0
	.long	LBE849-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB840-Ltext0
	.long	LBE840-Ltext0
	.long	LBB846-Ltext0
	.long	LBE846-Ltext0
	.long	LBB838-Ltext0
	.long	LBE838-Ltext0
	.long	LBB845-Ltext0
	.long	LBE845-Ltext0
	.long	LBB839-Ltext0
	.long	LBE839-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB915-Ltext0
	.long	LBE915-Ltext0
	.long	LBB1021-Ltext0
	.long	LBE1021-Ltext0
	.long	LBB1019-Ltext0
	.long	LBE1019-Ltext0
	.long	LBB1017-Ltext0
	.long	LBE1017-Ltext0
	.long	LBB1015-Ltext0
	.long	LBE1015-Ltext0
	.long	LBB1003-Ltext0
	.long	LBE1003-Ltext0
	.long	LBB997-Ltext0
	.long	LBE997-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB919-Ltext0
	.long	LBE919-Ltext0
	.long	LBB992-Ltext0
	.long	LBE992-Ltext0
	.long	LBB916-Ltext0
	.long	LBE916-Ltext0
	.long	LBB991-Ltext0
	.long	LBE991-Ltext0
	.long	LBB917-Ltext0
	.long	LBE917-Ltext0
	.long	LBB990-Ltext0
	.long	LBE990-Ltext0
	.long	LBB918-Ltext0
	.long	LBE918-Ltext0
	.long	LBB989-Ltext0
	.long	LBE989-Ltext0
	.long	LBB988-Ltext0
	.long	LBE988-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB923-Ltext0
	.long	LBE923-Ltext0
	.long	LBB987-Ltext0
	.long	LBE987-Ltext0
	.long	LBB920-Ltext0
	.long	LBE920-Ltext0
	.long	LBB986-Ltext0
	.long	LBE986-Ltext0
	.long	LBB985-Ltext0
	.long	LBE985-Ltext0
	.long	LBB921-Ltext0
	.long	LBE921-Ltext0
	.long	LBB984-Ltext0
	.long	LBE984-Ltext0
	.long	LBB922-Ltext0
	.long	LBE922-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB926-Ltext0
	.long	LBE926-Ltext0
	.long	LBB925-Ltext0
	.long	LBE925-Ltext0
	.long	LBB981-Ltext0
	.long	LBE981-Ltext0
	.long	LBB951-Ltext0
	.long	LBE951-Ltext0
	.long	LBB950-Ltext0
	.long	LBE950-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB933-Ltext0
	.long	LBE933-Ltext0
	.long	LBB947-Ltext0
	.long	LBE947-Ltext0
	.long	LBB930-Ltext0
	.long	LBE930-Ltext0
	.long	LBB946-Ltext0
	.long	LBE946-Ltext0
	.long	LBB931-Ltext0
	.long	LBE931-Ltext0
	.long	LBB932-Ltext0
	.long	LBE932-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB938-Ltext0
	.long	LBE938-Ltext0
	.long	LBB945-Ltext0
	.long	LBE945-Ltext0
	.long	LBB934-Ltext0
	.long	LBE934-Ltext0
	.long	LBB944-Ltext0
	.long	LBE944-Ltext0
	.long	LBB935-Ltext0
	.long	LBE935-Ltext0
	.long	LBB936-Ltext0
	.long	LBE936-Ltext0
	.long	LBB937-Ltext0
	.long	LBE937-Ltext0
	.long	LBB943-Ltext0
	.long	LBE943-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB952-Ltext0
	.long	LBE952-Ltext0
	.long	LBB983-Ltext0
	.long	LBE983-Ltext0
	.long	LBB924-Ltext0
	.long	LBE924-Ltext0
	.long	LBB982-Ltext0
	.long	LBE982-Ltext0
	.long	LBB980-Ltext0
	.long	LBE980-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB955-Ltext0
	.long	LBE955-Ltext0
	.long	LBB979-Ltext0
	.long	LBE979-Ltext0
	.long	LBB953-Ltext0
	.long	LBE953-Ltext0
	.long	LBB978-Ltext0
	.long	LBE978-Ltext0
	.long	LBB954-Ltext0
	.long	LBE954-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB961-Ltext0
	.long	LBE961-Ltext0
	.long	LBB977-Ltext0
	.long	LBE977-Ltext0
	.long	LBB956-Ltext0
	.long	LBE956-Ltext0
	.long	LBB976-Ltext0
	.long	LBE976-Ltext0
	.long	LBB957-Ltext0
	.long	LBE957-Ltext0
	.long	LBB958-Ltext0
	.long	LBE958-Ltext0
	.long	LBB959-Ltext0
	.long	LBE959-Ltext0
	.long	LBB960-Ltext0
	.long	LBE960-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB967-Ltext0
	.long	LBE967-Ltext0
	.long	LBB975-Ltext0
	.long	LBE975-Ltext0
	.long	LBB962-Ltext0
	.long	LBE962-Ltext0
	.long	LBB974-Ltext0
	.long	LBE974-Ltext0
	.long	LBB963-Ltext0
	.long	LBE963-Ltext0
	.long	LBB964-Ltext0
	.long	LBE964-Ltext0
	.long	LBB965-Ltext0
	.long	LBE965-Ltext0
	.long	LBB973-Ltext0
	.long	LBE973-Ltext0
	.long	LBB966-Ltext0
	.long	LBE966-Ltext0
	.long	LBB972-Ltext0
	.long	LBE972-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB998-Ltext0
	.long	LBE998-Ltext0
	.long	LBB1014-Ltext0
	.long	LBE1014-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1004-Ltext0
	.long	LBE1004-Ltext0
	.long	LBB1020-Ltext0
	.long	LBE1020-Ltext0
	.long	LBB1018-Ltext0
	.long	LBE1018-Ltext0
	.long	LBB1016-Ltext0
	.long	LBE1016-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1007-Ltext0
	.long	LBE1007-Ltext0
	.long	LBB1013-Ltext0
	.long	LBE1013-Ltext0
	.long	LBB1005-Ltext0
	.long	LBE1005-Ltext0
	.long	LBB1012-Ltext0
	.long	LBE1012-Ltext0
	.long	LBB1006-Ltext0
	.long	LBE1006-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1032-Ltext0
	.long	LBE1032-Ltext0
	.long	LBB1050-Ltext0
	.long	LBE1050-Ltext0
	.long	LBB1049-Ltext0
	.long	LBE1049-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1034-Ltext0
	.long	LBE1034-Ltext0
	.long	LBB1048-Ltext0
	.long	LBE1048-Ltext0
	.long	LBB1033-Ltext0
	.long	LBE1033-Ltext0
	.long	LBB1047-Ltext0
	.long	LBE1047-Ltext0
	.long	LBB1046-Ltext0
	.long	LBE1046-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1037-Ltext0
	.long	LBE1037-Ltext0
	.long	LBB1045-Ltext0
	.long	LBE1045-Ltext0
	.long	LBB1035-Ltext0
	.long	LBE1035-Ltext0
	.long	LBB1044-Ltext0
	.long	LBE1044-Ltext0
	.long	LBB1036-Ltext0
	.long	LBE1036-Ltext0
	.long	LBB1043-Ltext0
	.long	LBE1043-Ltext0
	.long	LBB1042-Ltext0
	.long	LBE1042-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1039-Ltext0
	.long	LBE1039-Ltext0
	.long	LBB1041-Ltext0
	.long	LBE1041-Ltext0
	.long	LBB1040-Ltext0
	.long	LBE1040-Ltext0
	.long	LBB1038-Ltext0
	.long	LBE1038-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1062-Ltext0
	.long	LBE1062-Ltext0
	.long	LBB1085-Ltext0
	.long	LBE1085-Ltext0
	.long	LBB1084-Ltext0
	.long	LBE1084-Ltext0
	.long	LBB1083-Ltext0
	.long	LBE1083-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1069-Ltext0
	.long	LBE1069-Ltext0
	.long	LBB1082-Ltext0
	.long	LBE1082-Ltext0
	.long	LBB1063-Ltext0
	.long	LBE1063-Ltext0
	.long	LBB1081-Ltext0
	.long	LBE1081-Ltext0
	.long	LBB1064-Ltext0
	.long	LBE1064-Ltext0
	.long	LBB1065-Ltext0
	.long	LBE1065-Ltext0
	.long	LBB1066-Ltext0
	.long	LBE1066-Ltext0
	.long	LBB1067-Ltext0
	.long	LBE1067-Ltext0
	.long	LBB1068-Ltext0
	.long	LBE1068-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1073-Ltext0
	.long	LBE1073-Ltext0
	.long	LBB1070-Ltext0
	.long	LBE1070-Ltext0
	.long	LBB1071-Ltext0
	.long	LBE1071-Ltext0
	.long	LBB1080-Ltext0
	.long	LBE1080-Ltext0
	.long	LBB1072-Ltext0
	.long	LBE1072-Ltext0
	.long	0x0
	.long	0x0
	.section	.debug_str,"dr"
LASF39:
	.ascii "paddr\0"
LASF28:
	.ascii "page_head\0"
LASF40:
	.ascii "walker\0"
LASF46:
	.ascii "access_error\0"
LASF0:
	.ascii "list_head\0"
LASF24:
	.ascii "shadow_page\0"
LASF47:
	.ascii "shadow_addr\0"
LASF22:
	.ascii "inherited_ar\0"
LASF5:
	.ascii "index\0"
LASF6:
	.ascii "error_code\0"
LASF36:
	.ascii "shadow_pte\0"
LASF18:
	.ascii "tlb_flush\0"
LASF17:
	.ascii "kvm_stat\0"
LASF11:
	.ascii "parent_ptes\0"
LASF14:
	.ascii "metaphysical\0"
LASF19:
	.ascii "kvm_arch_ops\0"
LASF20:
	.ascii "inject_page_fault\0"
LASF4:
	.ascii "page\0"
LASF16:
	.ascii "page_hpa\0"
LASF27:
	.ascii "addr\0"
LASF38:
	.ascii "access_bits\0"
LASF32:
	.ascii "__FUNCTION__\0"
LASF35:
	.ascii "context\0"
LASF7:
	.ascii "apic_base\0"
LASF52:
	.ascii "write_pt\0"
LASF23:
	.ascii "page_header\0"
LASF1:
	.ascii "hlist_head\0"
LASF26:
	.ascii "prev_desc\0"
LASF45:
	.ascii "not_present\0"
LASF44:
	.ascii "fetch_fault\0"
LASF8:
	.ascii "selector\0"
LASF50:
	.ascii "guest_pde\0"
LASF3:
	.ascii "systemVA\0"
LASF13:
	.ascii "quadrant\0"
LASF34:
	.ascii "pte_chain\0"
LASF33:
	.ascii "slot\0"
LASF43:
	.ascii "user_fault\0"
LASF15:
	.ascii "parent_pte\0"
LASF2:
	.ascii "hlist_node\0"
LASF25:
	.ascii "vcpu\0"
LASF51:
	.ascii "guest_pte\0"
LASF48:
	.ascii "prev_shadow_ent\0"
LASF30:
	.ascii "node\0"
LASF12:
	.ascii "level\0"
LASF9:
	.ascii "enabled\0"
LASF21:
	.ascii "table_gfn\0"
LASF10:
	.ascii "singlestep\0"
LASF29:
	.ascii "bucket\0"
LASF37:
	.ascii "gaddr\0"
LASF42:
	.ascii "write_fault\0"
LASF31:
	.ascii "__mptr\0"
LASF49:
	.ascii "guest_ent\0"
LASF41:
	.ascii "shadow_ent\0"
LASF53:
	.ascii "writable_shadow\0"
	.def	_kzalloc;	.scl	2;	.type	32;	.endef
	.def	_kfree;	.scl	2;	.type	32;	.endef
	.def	___pa;	.scl	2;	.type	32;	.endef
	.def	_gfn_to_memslot;	.scl	2;	.type	32;	.endef
	.def	_kmap_atomic;	.scl	2;	.type	32;	.endef
	.def	_kunmap_atomic;	.scl	2;	.type	32;	.endef
	.def	_mark_page_dirty;	.scl	2;	.type	32;	.endef
	.def	___free_page;	.scl	2;	.type	32;	.endef
	.def	_pfn_to_page;	.scl	2;	.type	32;	.endef
	.def	_free_page;	.scl	2;	.type	32;	.endef
	.def	_page_to_pfn;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_alloc_page;	.scl	2;	.type	32;	.endef
	.def	_page_address;	.scl	2;	.type	32;	.endef
	.def	_printk;	.scl	2;	.type	32;	.endef
	.def	_prefetch;	.scl	2;	.type	32;	.endef
	.def	___va;	.scl	2;	.type	32;	.endef
