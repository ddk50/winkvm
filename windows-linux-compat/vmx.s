	.file	"vmx.c"
	.section	.debug_abbrev,"dr"
Ldebug_abbrev0:
	.section	.debug_info,"dr"
Ldebug_info0:
	.section	.debug_line,"dr"
Ldebug_line0:
	.text
Ltext0:
	.p2align 4,,15
	.def	_vmx_get_rflags;	.scl	3;	.type	32;	.endef
_vmx_get_rflags:
LFB128:
	.file 1 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c"
	.loc 1 279 0
LVL0:
LBB827:
LBB828:
	.loc 1 157 0
	movl	$26656, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL1:
LVL2:
/NO_APP
LBE828:
LBE827:
	.loc 1 281 0
	ret
LFE128:
	.p2align 4,,15
	.def	_vcpu_load_rsp_rip;	.scl	3;	.type	32;	.endef
_vcpu_load_rsp_rip:
LFB137:
	.loc 1 463 0
LVL3:
	.loc 1 463 0
	movl	4(%esp), %ecx
LBB829:
LBB830:
	.loc 1 157 0
	movl	$26652, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL4:
/NO_APP
LBE830:
LBE829:
	.loc 1 464 0
	movl	%eax, 76(%ecx)
LBB831:
LBB832:
	.loc 1 157 0
	movb	$30, %dl
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL5:
/NO_APP
LBE832:
LBE831:
	.loc 1 465 0
	movl	%eax, 92(%ecx)
	.loc 1 466 0
	ret
LFE137:
	.p2align 4,,15
	.def	_hardware_disable;	.scl	3;	.type	32;	.endef
_hardware_disable:
LFB143:
	.loc 1 575 0
LVL6:
	.loc 1 577 0
/APP
 # 577 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x01, 0xc4
 # 0 "" 2
	.loc 1 579 0
/NO_APP
	ret
LFE143:
	.p2align 4,,15
	.def	_vmx_decache_cr0_cr4_guest_bits;	.scl	3;	.type	32;	.endef
_vmx_decache_cr0_cr4_guest_bits:
LFB158:
	.loc 1 839 0
LVL7:
	.loc 1 839 0
	movl	4(%esp), %ecx
LBB833:
LBB834:
	.loc 1 157 0
	movl	$26624, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
	movl	%eax, %edx
LVL8:
LBE834:
LBE833:
	.loc 1 841 0
	movl	96(%ecx), %eax
	andl	$536805342, %edx
	andl	$-536805343, %eax
	orl	%eax, %edx
	movl	%edx, 96(%ecx)
LBB835:
LBB836:
	.loc 1 157 0
	movl	$26628, %edx
LVL9:
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
	movl	%eax, %edx
LVL10:
LBE836:
LBE835:
	.loc 1 844 0
	movl	128(%ecx), %eax
	andl	$-8370, %edx
	andl	$8369, %eax
	orl	%eax, %edx
	movl	%edx, 128(%ecx)
	.loc 1 845 0
	ret
LFE158:
	.p2align 4,,15
	.def	_vmx_get_segment_base;	.scl	3;	.type	32;	.endef
_vmx_get_segment_base:
LFB163:
	.loc 1 924 0
LVL11:
	.loc 1 924 0
	movl	8(%esp), %eax
LBB837:
LBB838:
	.loc 1 157 0
	sall	$4, %eax
LVL12:
	movl	_kvm_vmx_segment_fields+4(%eax), %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL13:
/NO_APP
LBE838:
LBE837:
	.loc 1 928 0
	xorl	%edx, %edx
LVL14:
	ret
LFE163:
	.p2align 4,,15
	.def	_vmx_get_segment;	.scl	3;	.type	32;	.endef
_vmx_get_segment:
LFB164:
	.loc 1 932 0
LVL15:
	subl	$24, %esp
LCFI0:
	movl	36(%esp), %ecx
	movl	%ebx, 8(%esp)
LCFI1:
	movl	%esi, 12(%esp)
LCFI2:
	movl	32(%esp), %esi
	movl	%edi, 16(%esp)
LCFI3:
	.loc 1 933 0
	sall	$4, %ecx
	leal	_kvm_vmx_segment_fields(%ecx), %ebx
LVL16:
	.loc 1 932 0
	movl	%ebp, 20(%esp)
LCFI4:
LBB839:
LBB840:
	.loc 1 157 0
	movl	4(%ebx), %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL17:
/NO_APP
LBE840:
LBE839:
	.loc 1 936 0
	movl	%eax, (%esi)
	movl	$0, 4(%esi)
LBB841:
LBB842:
LBB843:
LBB844:
	.loc 1 157 0
	movl	8(%ebx), %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL18:
/NO_APP
LBE844:
LBE843:
LBE842:
LBE841:
	.loc 1 937 0
	movl	%eax, 8(%esi)
LBB845:
LBB846:
LBB847:
LBB848:
	.loc 1 157 0
	movl	_kvm_vmx_segment_fields(%ecx), %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL19:
/NO_APP
LBE848:
LBE847:
LBE846:
LBE845:
	.loc 1 938 0
	movw	%ax, 12(%esi)
LBB849:
LBB850:
LBB851:
LBB852:
	.loc 1 157 0
	movl	12(%ebx), %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL20:
/NO_APP
LBE852:
LBE851:
LBE850:
LBE849:
	.loc 1 940 0
	testl	$65536, %eax
	je	L12
LVL21:
	movb	$0, 5(%esp)
	xorl	%ebp, %ebp
	xorl	%edi, %edi
	movb	$0, 6(%esp)
	xorl	%ebx, %ebx
LVL22:
	xorl	%ecx, %ecx
	movb	$0, 7(%esp)
	xorl	%edx, %edx
	movb	$0, 3(%esp)
L13:
	.loc 1 942 0
	movzbl	5(%esp), %eax
LVL23:
	movb	%al, 14(%esi)
	.loc 1 943 0
	movzbl	6(%esp), %eax
	movb	%al, 18(%esi)
	.loc 1 944 0
	movzbl	7(%esp), %eax
	.loc 1 947 0
	movb	%bl, 19(%esi)
	.loc 1 948 0
	movb	%cl, 17(%esi)
	.loc 1 949 0
	movb	%dl, 20(%esi)
	.loc 1 944 0
	movb	%al, 16(%esi)
	.loc 1 945 0
	movl	%ebp, %eax
	movb	%al, 15(%esi)
	.loc 1 946 0
	movl	%edi, %eax
	movb	%al, 21(%esi)
	.loc 1 950 0
	movzbl	3(%esp), %edx
	movb	%dl, 22(%esi)
	.loc 1 951 0
	movl	8(%esp), %ebx
	movl	12(%esp), %esi
LVL24:
	movl	16(%esp), %edi
	movl	20(%esp), %ebp
	addl	$24, %esp
	ret
LVL25:
	.p2align 4,,7
L12:
	.loc 1 940 0
	movl	%eax, %edx
LVL26:
	andl	$15, %edx
	shrl	$4, %eax
LVL27:
	movb	%dl, 5(%esp)
	movl	%eax, %edx
LVL28:
	andl	$1, %edx
	shrl	%eax
LVL29:
	movb	%dl, 6(%esp)
	movl	%eax, %edx
LVL30:
	andl	$3, %edx
	shrl	$2, %eax
LVL31:
	movb	%dl, 7(%esp)
	movl	%eax, %edx
LVL32:
	andl	$1, %edx
	shrl	$5, %eax
LVL33:
	movl	%edx, %ebp
	movl	%eax, %edx
LVL34:
	shrl	%eax
LVL35:
	andl	$1, %edx
	movl	%eax, %ebx
LVL36:
	movl	%edx, %edi
	shrl	%eax
LVL37:
	andl	$1, %ebx
	movl	%eax, %ecx
LVL38:
	shrl	%eax
LVL39:
	andl	$1, %ecx
	movl	%eax, %edx
LVL40:
	shrl	%eax
LVL41:
	andl	$1, %edx
	andl	$1, %eax
LVL42:
	movb	%al, 3(%esp)
	jmp	L13
LFE164:
	.p2align 4,,15
	.def	_vmx_get_cs_db_l_bits;	.scl	3;	.type	32;	.endef
_vmx_get_cs_db_l_bits:
LFB166:
	.loc 1 980 0
LVL43:
LBB853:
LBB854:
LBB855:
LBB856:
	.loc 1 157 0
	movl	$18454, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
LBE856:
LBE855:
LBE854:
LBE853:
	.loc 1 983 0
	movl	8(%esp), %edx
LBB860:
LBB859:
LBB858:
LBB857:
	.loc 1 157 0
	movl	%eax, %ecx
LVL44:
LBE857:
LBE858:
LBE859:
LBE860:
	.loc 1 983 0
	shrl	$14, %eax
	andl	$1, %eax
	.loc 1 984 0
	shrl	$13, %ecx
	.loc 1 983 0
	movl	%eax, (%edx)
	.loc 1 984 0
	movl	12(%esp), %eax
	andl	$1, %ecx
	movl	%ecx, (%eax)
	.loc 1 985 0
	ret
LFE166:
	.p2align 4,,15
	.def	_vmx_get_idt;	.scl	3;	.type	32;	.endef
_vmx_get_idt:
LFB167:
	.loc 1 988 0
LVL45:
	.loc 1 988 0
	movl	8(%esp), %ecx
LBB861:
LBB862:
LBB863:
LBB864:
	.loc 1 157 0
	movl	$18450, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL46:
/NO_APP
LBE864:
LBE863:
LBE862:
LBE861:
	.loc 1 989 0
	movw	%ax, (%ecx)
LBB865:
LBB866:
	.loc 1 157 0
	movw	$26648, %dx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL47:
/NO_APP
LBE866:
LBE865:
	.loc 1 990 0
	movl	%eax, 2(%ecx)
	.loc 1 991 0
	ret
LFE167:
	.p2align 4,,15
	.def	_vmx_get_gdt;	.scl	3;	.type	32;	.endef
_vmx_get_gdt:
LFB169:
	.loc 1 1000 0
LVL48:
	.loc 1 1000 0
	movl	8(%esp), %ecx
LBB867:
LBB868:
LBB869:
LBB870:
	.loc 1 157 0
	movl	$18448, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL49:
/NO_APP
LBE870:
LBE869:
LBE868:
LBE867:
	.loc 1 1001 0
	movw	%ax, (%ecx)
LBB871:
LBB872:
	.loc 1 157 0
	movw	$26646, %dx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL50:
/NO_APP
LBE872:
LBE871:
	.loc 1 1002 0
	movl	%eax, 2(%ecx)
	.loc 1 1003 0
	ret
LFE169:
	.p2align 4,,15
	.def	_handle_external_interrupt;	.scl	3;	.type	32;	.endef
_handle_external_interrupt:
LFB181:
	.loc 1 1526 0
LVL51:
	.loc 1 1527 0
	addl	$1, _kvm_stat+44
	.loc 1 1529 0
	movl	$1, %eax
	ret
LFE181:
	.p2align 4,,15
	.def	_handle_triple_fault;	.scl	3;	.type	32;	.endef
_handle_triple_fault:
LFB182:
	.loc 1 1532 0
LVL52:
	.loc 1 1533 0
	movl	8(%esp), %eax
	movl	$8, 32(%eax)
	.loc 1 1535 0
	xorl	%eax, %eax
	ret
LFE182:
	.p2align 4,,15
	.def	_vmx_patch_hypercall;	.scl	3;	.type	32;	.endef
_vmx_patch_hypercall:
LFB185:
	.loc 1 1612 0
LVL53:
	.loc 1 1612 0
	movl	8(%esp), %eax
	.loc 1 1616 0
	movb	$15, (%eax)
	.loc 1 1617 0
	movb	$1, 1(%eax)
	.loc 1 1618 0
	movb	$-63, 2(%eax)
	.loc 1 1619 0
	movb	$-61, 3(%eax)
	.loc 1 1620 0
	ret
LFE185:
	.p2align 4,,15
	.def	_handle_cpuid;	.scl	3;	.type	32;	.endef
_handle_cpuid:
LFB188:
	.loc 1 1724 0
LVL54:
	.loc 1 1725 0
	movl	8(%esp), %eax
	movl	$3, 32(%eax)
	.loc 1 1727 0
	xorl	%eax, %eax
	ret
LFE188:
	.p2align 4,,15
	.def	_handle_interrupt_window;	.scl	3;	.type	32;	.endef
_handle_interrupt_window:
LFB192:
	.loc 1 1775 0
LVL55:
	.loc 1 1775 0
	movl	8(%esp), %eax
	.loc 1 1780 0
	cmpb	$0, 20(%eax)
	je	L31
LVL56:
	movl	4(%esp), %edx
	movl	24(%edx), %edx
	testl	%edx, %edx
	jne	L31
	.loc 1 1782 0
	movl	$7, 32(%eax)
	.loc 1 1783 0
	xorl	%eax, %eax
LVL57:
	addl	$1, _kvm_stat+32
	ret
LVL58:
	.p2align 4,,7
L31:
	.loc 1 1784 0
	movl	$1, %eax
LVL59:
	.loc 1 1787 0
	ret
LFE192:
	.p2align 4,,15
.globl _vmx_exit
	.def	_vmx_exit;	.scl	2;	.type	32;	.endef
_vmx_exit:
LFB204:
	.loc 1 2352 0
	.loc 1 2354 0
	jmp	_kvm_exit_arch
LFE204:
	.p2align 4,,15
.globl _vmx_init
	.def	_vmx_init;	.scl	2;	.type	32;	.endef
_vmx_init:
LFB203:
	.loc 1 2335 0
	subl	$16, %esp
LCFI5:
	.loc 1 2336 0
	movl	$30, 12(%esp)
	movl	$20, 8(%esp)
	movl	$10, 4(%esp)
	movl	$___FUNCTION__.3857, (%esp)
	call	_test_call
	.loc 1 2337 0
	movl	$8, 4(%esp)
	movl	$4, (%esp)
	call	_test_size
	.loc 1 2338 0
	movl	$0, (%esp)
	call	_test_nullcheck
	.loc 1 2339 0
	movl	$-4096, 8(%esp)
	movl	$12, 4(%esp)
	movl	$4096, (%esp)
	call	_check_page_compatible
	.loc 1 2341 0
	movl	$0, 4(%esp)
	movl	$_vmx_arch_ops, (%esp)
	call	_kvm_init_arch
	.loc 1 2342 0
	addl	$16, %esp
	ret
LFE203:
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "<3>vmwrite error: reg %lx value %lx (err %d)\12\0"
	.text
	.p2align 4,,15
	.def	_vmwrite_error;	.scl	3;	.type	32;	.endef
_vmwrite_error:
LFB120:
	.loc 1 182 0
LVL60:
	subl	$24, %esp
LCFI6:
LBB873:
LBB874:
LBB875:
LBB876:
	.loc 1 157 0
	movl	$17408, %ecx
LBE876:
LBE875:
LBE874:
LBE873:
	.loc 1 182 0
	movl	%ebx, 16(%esp)
LCFI7:
	movl	%eax, %ebx
	movl	%esi, 20(%esp)
LCFI8:
	.loc 1 182 0
	movl	%edx, %esi
LBB880:
LBB879:
LBB878:
LBB877:
	.loc 1 157 0
	movl	%ecx, %edx
LVL61:
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL62:
/NO_APP
LBE877:
LBE878:
LBE879:
LBE880:
	.loc 1 183 0
	movl	%esi, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	%eax, 12(%esp)
LVL63:
	movl	$LC0, (%esp)
	call	_printk
LVL64:
	.loc 1 186 0
	movl	16(%esp), %ebx
LVL65:
	movl	20(%esp), %esi
LVL66:
	addl	$24, %esp
	ret
LFE120:
	.p2align 4,,15
	.def	_vmcs_writel;	.scl	3;	.type	32;	.endef
_vmcs_writel:
LFB121:
	.loc 1 189 0
LVL67:
	subl	$8, %esp
LCFI9:
	movl	%eax, %ecx
	movl	%esi, 4(%esp)
LCFI10:
	.loc 1 192 0
	movl	%edx, %eax
LVL68:
	.loc 1 189 0
	movl	%edx, %esi
	movl	%ebx, (%esp)
LCFI11:
	.loc 1 192 0
	movl	%ecx, %edx
LVL69:
/APP
 # 192 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x79, 0xd0; setna %bl
 # 0 "" 2
LVL70:
	.loc 1 194 0
/NO_APP
	testb	%bl, %bl
	jne	L43
	.loc 1 196 0
	movl	(%esp), %ebx
LVL71:
	movl	4(%esp), %esi
LVL72:
	addl	$8, %esp
	ret
LVL73:
L43:
	.loc 1 195 0
	movl	%esi, %edx
	.loc 1 196 0
	movl	(%esp), %ebx
LVL74:
	.loc 1 195 0
	movl	%ecx, %eax
	.loc 1 196 0
	movl	4(%esp), %esi
LVL75:
	addl	$8, %esp
	.loc 1 195 0
	jmp	_vmwrite_error
LVL76:
LFE121:
	.p2align 4,,15
	.def	_skip_emulated_instruction;	.scl	3;	.type	32;	.endef
_skip_emulated_instruction:
LFB130:
	.loc 1 289 0
LVL77:
LBB881:
LBB882:
	.loc 1 157 0
	movl	$26654, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
	movl	%eax, %ecx
LVL78:
LBE882:
LBE881:
LBB883:
LBB884:
LBB885:
LBB886:
	movw	$17420, %dx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL79:
/NO_APP
LBE886:
LBE885:
LBE884:
LBE883:
	.loc 1 295 0
	leal	(%eax,%ecx), %edx
	movl	$26654, %eax
LVL80:
	call	_vmcs_writel
LVL81:
LBB887:
LBB888:
LBB889:
LBB890:
	.loc 1 157 0
	movl	$18468, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL82:
/NO_APP
LBE890:
LBE889:
LBE888:
LBE887:
	.loc 1 302 0
	testb	$3, %al
	je	L45
LBB891:
LBB892:
	.loc 1 205 0
	andl	$-4, %eax
	movl	%eax, %edx
	movl	$18468, %eax
LVL83:
	call	_vmcs_writel
LVL84:
L45:
LBE892:
LBE891:
	.loc 1 305 0
	movl	4(%esp), %eax
LVL85:
	movl	$1, 20(%eax)
	.loc 1 306 0
	ret
LFE130:
	.p2align 4,,15
	.def	_handle_halt;	.scl	3;	.type	32;	.endef
_handle_halt:
LFB193:
	.loc 1 1790 0
LVL86:
	pushl	%ebx
LCFI12:
	subl	$4, %esp
LCFI13:
	.loc 1 1790 0
	movl	12(%esp), %ebx
	.loc 1 1791 0
	movl	%ebx, (%esp)
	call	_skip_emulated_instruction
	.loc 1 1792 0
	movl	24(%ebx), %ecx
	movl	$1, %eax
	testl	%ecx, %ecx
	jne	L49
LVL87:
	.loc 1 1795 0
	movl	16(%esp), %eax
	movl	$5, 32(%eax)
	.loc 1 1796 0
	xorl	%eax, %eax
	addl	$1, _kvm_stat+36
L49:
	.loc 1 1798 0
	addl	$4, %esp
	popl	%ebx
LVL88:
	ret
LFE193:
	.p2align 4,,15
	.def	_update_exception_bitmap;	.scl	3;	.type	32;	.endef
_update_exception_bitmap:
LFB152:
	.loc 1 691 0
LVL89:
	.loc 1 692 0
	movl	14844(%eax), %eax
LVL90:
	testl	%eax, %eax
	jne	L54
LBB893:
LBB894:
	.loc 1 205 0
	movl	$16384, %edx
	movl	$16388, %eax
	jmp	_vmcs_writel
	.p2align 4,,7
L54:
LBE894:
LBE893:
LBB895:
LBB896:
	movl	$-1, %edx
	movl	$16388, %eax
	jmp	_vmcs_writel
LBE896:
LBE895:
LFE152:
	.p2align 4,,15
	.def	_vmcs_write64;	.scl	3;	.type	32;	.endef
_vmcs_write64:
LFB124:
	.loc 1 209 0
LVL91:
	subl	$8, %esp
LCFI14:
	movl	%ebx, (%esp)
LCFI15:
	movl	%eax, %ebx
	movl	%esi, 4(%esp)
LCFI16:
	.loc 1 209 0
	movl	%ecx, %esi
LVL92:
	.loc 1 213 0
	call	_vmcs_writel
LVL93:
	.loc 1 214 0
	.loc 1 215 0
	addl	$1, %ebx
LVL94:
	movl	%esi, %edx
	.loc 1 217 0
	movl	4(%esp), %esi
LVL95:
	.loc 1 215 0
	movl	%ebx, %eax
	.loc 1 217 0
	movl	(%esp), %ebx
	addl	$8, %esp
	.loc 1 215 0
	jmp	_vmcs_writel
LFE124:
	.p2align 4,,15
	.def	_seg_setup;	.scl	3;	.type	32;	.endef
_seg_setup:
LFB173:
	.loc 1 1060 0
LVL96:
	.loc 1 1061 0
	sall	$4, %eax
LVL97:
LBB897:
LBB898:
	.loc 1 200 0
	xorl	%edx, %edx
LBE898:
LBE897:
	.loc 1 1060 0
	pushl	%ebx
LCFI17:
	.loc 1 1061 0
	leal	_kvm_vmx_segment_fields(%eax), %ebx
LVL98:
LBB900:
LBB899:
	.loc 1 200 0
	movl	_kvm_vmx_segment_fields(%eax), %eax
	call	_vmcs_writel
LBE899:
LBE900:
	.loc 1 1064 0
	movl	4(%ebx), %eax
	xorl	%edx, %edx
	call	_vmcs_writel
LBB901:
LBB902:
	.loc 1 205 0
	movl	8(%ebx), %eax
	movl	$65535, %edx
	call	_vmcs_writel
LBE902:
LBE901:
LBB903:
LBB904:
	movl	12(%ebx), %eax
	movl	$147, %edx
LBE904:
LBE903:
	.loc 1 1067 0
	popl	%ebx
LVL99:
LBB906:
LBB905:
	.loc 1 205 0
	jmp	_vmcs_writel
LBE905:
LBE906:
LFE173:
	.p2align 4,,15
	.def	_fix_rmode_seg;	.scl	3;	.type	32;	.endef
_fix_rmode_seg:
LFB156:
	.loc 1 754 0
LVL100:
	subl	$12, %esp
LCFI18:
	movl	%edi, 8(%esp)
LCFI19:
	movl	%eax, %edi
	.loc 1 755 0
	sall	$4, %edi
LBB907:
LBB908:
LBB909:
LBB910:
	.loc 1 157 0
	movl	_kvm_vmx_segment_fields(%edi), %ecx
LBE910:
LBE909:
LBE908:
LBE907:
	.loc 1 754 0
	movl	%ebx, (%esp)
LCFI20:
	.loc 1 755 0
	leal	_kvm_vmx_segment_fields(%edi), %ebx
LVL101:
	.loc 1 754 0
	movl	%esi, 4(%esp)
LCFI21:
	.loc 1 754 0
	movl	%edx, %esi
LBB914:
LBB913:
LBB912:
LBB911:
	.loc 1 157 0
	movl	%ecx, %edx
LVL102:
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL103:
/NO_APP
LBE911:
LBE912:
LBE913:
LBE914:
	.loc 1 757 0
	movw	%ax, (%esi)
LVL104:
LBB915:
LBB916:
	.loc 1 157 0
	movl	4(%ebx), %ecx
	movl	%ecx, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL105:
/NO_APP
LBE916:
LBE915:
	.loc 1 758 0
	movl	%eax, 2(%esi)
LVL106:
LBB917:
LBB918:
LBB919:
LBB920:
	.loc 1 157 0
	movl	8(%ebx), %ecx
	movl	%ecx, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL107:
/NO_APP
LBE920:
LBE919:
LBE918:
LBE917:
	.loc 1 759 0
	movl	%eax, 6(%esi)
LVL108:
LBB921:
LBB922:
LBB923:
LBB924:
	.loc 1 157 0
	movl	12(%ebx), %ecx
	movl	%ecx, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL109:
/NO_APP
LBE924:
LBE923:
LBE922:
LBE921:
	.loc 1 760 0
	movl	%eax, 10(%esi)
LVL110:
LBB925:
LBB926:
	.loc 1 157 0
	movl	4(%ebx), %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL111:
/NO_APP
	movl	%eax, %edx
LVL112:
LBE926:
LBE925:
LBB927:
LBB928:
	.loc 1 200 0
	movl	_kvm_vmx_segment_fields(%edi), %eax
	shrl	$4, %edx
	movzwl	%dx, %edx
LVL113:
	call	_vmcs_writel
LBE928:
LBE927:
LBB929:
LBB930:
	.loc 1 205 0
	movl	8(%ebx), %eax
	movl	$65535, %edx
	call	_vmcs_writel
LBE930:
LBE929:
LBB931:
LBB932:
	movl	12(%ebx), %eax
	movl	$243, %edx
LBE932:
LBE931:
	.loc 1 764 0
	movl	(%esp), %ebx
LVL114:
	movl	4(%esp), %esi
LVL115:
	movl	8(%esp), %edi
	addl	$12, %esp
LBB934:
LBB933:
	.loc 1 205 0
	jmp	_vmcs_writel
LBE933:
LBE934:
LFE156:
	.p2align 4,,15
	.def	_vmx_flush_tlb;	.scl	3;	.type	32;	.endef
_vmx_flush_tlb:
LFB198:
	.loc 1 2182 0
LVL116:
LBB935:
LBB936:
	.loc 1 157 0
	movl	$26626, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL117:
/NO_APP
LBE936:
LBE935:
	.loc 1 2183 0
	movl	%eax, %edx
	movl	$26626, %eax
LVL118:
	jmp	_vmcs_writel
LFE198:
	.p2align 4,,15
	.def	_vmx_set_rflags;	.scl	3;	.type	32;	.endef
_vmx_set_rflags:
LFB129:
	.loc 1 284 0
LVL119:
	.loc 1 284 0
	movl	8(%esp), %edx
	.loc 1 285 0
	movl	$26656, %eax
	jmp	_vmcs_writel
LFE129:
	.p2align 4,,15
	.def	_vcpu_put_rsp_rip;	.scl	3;	.type	32;	.endef
_vcpu_put_rsp_rip:
LFB138:
	.loc 1 473 0
LVL120:
	pushl	%ebx
LCFI22:
	.loc 1 473 0
	movl	8(%esp), %ebx
	.loc 1 474 0
	movl	$26652, %eax
	movl	76(%ebx), %edx
	call	_vmcs_writel
	.loc 1 475 0
	movl	92(%ebx), %edx
	movl	$26654, %eax
	.loc 1 476 0
	popl	%ebx
	.loc 1 475 0
	jmp	_vmcs_writel
LFE138:
	.p2align 4,,15
	.def	_handle_dr;	.scl	3;	.type	32;	.endef
_handle_dr:
LFB187:
	.loc 1 1689 0
LVL121:
	subl	$16, %esp
LCFI23:
LBB937:
LBB938:
LBB939:
LBB940:
	.loc 1 157 0
	movl	$25600, %edx
LBE940:
LBE939:
LBE938:
LBE937:
	.loc 1 1689 0
	movl	%edi, 12(%esp)
LCFI24:
	movl	20(%esp), %edi
	movl	%ebx, 4(%esp)
LCFI25:
	movl	%esi, 8(%esp)
LCFI26:
LBB946:
LBB945:
LBB942:
LBB941:
	.loc 1 157 0
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
	movl	%eax, %ecx
LVL122:
LBE941:
LBE942:
LBB943:
LBB944:
	movb	$1, %dl
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL123:
/NO_APP
LBE944:
LBE943:
	.loc 1 177 0
	movl	%ecx, %ebx
LVL124:
	movl	%eax, %esi
LVL125:
LBE945:
LBE946:
LBB947:
LBB948:
LBB951:
LBB952:
	.loc 1 157 0
	movw	$26652, %dx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL126:
/NO_APP
LBE952:
LBE951:
	.loc 1 464 0
	movl	%eax, 76(%edi)
LBB949:
LBB950:
	.loc 1 157 0
	movb	$30, %dl
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL127:
/NO_APP
LBE950:
LBE949:
LBE948:
LBE947:
	.loc 1 1702 0
	testb	$16, %cl
LBB954:
LBB953:
	.loc 1 465 0
	movl	%eax, 92(%edi)
LBE953:
LBE954:
	.loc 1 1702 0
	je	L68
LVL128:
	.loc 1 1704 0
	movl	%ecx, %eax
LVL129:
	movl	$-61456, %edx
LVL130:
	andl	$7, %eax
	cmpl	$6, %eax
	je	L72
	xorl	%edx, %edx
	cmpl	$7, %eax
	setne	%dl
LVL131:
	subl	$1, %edx
LVL132:
	andl	$1024, %edx
L72:
	.loc 1 1714 0
	shrdl	$8, %esi, %ebx
LVL133:
	movl	%ebx, %eax
LVL134:
	andl	$15, %eax
	movl	%edx, 60(%edi,%eax,4)
LVL135:
L68:
	.loc 1 1718 0
	movl	%edi, (%esp)
	call	_vcpu_put_rsp_rip
LVL136:
	.loc 1 1719 0
	movl	%edi, (%esp)
	call	_skip_emulated_instruction
	.loc 1 1721 0
	movl	$1, %eax
	movl	4(%esp), %ebx
LVL137:
	movl	8(%esp), %esi
LVL138:
	movl	12(%esp), %edi
LVL139:
	addl	$16, %esp
	ret
LFE187:
	.p2align 4,,15
	.def	_vmx_set_gdt;	.scl	3;	.type	32;	.endef
_vmx_set_gdt:
LFB170:
	.loc 1 1006 0
LVL140:
	pushl	%ebx
LCFI27:
	.loc 1 1006 0
	movl	12(%esp), %ebx
LBB955:
LBB956:
	.loc 1 205 0
	movl	$18448, %eax
	movzwl	(%ebx), %edx
	call	_vmcs_writel
LBE956:
LBE955:
	.loc 1 1008 0
	movl	2(%ebx), %edx
	movl	$26646, %eax
	.loc 1 1009 0
	popl	%ebx
	.loc 1 1008 0
	jmp	_vmcs_writel
LFE170:
	.p2align 4,,15
	.def	_vmx_set_idt;	.scl	3;	.type	32;	.endef
_vmx_set_idt:
LFB168:
	.loc 1 994 0
LVL141:
	pushl	%ebx
LCFI28:
	.loc 1 994 0
	movl	12(%esp), %ebx
LBB957:
LBB958:
	.loc 1 205 0
	movl	$18450, %eax
	movzwl	(%ebx), %edx
	call	_vmcs_writel
LBE958:
LBE957:
	.loc 1 996 0
	movl	2(%ebx), %edx
	movl	$26648, %eax
	.loc 1 997 0
	popl	%ebx
	.loc 1 996 0
	jmp	_vmcs_writel
LFE168:
	.p2align 4,,15
	.def	_vmx_set_cr4;	.scl	3;	.type	32;	.endef
_vmx_set_cr4:
LFB162:
	.loc 1 892 0
LVL142:
	subl	$8, %esp
LCFI29:
	.loc 1 893 0
	movl	$24582, %eax
	.loc 1 892 0
	movl	%ebx, (%esp)
LCFI30:
	movl	16(%esp), %ebx
	movl	%esi, 4(%esp)
LCFI31:
	.loc 1 892 0
	movl	12(%esp), %esi
	.loc 1 893 0
	movl	%ebx, %edx
	call	_vmcs_writel
	.loc 1 894 0
	movl	$26628, %eax
	cmpl	$1, 14844(%esi)
	sbbl	%edx, %edx
	addl	$8225, %edx
	orl	%ebx, %edx
	call	_vmcs_writel
	.loc 1 896 0
	movl	%ebx, 128(%esi)
	.loc 1 897 0
	movl	(%esp), %ebx
	movl	4(%esp), %esi
	addl	$8, %esp
	ret
LFE162:
	.p2align 4,,15
	.def	_vmx_set_cr3;	.scl	3;	.type	32;	.endef
_vmx_set_cr3:
LFB161:
	.loc 1 887 0
LVL143:
	.loc 1 887 0
	movl	8(%esp), %edx
	.loc 1 888 0
	movl	$26626, %eax
	jmp	_vmcs_writel
LFE161:
	.p2align 4,,15
	.def	_enter_rmode;	.scl	3;	.type	32;	.endef
_enter_rmode:
LFB157:
	.loc 1 767 0
LVL144:
	pushl	%ebx
LCFI32:
LBB959:
LBB960:
	.loc 1 157 0
	movl	$26644, %edx
LBE960:
LBE959:
	.loc 1 767 0
	movl	%eax, %ebx
	.loc 1 770 0
	movl	$1, 14844(%eax)
LBB962:
LBB961:
	.loc 1 157 0
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL145:
/NO_APP
LBE961:
LBE962:
	.loc 1 772 0
	movl	%eax, 14851(%ebx)
	.loc 1 773 0
	movl	(%ebx), %eax
LVL146:
	movl	8(%eax), %edx
	addl	12(%eax), %edx
	movl	$26644, %eax
	subl	$3, %edx
	sall	$12, %edx
	call	_vmcs_writel
LBB963:
LBB964:
LBB965:
LBB966:
	.loc 1 157 0
	movl	$18446, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL147:
/NO_APP
LBE966:
LBE965:
LBE964:
LBE963:
	.loc 1 775 0
	movl	%eax, 14855(%ebx)
LBB967:
LBB968:
	.loc 1 205 0
	movw	$8328, %dx
	movl	$18446, %eax
LVL148:
	call	_vmcs_writel
LBE968:
LBE967:
LBB969:
LBB970:
LBB971:
LBB972:
	.loc 1 157 0
	movl	$18466, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL149:
/NO_APP
LBE972:
LBE971:
LBE970:
LBE969:
	.loc 1 778 0
	movl	%eax, 14859(%ebx)
LBB973:
LBB974:
	.loc 1 205 0
	movw	$139, %dx
	movl	$18466, %eax
LVL150:
	call	_vmcs_writel
LBE974:
LBE973:
LBB975:
LBB976:
	.loc 1 157 0
	movl	$26656, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
	movl	%eax, %edx
LVL151:
LBE976:
LBE975:
	.loc 1 782 0
	andl	$12288, %eax
	shrl	$12, %eax
	.loc 1 786 0
	orl	$143360, %edx
	.loc 1 782 0
	movb	%al, 14848(%ebx)
	.loc 1 786 0
	movl	$26656, %eax
	call	_vmcs_writel
LVL152:
LBB977:
LBB978:
	.loc 1 157 0
	movl	$26628, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL153:
/NO_APP
LBE978:
LBE977:
	.loc 1 787 0
	orl	$1, %eax
	movl	%eax, %edx
	movl	$26628, %eax
LVL154:
	call	_vmcs_writel
	.loc 1 788 0
	movl	%ebx, %eax
	call	_update_exception_bitmap
LBB979:
LBB980:
	.loc 1 157 0
	movl	$26634, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL155:
/NO_APP
LBE980:
LBE979:
LBB981:
LBB982:
	.loc 1 200 0
	shrl	$4, %eax
	movzwl	%ax, %edx
	movl	$2052, %eax
LVL156:
	call	_vmcs_writel
LBE982:
LBE981:
LBB983:
LBB984:
	.loc 1 205 0
	movl	$65535, %edx
	movl	$18436, %eax
	call	_vmcs_writel
LBE984:
LBE983:
LBB985:
LBB986:
	movl	$243, %edx
	movl	$18456, %eax
	call	_vmcs_writel
LBE986:
LBE985:
LBB987:
LBB988:
	movl	$243, %edx
	movl	$18454, %eax
	call	_vmcs_writel
LBE988:
LBE987:
LBB989:
LBB990:
	movl	$65535, %edx
	movl	$18434, %eax
	call	_vmcs_writel
LBE990:
LBE989:
LBB991:
LBB992:
	.loc 1 157 0
	movl	$26632, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL157:
/NO_APP
LBE992:
LBE991:
LBB993:
LBB994:
	.loc 1 200 0
	shrl	$4, %eax
	movzwl	%ax, %edx
	movl	$2050, %eax
LVL158:
	call	_vmcs_writel
LBE994:
LBE993:
	.loc 1 798 0
	leal	14863(%ebx), %edx
	movl	$2, %eax
	call	_fix_rmode_seg
	.loc 1 799 0
	leal	14877(%ebx), %edx
	movl	$1, %eax
	call	_fix_rmode_seg
	.loc 1 800 0
	leal	14905(%ebx), %edx
	movl	$4, %eax
	call	_fix_rmode_seg
	.loc 1 801 0
	leal	14891(%ebx), %edx
	movl	$3, %eax
	.loc 1 802 0
	popl	%ebx
LVL159:
	.loc 1 801 0
	jmp	_fix_rmode_seg
LFE157:
	.p2align 4,,15
	.def	_vmx_set_cr0_no_modeswitch;	.scl	3;	.type	32;	.endef
_vmx_set_cr0_no_modeswitch:
LFB160:
	.loc 1 874 0
LVL160:
	subl	$8, %esp
LCFI33:
	movl	%esi, 4(%esp)
LCFI34:
	movl	12(%esp), %esi
	movl	%ebx, (%esp)
LCFI35:
	.loc 1 874 0
	movl	16(%esp), %ebx
	.loc 1 875 0
	movl	14844(%esi), %eax
	testl	%eax, %eax
	jne	L87
LVL161:
	testb	$1, %bl
	je	L89
L87:
	.loc 1 878 0
	movl	%ebx, %eax
	xorl	$1, %eax
	andl	$1, %eax
	movl	%eax, 14844(%esi)
	.loc 1 879 0
	movl	%esi, %eax
	call	_update_exception_bitmap
	.loc 1 880 0
	movl	%ebx, %edx
	movl	$24580, %eax
	call	_vmcs_writel
	.loc 1 881 0
	movl	%ebx, %edx
	movl	$26624, %eax
	andl	$536805342, %edx
	orl	$-2147418079, %edx
	call	_vmcs_writel
	.loc 1 883 0
	movl	%ebx, 96(%esi)
	.loc 1 884 0
	movl	(%esp), %ebx
LVL162:
	movl	4(%esp), %esi
LVL163:
	addl	$8, %esp
	ret
LVL164:
	.p2align 4,,7
L89:
	.loc 1 876 0
	movl	%esi, %eax
	call	_enter_rmode
	jmp	L87
LFE160:
	.p2align 4,,15
	.def	_fix_pmode_dataseg;	.scl	3;	.type	32;	.endef
_fix_pmode_dataseg:
LFB153:
	.loc 1 699 0
LVL165:
	movl	%eax, %ecx
	pushl	%esi
LCFI36:
	movl	%edx, %esi
	.loc 1 700 0
	sall	$4, %ecx
	.loc 1 699 0
	pushl	%ebx
LCFI37:
	.loc 1 700 0
	leal	_kvm_vmx_segment_fields(%ecx), %ebx
LVL166:
LBB995:
LBB996:
	.loc 1 157 0
	movl	4(%ebx), %edx
LVL167:
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL168:
/NO_APP
LBE996:
LBE995:
	.loc 1 702 0
	movl	2(%esi), %edx
	cmpl	%eax, %edx
	jne	L91
	andl	$16, %edx
	jne	L93
L91:
LBB997:
LBB1001:
LBB1002:
LBB1003:
LBB1004:
	.loc 1 157 0
	movl	_kvm_vmx_segment_fields(%ecx), %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL169:
/NO_APP
	movl	%eax, %edx
LVL170:
LBE1004:
LBE1003:
LBE1002:
LBE1001:
LBB998:
LBB999:
	.loc 1 205 0
	movl	12(%ebx), %eax
	andl	$3, %edx
LBE999:
LBE998:
LBE997:
	.loc 1 712 0
	popl	%ebx
LVL171:
	popl	%esi
LVL172:
LBB1006:
LBB1005:
LBB1000:
	.loc 1 205 0
	sall	$5, %edx
	orb	$-109, %dl
LVL173:
	jmp	_vmcs_writel
LVL174:
	.p2align 4,,7
L93:
LBE1000:
LBE1005:
LBE1006:
LBB1007:
LBB1008:
	.loc 1 200 0
	movl	_kvm_vmx_segment_fields(%ecx), %eax
LVL175:
	movzwl	(%esi), %edx
	call	_vmcs_writel
LBE1008:
LBE1007:
	.loc 1 704 0
	movl	2(%esi), %edx
	movl	4(%ebx), %eax
	call	_vmcs_writel
LBB1009:
LBB1010:
	.loc 1 205 0
	movl	6(%esi), %edx
	movl	8(%ebx), %eax
	call	_vmcs_writel
LBE1010:
LBE1009:
LBB1011:
LBB1012:
	movl	10(%esi), %edx
	movl	12(%ebx), %eax
LBE1012:
LBE1011:
	.loc 1 712 0
	popl	%ebx
LVL176:
	popl	%esi
LVL177:
LBB1014:
LBB1013:
	.loc 1 205 0
	jmp	_vmcs_writel
LBE1013:
LBE1014:
LFE153:
	.p2align 4,,15
	.def	_vmx_set_cr0;	.scl	3;	.type	32;	.endef
_vmx_set_cr0:
LFB159:
	.loc 1 848 0
LVL178:
	pushl	%esi
LCFI38:
	pushl	%ebx
LCFI39:
	.loc 1 848 0
	movl	12(%esp), %ebx
	movl	16(%esp), %esi
	.loc 1 849 0
	movl	14844(%ebx), %eax
	testl	%eax, %eax
	je	L95
LVL179:
	testl	$1, %esi
	jne	L99
L96:
	.loc 1 864 0
	movl	%esi, %edx
	movl	$24580, %eax
	call	_vmcs_writel
	.loc 1 865 0
	movl	%esi, %edx
	movl	$26624, %eax
	andl	$536805342, %edx
	orl	$-2147418079, %edx
	call	_vmcs_writel
	.loc 1 867 0
	movl	%esi, 96(%ebx)
	.loc 1 868 0
	popl	%ebx
LVL180:
	popl	%esi
LVL181:
	ret
LVL182:
	.p2align 4,,7
L95:
	.loc 1 852 0
	testl	$1, %esi
	jne	L96
	.loc 1 853 0
	movl	%ebx, %eax
	call	_enter_rmode
	.p2align 4,,4
	jmp	L96
	.p2align 4,,7
L99:
LBB1039:
LBB1040:
	.loc 1 720 0
	movl	14851(%ebx), %edx
	movl	$26644, %eax
	.loc 1 718 0
	movl	$0, 14844(%ebx)
	.loc 1 720 0
	call	_vmcs_writel
LBB1041:
LBB1042:
	.loc 1 205 0
	movl	14855(%ebx), %edx
	movl	$18446, %eax
	call	_vmcs_writel
LBE1042:
LBE1041:
LBB1043:
LBB1044:
	movl	14859(%ebx), %edx
	movl	$18466, %eax
	call	_vmcs_writel
LBE1044:
LBE1043:
LBB1045:
LBB1046:
	.loc 1 157 0
	movl	$26656, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
	movl	%eax, %edx
LVL183:
LBE1046:
LBE1045:
	.loc 1 727 0
	movzbl	14848(%ebx), %eax
	.loc 1 725 0
	andl	$-143361, %edx
	.loc 1 727 0
	sall	$12, %eax
	orl	%eax, %edx
	movl	$26656, %eax
	call	_vmcs_writel
LVL184:
LBB1047:
LBB1048:
	.loc 1 157 0
	movl	$26628, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
	movl	%eax, %ecx
LVL185:
LBE1048:
LBE1047:
LBB1049:
LBB1050:
	movw	$24582, %dx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL186:
/NO_APP
LBE1050:
LBE1049:
	.loc 1 729 0
	andl	$-2, %ecx
	andl	$1, %eax
	orl	%ecx, %eax
	movl	%eax, %edx
	movl	$26628, %eax
LVL187:
	call	_vmcs_writel
LVL188:
	.loc 1 732 0
	movl	%ebx, %eax
	call	_update_exception_bitmap
	.loc 1 734 0
	leal	14863(%ebx), %edx
	movl	$2, %eax
	call	_fix_pmode_dataseg
	.loc 1 735 0
	leal	14877(%ebx), %edx
	movl	$1, %eax
	call	_fix_pmode_dataseg
	.loc 1 736 0
	leal	14905(%ebx), %edx
	movl	$4, %eax
	call	_fix_pmode_dataseg
	.loc 1 737 0
	leal	14891(%ebx), %edx
	movl	$3, %eax
	call	_fix_pmode_dataseg
LBB1051:
LBB1052:
	.loc 1 200 0
	xorl	%edx, %edx
	movl	$2052, %eax
	call	_vmcs_writel
LBE1052:
LBE1051:
LBB1053:
LBB1054:
	.loc 1 205 0
	movl	$147, %edx
	movl	$18456, %eax
	call	_vmcs_writel
LBE1054:
LBE1053:
LBB1055:
LBB1056:
LBB1057:
LBB1058:
	.loc 1 157 0
	movl	$2050, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL189:
/NO_APP
LBE1058:
LBE1057:
LBE1056:
LBE1055:
LBB1059:
LBB1060:
	.loc 1 200 0
	andl	$65532, %eax
	movl	%eax, %edx
	movl	$2050, %eax
LVL190:
	call	_vmcs_writel
LBE1060:
LBE1059:
LBB1061:
LBB1062:
	.loc 1 205 0
	movl	$155, %edx
	movl	$18454, %eax
	call	_vmcs_writel
	jmp	L96
LBE1062:
LBE1061:
LBE1040:
LBE1039:
LFE159:
	.p2align 4,,15
	.def	_vmx_set_segment;	.scl	3;	.type	32;	.endef
_vmx_set_segment:
LFB165:
	.loc 1 955 0
LVL191:
	subl	$12, %esp
LCFI40:
	movl	%ebx, (%esp)
LCFI41:
	movl	24(%esp), %ebx
	movl	%esi, 4(%esp)
LCFI42:
	movl	20(%esp), %esi
	movl	%edi, 8(%esp)
LCFI43:
	.loc 1 956 0
	sall	$4, %ebx
	leal	_kvm_vmx_segment_fields(%ebx), %edi
LVL192:
	.loc 1 959 0
	movl	(%esi), %edx
	movl	4(%edi), %eax
	call	_vmcs_writel
LBB1063:
LBB1064:
	.loc 1 205 0
	movl	8(%esi), %edx
	movl	8(%edi), %eax
	call	_vmcs_writel
LBE1064:
LBE1063:
LBB1065:
LBB1066:
	.loc 1 200 0
	movzwl	12(%esi), %edx
	movl	_kvm_vmx_segment_fields(%ebx), %eax
	call	_vmcs_writel
LBE1066:
LBE1065:
	.loc 1 962 0
	movl	$65536, %edx
LVL193:
	cmpb	$0, 22(%esi)
	jne	L102
LVL194:
	.loc 1 966 0
	movzbl	18(%esi), %edx
LVL195:
	movzbl	16(%esi), %eax
	.loc 1 965 0
	movzbl	14(%esi), %ecx
	.loc 1 966 0
	andl	$1, %edx
	andl	$3, %eax
	sall	$5, %eax
	.loc 1 965 0
	andl	$15, %ecx
	.loc 1 966 0
	sall	$4, %edx
	orl	%eax, %edx
	.loc 1 968 0
	movzbl	15(%esi), %eax
	.loc 1 967 0
	orl	%ecx, %edx
	.loc 1 968 0
	sall	$7, %eax
	andl	$255, %eax
	orl	%eax, %edx
	.loc 1 969 0
	movzbl	21(%esi), %eax
	andl	$1, %eax
	sall	$12, %eax
	orl	%eax, %edx
	.loc 1 970 0
	movzbl	19(%esi), %eax
	andl	$1, %eax
	sall	$13, %eax
	orl	%eax, %edx
	.loc 1 971 0
	movzbl	17(%esi), %eax
	andl	$1, %eax
	sall	$14, %eax
	orl	%eax, %edx
	.loc 1 972 0
	movzbl	20(%esi), %eax
	sall	$15, %eax
	andl	$65535, %eax
	.loc 1 974 0
	orl	%eax, %edx
LVL196:
	jne	L102
	movl	$65536, %edx
L102:
LBB1067:
LBB1068:
	.loc 1 205 0
	movl	12(%edi), %eax
LBE1068:
LBE1067:
	.loc 1 977 0
	movl	(%esp), %ebx
	movl	4(%esp), %esi
LVL197:
	movl	8(%esp), %edi
LVL198:
	addl	$12, %esp
LBB1070:
LBB1069:
	.loc 1 205 0
	jmp	_vmcs_writel
LVL199:
LBE1069:
LBE1070:
LFE165:
	.p2align 4,,15
	.def	_set_guest_debug;	.scl	3;	.type	32;	.endef
_set_guest_debug:
LFB139:
	.loc 1 479 0
LVL200:
	subl	$20, %esp
LCFI44:
LBB1071:
LBB1072:
LBB1073:
LBB1074:
	.loc 1 157 0
	movl	$16388, %edx
LBE1074:
LBE1073:
LBE1072:
LBE1071:
	.loc 1 479 0
	movl	%esi, 8(%esp)
LCFI45:
	movl	28(%esp), %esi
	movl	%edi, 12(%esp)
LCFI46:
	movl	24(%esp), %edi
	movl	%ebx, 4(%esp)
LCFI47:
	movl	%ebp, 16(%esp)
LCFI48:
LBB1078:
LBB1077:
LBB1076:
LBB1075:
	.loc 1 157 0
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
	movl	%eax, %edx
LVL201:
LBE1075:
LBE1076:
LBE1077:
LBE1078:
	.loc 1 485 0
	movl	13756(%edi), %eax
	movl	%eax, (%esp)
LVL202:
	.loc 1 487 0
	movl	(%esi), %eax
	.loc 1 488 0
	testl	%eax, %eax
	.loc 1 487 0
	movl	%eax, 13736(%edi)
	.loc 1 488 0
	je	L105
LVL203:
	movl	$1536, %ebx
LVL204:
	xorl	%ecx, %ecx
LBB1079:
	.loc 1 496 0
	movl	$2, %ebp
L107:
	.loc 1 493 0
	movl	8(%esi,%ecx,8), %eax
	testl	%eax, %eax
	je	L106
	.loc 1 495 0
	movl	16(%esi,%ecx,8), %eax
	movl	%eax, 13740(%edi,%ecx,2)
	.loc 1 496 0
	movl	%ebp, %eax
	sall	%cl, %eax
	orl	%eax, %ebx
L106:
	addl	$2, %ecx
	.loc 1 492 0
	cmpl	$8, %ecx
	jne	L107
	.loc 1 502 0
	movl	72(%esi), %eax
	.loc 1 500 0
	movl	%edx, %ebp
	orl	$2, %ebp
LVL205:
	.loc 1 502 0
	movl	%eax, 13756(%edi)
L108:
LBE1079:
	.loc 1 508 0
	movl	(%esp), %eax
	testl	%eax, %eax
	je	L109
LVL206:
	movl	13756(%edi), %eax
	testl	%eax, %eax
	je	L112
L109:
LBB1080:
LBB1081:
	.loc 1 205 0
	movl	%ebp, %edx
	movl	$16388, %eax
	call	_vmcs_writel
LBE1081:
LBE1080:
	.loc 1 517 0
	movl	%ebx, %edx
	movl	$26650, %eax
	call	_vmcs_writel
	.loc 1 520 0
	xorl	%eax, %eax
	movl	4(%esp), %ebx
LVL207:
	movl	8(%esp), %esi
LVL208:
	movl	12(%esp), %edi
LVL209:
	movl	16(%esp), %ebp
LVL210:
	addl	$20, %esp
	ret
LVL211:
	.p2align 4,,7
L105:
	.loc 1 504 0
	movl	%edx, %ebp
	.loc 1 505 0
	movl	$1024, %ebx
LVL212:
	.loc 1 504 0
	andl	$-3, %ebp
LVL213:
	.loc 1 505 0
	movl	$0, 13756(%edi)
	jmp	L108
LVL214:
	.p2align 4,,7
L112:
LBB1082:
LBB1083:
LBB1084:
	.loc 1 157 0
	movl	$26656, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL215:
/NO_APP
LBE1084:
LBE1083:
	.loc 1 513 0
	andl	$-65793, %eax
	movl	%eax, %edx
	movl	$26656, %eax
LVL216:
	call	_vmcs_writel
	jmp	L109
LBE1082:
LFE139:
	.section .rdata,"dr"
	.align 4
LC1:
	.ascii "<7>inject_general_protection: rip 0x%lx\12\0"
	.text
	.p2align 4,,15
	.def	_vmx_inject_gp;	.scl	3;	.type	32;	.endef
_vmx_inject_gp:
LFB131:
	.loc 1 309 0
LVL217:
	pushl	%ebx
LCFI49:
LBB1085:
LBB1086:
	.loc 1 157 0
	movl	$26654, %edx
LBE1086:
LBE1085:
	.loc 1 309 0
	subl	$8, %esp
LCFI50:
	.loc 1 309 0
	movl	20(%esp), %ebx
LBB1088:
LBB1087:
	.loc 1 157 0
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL218:
/NO_APP
LBE1087:
LBE1088:
	.loc 1 310 0
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printk
LVL219:
LBB1089:
LBB1090:
	.loc 1 205 0
	movl	%ebx, %edx
	movl	$16408, %eax
	call	_vmcs_writel
LBE1090:
LBE1089:
	.loc 1 318 0
	addl	$8, %esp
LBB1091:
LBB1092:
	.loc 1 205 0
	movl	$-2147480819, %edx
LBE1092:
LBE1091:
	.loc 1 318 0
	popl	%ebx
LBB1094:
LBB1093:
	.loc 1 205 0
	movl	$16406, %eax
	jmp	_vmcs_writel
LBE1093:
LBE1094:
LFE131:
	.section .rdata,"dr"
	.align 4
LC2:
	.ascii "<7>inject_page_fault: double fault 0x%lx @ 0x%lx\12\0"
	.text
	.p2align 4,,15
	.def	_vmx_inject_page_fault;	.scl	3;	.type	32;	.endef
_vmx_inject_page_fault:
LFB199:
	.loc 1 2189 0
LVL220:
	subl	$20, %esp
LCFI51:
LBB1095:
LBB1096:
LBB1097:
LBB1098:
	.loc 1 157 0
	movl	$17416, %edx
LBE1098:
LBE1097:
LBE1096:
LBE1095:
	.loc 1 2189 0
	movl	%ebx, 12(%esp)
LCFI52:
	movl	32(%esp), %ecx
	movl	%esi, 16(%esp)
LCFI53:
	.loc 1 2189 0
	movl	24(%esp), %ebx
	movl	28(%esp), %esi
LBB1102:
LBB1101:
LBB1100:
LBB1099:
	.loc 1 157 0
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL221:
/NO_APP
LBE1099:
LBE1100:
LBE1101:
LBE1102:
	.loc 1 2194 0
	andl	$-2147481601, %eax
	.loc 1 2192 0
	addl	$1, _kvm_stat+4
	.loc 1 2194 0
	cmpl	$-2147482866, %eax
	je	L119
LVL222:
LBB1103:
LBB1104:
	.loc 1 205 0
	movl	%ecx, %edx
	movl	$16408, %eax
LVL223:
LBE1104:
LBE1103:
	.loc 1 2206 0
	movl	%esi, 100(%ebx)
LBB1106:
LBB1105:
	.loc 1 205 0
	call	_vmcs_writel
LVL224:
LBE1105:
LBE1106:
LBB1107:
LBB1109:
	movl	$-2147480818, %edx
L118:
LBE1109:
LBE1107:
	.loc 1 2214 0
	movl	12(%esp), %ebx
LVL225:
LBB1111:
LBB1108:
	.loc 1 205 0
	movl	$16406, %eax
LBE1108:
LBE1111:
	.loc 1 2214 0
	movl	16(%esp), %esi
LVL226:
	addl	$20, %esp
LBB1112:
LBB1110:
	.loc 1 205 0
	jmp	_vmcs_writel
LVL227:
	.p2align 4,,7
L119:
LBE1110:
LBE1112:
LBB1113:
LBB1114:
	.loc 1 157 0
	movw	$26654, %dx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL228:
/NO_APP
LBE1114:
LBE1113:
	.loc 1 2195 0
	movl	%eax, 8(%esp)
	movl	%esi, 4(%esp)
	movl	$LC2, (%esp)
	call	_printk
LVL229:
LBB1115:
LBB1116:
	.loc 1 205 0
	xorl	%edx, %edx
	movl	$16408, %eax
	call	_vmcs_writel
LBE1116:
LBE1115:
LBB1117:
LBB1118:
	movl	$-2147480824, %edx
	jmp	L118
LBE1118:
LBE1117:
LFE199:
	.section .rdata,"dr"
LC3:
	.ascii "<1>%s\12\0"
	.text
	.p2align 4,,15
	.def	_vmx_disabled_by_bios;	.scl	3;	.type	32;	.endef
_vmx_disabled_by_bios:
LFB141:
	.loc 1 530 0
	subl	$8, %esp
LCFI54:
	.loc 1 533 0
	movl	$___FUNCTION__.2776, 4(%esp)
	movl	$LC3, (%esp)
	call	_printk
LBB1119:
LBB1120:
	.file 2 "include/asm/winkvmmisc.h"
	.loc 2 161 0
	movl	$58, %ecx
/APP
 # 161 "include/asm/winkvmmisc.h" 1
	rdmsr
 # 0 "" 2
LVL230:
/NO_APP
	andl	$5, %eax
LVL231:
	subl	$1, %eax
	sete	%al
LBE1120:
LBE1119:
	.loc 1 537 0
	addl	$8, %esp
LBB1122:
LBB1121:
	.loc 2 161 0
	movzbl	%al, %eax
LBE1121:
LBE1122:
	.loc 1 537 0
	ret
LFE141:
	.p2align 4,,15
	.def	_cpu_has_kvm_support;	.scl	3;	.type	32;	.endef
_cpu_has_kvm_support:
LFB140:
	.loc 1 523 0
	pushl	%ebx
LCFI55:
LBB1123:
LBB1125:
LBB1127:
LBB1129:
LBB1131:
LBB1133:
	.loc 2 52 0
	movl	$1, %eax
LVL232:
LBE1133:
LBE1131:
LBE1129:
LBE1127:
LBE1125:
LBE1123:
	.loc 1 523 0
	subl	$12, %esp
LCFI56:
LBB1139:
LBB1124:
LBB1126:
LBB1128:
LBB1130:
LBB1132:
	.loc 2 52 0
	xorl	%ecx, %ecx
LVL233:
LBE1132:
LBE1130:
LBE1128:
LBE1126:
LBE1124:
LBE1139:
	.loc 1 525 0
	movl	$___FUNCTION__.2768, 4(%esp)
LBB1140:
LBB1138:
LBB1137:
LBB1136:
LBB1135:
LBB1134:
	.loc 2 52 0
/APP
 # 52 "include/asm/winkvmmisc.h" 1
	cpuid
 # 0 "" 2
LVL234:
/NO_APP
LBE1134:
LBE1135:
LBE1136:
LBE1137:
LBE1138:
LBE1140:
	.loc 1 525 0
	movl	$LC3, (%esp)
	.loc 1 524 0
	movl	%ecx, 8(%esp)
LVL235:
	.loc 1 525 0
	call	_printk
LVL236:
LBB1141:
LBB1142:
	.file 3 "include/linux/winkvmstab.h"
	.loc 3 310 0
/APP
 # 310 "include/linux/winkvmstab.h" 1
	btl $5,8(%esp); setc %al
 # 0 "" 2
LVL237:
/NO_APP
LBE1142:
LBE1141:
	.loc 1 527 0
	addl	$12, %esp
LBB1144:
LBB1143:
	.loc 3 310 0
	movzbl	%al, %eax
LVL238:
LVL239:
LBE1143:
LBE1144:
	.loc 1 527 0
	popl	%ebx
LVL240:
	ret
LFE140:
	.section .rdata,"dr"
LC4:
	.ascii "<7>%s: gfn_to_page failed\12\0"
LC5:
	.ascii "<7>kvm: msrs: %d\12\0"
	.text
	.p2align 4,,15
	.def	_vmx_vcpu_setup;	.scl	3;	.type	32;	.endef
_vmx_vcpu_setup:
LFB174:
	.loc 1 1076 0
LVL241:
	pushl	%ebp
LCFI57:
	pushl	%edi
LCFI58:
	pushl	%esi
LCFI59:
	pushl	%ebx
LCFI60:
	subl	$52, %esp
LCFI61:
	.loc 1 1087 0
	movl	72(%esp), %eax
	movl	(%eax), %edi
LBB1305:
LBB1307:
	.loc 1 1014 0
	movl	8(%edi), %eax
	addl	12(%edi), %eax
LBB1308:
	.file 4 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h"
	.loc 4 541 0
	movl	%edi, (%esp)
LBE1308:
	.loc 1 1014 0
	leal	-3(%eax), %ebx
LVL242:
	sall	$12, %ebx
	sarl	$12, %ebx
LBB1310:
	.loc 4 541 0
	movl	%ebx, 4(%esp)
LBE1310:
	.loc 1 1019 0
	leal	1(%ebx), %esi
LVL243:
LBB1311:
	.loc 4 541 0
	call	_gfn_to_memslot
LBB1309:
	.loc 4 542 0
	movl	$0, 28(%esp)
LVL244:
	movb	$1, 35(%esp)
	testl	%eax, %eax
LVL245:
	je	L126
	subl	(%eax), %ebx
LVL246:
	movl	12(%eax), %eax
LVL247:
	movl	(%eax,%ebx,4), %eax
	testl	%eax, %eax
	movl	%eax, 28(%esp)
LVL248:
	sete	35(%esp)
LVL249:
L126:
LBE1309:
LBE1311:
LBB1312:
	.loc 4 541 0
	movl	%esi, 4(%esp)
LBE1312:
	.loc 1 1020 0
	leal	1(%esi), %ebx
LVL250:
LBB1315:
LBB1313:
	.loc 4 542 0
	movl	$1, %ebp
LBE1313:
	.loc 4 541 0
	movl	%edi, (%esp)
	call	_gfn_to_memslot
LVL251:
LBB1314:
	.loc 4 542 0
	movl	$0, 24(%esp)
LVL252:
	testl	%eax, %eax
LVL253:
	je	L128
	subl	(%eax), %esi
LVL254:
	movl	12(%eax), %eax
LVL255:
	movl	(%eax,%esi,4), %eax
	testl	%eax, %eax
	sete	%dl
	movl	%eax, 24(%esp)
LVL256:
	movl	%edx, %ebp
LVL257:
L128:
LBE1314:
LBE1315:
LBB1316:
	.loc 4 541 0
	movl	%ebx, 4(%esp)
LBB1317:
	.loc 4 542 0
	xorl	%esi, %esi
LVL258:
LBE1317:
	.loc 4 541 0
	movl	%edi, (%esp)
	call	_gfn_to_memslot
LVL259:
LBB1318:
	.loc 4 542 0
	testl	%eax, %eax
LVL260:
	je	L130
	subl	(%eax), %ebx
	movl	12(%eax), %eax
LVL261:
	movl	(%eax,%ebx,4), %esi
LVL262:
L130:
LBE1318:
LBE1316:
	.loc 1 1023 0
	movl	%ebp, %ecx
	testb	%cl, %cl
	jne	L131
	cmpb	$0, 35(%esp)
	jne	L131
	testl	%esi, %esi
	je	L131
LBE1307:
	.loc 1 1029 0
	movl	28(%esp), %edi
	movl	$3, 4(%esp)
	movl	%edi, (%esp)
	call	_kmap_atomic
LVL263:
LBB1319:
	.loc 1 1030 0
	movl	$4096, 8(%esp)
	movl	$0, 4(%esp)
LBE1319:
	.loc 1 1029 0
	movl	%eax, %ebx
LVL264:
LBB1320:
	.loc 1 1030 0
	movl	%eax, (%esp)
	call	_memset
	.loc 1 1031 0
	movw	$136, 102(%ebx)
	.loc 1 1032 0
	movl	%ebx, (%esp)
	movl	$3, 4(%esp)
	call	_kunmap_atomic
LBE1320:
	.loc 1 1034 0
	movl	24(%esp), %eax
	movl	$3, 4(%esp)
	movl	%eax, (%esp)
	call	_kmap_atomic
LBB1321:
	.loc 1 1035 0
	movl	$4096, 8(%esp)
	movl	$0, 4(%esp)
LBE1321:
	.loc 1 1034 0
	movl	%eax, %ebx
LBB1322:
	.loc 1 1035 0
	movl	%eax, (%esp)
	call	_memset
	.loc 1 1036 0
	movl	%ebx, (%esp)
	movl	$3, 4(%esp)
	call	_kunmap_atomic
LBE1322:
	.loc 1 1038 0
	movl	$3, 4(%esp)
	movl	%esi, (%esp)
	call	_kmap_atomic
LBB1323:
	.loc 1 1039 0
	movl	$4096, 8(%esp)
	movl	$0, 4(%esp)
LBE1323:
	.loc 1 1038 0
	movl	%eax, %ebx
LBB1324:
	.loc 1 1039 0
	movl	%eax, (%esp)
	call	_memset
	.loc 1 1040 0
	movb	$-1, 136(%ebx)
	.loc 1 1041 0
	movl	$3, 4(%esp)
	movl	%ebx, (%esp)
	call	_kunmap_atomic
LBE1324:
LBE1305:
	.loc 1 1092 0
	movl	72(%esp), %eax
	movl	$32, 8(%esp)
	movl	$0, 4(%esp)
	addl	$60, %eax
	movl	%eax, (%esp)
	call	_memset
	.loc 1 1093 0
	movl	72(%esp), %edx
	movl	$1536, 68(%edx)
	.loc 1 1094 0
	movl	$0, 132(%edx)
	.loc 1 1095 0
	movl	$-18872064, 176(%edx)
	movl	$0, 180(%edx)
	.loc 1 1099 0
	movl	%edx, (%esp)
	call	_fx_init
LBB1326:
LBB1327:
	.loc 1 200 0
	movl	$61440, %edx
	movl	$2050, %eax
	call	_vmcs_writel
LBE1327:
LBE1326:
	.loc 1 1106 0
	movl	$983040, %edx
	movl	$26632, %eax
	call	_vmcs_writel
LBB1328:
LBB1329:
	.loc 1 205 0
	movl	$65535, %edx
	movl	$18434, %eax
	call	_vmcs_writel
LBE1329:
LBE1328:
LBB1330:
LBB1331:
	movl	$155, %edx
	movl	$18454, %eax
	call	_vmcs_writel
LBE1331:
LBE1330:
	.loc 1 1110 0
	movl	$1, %eax
	call	_seg_setup
	.loc 1 1111 0
	movl	$2, %eax
	call	_seg_setup
	.loc 1 1112 0
	movl	$3, %eax
	call	_seg_setup
	.loc 1 1113 0
	movl	$4, %eax
	call	_seg_setup
	.loc 1 1114 0
	movl	$5, %eax
	call	_seg_setup
LBB1332:
LBB1333:
	.loc 1 200 0
	xorl	%edx, %edx
	movl	$2062, %eax
	call	_vmcs_writel
LBE1333:
LBE1332:
	.loc 1 1117 0
	xorl	%edx, %edx
	movl	$26644, %eax
	call	_vmcs_writel
LBB1334:
LBB1335:
	.loc 1 205 0
	movl	$65535, %edx
	movl	$18446, %eax
	call	_vmcs_writel
LBE1335:
LBE1334:
LBB1336:
LBB1337:
	movl	$139, %edx
	movl	$18466, %eax
	call	_vmcs_writel
LBE1337:
LBE1336:
LBB1338:
LBB1339:
	.loc 1 200 0
	xorl	%edx, %edx
	movl	$2060, %eax
	call	_vmcs_writel
LBE1339:
LBE1338:
	.loc 1 1122 0
	xorl	%edx, %edx
	movl	$26642, %eax
	call	_vmcs_writel
LBB1340:
LBB1341:
	.loc 1 205 0
	movl	$65535, %edx
	movl	$18444, %eax
	call	_vmcs_writel
LBE1341:
LBE1340:
LBB1342:
LBB1343:
	movl	$130, %edx
	movl	$18464, %eax
	call	_vmcs_writel
LBE1343:
LBE1342:
LBB1344:
LBB1345:
	xorl	%edx, %edx
	movl	$18474, %eax
	call	_vmcs_writel
LBE1345:
LBE1344:
	.loc 1 1127 0
	xorl	%edx, %edx
	movl	$26660, %eax
	call	_vmcs_writel
	.loc 1 1128 0
	xorl	%edx, %edx
	movl	$26662, %eax
	call	_vmcs_writel
	.loc 1 1130 0
	movl	$2, %edx
	movl	$26656, %eax
	call	_vmcs_writel
	.loc 1 1131 0
	movl	$65520, %edx
	movl	$26654, %eax
	call	_vmcs_writel
	.loc 1 1132 0
	xorl	%edx, %edx
	movl	$26652, %eax
	call	_vmcs_writel
	.loc 1 1135 0
	movl	$1024, %edx
	movl	$26650, %eax
	call	_vmcs_writel
	.loc 1 1137 0
	xorl	%edx, %edx
	movl	$26646, %eax
	call	_vmcs_writel
LBB1346:
LBB1347:
	.loc 1 205 0
	movl	$65535, %edx
	movl	$18448, %eax
	call	_vmcs_writel
LBE1347:
LBE1346:
	.loc 1 1140 0
	xorl	%edx, %edx
	movl	$26648, %eax
	call	_vmcs_writel
LBB1348:
LBB1349:
	.loc 1 205 0
	movl	$65535, %edx
	movl	$18450, %eax
	call	_vmcs_writel
LBE1349:
LBE1348:
LBB1350:
LBB1351:
	xorl	%edx, %edx
	movl	$18470, %eax
	call	_vmcs_writel
LBE1351:
LBE1350:
LBB1352:
LBB1353:
	xorl	%edx, %edx
	movl	$18468, %eax
	call	_vmcs_writel
LBE1353:
LBE1352:
LBB1354:
LBB1355:
	xorl	%edx, %edx
	movl	$26658, %eax
	call	_vmcs_writel
LBE1355:
LBE1354:
	.loc 1 1148 0
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$8192, %eax
	call	_vmcs_write64
	.loc 1 1149 0
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$8194, %eax
	call	_vmcs_write64
LBB1356:
LBB1357:
LBB1358:
LBB1359:
	.loc 2 217 0
/APP
 # 217 "include/asm/winkvmmisc.h" 1
	rdtsc
 # 0 "" 2
LVL265:
/NO_APP
LBE1359:
LBE1358:
	.loc 1 342 0
	negl	%eax
LVL266:
	adcl	$0, %edx
LVL267:
	negl	%edx
	movl	%edx, %ecx
	movl	%eax, %edx
LVL268:
	movl	$8208, %eax
LVL269:
	call	_vmcs_write64
LBE1357:
LBE1356:
	.loc 1 1153 0
	movl	$-1, %edx
	movl	$-1, %ecx
	movl	$10240, %eax
	call	_vmcs_write64
	.loc 1 1156 0
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	$10242, %eax
	call	_vmcs_write64
LBB1360:
LBB1361:
LBB1362:
LBB1363:
LBB1364:
	.loc 2 161 0
	movl	$1153, %ecx
/APP
 # 161 "include/asm/winkvmmisc.h" 1
	rdmsr
 # 0 "" 2
/NO_APP
	movl	%eax, %ecx
LVL270:
LBE1364:
LBE1363:
LBE1362:
	.loc 1 1054 0
	andl	$9, %edx
LBB1365:
LBB1366:
	.loc 1 205 0
	orl	%ecx, %edx
	movl	$16384, %eax
	call	_vmcs_writel
LVL271:
LBE1366:
LBE1365:
LBE1361:
LBE1360:
LBB1367:
LBB1368:
LBB1369:
LBB1370:
LBB1371:
	.loc 2 161 0
	movl	$1154, %ecx
/APP
 # 161 "include/asm/winkvmmisc.h" 1
	rdmsr
 # 0 "" 2
/NO_APP
	movl	%eax, %ecx
LVL272:
LBE1371:
LBE1370:
LBE1369:
	.loc 1 1054 0
	andl	$26738824, %edx
LBB1372:
LBB1373:
	.loc 1 205 0
	orl	%ecx, %edx
	movl	$16386, %eax
	call	_vmcs_writel
LVL273:
LBE1373:
LBE1372:
LBE1368:
LBE1367:
LBB1374:
LBB1375:
	movl	$16384, %edx
	movl	$16388, %eax
	call	_vmcs_writel
LBE1375:
LBE1374:
LBB1376:
LBB1377:
	xorl	%edx, %edx
	movl	$16390, %eax
	call	_vmcs_writel
LBE1377:
LBE1376:
LBB1378:
LBB1379:
	xorl	%edx, %edx
	movl	$16392, %eax
	call	_vmcs_writel
LBE1379:
LBE1378:
LBB1380:
LBB1381:
	xorl	%edx, %edx
	movl	$16394, %eax
	call	_vmcs_writel
LBE1381:
LBE1380:
LBB1382:
LBB1383:
	.loc 2 285 0
/APP
 # 285 "include/asm/winkvmmisc.h" 1
	movl %cr0,%edx
	
 # 0 "" 2
LVL274:
/NO_APP
LBE1383:
LBE1382:
	.loc 1 1179 0
	movl	$27648, %eax
	call	_vmcs_writel
LVL275:
LBB1384:
LBB1385:
	.loc 2 278 0
/APP
 # 278 "include/asm/winkvmmisc.h" 1
	movl %cr4,%edx
	
 # 0 "" 2
LVL276:
/NO_APP
LBE1385:
LBE1384:
	.loc 1 1180 0
	movl	$27652, %eax
	call	_vmcs_writel
LVL277:
LBB1386:
LBB1387:
	.loc 2 309 0
/APP
 # 309 "include/asm/winkvmmisc.h" 1
	movl %cr3,%edx
	
 # 0 "" 2
LVL278:
/NO_APP
LBE1387:
LBE1386:
	.loc 1 1181 0
	movl	$27650, %eax
	call	_vmcs_writel
LVL279:
LBB1388:
LBB1389:
	.loc 2 332 0
/APP
 # 332 "include/asm/winkvmmisc.h" 1
	mov %cs, %dx
 # 0 "" 2
LVL280:
/NO_APP
LBE1389:
LBE1388:
LBB1390:
LBB1391:
	.loc 1 200 0
	movl	$3074, %eax
	movzwl	%dx, %edx
LVL281:
	call	_vmcs_writel
LVL282:
LBE1391:
LBE1390:
LBB1392:
LBB1393:
	.loc 2 346 0
/APP
 # 346 "include/asm/winkvmmisc.h" 1
	mov %ds, %dx
 # 0 "" 2
LVL283:
/NO_APP
LBE1393:
LBE1392:
LBB1394:
LBB1395:
	.loc 1 200 0
	movl	$3078, %eax
	andl	$65532, %edx
LVL284:
	call	_vmcs_writel
LBE1395:
LBE1394:
LBB1396:
LBB1397:
	.loc 2 325 0
/APP
 # 325 "include/asm/winkvmmisc.h" 1
	mov %es, %dx
 # 0 "" 2
LVL285:
/NO_APP
LBE1397:
LBE1396:
LBB1398:
LBB1399:
	.loc 1 200 0
	movl	$3072, %eax
	andl	$65532, %edx
LVL286:
	call	_vmcs_writel
LBE1399:
LBE1398:
LBB1400:
LBB1401:
	movl	$3080, %eax
LBE1401:
LBE1400:
LBB1403:
LBB1404:
	.loc 4 584 0
/APP
 # 584 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	mov %fs, %dx
 # 0 "" 2
LVL287:
/NO_APP
LBE1404:
LBE1403:
LBB1405:
LBB1402:
	.loc 1 200 0
	movzwl	%dx, %edx
LVL288:
	call	_vmcs_writel
LVL289:
LBE1402:
LBE1405:
LBB1406:
LBB1407:
	movl	$3082, %eax
LBE1407:
LBE1406:
LBB1409:
LBB1410:
	.loc 4 591 0
/APP
 # 591 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	mov %gs, %dx
 # 0 "" 2
LVL290:
/NO_APP
LBE1410:
LBE1409:
LBB1411:
LBB1408:
	.loc 1 200 0
	movzwl	%dx, %edx
LVL291:
	call	_vmcs_writel
LVL292:
LBE1408:
LBE1411:
LBB1412:
LBB1413:
	.loc 2 339 0
/APP
 # 339 "include/asm/winkvmmisc.h" 1
	mov %ss, %dx
 # 0 "" 2
LVL293:
/NO_APP
LBE1413:
LBE1412:
LBB1414:
LBB1415:
	.loc 1 200 0
	movl	$3076, %eax
	movzwl	%dx, %edx
LVL294:
	call	_vmcs_writel
LVL295:
LBE1415:
LBE1414:
LBB1416:
LBB1417:
LBB1418:
LBB1419:
	.loc 2 353 0
/APP
 # 353 "include/asm/winkvmmisc.h" 1
	mov %fs, %cx
 # 0 "" 2
LVL296:
/NO_APP
LBE1419:
LBE1418:
	.loc 2 376 0
	shrw	$3, %cx
	movzwl	%cx, %ecx
LVL297:
LBB1420:
LBB1421:
	.loc 2 255 0
/APP
 # 255 "include/asm/winkvmmisc.h" 1
	sgdt 38(%esp)
 # 0 "" 2
/NO_APP
LBE1421:
LBE1420:
	.loc 2 376 0
	sall	$3, %ecx
	addl	40(%esp), %ecx
LBE1417:
LBE1416:
	.loc 1 1209 0
	movzbl	7(%ecx), %edx
	movzbl	4(%ecx), %eax
	sall	$24, %edx
	sall	$16, %eax
	orl	%eax, %edx
	movzwl	2(%ecx), %eax
	orl	%eax, %edx
	movl	$27654, %eax
	call	_vmcs_writel
LBB1422:
LBB1423:
LBB1424:
LBB1425:
	.loc 2 360 0
/APP
 # 360 "include/asm/winkvmmisc.h" 1
	mov %gs, %cx
 # 0 "" 2
LVL298:
/NO_APP
LBE1425:
LBE1424:
	.loc 2 395 0
	shrw	$3, %cx
	movzwl	%cx, %ecx
LVL299:
LBB1426:
LBB1427:
	.loc 2 255 0
/APP
 # 255 "include/asm/winkvmmisc.h" 1
	sgdt 38(%esp)
 # 0 "" 2
/NO_APP
LBE1427:
LBE1426:
	.loc 2 395 0
	sall	$3, %ecx
	addl	40(%esp), %ecx
LBE1423:
LBE1422:
	.loc 1 1210 0
	movzbl	7(%ecx), %edx
	movzbl	4(%ecx), %eax
	sall	$24, %edx
	sall	$16, %eax
	orl	%eax, %edx
	movzwl	2(%ecx), %eax
	orl	%eax, %edx
	movl	$27656, %eax
	call	_vmcs_writel
LBB1428:
LBB1429:
	.loc 1 200 0
	movl	$3084, %eax
LBE1429:
LBE1428:
LBB1431:
LBB1432:
	.loc 2 266 0
/APP
 # 266 "include/asm/winkvmmisc.h" 1
	str %edx
 # 0 "" 2
LVL300:
/NO_APP
LBE1432:
LBE1431:
LBB1433:
LBB1430:
	.loc 1 200 0
	movzwl	%dx, %edx
LVL301:
	call	_vmcs_writel
LVL302:
LBE1430:
LBE1433:
	.loc 1 1221 0
	movl	$27662, %eax
LBB1434:
LBB1435:
	.loc 4 621 0
/APP
 # 621 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	sidt 46(%esp)
 # 0 "" 2
/NO_APP
LBE1435:
LBE1434:
	.loc 1 1221 0
	movl	48(%esp), %edx
	call	_vmcs_writel
	.loc 1 1225 0
	movl	$_kvm_vmx_fake_return, %edx
	movl	$27670, %eax
	call	_vmcs_writel
LBB1436:
LBB1437:
LBB1438:
	.loc 2 161 0
	movl	$372, %ecx
/APP
 # 161 "include/asm/winkvmmisc.h" 1
	rdmsr
 # 0 "" 2
LVL303:
/NO_APP
LBE1438:
LBE1437:
LBE1436:
LBB1439:
LBB1440:
	.loc 1 205 0
	movl	%eax, %edx
	movl	$19456, %eax
LVL304:
	call	_vmcs_writel
LBE1440:
LBE1439:
LBB1441:
LBB1442:
	.loc 2 161 0
	movl	$373, %ecx
/APP
 # 161 "include/asm/winkvmmisc.h" 1
	rdmsr
 # 0 "" 2
LVL305:
/NO_APP
LBE1442:
LBE1441:
	.loc 1 1230 0
	movl	%eax, %edx
	movl	$27664, %eax
LVL306:
	call	_vmcs_writel
LBB1443:
LBB1444:
	.loc 2 161 0
	movl	$374, %ecx
/APP
 # 161 "include/asm/winkvmmisc.h" 1
	rdmsr
 # 0 "" 2
LVL307:
/NO_APP
LBE1444:
LBE1443:
	.loc 1 1232 0
	movl	%eax, %edx
	movl	$27666, %eax
LVL308:
	call	_vmcs_writel
	movl	72(%esp), %edx
	movl	$0, 20(%esp)
LVL309:
	movl	192(%edx), %ebp
LVL310:
L134:
LBB1445:
	.loc 1 1235 0
	movl	20(%esp), %ecx
	movl	_vmx_msr_index(,%ecx,4), %esi
LVL311:
LBB1446:
LBB1447:
LBB1448:
	.loc 2 161 0
	movl	%esi, %ecx
/APP
 # 161 "include/asm/winkvmmisc.h" 1
	rdmsr
 # 0 "" 2
/NO_APP
	movl	%eax, 12(%esp)
LVL312:
LBE1448:
LBE1447:
LBE1446:
LBB1451:
LBB1452:
	.loc 2 188 0
	movl	12(%esp), %eax
LBE1452:
LBE1451:
LBB1456:
LBB1450:
LBB1449:
	.loc 2 161 0
	movl	%edx, 16(%esp)
LVL313:
LBE1449:
LBE1450:
LBE1456:
LBB1457:
LBB1455:
LBB1453:
LBB1454:
	.loc 2 167 0
/APP
 # 167 "include/asm/winkvmmisc.h" 1
	wrmsr
 # 0 "" 2
/NO_APP
LBE1454:
LBE1453:
LBE1455:
LBE1457:
	.loc 1 1245 0
	movl	72(%esp), %edi
	movl	%ebp, %ecx
	sall	$4, %ecx
	movl	200(%edi), %ebx
	movl	%esi, (%ebx,%ecx)
	.loc 1 1246 0
	movl	200(%edi), %ebx
	movl	$0, 4(%ebx,%ecx)
	.loc 1 1247 0
	movl	200(%edi), %ebx
	movl	%eax, 8(%ebx,%ecx)
	movl	%edx, 12(%ebx,%ecx)
	.loc 1 1248 0
	movl	200(%edi), %edx
	movl	196(%edi), %ebx
	movl	(%edx,%ecx), %eax
	movl	%eax, (%ebx,%ecx)
	movl	4(%edx,%ecx), %eax
	movl	%eax, 4(%ebx,%ecx)
	movl	8(%edx,%ecx), %eax
	movl	%eax, 8(%ebx,%ecx)
	movl	12(%edx,%ecx), %eax
	movl	%eax, 12(%ebx,%ecx)
	.loc 1 1249 0
	movl	192(%edi), %ebp
	addl	$1, %ebp
	movl	%ebp, 192(%edi)
LBE1445:
	.loc 1 1234 0
	addl	$1, 20(%esp)
LVL314:
	cmpl	$2, 20(%esp)
	jne	L134
LVL315:
	.loc 1 1251 0
	movl	%ebp, 4(%esp)
	movl	$LC5, (%esp)
	call	_printk
LBB1458:
	.loc 3 242 0
	movl	196(%edi), %eax
LBE1458:
	.loc 1 1253 0
	movl	192(%edi), %ebx
LVL316:
LBB1459:
	.loc 3 242 0
	movl	%eax, (%esp)
	call	___pa
LBE1459:
	.loc 1 1254 0
	movl	%eax, %edx
	movl	$8202, %eax
	call	_vmcs_writel
LBB1460:
	.loc 3 242 0
	movl	196(%edi), %eax
	movl	%eax, (%esp)
	call	___pa
LBE1460:
	.loc 1 1256 0
	movl	%eax, %edx
	movl	$8198, %eax
	call	_vmcs_writel
LBB1461:
	.loc 3 242 0
	movl	200(%edi), %eax
	movl	%eax, (%esp)
	call	___pa
LBE1461:
	.loc 1 1258 0
	movl	%eax, %edx
	movl	$8200, %eax
	call	_vmcs_writel
LBB1462:
LBB1463:
LBB1464:
LBB1465:
LBB1466:
	.loc 2 161 0
	movl	$1155, %ecx
/APP
 # 161 "include/asm/winkvmmisc.h" 1
	rdmsr
 # 0 "" 2
LVL317:
/NO_APP
LBE1466:
LBE1465:
LBE1464:
LBB1467:
LBB1468:
	.loc 1 205 0
	movl	%eax, %edx
	movl	$16396, %eax
LVL318:
	call	_vmcs_writel
LBE1468:
LBE1467:
LBE1463:
LBE1462:
LBB1469:
LBB1470:
	movl	%ebx, %edx
	movl	$16398, %eax
	call	_vmcs_writel
LBE1470:
LBE1469:
LBB1471:
LBB1472:
	movl	%ebx, %edx
	movl	$16400, %eax
	call	_vmcs_writel
LBE1472:
LBE1471:
LBB1473:
LBB1474:
	movl	%ebx, %edx
	movl	$16404, %eax
	call	_vmcs_writel
LBE1474:
LBE1473:
LBB1475:
LBB1476:
LBB1477:
LBB1478:
LBB1479:
	.loc 2 161 0
	movl	$1156, %ecx
/APP
 # 161 "include/asm/winkvmmisc.h" 1
	rdmsr
 # 0 "" 2
LVL319:
/NO_APP
LBE1479:
LBE1478:
LBE1477:
LBB1480:
LBB1481:
	.loc 1 205 0
	movl	%eax, %edx
	movl	$16402, %eax
LVL320:
	call	_vmcs_writel
LBE1481:
LBE1480:
LBE1476:
LBE1475:
LBB1482:
LBB1483:
	xorl	%edx, %edx
	movl	$16406, %eax
	call	_vmcs_writel
LBE1483:
LBE1482:
	.loc 1 1277 0
	movl	$-536805343, %edx
	movl	$24576, %eax
	call	_vmcs_writel
	.loc 1 1278 0
	movl	$24578, %eax
	movl	$8369, %edx
	call	_vmcs_writel
	.loc 1 1280 0
	movl	$1610612752, 96(%edi)
	.loc 1 1281 0
	movl	%edi, (%esp)
	movl	$1610612752, 4(%esp)
	call	_vmx_set_cr0
	.loc 1 1282 0
	movl	%edi, (%esp)
	movl	$0, 4(%esp)
	call	_vmx_set_cr4
	.loc 1 1291 0
	addl	$52, %esp
	.loc 1 1282 0
	xorl	%eax, %eax
LVL321:
	.loc 1 1291 0
	popl	%ebx
LVL322:
LVL323:
	popl	%esi
LVL324:
	popl	%edi
	popl	%ebp
	ret
LVL325:
	.p2align 4,,7
L131:
LBB1484:
LBB1306:
	.loc 1 1024 0
	movl	$___FUNCTION__.3203, 4(%esp)
	movl	$LC4, (%esp)
	call	_printk
LVL326:
LBE1306:
LBE1484:
	.loc 1 1291 0
	addl	$52, %esp
LBB1485:
LBB1325:
	.loc 1 1024 0
	movl	$-12, %eax
LVL327:
LBE1325:
LBE1485:
	.loc 1 1291 0
	popl	%ebx
LVL328:
LVL329:
	popl	%esi
LVL330:
	popl	%edi
	popl	%ebp
	ret
LFE174:
	.section .rdata,"dr"
	.align 4
LC6:
	.ascii "<3>kvm: vmclear fail: %p/%llx\12\0"
	.text
	.p2align 4,,15
	.def	_vmcs_clear;	.scl	3;	.type	32;	.endef
_vmcs_clear:
LFB113:
	.loc 1 120 0
LVL331:
	pushl	%ebx
LCFI62:
	movl	%eax, %ebx
	subl	$24, %esp
LCFI63:
	.loc 1 121 0
	movl	%eax, (%esp)
	call	___pa
LVL332:
	movl	%eax, 16(%esp)
LVL333:
	.loc 1 124 0
	leal	16(%esp), %eax
LVL334:
	.loc 1 121 0
	movl	%edx, 20(%esp)
LVL335:
	.loc 1 124 0
/APP
 # 124 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x66, 0x0f, 0xc7, 0x30; setna %al
 # 0 "" 2
LVL336:
	.loc 1 127 0
/NO_APP
	testb	%al, %al
	je	L139
LVL337:
	.loc 1 128 0
	movl	16(%esp), %eax
LVL338:
	movl	20(%esp), %edx
	movl	%ebx, 4(%esp)
	movl	$LC6, (%esp)
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	call	_printk
LVL339:
L139:
	.loc 1 130 0
	addl	$24, %esp
	popl	%ebx
LVL340:
	ret
LFE113:
	.p2align 4,,15
	.def	_vmx_set_msr;	.scl	3;	.type	32;	.endef
_vmx_set_msr:
LFB136:
	.loc 1 419 0
LVL341:
	subl	$24, %esp
LCFI64:
	movl	%ebx, 8(%esp)
LCFI65:
	movl	32(%esp), %ebx
	movl	28(%esp), %eax
	movl	%edi, 16(%esp)
LCFI66:
	movl	36(%esp), %edi
	movl	%ebp, 20(%esp)
LCFI67:
	movl	40(%esp), %ebp
LVL342:
	.loc 1 421 0
	cmpl	$372, %ebx
	.loc 1 419 0
	movl	%esi, 12(%esp)
LCFI68:
	.loc 1 419 0
	movl	%eax, (%esp)
LVL343:
	.loc 1 421 0
	je	L143
LVL344:
	jbe	L157
	cmpl	$373, %ebx
	je	L144
	cmpl	$374, %ebx
	.p2align 4,,7
	jne	L141
	.loc 1 436 0
	movl	%edi, %edx
	movl	$26662, %eax
	call	_vmcs_writel
LVL345:
L150:
	.loc 1 456 0
	xorl	%eax, %eax
	movl	8(%esp), %ebx
LVL346:
	movl	12(%esp), %esi
LVL347:
	movl	16(%esp), %edi
LVL348:
	movl	20(%esp), %ebp
LVL349:
	addl	$24, %esp
	ret
LVL350:
	.p2align 4,,7
L157:
	.loc 1 421 0
	cmpl	$16, %ebx
	je	L158
L141:
LBB1486:
LBB1488:
	.loc 1 113 0
	movl	(%esp), %eax
	movl	192(%eax), %eax
	testl	%eax, %eax
	movl	%eax, 4(%esp)
	jle	L147
LVL351:
	.loc 1 114 0
	movl	(%esp), %eax
	movl	196(%eax), %esi
LVL352:
	cmpl	(%esi), %ebx
	je	L148
LBE1488:
LBE1486:
	.loc 1 446 0
	leal	16(%esi), %edx
	xorl	%ecx, %ecx
LVL353:
	jmp	L151
	.p2align 4,,7
L153:
LBB1490:
LBB1487:
	.loc 1 114 0
	movl	(%edx), %eax
LBE1487:
LBE1490:
LBB1491:
LBB1492:
	.loc 1 443 0
	movl	%edx, %esi
LBE1492:
LBE1491:
LBB1496:
LBB1489:
	.loc 1 114 0
	addl	$16, %edx
	cmpl	%eax, %ebx
	je	L148
L151:
	.loc 1 113 0
	addl	$1, %ecx
	cmpl	4(%esp), %ecx
	jl	L153
L147:
LBE1489:
LBE1496:
	.loc 1 450 0
	movl	(%esp), %eax
	movl	%edi, 36(%esp)
	.loc 1 456 0
	movl	12(%esp), %esi
LVL354:
	.loc 1 450 0
	movl	%ebp, 40(%esp)
	.loc 1 456 0
	movl	16(%esp), %edi
LVL355:
	.loc 1 450 0
	movl	%ebx, 32(%esp)
	.loc 1 456 0
	movl	20(%esp), %ebp
LVL356:
	.loc 1 450 0
	movl	%eax, 28(%esp)
	.loc 1 456 0
	movl	8(%esp), %ebx
LVL357:
	addl	$24, %esp
	.loc 1 450 0
	jmp	_kvm_set_msr_common
LVL358:
	.p2align 4,,7
L144:
	.loc 1 439 0
	movl	%edi, %edx
	movl	$26660, %eax
	call	_vmcs_writel
	jmp	L150
	.p2align 4,,7
L143:
LBB1497:
LBB1498:
	.loc 1 205 0
	movl	%edi, %edx
	movl	$18474, %eax
	call	_vmcs_writel
	.p2align 4,,4
	jmp	L150
	.p2align 4,,7
L158:
LBE1498:
LBE1497:
LBB1499:
LBB1495:
LBB1493:
LBB1494:
	.loc 2 217 0
/APP
 # 217 "include/asm/winkvmmisc.h" 1
	rdtsc
 # 0 "" 2
LVL359:
/NO_APP
LBE1494:
LBE1493:
	.loc 1 342 0
	subl	%eax, %edi
LVL360:
	movl	$8208, %eax
LVL361:
	sbbl	%edx, %ebp
LVL362:
	movl	%edi, %edx
LVL363:
	movl	%ebp, %ecx
	call	_vmcs_write64
	jmp	L150
LVL364:
	.p2align 4,,7
L148:
LBE1495:
LBE1499:
	.loc 1 446 0
	testl	%esi, %esi
	je	L147
	.loc 1 447 0
	movl	%edi, 8(%esi)
	movl	%ebp, 12(%esi)
	.p2align 4,,5
	jmp	L150
LFE136:
	.p2align 4,,15
	.def	_handle_wrmsr;	.scl	3;	.type	32;	.endef
_handle_wrmsr:
LFB190:
	.loc 1 1747 0
LVL365:
	subl	$24, %esp
LCFI69:
	movl	%esi, 20(%esp)
LCFI70:
	movl	28(%esp), %esi
	movl	%ebx, 16(%esp)
LCFI71:
	.loc 1 1752 0
	movl	60(%esi), %eax
	movl	68(%esi), %ecx
	movl	%eax, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	64(%esi), %eax
	movl	%esi, (%esp)
	movl	%eax, 4(%esp)
	call	_vmx_set_msr
	testl	%eax, %eax
	jne	L163
LVL366:
	.loc 1 1757 0
	movl	%esi, (%esp)
	call	_skip_emulated_instruction
L161:
	.loc 1 1759 0
	movl	$1, %eax
	movl	16(%esp), %ebx
	movl	20(%esp), %esi
LVL367:
	addl	$24, %esp
	ret
LVL368:
	.p2align 4,,7
L163:
	.loc 1 1753 0
	movl	$0, 4(%esp)
	movl	%esi, (%esp)
	call	_vmx_inject_gp
	jmp	L161
LFE190:
	.section .rdata,"dr"
	.align 4
LC7:
	.ascii "<3>BUG: get_msr called with NULL pdata\12\0"
	.text
	.p2align 4,,15
	.def	_vmx_get_msr;	.scl	3;	.type	32;	.endef
_vmx_get_msr:
LFB135:
	.loc 1 368 0
LVL369:
	subl	$24, %esp
LCFI72:
	movl	%ebp, 20(%esp)
LCFI73:
	movl	36(%esp), %ebp
	movl	28(%esp), %eax
	movl	%esi, 12(%esp)
LCFI74:
	movl	32(%esp), %esi
	movl	%ebx, 8(%esp)
LCFI75:
	.loc 1 372 0
	testl	%ebp, %ebp
	.loc 1 368 0
	movl	%edi, 16(%esp)
LCFI76:
	.loc 1 368 0
	movl	%eax, 4(%esp)
LVL370:
	.loc 1 372 0
	je	L183
LVL371:
	.loc 1 377 0
	cmpl	$372, %esi
	je	L169
	jbe	L184
	cmpl	$373, %esi
	.p2align 4,,7
	je	L170
	cmpl	$374, %esi
	.p2align 4,,7
	jne	L167
LBB1500:
LBB1501:
	.loc 1 157 0
	movl	$26662, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL372:
/NO_APP
LBE1501:
LBE1500:
	.loc 1 395 0
	xorl	%edi, %edi
LVL373:
	movl	%eax, %esi
LVL374:
L176:
	.loc 1 409 0
	movl	%esi, (%ebp)
	xorl	%eax, %eax
LVL375:
	movl	%edi, 4(%ebp)
LVL376:
L166:
	.loc 1 411 0
	movl	8(%esp), %ebx
LVL377:
	movl	12(%esp), %esi
LVL378:
	movl	16(%esp), %edi
LVL379:
	movl	20(%esp), %ebp
LVL380:
	addl	$24, %esp
	ret
LVL381:
	.p2align 4,,7
L184:
	.loc 1 377 0
	cmpl	$16, %esi
	je	L185
L167:
LBB1502:
LBB1504:
	.loc 1 113 0
	movl	4(%esp), %edx
	movl	192(%edx), %edi
	testl	%edi, %edi
	jle	L173
LVL382:
	.loc 1 114 0
	movl	196(%edx), %edx
LVL383:
	cmpl	(%edx), %esi
	je	L174
LBE1504:
LBE1502:
	.loc 1 402 0
	leal	16(%edx), %ecx
	xorl	%ebx, %ebx
LVL384:
	jmp	L177
	.p2align 4,,7
L179:
LBB1506:
LBB1503:
	.loc 1 114 0
	movl	(%ecx), %eax
LBE1503:
LBE1506:
	.loc 1 399 0
	movl	%ecx, %edx
LBB1507:
LBB1505:
	.loc 1 114 0
	addl	$16, %ecx
	cmpl	%eax, %esi
	je	L174
L177:
	.loc 1 113 0
	addl	$1, %ebx
	cmpl	%edi, %ebx
	jl	L179
L173:
LBE1505:
LBE1507:
	.loc 1 406 0
	movl	4(%esp), %edx
LVL385:
	movl	%ebp, 36(%esp)
	.loc 1 411 0
	movl	8(%esp), %ebx
LVL386:
	.loc 1 406 0
	movl	%esi, 32(%esp)
	.loc 1 411 0
	movl	16(%esp), %edi
	movl	12(%esp), %esi
LVL387:
	.loc 1 406 0
	movl	%edx, 28(%esp)
	.loc 1 411 0
	movl	20(%esp), %ebp
LVL388:
	addl	$24, %esp
	.loc 1 406 0
	jmp	_kvm_get_msr_common
LVL389:
	.p2align 4,,7
L169:
LBB1508:
LBB1509:
LBB1510:
LBB1511:
	.loc 1 157 0
	movl	$18474, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL390:
/NO_APP
LBE1511:
LBE1510:
LBE1509:
LBE1508:
	.loc 1 392 0
	xorl	%edi, %edi
LVL391:
	movl	%eax, %esi
LVL392:
	jmp	L176
LVL393:
	.p2align 4,,7
L170:
LBB1512:
LBB1513:
	.loc 1 157 0
	movl	$26660, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL394:
/NO_APP
LBE1513:
LBE1512:
	.loc 1 398 0
	xorl	%edi, %edi
LVL395:
	movl	%eax, %esi
LVL396:
	jmp	L176
LVL397:
	.p2align 4,,7
L185:
LBB1514:
LBB1515:
LBB1516:
LBB1517:
	.loc 2 217 0
/APP
 # 217 "include/asm/winkvmmisc.h" 1
	rdtsc
 # 0 "" 2
/NO_APP
	movl	%edx, %edi
LVL398:
	movl	%eax, %esi
LVL399:
LBE1517:
LBE1516:
LBB1518:
LBB1519:
LBB1520:
LBB1521:
	.loc 1 157 0
	movl	$8208, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
	movl	%eax, %ebx
LVL400:
LBE1521:
LBE1520:
LBB1522:
LBB1523:
	movb	$17, %dl
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
	movl	%eax, %ecx
LVL401:
LBE1523:
LBE1522:
LBE1519:
LBE1518:
	.loc 1 330 0
	addl	%ebx, %esi
LVL402:
	adcl	%ecx, %edi
LVL403:
	jmp	L176
LVL404:
	.p2align 4,,7
L174:
LBE1515:
LBE1514:
	.loc 1 402 0
	testl	%edx, %edx
	je	L173
	.loc 1 403 0
	movl	8(%edx), %esi
LVL405:
	movl	12(%edx), %edi
LVL406:
	jmp	L176
LVL407:
L183:
	.loc 1 373 0
	movl	$LC7, (%esp)
	call	_printk
	movl	$-22, %eax
	jmp	L166
LFE135:
	.p2align 4,,15
	.def	_handle_rdmsr;	.scl	3;	.type	32;	.endef
_handle_rdmsr:
LFB189:
	.loc 1 1730 0
LVL408:
	pushl	%ebx
LCFI77:
	subl	$20, %esp
LCFI78:
	.loc 1 1730 0
	movl	28(%esp), %ebx
	.loc 1 1734 0
	leal	12(%esp), %eax
	movl	%eax, 8(%esp)
	movl	64(%ebx), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	_vmx_get_msr
	testl	%eax, %eax
	jne	L190
LVL409:
	.loc 1 1740 0
	movl	12(%esp), %eax
LVL410:
	movl	%eax, 60(%ebx)
	.loc 1 1741 0
	movl	16(%esp), %eax
LVL411:
	movl	%eax, 68(%ebx)
	.loc 1 1742 0
	movl	%ebx, (%esp)
	call	_skip_emulated_instruction
	.loc 1 1744 0
	movl	$1, %eax
	addl	$20, %esp
	popl	%ebx
LVL412:
	ret
LVL413:
	.p2align 4,,7
L190:
	.loc 1 1735 0
	movl	%ebx, (%esp)
	movl	$0, 4(%esp)
	call	_vmx_inject_gp
	.loc 1 1744 0
	movl	$1, %eax
	addl	$20, %esp
	popl	%ebx
LVL414:
	ret
LFE189:
	.p2align 4,,15
	.def	___vcpu_clear;	.scl	3;	.type	32;	.endef
___vcpu_clear:
LFB114:
	.loc 1 133 0
LVL415:
	subl	$8, %esp
LCFI79:
	movl	%esi, 4(%esp)
LCFI80:
	movl	12(%esp), %esi
	movl	%ebx, (%esp)
LCFI81:
	.loc 1 135 0
	call	_raw_smp_processor_id
	.loc 1 137 0
	cmpl	12(%esi), %eax
LVL416:
	.loc 1 135 0
	movl	%eax, %ebx
LVL417:
	.loc 1 137 0
	je	L195
LVL418:
L192:
	.loc 1 140 0
	movl	_g_current_vmcs_(,%ebx,4), %eax
	cmpl	4(%esi), %eax
	je	L196
	.loc 1 142 0
	movl	(%esp), %ebx
LVL419:
	movl	4(%esp), %esi
LVL420:
	addl	$8, %esp
	ret
LVL421:
	.p2align 4,,7
L196:
	.loc 1 141 0
	movl	$0, _g_current_vmcs_(,%ebx,4)
	.loc 1 142 0
	movl	4(%esp), %esi
LVL422:
	movl	(%esp), %ebx
LVL423:
	addl	$8, %esp
	ret
LVL424:
	.p2align 4,,7
L195:
	.loc 1 138 0
	movl	4(%esi), %eax
	call	_vmcs_clear
	jmp	L192
LFE114:
	.p2align 4,,15
	.def	_vcpu_clear;	.scl	3;	.type	32;	.endef
_vcpu_clear:
LFB115:
	.loc 1 145 0
LVL425:
	subl	$28, %esp
LCFI82:
	movl	%esi, 24(%esp)
LCFI83:
	movl	%eax, %esi
	movl	%ebx, 20(%esp)
LCFI84:
	.loc 1 146 0
	movl	12(%eax), %ebx
	call	_raw_smp_processor_id
LVL426:
	cmpl	%eax, %ebx
	je	L198
	movl	12(%esi), %eax
	cmpl	$-1, %eax
	jne	L201
L198:
	.loc 1 149 0
	movl	%esi, (%esp)
	call	___vcpu_clear
L199:
	.loc 1 150 0
	movl	$0, 16(%esi)
	.loc 1 151 0
	movl	20(%esp), %ebx
	movl	24(%esp), %esi
LVL427:
	addl	$28, %esp
	ret
LVL428:
	.p2align 4,,7
L201:
	.loc 1 147 0
	movl	$1, 16(%esp)
	movl	$0, 12(%esp)
	movl	%esi, 8(%esp)
	movl	$___vcpu_clear, 4(%esp)
	movl	%eax, (%esp)
	call	_smp_call_function_single
	jmp	L199
LFE115:
	.p2align 4,,15
	.def	_vmx_vcpu_decache;	.scl	3;	.type	32;	.endef
_vmx_vcpu_decache:
LFB127:
	.loc 1 274 0
LVL429:
	.loc 1 274 0
	movl	4(%esp), %eax
	.loc 1 275 0
	jmp	_vcpu_clear
LFE127:
	.p2align 4,,15
	.def	_vmx_vcpu_put;	.scl	3;	.type	32;	.endef
_vmx_vcpu_put:
LFB126:
	.loc 1 269 0
LVL430:
	.loc 1 270 0
	jmp	_put_cpu
LFE126:
	.section .rdata,"dr"
LC8:
	.ascii "<3>kvm: vmptrld %p/%llx fail\12\0"
	.text
	.p2align 4,,15
	.def	_vmx_vcpu_load;	.scl	3;	.type	32;	.endef
_vmx_vcpu_load:
LFB125:
	.loc 1 224 0
LVL431:
	pushl	%esi
LCFI85:
	pushl	%ebx
LCFI86:
	subl	$32, %esp
LCFI87:
	.loc 1 224 0
	movl	44(%esp), %esi
	.loc 1 225 0
	movl	4(%esi), %eax
	movl	%eax, (%esp)
	call	___pa
	movl	%eax, 16(%esp)
LVL432:
	movl	%edx, 20(%esp)
LVL433:
	.loc 1 230 0
	call	_get_cpu
LVL434:
	.loc 1 232 0
	cmpl	12(%esi), %eax
LVL435:
	.loc 1 230 0
	movl	%eax, %ebx
LVL436:
	.loc 1 232 0
	je	L207
LVL437:
	.loc 1 233 0
	movl	%esi, %eax
	call	_vcpu_clear
L207:
	.loc 1 235 0
	movl	4(%esi), %eax
	cmpl	%eax, _g_current_vmcs_(,%ebx,4)
	je	L208
LBB1524:
	.loc 1 238 0
	movl	%eax, _g_current_vmcs_(,%ebx,4)
	.loc 1 240 0
	leal	16(%esp), %eax
/APP
 # 240 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0xc7, 0x30; setna %al
 # 0 "" 2
LVL438:
	.loc 1 243 0
/NO_APP
	testb	%al, %al
	jne	L211
LVL439:
L208:
LBE1524:
	.loc 1 248 0
	cmpl	12(%esi), %ebx
	je	L210
LBB1525:
	.loc 1 252 0
	movl	%ebx, 12(%esi)
LBB1526:
LBB1527:
	.loc 4 632 0
/APP
 # 632 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	str %ax
 # 0 "" 2
LVL440:
/NO_APP
LBE1527:
	.loc 4 633 0
	movzwl	%ax, %eax
LVL441:
	movl	%eax, (%esp)
	call	_segment_base
LVL442:
LBE1526:
	.loc 1 257 0
	movl	%eax, %edx
	movl	$27658, %eax
	call	_vmcs_writel
	.loc 1 259 0
	movl	$27660, %eax
LBB1528:
LBB1529:
	.loc 4 626 0
/APP
 # 626 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	sgdt 26(%esp)
 # 0 "" 2
/NO_APP
LBE1529:
LBE1528:
	.loc 1 259 0
	movl	28(%esp), %edx
	call	_vmcs_writel
LBB1530:
LBB1531:
	.loc 2 161 0
	movl	$373, %ecx
/APP
 # 161 "include/asm/winkvmmisc.h" 1
	rdmsr
 # 0 "" 2
LVL443:
/NO_APP
LBE1531:
LBE1530:
	.loc 1 262 0
	movl	%eax, %edx
	movl	$27664, %eax
LVL444:
	call	_vmcs_writel
LVL445:
L210:
LBE1525:
	.loc 1 266 0
	addl	$32, %esp
	popl	%ebx
LVL446:
	popl	%esi
LVL447:
	ret
LVL448:
	.p2align 4,,7
L211:
LBB1532:
	.loc 1 244 0
	movl	16(%esp), %eax
LVL449:
	movl	20(%esp), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	4(%esi), %eax
	movl	$LC8, (%esp)
	movl	%eax, 4(%esp)
	call	_printk
	jmp	L208
LBE1532:
LFE125:
	.p2align 4,,15
	.def	_vmx_free_vcpu;	.scl	3;	.type	32;	.endef
_vmx_free_vcpu:
LFB201:
	.loc 1 2228 0
LVL450:
	pushl	%ebx
LCFI88:
	subl	$16, %esp
LCFI89:
	.loc 1 2228 0
	movl	24(%esp), %ebx
LBB1533:
LBB1534:
	.loc 1 2219 0
	movl	4(%ebx), %edx
	testl	%edx, %edx
	je	L214
LVL451:
	.loc 1 2220 0
	movl	$1, 12(%esp)
	movl	$0, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	$___vcpu_clear, (%esp)
	call	_on_each_cpu
LBB1535:
LBB1536:
	.loc 1 630 0
	movl	_vmcs_descriptor+4, %eax
	movl	%eax, 4(%esp)
	movl	4(%ebx), %eax
	movl	%eax, (%esp)
	call	_free_pages
LBE1536:
LBE1535:
	.loc 1 2222 0
	movl	$0, 4(%ebx)
L214:
LBE1534:
LBE1533:
	.loc 1 2230 0
	addl	$16, %esp
	popl	%ebx
LVL452:
	ret
LFE201:
	.section .rdata,"dr"
LC9:
	.ascii "<1>vmcs pointer: 0x%x\12\0"
LC10:
	.ascii "<1>vmcs revision_id: %d\12\0"
LC11:
	.ascii "<1>vmcs abort: %d\12\0"
	.text
	.p2align 4,,15
	.def	_alloc_vmcs_cpu;	.scl	3;	.type	32;	.endef
_alloc_vmcs_cpu:
LFB145:
	.loc 1 594 0
LVL453:
	pushl	%ebx
LCFI90:
	.loc 1 602 0
	xorl	%ebx, %ebx
LVL454:
	.loc 1 594 0
	subl	$12, %esp
LCFI91:
	.loc 1 595 0
	movl	%eax, (%esp)
	call	_cpu_to_node
LVL455:
	.loc 1 601 0
	movl	_vmcs_descriptor+4, %edx
	movl	$208, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, (%esp)
LVL456:
	call	_alloc_pages_node
LVL457:
	.loc 1 602 0
	testl	%eax, %eax
LVL458:
	je	L217
	.loc 1 605 0
	movl	%eax, (%esp)
	call	_page_address
LVL459:
	.loc 1 606 0
	movl	$0, 4(%esp)
	.loc 1 605 0
	movl	%eax, %ebx
	.loc 1 606 0
	movl	_vmcs_descriptor, %eax
	movl	%ebx, (%esp)
	movl	%eax, 8(%esp)
	call	_memset
	.loc 1 607 0
	movl	_vmcs_descriptor+8, %eax
	movl	%eax, (%ebx)
	.loc 1 609 0
	movl	%ebx, 4(%esp)
	movl	$LC9, (%esp)
	call	_printk
	.loc 1 610 0
	movl	(%ebx), %eax
	movl	$LC10, (%esp)
	movl	%eax, 4(%esp)
	call	_printk
	.loc 1 611 0
	movl	4(%ebx), %eax
	movl	$LC11, (%esp)
	movl	%eax, 4(%esp)
	call	_printk
LVL460:
L217:
	.loc 1 616 0
	movl	%ebx, %eax
LVL461:
	addl	$12, %esp
	popl	%ebx
LVL462:
	ret
LFE145:
	.p2align 4,,15
	.def	_vmx_create_vcpu;	.scl	3;	.type	32;	.endef
_vmx_create_vcpu:
LFB202:
	.loc 1 2233 0
LVL463:
	pushl	%esi
LCFI92:
	pushl	%ebx
LCFI93:
	subl	$8, %esp
LCFI94:
	.loc 1 2233 0
	movl	20(%esp), %esi
	.loc 1 2238 0
	movl	$208, 4(%esp)
	movl	$4096, (%esp)
	call	_kmalloc
	.loc 1 2239 0
	movl	$-12, %edx
	testl	%eax, %eax
	.loc 1 2238 0
	movl	%eax, 196(%esi)
	.loc 1 2239 0
	je	L221
LVL464:
	.loc 1 2242 0
	movl	$208, 4(%esp)
	movl	$4096, (%esp)
	call	_kmalloc
	.loc 1 2243 0
	testl	%eax, %eax
	.loc 1 2242 0
	movl	%eax, 200(%esi)
	.loc 1 2243 0
	je	L222
LBB1537:
	.loc 1 622 0
	call	_raw_smp_processor_id
	call	_alloc_vmcs_cpu
LBE1537:
	.loc 1 2247 0
	testl	%eax, %eax
LVL465:
LBB1538:
	.loc 1 622 0
	movl	%eax, %ebx
LVL466:
LBE1538:
	.loc 1 2247 0
	je	L223
	.loc 1 2250 0
	call	_vmcs_clear
	.loc 1 2252 0
	xorl	%edx, %edx
	.loc 1 2251 0
	movl	%ebx, 4(%esi)
	.loc 1 2252 0
	movl	$0, 16(%esi)
L221:
	.loc 1 2266 0
	addl	$8, %esp
	movl	%edx, %eax
	popl	%ebx
LVL467:
	popl	%esi
LVL468:
	ret
LVL469:
	.p2align 4,,7
L223:
	.loc 1 2258 0
	movl	200(%esi), %eax
	movl	%eax, (%esp)
	call	_kfree
	.loc 1 2259 0
	movl	$0, 200(%esi)
L222:
	.loc 1 2262 0
	movl	196(%esi), %eax
	movl	%eax, (%esp)
	call	_kfree
	.loc 1 2263 0
	movl	$-12, %edx
	movl	$0, 196(%esi)
	.loc 1 2266 0
	movl	%edx, %eax
	addl	$8, %esp
	popl	%ebx
LVL470:
	popl	%esi
LVL471:
	ret
LFE202:
	.p2align 4,,15
	.def	_free_kvm_area;	.scl	3;	.type	32;	.endef
_free_kvm_area:
LFB148:
	.loc 1 635 0
	pushl	%ebx
LCFI95:
	subl	$8, %esp
LCFI96:
	.loc 1 640 0
	call	_first_cpu
	movl	%eax, %ebx
LVL472:
	jmp	L226
	.p2align 4,,7
L227:
LBB1539:
LBB1540:
	.loc 1 630 0
	movl	_vmcs_descriptor+4, %eax
	movl	%eax, 4(%esp)
	movl	_g_vmxarea_(,%ebx,4), %eax
	movl	%eax, (%esp)
	call	_free_pages
LBE1540:
LBE1539:
	.loc 1 640 0
	movl	%ebx, (%esp)
	call	_next_cpu
	movl	%eax, %ebx
L226:
	call	_get_nr_cpus
	cmpl	%eax, %ebx
	jl	L227
	.loc 1 644 0
	addl	$8, %esp
	popl	%ebx
LVL473:
	.p2align 4,,1
	ret
LFE148:
	.p2align 4,,15
	.def	_hardware_unsetup;	.scl	3;	.type	32;	.endef
_hardware_unsetup:
LFB151:
	.loc 1 686 0
	.loc 1 687 0
	jmp	_free_kvm_area
LFE151:
	.section .rdata,"dr"
	.align 4
LC12:
	.ascii "<1>first_cpu() = %d, get_nr_cpus() = %d\12\0"
LC13:
	.ascii "<1>call each online\12\0"
LC14:
	.ascii "<1>%d\12\0"
	.text
	.p2align 4,,15
	.def	_hardware_setup;	.scl	3;	.type	32;	.endef
_hardware_setup:
LFB150:
	.loc 1 679 0
	pushl	%esi
LCFI97:
	pushl	%ebx
LCFI98:
	subl	$12, %esp
LCFI99:
	.loc 1 680 0
	movl	$___FUNCTION__.2881, 4(%esp)
	movl	$LC3, (%esp)
	call	_printk
LBB1549:
LBB1550:
	.loc 1 585 0
	movl	$___FUNCTION__.2807, 4(%esp)
	movl	$LC3, (%esp)
	call	_printk
LBB1551:
LBB1552:
LBB1553:
	.loc 2 161 0
	movl	$1152, %ecx
/APP
 # 161 "include/asm/winkvmmisc.h" 1
	rdmsr
 # 0 "" 2
/NO_APP
	movl	%eax, %ebx
LVL474:
LBE1553:
LBE1552:
LBE1551:
	.loc 1 588 0
	movl	%edx, %eax
LVL475:
	andl	$8191, %eax
	movl	%eax, _vmcs_descriptor
LBE1550:
	.loc 1 589 0
	movl	%eax, (%esp)
	call	_get_order
LVL476:
LBB1554:
	.loc 1 590 0
	movl	%ebx, _vmcs_descriptor+8
	.loc 1 589 0
	movl	%eax, _vmcs_descriptor+4
LBE1554:
LBE1549:
LBB1555:
	.loc 1 654 0
	call	_get_nr_cpus
	movl	%eax, %ebx
LVL477:
	call	_first_cpu
LBB1560:
	movl	%ebx, 8(%esp)
	movl	$LC12, (%esp)
	movl	%eax, 4(%esp)
	call	_printk
LBE1560:
	.loc 1 657 0
	call	_first_cpu
	movl	%eax, %ebx
LVL478:
	jmp	L232
	.p2align 4,,7
L235:
LBB1559:
LBB1562:
	.loc 1 660 0
	movl	$___FUNCTION__.2866, 4(%esp)
	movl	$LC13, (%esp)
	call	_printk
LBE1562:
LBE1559:
	.loc 1 662 0
	movl	%ebx, %eax
	call	_alloc_vmcs_cpu
LBB1558:
LBB1563:
	.loc 1 663 0
	testl	%eax, %eax
LVL479:
	je	L237
	.loc 1 669 0
	movl	%eax, _g_vmxarea_(,%ebx,4)
	.loc 1 670 0
	movl	%ebx, 4(%esp)
	movl	$LC14, (%esp)
	call	_printk
LVL480:
LBE1563:
LBE1558:
	.loc 1 657 0
	movl	%ebx, (%esp)
	call	_next_cpu
	movl	%eax, %ebx
L232:
	call	_get_nr_cpus
LBB1557:
	cmpl	%eax, %ebx
	jl	L235
LBE1557:
LBE1555:
	.loc 1 683 0
	addl	$12, %esp
LBB1567:
LBB1565:
	.loc 1 657 0
	xorl	%eax, %eax
LBE1565:
LBE1567:
	.loc 1 683 0
	popl	%ebx
LVL481:
	popl	%esi
	ret
LVL482:
	.p2align 4,,7
L237:
LBB1568:
LBB1556:
LBB1561:
	.loc 1 664 0
	call	_free_kvm_area
LVL483:
LBE1561:
LBE1556:
LBE1568:
	.loc 1 683 0
	addl	$12, %esp
LBB1569:
LBB1566:
LBB1564:
	.loc 1 664 0
	movl	$-12, %eax
LBE1564:
LBE1566:
LBE1569:
	.loc 1 683 0
	popl	%ebx
LVL484:
	popl	%esi
	ret
LFE150:
	.section .rdata,"dr"
LC15:
	.ascii "<1>%s:0\12\0"
LC16:
	.ascii "<1>%s:1\12\0"
LC17:
	.ascii "<1>%s:2\12\0"
LC18:
	.ascii "<1>%s:3 phys_addr: 0x%x\12\0"
LC19:
	.ascii "<1>%s:4\12\0"
	.text
	.p2align 4,,15
	.def	_hardware_enable;	.scl	3;	.type	32;	.endef
_hardware_enable:
LFB142:
	.loc 1 544 0
LVL485:
	subl	$40, %esp
LCFI100:
	movl	%ebx, 24(%esp)
LCFI101:
	movl	%esi, 28(%esp)
LCFI102:
	movl	%edi, 32(%esp)
LCFI103:
	movl	%ebp, 36(%esp)
LCFI104:
	.loc 1 545 0
	call	_raw_smp_processor_id
	.loc 1 546 0
	movl	_g_vmxarea_(,%eax,4), %eax
LVL486:
	movl	%eax, (%esp)
	call	___pa
	.loc 1 549 0
	movl	$___FUNCTION__.2788, 4(%esp)
	movl	$LC15, (%esp)
	.loc 1 546 0
	movl	%eax, 16(%esp)
LVL487:
	movl	%edx, 20(%esp)
LVL488:
	.loc 1 549 0
	call	_printk
LVL489:
LBB1570:
LBB1571:
	.loc 2 161 0
	movl	$58, %ecx
/APP
 # 161 "include/asm/winkvmmisc.h" 1
	rdmsr
 # 0 "" 2
/NO_APP
	movl	%eax, %ebx
LVL490:
	movl	%edx, %esi
LVL491:
LBE1571:
LBE1570:
	.loc 1 553 0
	movl	$___FUNCTION__.2788, 4(%esp)
	movl	$LC16, (%esp)
	call	_printk
	.loc 1 555 0
	movl	%ebx, %eax
LVL492:
	andl	$5, %eax
	cmpl	$5, %eax
	je	L239
LBB1572:
LBB1573:
	.loc 2 167 0
	movl	%ebx, %edi
	movl	$58, %ecx
	orl	$5, %edi
	movl	%esi, %edx
LVL493:
	movl	%edi, %eax
/APP
 # 167 "include/asm/winkvmmisc.h" 1
	wrmsr
 # 0 "" 2
LVL494:
/NO_APP
L239:
LBE1573:
LBE1572:
	.loc 1 559 0
	movl	$___FUNCTION__.2788, 4(%esp)
	movl	$LC17, (%esp)
	call	_printk
LBB1574:
LBB1575:
	.loc 2 278 0
/APP
 # 278 "include/asm/winkvmmisc.h" 1
	movl %cr4,%eax
	
 # 0 "" 2
LVL495:
/NO_APP
LBE1575:
LBE1574:
LBB1576:
LBB1577:
	.loc 2 272 0
	orb	$32, %ah
/APP
 # 272 "include/asm/winkvmmisc.h" 1
	movl %eax,%cr4
 # 0 "" 2
/NO_APP
LBE1577:
LBE1576:
	.loc 1 563 0
	movl	20(%esp), %edx
	movl	16(%esp), %eax
LVL496:
	movl	$___FUNCTION__.2788, 4(%esp)
	movl	$LC18, (%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	call	_printk
	.loc 1 565 0
	call	_check_ensure_vmx
	.loc 1 567 0
	leal	16(%esp), %eax
/APP
 # 567 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0xf3, 0x0f, 0xc7, 0x30
 # 0 "" 2
	.loc 1 570 0
/NO_APP
	movl	$___FUNCTION__.2788, 4(%esp)
	movl	$LC19, (%esp)
	call	_printk
	.loc 1 572 0
	movl	24(%esp), %ebx
	movl	28(%esp), %esi
LVL497:
	movl	32(%esp), %edi
	movl	36(%esp), %ebp
	addl	$40, %esp
	ret
LFE142:
	.p2align 4,,15
	.def	_handle_io;	.scl	3;	.type	32;	.endef
_handle_io:
LFB184:
	.loc 1 1586 0
LVL498:
	pushl	%ebp
LCFI105:
LBB1578:
LBB1580:
LBB1584:
LBB1585:
	.loc 1 157 0
	movl	$25600, %edx
LBE1585:
LBE1584:
LBE1580:
LBE1578:
	.loc 1 1586 0
	pushl	%edi
LCFI106:
	pushl	%esi
LCFI107:
	pushl	%ebx
LCFI108:
	subl	$32, %esp
LCFI109:
	.loc 1 1586 0
	movl	52(%esp), %ebp
	movl	56(%esp), %esi
	.loc 1 1589 0
	addl	$1, _kvm_stat+20
LBB1588:
LBB1579:
LBB1583:
LBB1586:
	.loc 1 157 0
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
	movl	%eax, %ebx
LVL499:
LBE1586:
LBE1583:
LBB1581:
LBB1582:
	movb	$1, %dl
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
LBE1582:
LBE1581:
	.loc 1 177 0
	movl	%ebx, 16(%esp)
LVL500:
LBE1579:
LBE1588:
LBB1589:
LBB1591:
	.loc 1 157 0
	movl	$26656, %edi
LBE1591:
LBE1589:
LBB1593:
LBB1587:
	.loc 1 177 0
	movl	%eax, 20(%esp)
LVL501:
LBE1587:
LBE1593:
	.loc 1 1591 0
	movl	$2, 32(%esi)
	.loc 1 1593 0
	testb	$8, 16(%esp)
	sete	60(%esi)
	.loc 1 1596 0
	movzbl	16(%esp), %ecx
	andl	$7, %ecx
	addl	$1, %ecx
	movb	%cl, 61(%esi)
	.loc 1 1597 0
	movl	20(%esp), %edx
	movl	16(%esp), %eax
LVL502:
	shrdl	$4, %edx, %eax
	movl	%eax, 16(%esp)
LVL503:
	movzbl	16(%esp), %ebx
LVL504:
	shrl	$4, %edx
	movl	%edx, 20(%esp)
LVL505:
LBB1594:
LBB1590:
	.loc 1 157 0
	movl	%edi, %edx
LBE1590:
LBE1594:
	.loc 1 1597 0
	andl	$1, %ebx
	movb	%bl, 62(%esi)
LBB1595:
LBB1592:
	.loc 1 157 0
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
	movl	%eax, %ecx
LVL506:
LBE1592:
LBE1595:
	.loc 1 1598 0
	shrl	$10, %ecx
	andl	$1, %ecx
LVL507:
	movb	%cl, 63(%esi)
	.loc 1 1600 0
	movl	20(%esp), %edx
	movl	16(%esp), %eax
	shrdl	$1, %edx, %eax
	movl	%eax, 16(%esp)
LVL508:
	movzbl	16(%esp), %ecx
	shrl	%edx
	.loc 1 1601 0
	shrdl	$11, %edx, %eax
	.loc 1 1600 0
	movl	%edx, 20(%esp)
LVL509:
	.loc 1 1601 0
	movw	%ax, 66(%esi)
	.loc 1 1600 0
	andl	$1, %ecx
	.loc 1 1602 0
	testb	%bl, %bl
	.loc 1 1600 0
	movb	%cl, 64(%esi)
	.loc 1 1602 0
	je	L244
LVL510:
LBB1596:
LBB1600:
LBB1612:
LBB1613:
	.loc 1 157 0
	movl	%edi, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL511:
/NO_APP
LBE1613:
LBE1612:
	.loc 1 1544 0
	testl	$131072, %eax
	je	L263
LVL512:
L245:
LBB1607:
	.loc 1 1549 0
	movl	$2, %ebx
L247:
LBE1607:
LBB1604:
LBB1605:
	.loc 1 157 0
	movl	$26654, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL513:
/NO_APP
LBE1605:
LBE1604:
	.loc 1 1554 0
	cmpl	$8, %ebx
LBB1603:
LBB1606:
	.loc 1 157 0
	movl	%eax, %ecx
LVL514:
LBE1606:
LBE1603:
	.loc 1 1554 0
	je	L248
LBB1601:
LBB1602:
	.loc 1 157 0
	movb	$8, %dl
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL515:
/NO_APP
LBE1602:
LBE1601:
	.loc 1 1555 0
	addl	%eax, %ecx
L248:
LBE1600:
	.loc 1 1557 0
	leal	24(%esp), %edi
	movl	%ecx, 4(%esp)
	movl	%edi, 12(%esp)
	movl	$8, 8(%esp)
	movl	%ebp, (%esp)
	call	_kvm_read_guest
LVL516:
LBB1599:
	.loc 1 1559 0
	testl	%eax, %eax
LVL517:
LBE1599:
	.loc 1 1557 0
	movl	%eax, %ecx
LVL518:
LBB1598:
	.loc 1 1559 0
	jle	L249
	xorl	%edx, %edx
LVL519:
L258:
	.loc 1 1560 0
	movzbl	(%edi,%edx), %eax
	cmpb	$102, %al
	ja	L253
	cmpb	$100, %al
	jae	L251
	cmpb	$46, %al
	je	L251
	.p2align 4,,7
	ja	L254
	cmpb	$38, %al
	.p2align 4,,7
	jne	L250
	.p2align 4,,7
L251:
	.loc 1 1559 0
	addl	$1, %edx
	cmpl	%edx, %ecx
	.p2align 4,,5
	jg	L258
L249:
LBE1598:
LBE1596:
	.loc 1 1607 0
	movl	$1, %eax
	.p2align 4,,3
	jmp	L259
LVL520:
	.p2align 4,,7
L244:
	movl	60(%ebp), %eax
	movl	%eax, 76(%esi)
	xorl	%eax, %eax
LVL521:
L259:
	.loc 1 1609 0
	addl	$32, %esp
	popl	%ebx
LVL522:
	popl	%esi
LVL523:
	popl	%edi
	popl	%ebp
LVL524:
	ret
LVL525:
	.p2align 4,,7
L263:
LBB1617:
LBB1615:
LBB1614:
LBB1608:
LBB1609:
LBB1610:
LBB1611:
	.loc 1 157 0
	movw	$18454, %dx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL526:
/NO_APP
LBE1611:
LBE1610:
LBE1609:
LBE1608:
	.loc 1 1549 0
	testb	$32, %ah
	movl	$8, %ebx
LVL527:
	jne	L247
	testb	$64, %ah
	movl	$4, %ebx
	jne	L247
	jmp	L245
LVL528:
	.p2align 4,,7
L253:
LBE1614:
	.loc 1 1560 0
	cmpb	$-16, %al
	.p2align 4,,5
	je	L251
	.p2align 4,,9
	ja	L255
	cmpb	$103, %al
	.p2align 4,,7
	je	L264
L250:
	.loc 1 1559 0
	leal	0(,%ebx,8), %eax
L262:
	movl	$64, %ecx
LVL529:
	movl	$-1, %edx
LVL530:
	subl	%eax, %ecx
	movl	$-1, %eax
	shrdl	%cl,%edx, %eax
	shrl	%cl, %edx
	testb	$32, %cl
	je	L257
	movl	%edx, %eax
LVL531:
L257:
	.loc 1 1581 0
	andl	64(%ebp), %eax
LBE1615:
LBE1617:
LBB1618:
LBB1619:
	.loc 1 157 0
	movl	$25610, %edx
LVL532:
LBE1619:
LBE1618:
LBB1621:
LBB1597:
	.loc 1 1581 0
	movl	$0, 72(%esi)
	movl	%eax, 68(%esi)
LBE1597:
LBE1621:
LBB1622:
LBB1620:
	.loc 1 157 0
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL533:
/NO_APP
LBE1620:
LBE1622:
	.loc 1 1605 0
	movl	%eax, 76(%esi)
	xorl	%eax, %eax
LVL534:
	movl	$0, 80(%esi)
	.loc 1 1609 0
	addl	$32, %esp
	popl	%ebx
LVL535:
	popl	%esi
LVL536:
	popl	%edi
	popl	%ebp
LVL537:
	ret
LVL538:
	.p2align 4,,7
L255:
LBB1623:
LBB1616:
	.loc 1 1560 0
	addl	$14, %eax
	cmpb	$1, %al
	ja	L250
	jmp	L251
	.p2align 4,,7
L264:
	.loc 1 1573 0
	cmpl	$2, %ebx
	movl	$-1, %eax
	.p2align 4,,3
	je	L257
	leal	0(,%ebx,4), %eax
	jmp	L262
	.p2align 4,,7
L254:
	.loc 1 1560 0
	cmpb	$54, %al
	je	L251
	cmpb	$62, %al
	jne	L250
	.p2align 4,,7
	jmp	L251
LBE1616:
LBE1623:
LFE184:
	.section .rdata,"dr"
	.align 4
LC20:
	.ascii "<7>%s: #SS, rsp 0x%lx ss 0x%lx limit 0x%x\12\0"
LC21:
	.ascii "<7>%s: read guest err\12\0"
LC22:
	.ascii "<7>%s: write guest err\12\0"
LC23:
	.ascii "<1>VM-exit failed: 0x%08lx\12\0"
	.align 4
LC24:
	.ascii "<4>%s: unexpected, valid vectoring info and exit reason is 0x%x\12\0"
	.text
	.p2align 4,,15
.globl _vmx_vcpu_run
	.def	_vmx_vcpu_run;	.scl	2;	.type	32;	.endef
_vmx_vcpu_run:
LFB197:
	.loc 1 1879 0
LVL539:
L267:
	pushl	%ebp
LCFI110:
	pushl	%edi
LCFI111:
	pushl	%esi
LCFI112:
	pushl	%ebx
LCFI113:
	subl	$88, %esp
LCFI114:
LBB1783:
LBB1784:
	.loc 4 584 0
/APP
 # 584 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	mov %fs, 48(%esp)
 # 0 "" 2
/NO_APP
LBE1784:
LBE1783:
LBB1785:
LBB1786:
	.loc 4 591 0
/APP
 # 591 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	mov %gs, 46(%esp)
 # 0 "" 2
/NO_APP
LBE1786:
LBE1785:
	.loc 1 1895 0
	movzwl	48(%esp), %ebp
	movzwl	46(%esp), %ecx
	.loc 1 1879 0
	movl	108(%esp), %esi
	movl	112(%esp), %edi
	.loc 1 1895 0
	movl	%ebp, 36(%esp)
	movl	%ecx, 40(%esp)
	orl	%ebp, %ecx
LBB1787:
LBB1791:
LBB1794:
LBB1797:
	.loc 1 1346 0
	leal	28(%esi), %eax
LBE1797:
LBE1794:
LBE1791:
LBE1787:
	.loc 1 1895 0
	andl	$7, %ecx
LBB1881:
LBB1790:
LBB1793:
LBB1856:
LBB1848:
LBB1850:
	.loc 2 144 0
	leal	24(%esi), %edx
LBE1850:
LBE1848:
	.loc 1 1346 0
	movl	%eax, 56(%esp)
LBB1852:
LBB1849:
	.loc 2 144 0
	movl	%edx, 60(%esp)
LBE1849:
LBE1852:
LBE1856:
LBE1793:
LBE1790:
LBE1881:
	.loc 1 1895 0
	movl	%ecx, 32(%esp)
LVL540:
	.p2align 4,,7
L298:
LBB1882:
LBB1883:
	.loc 4 598 0
/APP
 # 598 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	sldt 50(%esp)
 # 0 "" 2
LVL541:
/NO_APP
LBE1883:
LBE1882:
	.loc 1 1895 0
	movzwl	50(%esp), %eax
LVL542:
	.loc 1 1896 0
	orl	32(%esp), %eax
LVL543:
LBB1884:
LBB1885:
	.loc 1 200 0
	movl	36(%esp), %edx
LBE1885:
LBE1884:
	.loc 1 1896 0
	movl	%eax, 52(%esp)
LVL544:
LBB1887:
LBB1886:
	.loc 1 200 0
	movl	$3080, %eax
LVL545:
	call	_vmcs_writel
LBE1886:
LBE1887:
LBB1888:
LBB1889:
	movl	40(%esp), %edx
	movl	$3082, %eax
	call	_vmcs_writel
LBE1889:
LBE1888:
LBB1890:
LBB1891:
LBB1892:
LBB1893:
	.loc 2 353 0
/APP
 # 353 "include/asm/winkvmmisc.h" 1
	mov %fs, %cx
 # 0 "" 2
LVL546:
/NO_APP
LBE1893:
LBE1892:
	.loc 2 376 0
	shrw	$3, %cx
	movzwl	%cx, %ecx
LVL547:
LBB1894:
LBB1895:
	.loc 2 255 0
/APP
 # 255 "include/asm/winkvmmisc.h" 1
	sgdt 72(%esp)
 # 0 "" 2
/NO_APP
LBE1895:
LBE1894:
	.loc 2 376 0
	sall	$3, %ecx
	addl	74(%esp), %ecx
LBE1891:
LBE1890:
	.loc 1 1915 0
	movzbl	7(%ecx), %edx
	movzbl	4(%ecx), %eax
	sall	$24, %edx
	sall	$16, %eax
	orl	%eax, %edx
	movzwl	2(%ecx), %eax
	orl	%eax, %edx
	movl	$27654, %eax
	call	_vmcs_writel
LBB1896:
LBB1897:
LBB1898:
LBB1899:
	.loc 2 360 0
/APP
 # 360 "include/asm/winkvmmisc.h" 1
	mov %gs, %cx
 # 0 "" 2
LVL548:
/NO_APP
LBE1899:
LBE1898:
	.loc 2 395 0
	shrw	$3, %cx
	movzwl	%cx, %ecx
LVL549:
LBB1900:
LBB1901:
	.loc 2 255 0
/APP
 # 255 "include/asm/winkvmmisc.h" 1
	sgdt 72(%esp)
 # 0 "" 2
/NO_APP
LBE1901:
LBE1900:
	.loc 2 395 0
	sall	$3, %ecx
	addl	74(%esp), %ecx
LBE1897:
LBE1896:
	.loc 1 1916 0
	movzbl	7(%ecx), %edx
	movzbl	4(%ecx), %eax
	sall	$24, %edx
	sall	$16, %eax
	orl	%eax, %edx
	movzwl	2(%ecx), %eax
	orl	%eax, %edx
	movl	$27656, %eax
	call	_vmcs_writel
	.loc 1 1919 0
	movl	14812(%esi), %eax
	testl	%eax, %eax
	jne	L270
LBB1902:
LBB1878:
LBB1859:
LBB1860:
	.loc 1 157 0
	movl	$26656, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL550:
/NO_APP
LBE1860:
LBE1859:
	.loc 1 1369 0
	testb	$2, %ah
	je	L271
LBB1861:
LBB1862:
LBB1863:
LBB1864:
	.loc 1 157 0
	movw	$18468, %dx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL551:
/NO_APP
LBE1864:
LBE1863:
LBE1862:
LBE1861:
	.loc 1 1369 0
	testb	$3, %al
	jne	L271
	.loc 1 1373 0
	movl	24(%esi), %ecx
	.loc 1 1369 0
	movl	$1, 20(%esi)
	.loc 1 1373 0
	testl	%ecx, %ecx
	je	L272
LBB1865:
LBB1866:
LBB1867:
LBB1868:
	.loc 1 157 0
	movw	$16406, %dx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL552:
/NO_APP
LBE1868:
LBE1867:
LBE1866:
LBE1865:
	.loc 1 1373 0
	testl	%eax, %eax
	js	L272
LBB1869:
LBB1796:
LBB1845:
LBB1846:
	.loc 2 144 0
	movl	56(%esp), %ebp
LBE1846:
LBE1845:
LBB1843:
LBB1844:
	.loc 2 126 0
/APP
 # 126 "include/asm/winkvmmisc.h" 1
	bsfl %ecx,%ebx
 # 0 "" 2
LVL553:
/NO_APP
LBE1844:
LBE1843:
	.loc 1 1342 0
	movl	%ebx, %eax
LVL554:
	sall	$5, %eax
LBB1841:
LBB1842:
	.loc 2 126 0
	leal	4(%ebx), %ecx
/APP
 # 126 "include/asm/winkvmmisc.h" 1
	bsfl 12(%esi,%ecx,4),%edx
 # 0 "" 2
LVL555:
/NO_APP
LBE1842:
LBE1841:
	.loc 1 1342 0
	addl	%edx, %eax
	movl	%eax, 20(%esp)
LVL556:
LBB1840:
LBB1847:
	.loc 2 144 0
	leal	(%ebp,%ebx,4), %eax
/APP
 # 144 "include/asm/winkvmmisc.h" 1
	lock; btrl %edx,(%eax)
 # 0 "" 2
/NO_APP
LBE1847:
LBE1840:
	.loc 1 1347 0
	movl	12(%esi,%ecx,4), %ebp
	testl	%ebp, %ebp
	jne	L273
LBB1839:
LBB1851:
	.loc 2 144 0
	movl	60(%esp), %eax
/APP
 # 144 "include/asm/winkvmmisc.h" 1
	lock; btrl %ebx,(%eax)
 # 0 "" 2
/NO_APP
L273:
LBE1851:
LBE1839:
	.loc 1 1350 0
	movl	14844(%esi), %ebx
LVL557:
	testl	%ebx, %ebx
	je	L274
LBB1799:
LBB1801:
LBB1810:
LBB1811:
	.loc 1 157 0
	movl	$26634, %ebx
	movl	%ebx, %edx
LVL558:
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
	movl	%eax, 64(%esp)
LVL559:
LBE1811:
LBE1810:
LBB1812:
LBB1813:
	movb	$28, %dl
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL560:
/NO_APP
LBE1813:
LBE1812:
LBB1814:
LBB1815:
LBB1816:
LBB1817:
	movl	$18436, %ecx
LBE1817:
LBE1816:
LBE1815:
LBE1814:
	.loc 1 1300 0
	movw	%ax, 30(%esp)
LVL561:
LBB1821:
LBB1820:
LBB1819:
LBB1818:
	.loc 1 157 0
	movl	%ecx, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL562:
/NO_APP
LBE1818:
LBE1819:
LBE1820:
LBE1821:
	.loc 1 1303 0
	movzwl	30(%esp), %ebp
	cmpl	%ebp, %eax
	movl	%ebp, 68(%esp)
	jb	L303
LVL563:
LBE1801:
	.loc 1 1312 0
	leal	72(%esp), %eax
	movl	%eax, 12(%esp)
	movl	20(%esp), %eax
	movl	$4, 8(%esp)
	movl	%esi, (%esp)
	sall	$2, %eax
	movl	%eax, 4(%esp)
	call	_kvm_read_guest
LBB1834:
	cmpl	$4, %eax
	je	L276
LVL564:
	.loc 1 1314 0
	movl	$___FUNCTION__.3338, 4(%esp)
	movl	$LC21, (%esp)
	call	_printk
LVL565:
	.p2align 4,,7
L272:
LBE1834:
LBE1799:
LBE1796:
LBE1869:
LBB1870:
LBB1871:
LBB1872:
LBB1873:
	.loc 1 157 0
	movl	$16386, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL566:
/NO_APP
LBE1873:
LBE1872:
LBE1871:
LBE1870:
	.loc 1 1382 0
	movl	20(%esi), %ecx
	testl	%ecx, %ecx
	jne	L279
LVL567:
	movl	24(%esi), %edx
	testl	%edx, %edx
	jne	L280
	cmpb	$0, 20(%edi)
	je	L279
L280:
	.loc 1 1387 0
	movl	%eax, %edx
	orl	$4, %edx
LVL568:
L281:
LBB1874:
LBB1875:
	.loc 1 205 0
	movl	$16386, %eax
	call	_vmcs_writel
LVL569:
L270:
LBE1875:
LBE1874:
LBE1878:
LBE1902:
	.loc 1 1922 0
	movl	13736(%esi), %eax
	testl	%eax, %eax
	je	L282
LBB1903:
LBB1904:
LBB1911:
LBB1912:
	.loc 2 427 0
	movl	13740(%esi), %eax
/APP
 # 427 "include/asm/winkvmmisc.h" 1
	movl %eax,%db0
 # 0 "" 2
/NO_APP
LBE1912:
LBE1911:
LBB1909:
LBB1910:
	.loc 2 430 0
	movl	13744(%esi), %eax
/APP
 # 430 "include/asm/winkvmmisc.h" 1
	movl %eax,%db1
 # 0 "" 2
/NO_APP
LBE1910:
LBE1909:
LBB1907:
LBB1908:
	.loc 2 433 0
	movl	13748(%esi), %eax
/APP
 # 433 "include/asm/winkvmmisc.h" 1
	movl %eax,%db2
 # 0 "" 2
/NO_APP
LBE1908:
LBE1907:
LBB1905:
LBB1906:
	.loc 2 436 0
	movl	13752(%esi), %eax
/APP
 # 436 "include/asm/winkvmmisc.h" 1
	movl %eax,%db3
 # 0 "" 2
/NO_APP
LBE1906:
LBE1905:
	.loc 1 1404 0
	movl	13756(%esi), %eax
	testl	%eax, %eax
	jne	L304
L282:
LBE1904:
LBE1903:
LBB1917:
LBB1918:
	.loc 4 648 0
	movl	14800(%esi), %eax
/APP
 # 648 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	fxsave (%eax)
 # 0 "" 2
/NO_APP
LBE1918:
LBE1917:
LBB1919:
LBB1920:
	.loc 4 653 0
	movl	14804(%esi), %eax
/APP
 # 653 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	fxrstor (%eax)
 # 0 "" 2
/NO_APP
LBE1920:
LBE1919:
	.loc 1 1928 0
	movl	192(%esi), %eax
	movl	%eax, 4(%esp)
	movl	200(%esi), %eax
	movl	%eax, (%esp)
	call	_save_msrs
	.loc 1 1929 0
	movl	$0, 4(%esp)
	movl	196(%esi), %eax
	movl	%eax, (%esp)
	call	_load_msrs
	.loc 1 1939 0
	movl	16(%esi), %eax
	movl	$27668, %edx
	movl	%esi, %ecx
/APP
 # 1939 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	pushf 
	pusha; push %ecx 
	.byte 0x0f, 0x79, 0xd4
	cmp $0, %eax 
	pushf 
	.globl _vm_start 
	_vm_start:mov $(kvm_vmx_return), %eax 
	mov $0x00006c16, %edx 
	.byte 0x0f, 0x79, 0xd0
	popf 
	mov 100(%ecx), %eax 
	mov %eax,   %cr2 
	mov 60(%ecx), %eax 
	mov 72(%ecx), %ebx 
	mov 68(%ecx), %edx 
	mov 84(%ecx), %esi 
	mov 88(%ecx), %edi 
	mov 80(%ecx), %ebp 
	mov 64(%ecx), %ecx 
	jne launched 
	.byte 0x0f, 0x01, 0xc2
	jmp kvm_vmx_return 
	launched: .byte 0x0f, 0x01, 0xc3
	.globl kvm_vmx_return 
	kvm_vmx_return:xchg %ecx, (%esp) 
	mov %eax, 60(%ecx) 
	mov %ebx, 72(%ecx) 
	pushl (%esp); popl 64(%ecx) 
	mov %edx, 68(%ecx) 
	mov %esi, 84(%ecx) 
	mov %edi, 88(%ecx) 
	mov %ebp, 80(%ecx) 
	mov %cr2, %eax  
	mov %eax, 100(%ecx) 
	mov (%esp), %ecx 
	pop %ecx; popa 
	setbe %bl 
	popf 
	
 # 0 "" 2
LVL570:
	.loc 1 2103 0
/NO_APP
	movl	52(%esp), %ebp
LVL571:
	testl	%ebp, %ebp
	jne	L305
LVL572:
L283:
	.loc 1 2119 0
	addl	$1, _kvm_stat+16
	.loc 1 2121 0
	movl	$0, 4(%esp)
	movl	196(%esi), %eax
	movl	%eax, (%esp)
	call	_save_msrs
	.loc 1 2122 0
	movl	$0, 4(%esp)
	movl	200(%esi), %eax
	movl	%eax, (%esp)
	call	_load_msrs
LBB1921:
LBB1922:
	.loc 4 648 0
	movl	14804(%esi), %eax
/APP
 # 648 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	fxsave (%eax)
 # 0 "" 2
/NO_APP
LBE1922:
LBE1921:
LBB1923:
LBB1924:
	.loc 4 653 0
	movl	14800(%esi), %eax
/APP
 # 653 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	fxrstor (%eax)
 # 0 "" 2
/NO_APP
LBE1924:
LBE1923:
LBB1925:
LBB1926:
LBB1927:
LBB1928:
	.loc 1 157 0
	movl	$18468, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL573:
/NO_APP
LBE1928:
LBE1927:
LBE1926:
LBE1925:
	.loc 1 2126 0
	testb	$3, %al
	sete	%al
LVL574:
	movzbl	%al, %eax
	movl	%eax, 20(%esi)
LBB1929:
LBB1930:
	.loc 2 346 0
/APP
 # 346 "include/asm/winkvmmisc.h" 1
	mov %ds, %dx
 # 0 "" 2
LVL575:
/NO_APP
LBE1930:
LBE1929:
LBB1931:
LBB1932:
	.loc 2 325 0
/APP
 # 325 "include/asm/winkvmmisc.h" 1
	mov %es, %ax
 # 0 "" 2
LVL576:
/NO_APP
LBE1932:
LBE1931:
	.loc 1 2131 0
/APP
 # 2131 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	mov %dx, %ds; mov %ax, %es
 # 0 "" 2
	.loc 1 2135 0
/NO_APP
	testb	%bl, %bl
	.loc 1 2134 0
	movl	$0, 28(%edi)
	.loc 1 2135 0
	jne	L306
	.loc 1 2150 0
	movl	$1, 16(%esi)
LBB1933:
LBB1936:
LBB1937:
LBB1938:
LBB1939:
LBB1940:
	.loc 1 157 0
	movl	$17416, %edx
LVL577:
LBE1940:
LBE1939:
LBE1938:
LBE1937:
LBE1936:
LBE1933:
	.loc 1 2151 0
	movl	$2, 28(%edi)
LBB1958:
LBB1935:
LBB1944:
LBB1943:
LBB1942:
LBB1941:
	.loc 1 157 0
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL578:
/NO_APP
	movl	%eax, %ecx
LVL579:
LBE1941:
LBE1942:
LBE1943:
LBE1944:
LBB1945:
LBB1946:
LBB1947:
LBB1948:
	movb	$2, %dl
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
LBE1948:
LBE1947:
LBE1946:
LBE1945:
	.loc 1 1842 0
	testl	%ecx, %ecx
LBB1952:
LBB1951:
LBB1950:
LBB1949:
	.loc 1 157 0
	movl	%eax, %ebx
LVL580:
LBE1949:
LBE1950:
LBE1951:
LBE1952:
	.loc 1 1842 0
	js	L307
LVL581:
L286:
LBB1953:
LBB1954:
LBB1955:
LBB1956:
	.loc 1 157 0
	movl	$17420, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL582:
/NO_APP
LBE1956:
LBE1955:
LBE1954:
LBE1953:
	.loc 1 1847 0
	cmpl	$32, %ebx
	.loc 1 1846 0
	movl	%eax, 36(%edi)
	.loc 1 1847 0
	ja	L287
	movl	_kvm_vmx_exit_handlers(,%ebx,4), %eax
LVL583:
	testl	%eax, %eax
	je	L287
LBE1935:
	.loc 1 1849 0
	movl	%edi, 4(%esp)
	movl	%esi, (%esp)
	call	*%eax
LVL584:
LBE1958:
	.loc 1 2153 0
	testl	%eax, %eax
LVL585:
LBB1959:
	.loc 1 1849 0
	movl	%eax, %ecx
LVL586:
LBE1959:
	.loc 1 2153 0
	jle	L285
	.loc 1 2157 0
	movl	_current, %eax
	movl	%eax, (%esp)
	call	_signal_pending
LVL587:
	testl	%eax, %eax
	jne	L308
LBB1960:
LBB1961:
	.loc 1 1869 0
	movl	24(%esi), %ebx
LVL588:
	testl	%ebx, %ebx
	jne	L293
	cmpb	$0, 20(%edi)
	.p2align 4,,3
	je	L293
	movl	20(%esi), %ecx
	testl	%ecx, %ecx
	je	L293
LBB1962:
LBB1963:
	.loc 1 157 0
	movl	$26656, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL589:
/NO_APP
LBE1963:
LBE1962:
	.loc 1 1869 0
	testb	$2, %ah
	je	L293
LBE1961:
LBE1960:
	.loc 1 2165 0
	addl	$1, _kvm_stat+40
LBB1964:
LBB1965:
LBB1966:
LBB1967:
	.loc 1 157 0
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL590:
/NO_APP
LBE1967:
LBE1966:
	.loc 1 1765 0
	shrl	$9, %eax
	andl	$1, %eax
LVL591:
	movb	%al, 41(%edi)
	.loc 1 1766 0
	movl	132(%esi), %ecx
	movl	%ecx, 44(%edi)
LVL592:
L302:
	movl	$0, 48(%edi)
	.loc 1 1767 0
	movl	176(%esi), %eax
	movl	180(%esi), %edx
	movl	%eax, 52(%edi)
	.loc 1 1768 0
	xorl	%eax, %eax
	.loc 1 1767 0
	movl	%edx, 56(%edi)
	.loc 1 1768 0
	movl	20(%esi), %edx
	testl	%edx, %edx
	je	L295
	movl	24(%esi), %eax
	testl	%eax, %eax
	sete	%al
L295:
	movl	$-4, %ecx
LVL593:
	movb	%al, 40(%edi)
LBE1965:
LBE1964:
	.loc 1 2179 0
	addl	$88, %esp
	movl	%ecx, %eax
	popl	%ebx
LVL594:
	popl	%esi
LVL595:
	popl	%edi
LVL596:
	popl	%ebp
	ret
LVL597:
	.p2align 4,,7
L293:
	.loc 1 2171 0
	movl	%esi, (%esp)
	call	_kvm_resched
LVL598:
	jmp	L298
LVL599:
	.p2align 4,,7
L287:
LBB1968:
LBB1934:
	.loc 1 1853 0
	movl	$0, 32(%edi)
	.loc 1 1854 0
	xorl	%ecx, %ecx
LVL600:
	movl	%ebx, 60(%edi)
LVL601:
L285:
LBE1934:
LBE1968:
LBB1969:
LBB1970:
LBB1971:
LBB1972:
	.loc 1 157 0
	movl	$26656, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL602:
/NO_APP
LBE1972:
LBE1971:
	.loc 1 1765 0
	shrl	$9, %eax
	andl	$1, %eax
LVL603:
	movb	%al, 41(%edi)
	.loc 1 1766 0
	movl	132(%esi), %ebp
	movl	$0, 48(%edi)
	movl	%ebp, 44(%edi)
	.loc 1 1767 0
	movl	176(%esi), %eax
	movl	180(%esi), %edx
	movl	%eax, 52(%edi)
	.loc 1 1768 0
	xorl	%eax, %eax
	.loc 1 1767 0
	movl	%edx, 56(%edi)
	.loc 1 1768 0
	movl	20(%esi), %ebp
	testl	%ebp, %ebp
	jne	L309
L297:
	movb	%al, 40(%edi)
LBE1970:
LBE1969:
	.loc 1 2179 0
	addl	$88, %esp
	movl	%ecx, %eax
	popl	%ebx
LVL604:
	popl	%esi
LVL605:
	popl	%edi
LVL606:
	popl	%ebp
	ret
LVL607:
	.p2align 4,,7
L271:
LBB1974:
LBB1789:
	.loc 1 1369 0
	movl	$0, 20(%esi)
	jmp	L272
LVL608:
	.p2align 4,,7
L279:
	.loc 1 1389 0
	movl	%eax, %edx
	andl	$-5, %edx
LVL609:
	jmp	L281
LVL610:
	.p2align 4,,7
L305:
LBE1789:
LBE1974:
LBB1975:
LBB1976:
	.loc 4 615 0
/APP
 # 615 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	lldt 50(%esp)
 # 0 "" 2
LVL611:
/NO_APP
LBE1976:
LBE1975:
LBB1977:
LBB1978:
	.loc 4 604 0
/APP
 # 604 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	mov 48(%esp), %fs
 # 0 "" 2
/NO_APP
LBE1978:
LBE1977:
	.loc 1 2110 0
	call	_local_irq_disable
LBB1979:
LBB1980:
	.loc 4 609 0
/APP
 # 609 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	mov 46(%esp), %gs
 # 0 "" 2
/NO_APP
LBE1980:
LBE1979:
	.loc 1 2115 0
	call	_local_irq_enable
LBB1981:
LBB1982:
LBB1983:
LBB1984:
	.loc 4 626 0
/APP
 # 626 "/home/ddk50/vmware/winkvm/kvm/kernel/kvm.h" 1
	sgdt 72(%esp)
 # 0 "" 2
/NO_APP
LBE1984:
LBE1983:
	.loc 1 357 0
	movl	74(%esp), %eax
	movzbl	37(%eax), %edx
	andl	$-16, %edx
	orl	$9, %edx
	movb	%dl, 37(%eax)
LBB1985:
LBB1986:
	.loc 2 240 0
	movl	$32, %eax
/APP
 # 240 "include/asm/winkvmmisc.h" 1
	ltr %ax
 # 0 "" 2
/NO_APP
	jmp	L283
LVL612:
	.p2align 4,,7
L307:
LBE1986:
LBE1985:
LBE1982:
LBE1981:
LBB1987:
LBB1957:
	.loc 1 1842 0
	testl	%eax, %eax
	je	L286
LVL613:
	.loc 1 1844 0
	movl	%eax, 8(%esp)
	movl	$___FUNCTION__.3724, 4(%esp)
	movl	$LC24, (%esp)
	call	_printk
LVL614:
	jmp	L286
LVL615:
	.p2align 4,,7
L304:
LBE1957:
LBE1987:
LBB1988:
LBB1916:
LBB1913:
LBB1914:
LBB1915:
	.loc 1 157 0
	movl	$26656, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL616:
/NO_APP
LBE1915:
LBE1914:
	.loc 1 1409 0
	orl	$65792, %eax
	movl	%eax, %edx
	movl	$26656, %eax
LVL617:
	call	_vmcs_writel
	jmp	L282
LVL618:
	.p2align 4,,7
L274:
LBE1913:
LBE1916:
LBE1988:
LBB1989:
LBB1879:
LBB1876:
LBB1857:
LBB1853:
LBB1854:
	.loc 1 205 0
	orl	$-2147483648, 20(%esp)
LVL619:
	movl	$16406, %eax
	movl	20(%esp), %edx
LVL620:
	call	_vmcs_writel
	jmp	L272
LVL621:
	.p2align 4,,7
L309:
LBE1854:
LBE1853:
LBE1857:
LBE1876:
LBE1879:
LBE1989:
LBB1990:
LBB1973:
	.loc 1 1768 0
	movl	24(%esi), %ebx
LVL622:
	testl	%ebx, %ebx
	sete	%al
	jmp	L297
LVL623:
	.p2align 4,,7
L303:
LBE1973:
LBE1990:
LBB1991:
LBB1788:
LBB1792:
LBB1795:
LBB1798:
LBB1800:
LBB1822:
LBB1823:
LBB1824:
LBB1825:
	.loc 1 157 0
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
	movl	%eax, %ebp
LVL624:
LBE1825:
LBE1824:
LBE1823:
LBE1822:
LBB1826:
LBB1827:
	movl	%ebx, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
	movl	%eax, %ebx
LVL625:
LBE1827:
LBE1826:
LBB1828:
LBB1829:
	movb	$28, %dl
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
LBE1829:
LBE1828:
	.loc 1 1304 0
	movl	%ebp, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%eax, 8(%esp)
LVL626:
	movl	$___FUNCTION__.3338, 4(%esp)
	movl	$LC20, (%esp)
	call	_printk
LVL627:
	jmp	L272
LVL628:
	.p2align 4,,7
L306:
LBE1800:
LBE1798:
LBE1795:
LBE1792:
LBE1788:
LBE1991:
	.loc 1 2136 0
	movl	$1, 28(%edi)
LBB1992:
LBB1993:
LBB1994:
LBB1995:
	.loc 1 157 0
	movl	$17408, %edx
LVL629:
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL630:
/NO_APP
LBE1995:
LBE1994:
LBE1993:
LBE1992:
	.loc 1 2137 0
	movl	%eax, 32(%edi)
	.loc 1 2139 0
	movl	%eax, 4(%esp)
	movl	$LC23, (%esp)
	call	_printk
LVL631:
	xorl	%ecx, %ecx
LVL632:
	jmp	L285
LVL633:
	.p2align 4,,7
L308:
	.loc 1 2158 0
	addl	$1, _kvm_stat+28
LBB1996:
LBB1997:
LBB1998:
LBB1999:
	.loc 1 157 0
	movl	$26656, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL634:
/NO_APP
LBE1999:
LBE1998:
	.loc 1 1765 0
	shrl	$9, %eax
	andl	$1, %eax
LVL635:
	movb	%al, 41(%edi)
	.loc 1 1766 0
	movl	132(%esi), %edx
	movl	%edx, 44(%edi)
	jmp	L302
LVL636:
L276:
LBE1997:
LBE1996:
LBB2000:
LBB1880:
LBB1877:
LBB1858:
LBB1855:
LBB1835:
LBB1808:
LBB1809:
	.loc 1 157 0
	movl	$26656, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL637:
/NO_APP
LBE1809:
LBE1808:
	.loc 1 1318 0
	movl	%eax, 80(%esp)
LVL638:
LBB1806:
LBB1807:
	.loc 1 157 0
	movb	$8, %dl
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL639:
/NO_APP
LBE1807:
LBE1806:
	.loc 1 1319 0
	shrl	$4, %eax
LBB1803:
LBB1804:
	.loc 1 157 0
	movb	$30, %dl
LBE1804:
LBE1803:
	.loc 1 1319 0
	movw	%ax, 86(%esp)
LVL640:
LBB1802:
LBB1805:
	.loc 1 157 0
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL641:
/NO_APP
LBE1805:
LBE1802:
	.loc 1 1323 0
	movl	68(%esp), %ebx
	addl	64(%esp), %ebx
	.loc 1 1320 0
	movw	%ax, 84(%esp)
LVL642:
LBE1835:
	.loc 1 1323 0
	leal	80(%esp), %eax
LVL643:
	movl	%eax, 12(%esp)
	leal	-2(%ebx), %eax
	movl	$2, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	_kvm_write_guest
LBB1836:
	cmpl	$2, %eax
	je	L310
LVL644:
L277:
	.loc 1 1326 0
	movl	$___FUNCTION__.3338, 4(%esp)
	movl	$LC22, (%esp)
	call	_printk
	jmp	L272
L310:
LBE1836:
	.loc 1 1323 0
	leal	86(%esp), %eax
	movl	%eax, 12(%esp)
	leal	-4(%ebx), %eax
	movl	$2, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	_kvm_write_guest
LBB1837:
	cmpl	$2, %eax
	jne	L277
LBE1837:
	leal	84(%esp), %eax
	movl	%eax, 12(%esp)
	leal	-6(%ebx), %eax
	movl	$2, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	_kvm_write_guest
LBB1838:
	cmpl	$2, %eax
	jne	L277
	.loc 1 1330 0
	movl	80(%esp), %edx
	movl	$26656, %eax
	andl	$-262913, %edx
LVL645:
	call	_vmcs_writel
LVL646:
LBB1830:
LBB1831:
	.loc 1 200 0
	movzwl	74(%esp), %edx
	movl	$2050, %eax
	call	_vmcs_writel
LBE1831:
LBE1830:
	.loc 1 1333 0
	movzwl	74(%esp), %edx
	movl	$26632, %eax
	sall	$4, %edx
	call	_vmcs_writel
	.loc 1 1334 0
	movzwl	72(%esp), %edx
	movl	$26654, %eax
	call	_vmcs_writel
LBB1832:
LBB1833:
	.loc 1 157 0
	movl	$26652, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL647:
/NO_APP
LBE1833:
LBE1832:
	.loc 1 1335 0
	movl	68(%esp), %edx
	xorw	%ax, %ax
LVL648:
	subl	$6, %edx
	orl	%edx, %eax
LVL649:
	movl	%eax, %edx
	movl	$26652, %eax
LVL650:
	call	_vmcs_writel
	jmp	L272
LBE1838:
LBE1855:
LBE1858:
LBE1877:
LBE1880:
LBE2000:
LFE197:
	.section .rdata,"dr"
	.align 4
LC25:
	.ascii "<7>handle_cr: read CR8 cpu erratum AA15\12\0"
	.align 4
LC26:
	.ascii "<3>kvm: unhandled control register: op %d cr %d\12\0"
	.text
	.p2align 4,,15
	.def	_handle_cr;	.scl	3;	.type	32;	.endef
_handle_cr:
LFB186:
	.loc 1 1623 0
LVL651:
	subl	$32, %esp
LCFI115:
LBB2001:
LBB2002:
LBB2003:
LBB2004:
	.loc 1 157 0
	movl	$25600, %edx
LBE2004:
LBE2003:
LBE2002:
LBE2001:
	.loc 1 1623 0
	movl	%ebx, 16(%esp)
LCFI116:
	movl	%esi, 20(%esp)
LCFI117:
	movl	%edi, 24(%esp)
LCFI118:
	movl	%ebp, 28(%esp)
LCFI119:
LBB2010:
LBB2009:
LBB2006:
LBB2005:
	.loc 1 157 0
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
	movl	%eax, %ecx
LVL652:
LBE2005:
LBE2006:
LBB2007:
LBB2008:
	movb	$1, %dl
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL653:
/NO_APP
LBE2008:
LBE2007:
	.loc 1 177 0
	movl	%ecx, %ebx
LVL654:
	movl	%eax, %esi
LVL655:
LBE2009:
LBE2010:
	.loc 1 1630 0
	movl	%esi, %edx
	movl	%ebx, %eax
LVL656:
	shrdl	$8, %edx, %eax
	.loc 1 1631 0
	movl	%esi, %ebp
	.loc 1 1630 0
	movl	%eax, %edi
	.loc 1 1629 0
	andl	$15, %ecx
LVL657:
	.loc 1 1630 0
	andl	$15, %edi
	movl	%edi, 12(%esp)
LVL658:
	.loc 1 1631 0
	movl	%ebx, %edi
	shrdl	$4, %ebp, %edi
	movl	%edi, %edx
	andl	$3, %edx
	cmpl	$1, %edx
	jne	L327
	.loc 1 1657 0
	cmpl	$3, %ecx
	je	L323
	cmpl	$8, %ecx
	je	L328
L312:
	.loc 1 1682 0
	movl	40(%esp), %eax
	movl	$0, 32(%eax)
	.loc 1 1683 0
	movl	%edi, %eax
	andl	$3, %eax
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC26, (%esp)
	call	_printk
LVL659:
	xorl	%eax, %eax
	jmp	L322
LVL660:
	.p2align 4,,7
L327:
	.loc 1 1631 0
	cmpl	$1, %edx
	jb	L313
	cmpl	$3, %edx
	.p2align 4,,5
	jne	L312
	.loc 1 1675 0
	movl	36(%esp), %edx
	shrdl	$16, %esi, %ebx
LVL661:
	movl	%ebx, %eax
LVL662:
	andl	$15, %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_lmsw
LVL663:
	.loc 1 1677 0
	movl	36(%esp), %ecx
	movl	%ecx, (%esp)
	call	_skip_emulated_instruction
	movl	$1, %eax
LVL664:
L322:
	.loc 1 1686 0
	movl	16(%esp), %ebx
LVL665:
	movl	20(%esp), %esi
LVL666:
	movl	24(%esp), %edi
	movl	28(%esp), %ebp
	addl	$32, %esp
	ret
LVL667:
	.p2align 4,,7
L313:
	.loc 1 1633 0
	cmpl	$3, %ecx
	je	L318
	jg	L321
	testl	%ecx, %ecx
	.p2align 4,,7
	jne	L312
LBB2011:
LBB2012:
LBB2013:
LBB2014:
	.loc 1 157 0
	movl	$26652, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL668:
/NO_APP
LBE2014:
LBE2013:
	.loc 1 464 0
	movl	36(%esp), %edx
	movl	%eax, 76(%edx)
LBB2015:
LBB2016:
	.loc 1 157 0
	movl	$26654, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL669:
/NO_APP
LBE2016:
LBE2015:
	.loc 1 465 0
	movl	36(%esp), %ecx
LVL670:
	movl	%eax, 92(%ecx)
LBE2012:
LBE2011:
	.loc 1 1636 0
	movl	12(%esp), %edi
	movl	60(%ecx,%edi,4), %eax
LVL671:
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	call	_set_cr0
	.loc 1 1637 0
	movl	36(%esp), %eax
	movl	%eax, (%esp)
	call	_skip_emulated_instruction
	movl	$1, %eax
	jmp	L322
LVL672:
	.p2align 4,,7
L323:
LBB2017:
LBB2018:
LBB2019:
LBB2020:
	.loc 1 157 0
	movl	$26652, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL673:
/NO_APP
LBE2020:
LBE2019:
	.loc 1 464 0
	movl	36(%esp), %edx
	movl	%eax, 76(%edx)
LBB2021:
LBB2022:
	.loc 1 157 0
	movl	$26654, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL674:
/NO_APP
LBE2022:
LBE2021:
	.loc 1 465 0
	movl	36(%esp), %ecx
LVL675:
	movl	%eax, 92(%ecx)
LBE2018:
LBE2017:
	.loc 1 1660 0
	movl	104(%ecx), %eax
LVL676:
L326:
	.loc 1 1668 0
	movl	12(%esp), %edi
	movl	%eax, 60(%ecx,%edi,4)
	.loc 1 1669 0
	movl	%ecx, (%esp)
	call	_vcpu_put_rsp_rip
	.loc 1 1670 0
	movl	36(%esp), %eax
	movl	%eax, (%esp)
	call	_skip_emulated_instruction
	movl	$1, %eax
	jmp	L322
LVL677:
	.p2align 4,,7
L318:
LBB2023:
LBB2024:
LBB2025:
LBB2026:
	.loc 1 157 0
	movl	$26652, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL678:
/NO_APP
LBE2026:
LBE2025:
	.loc 1 464 0
	movl	36(%esp), %edx
	movl	%eax, 76(%edx)
LBB2027:
LBB2028:
	.loc 1 157 0
	movl	$26654, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL679:
/NO_APP
LBE2028:
LBE2027:
	.loc 1 465 0
	movl	36(%esp), %ecx
LVL680:
	movl	%eax, 92(%ecx)
LBE2024:
LBE2023:
	.loc 1 1641 0
	movl	12(%esp), %edi
	movl	60(%ecx,%edi,4), %eax
LVL681:
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	call	_set_cr3
	.loc 1 1642 0
	movl	36(%esp), %eax
	movl	%eax, (%esp)
	call	_skip_emulated_instruction
	movl	$1, %eax
	jmp	L322
LVL682:
	.p2align 4,,7
L321:
	.loc 1 1633 0
	cmpl	$4, %ecx
	je	L319
	cmpl	$8, %ecx
	.p2align 4,,5
	jne	L312
LBB2029:
LBB2030:
LBB2031:
LBB2032:
	.loc 1 157 0
	movl	$26652, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL683:
/NO_APP
LBE2032:
LBE2031:
	.loc 1 464 0
	movl	36(%esp), %edx
	movl	%eax, 76(%edx)
LBB2033:
LBB2034:
	.loc 1 157 0
	movl	$26654, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL684:
/NO_APP
LBE2034:
LBE2033:
	.loc 1 465 0
	movl	36(%esp), %ecx
LVL685:
	movl	%eax, 92(%ecx)
LBE2030:
LBE2029:
	.loc 1 1651 0
	movl	12(%esp), %edi
	movl	60(%ecx,%edi,4), %eax
LVL686:
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	call	_set_cr8
	.loc 1 1652 0
	movl	36(%esp), %eax
	movl	%eax, (%esp)
	call	_skip_emulated_instruction
	movl	$1, %eax
	jmp	L322
LVL687:
	.p2align 4,,7
L328:
	.loc 1 1665 0
	movl	$LC25, (%esp)
	call	_printk
LVL688:
LBB2035:
LBB2036:
LBB2037:
LBB2038:
	.loc 1 157 0
	movl	$26652, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL689:
/NO_APP
LBE2038:
LBE2037:
	.loc 1 464 0
	movl	36(%esp), %edx
	movl	%eax, 76(%edx)
LBB2039:
LBB2040:
	.loc 1 157 0
	movl	$26654, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL690:
/NO_APP
LBE2040:
LBE2039:
	.loc 1 465 0
	movl	36(%esp), %ecx
	movl	%eax, 92(%ecx)
LBE2036:
LBE2035:
	.loc 1 1668 0
	movl	132(%ecx), %eax
LVL691:
	jmp	L326
LVL692:
	.p2align 4,,7
L319:
LBB2041:
LBB2042:
LBB2043:
LBB2044:
	.loc 1 157 0
	movl	$26652, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL693:
/NO_APP
LBE2044:
LBE2043:
	.loc 1 464 0
	movl	36(%esp), %edx
	movl	%eax, 76(%edx)
LBB2045:
LBB2046:
	.loc 1 157 0
	movl	$26654, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL694:
/NO_APP
LBE2046:
LBE2045:
	.loc 1 465 0
	movl	36(%esp), %ecx
LVL695:
	movl	%eax, 92(%ecx)
LBE2042:
LBE2041:
	.loc 1 1646 0
	movl	12(%esp), %edi
	movl	60(%ecx,%edi,4), %eax
LVL696:
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	call	_set_cr4
	.loc 1 1647 0
	movl	36(%esp), %eax
	movl	%eax, (%esp)
	call	_skip_emulated_instruction
	movl	$1, %eax
	jmp	L322
LFE186:
	.p2align 4,,15
	.def	_handle_vmcall;	.scl	3;	.type	32;	.endef
_handle_vmcall:
LFB194:
	.loc 1 1801 0
LVL697:
	subl	$12, %esp
LCFI120:
	movl	%ebx, 4(%esp)
LCFI121:
	movl	20(%esp), %ebx
	movl	%esi, 8(%esp)
LCFI122:
	.loc 1 1801 0
	movl	16(%esp), %esi
	.loc 1 1802 0
	movl	%esi, (%esp)
	call	_skip_emulated_instruction
	.loc 1 1803 0
	movl	%ebx, 20(%esp)
	.loc 1 1804 0
	movl	4(%esp), %ebx
	.loc 1 1803 0
	movl	%esi, 16(%esp)
	.loc 1 1804 0
	movl	8(%esp), %esi
	addl	$12, %esp
	.loc 1 1803 0
	jmp	_kvm_hypercall
LFE194:
	.section .rdata,"dr"
	.align 4
LC27:
	.ascii "<3>%s: unexpected, vectoring info 0x%x intr info 0x%x\12\0"
LC28:
	.ascii "<7>%s: emulate fail\12\0"
	.text
	.p2align 4,,15
	.def	_handle_exception;	.scl	3;	.type	32;	.endef
_handle_exception:
LFB180:
	.loc 1 1434 0
LVL698:
	subl	$36, %esp
LCFI123:
LBB2047:
LBB2048:
LBB2049:
LBB2050:
	.loc 1 157 0
	movl	$17416, %edx
LBE2050:
LBE2049:
LBE2048:
LBE2047:
	.loc 1 1434 0
	movl	%edi, 28(%esp)
LCFI124:
	movl	40(%esp), %edi
	movl	%ebx, 20(%esp)
LCFI125:
	movl	%esi, 24(%esp)
LCFI126:
	movl	%ebp, 32(%esp)
LCFI127:
LBB2054:
LBB2053:
LBB2052:
LBB2051:
	.loc 1 157 0
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
	movl	%eax, %ebx
LVL699:
LBE2051:
LBE2052:
LBE2053:
LBE2054:
LBB2055:
LBB2056:
LBB2057:
LBB2058:
	movb	$4, %dl
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
LBE2058:
LBE2057:
LBE2056:
LBE2055:
	.loc 1 1446 0
	testl	%ebx, %ebx
LBB2062:
LBB2061:
LBB2060:
LBB2059:
	.loc 1 157 0
	movl	%eax, %esi
LVL700:
LBE2059:
LBE2060:
LBE2061:
LBE2062:
	.loc 1 1446 0
	js	L348
LVL701:
L332:
	.loc 1 1452 0
	movl	%ebx, %eax
	andl	$-2147481856, %eax
	cmpl	$-2147483648, %eax
	je	L349
	.loc 1 1459 0
	movl	%esi, %eax
	andl	$1792, %eax
	cmpl	$512, %eax
	je	L350
L334:
LBB2063:
LBB2064:
	.loc 1 157 0
	movl	$26654, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL702:
/NO_APP
LBE2064:
LBE2063:
	.loc 1 1466 0
	xorl	%ebp, %ebp
LVL703:
	testl	$2048, %esi
	jne	L351
	.loc 1 1468 0
	movl	%esi, %eax
LVL704:
	andl	$-2147481601, %eax
	cmpl	$-2147482866, %eax
	je	L352
LVL705:
L338:
	.loc 1 1505 0
	movl	14844(%edi), %eax
	testl	%eax, %eax
	jne	L353
L345:
	.loc 1 1512 0
	movl	%esi, %eax
	andl	$2047, %eax
	cmpl	$769, %eax
	je	L354
	.loc 1 1517 0
	movl	44(%esp), %edx
	.loc 1 1518 0
	movl	%esi, %eax
	.loc 1 1519 0
	xorl	%ebx, %ebx
LVL706:
	.loc 1 1518 0
	andl	$255, %eax
	.loc 1 1517 0
	movl	$1, 32(%edx)
	.loc 1 1518 0
	movl	%eax, 60(%edx)
	.loc 1 1519 0
	movl	%ebp, 64(%edx)
L335:
	.loc 1 1522 0
	movl	%ebx, %eax
	movl	24(%esp), %esi
LVL707:
	movl	20(%esp), %ebx
LVL708:
	movl	28(%esp), %edi
LVL709:
	movl	32(%esp), %ebp
LVL710:
	addl	$36, %esp
	ret
LVL711:
	.p2align 4,,7
L351:
LBB2065:
LBB2066:
LBB2067:
LBB2068:
	.loc 1 157 0
	movl	$17414, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
LVL712:
/NO_APP
	movl	%eax, %ebp
LBE2068:
LBE2067:
LBE2066:
LBE2065:
	.loc 1 1468 0
	movl	%esi, %eax
	andl	$-2147481601, %eax
	cmpl	$-2147482866, %eax
	jne	L338
L352:
LBB2069:
LBB2070:
	.loc 1 157 0
	movl	$25600, %edx
/APP
 # 157 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	.byte 0x0f, 0x78, 0xd0
 # 0 "" 2
/NO_APP
	movl	%eax, 16(%esp)
LVL713:
LBE2070:
LBE2069:
	.loc 1 1471 0
	movl	(%edi), %eax
	movl	%eax, (%esp)
	call	_spin_lock
LBB2071:
LBB2072:
	.loc 4 531 0
	movl	(%edi), %eax
	cmpl	$4, 96(%eax)
	jle	L355
L339:
LBE2072:
	.loc 4 536 0
	movl	16(%esp), %edx
	movl	%ebp, 8(%esp)
	movl	%edi, (%esp)
	movl	%edx, 4(%esp)
	call	*13528(%edi)
LBE2071:
	.loc 1 1474 0
	cmpl	$0, %eax
LVL714:
LBB2074:
	.loc 4 536 0
	movl	%eax, %ebx
LVL715:
LBE2074:
	.loc 1 1474 0
	jl	L356
LVL716:
	.loc 1 1479 0
	je	L357
	.loc 1 1485 0
	movzwl	%bp, %eax
LVL717:
	movl	44(%esp), %edx
	movl	%eax, 12(%esp)
	movl	16(%esp), %eax
LVL718:
	movl	%edi, (%esp)
	movl	%edx, 4(%esp)
	movl	%eax, 8(%esp)
	call	_emulate_instruction
	movl	%eax, %ebx
LVL719:
	.loc 1 1486 0
	movl	(%edi), %eax
	movl	%eax, (%esp)
	call	_spin_unlock
	.loc 1 1488 0
	cmpl	$1, %ebx
	je	L343
	jb	L342
	cmpl	$2, %ebx
	.p2align 4,,7
	jne	L338
	.loc 1 1498 0
	movl	$___FUNCTION__.3455, 4(%esp)
	movl	$LC28, (%esp)
	call	_printk
	jmp	L338
LVL720:
	.p2align 4,,7
L353:
LBB2075:
LBB2076:
	.loc 1 1422 0
	movl	%esi, %edx
LVL721:
	cmpb	$13, %dl
	jne	L345
	testl	%ebp, %ebp
	.p2align 4,,5
	jne	L345
LBE2076:
	.loc 1 1423 0
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	%edi, (%esp)
	call	_emulate_instruction
LBB2077:
	testl	%eax, %eax
	jne	L345
LVL722:
L342:
LBE2077:
LBE2075:
	.loc 1 1521 0
	movl	$1, %ebx
LVL723:
	jmp	L335
LVL724:
	.p2align 4,,7
L349:
LBB2078:
	.loc 1 1453 0
	movzbl	%bl,%eax
LVL725:
LBB2079:
LBB2080:
	.loc 3 291 0
	leal	28(%edi), %edx
/APP
 # 291 "include/linux/winkvmstab.h" 1
	lock; btsl %eax,28(%edi)
 # 0 "" 2
/NO_APP
LBE2080:
LBE2079:
	.loc 1 1455 0
	sarl	$5, %eax
LBB2081:
LBB2082:
	.loc 3 291 0
	leal	24(%edi), %edx
/APP
 # 291 "include/linux/winkvmstab.h" 1
	lock; btsl %eax,24(%edi)
 # 0 "" 2
/NO_APP
LBE2082:
LBE2081:
LBE2078:
	.loc 1 1459 0
	movl	%esi, %eax
LVL726:
	andl	$1792, %eax
	cmpl	$512, %eax
	jne	L334
L350:
	.loc 1 1460 0
/APP
 # 1460 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c" 1
	int $2
 # 0 "" 2
/NO_APP
	movl	$1, %ebx
LVL727:
	jmp	L335
LVL728:
	.p2align 4,,7
L348:
	.loc 1 1446 0
	andl	$-2147481601, %eax
	cmpl	$-2147482866, %eax
	je	L332
	.loc 1 1448 0
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	$___FUNCTION__.3455, 4(%esp)
	movl	$LC27, (%esp)
	call	_printk
	jmp	L332
LVL729:
	.p2align 4,,7
L354:
	.loc 1 1513 0
	movl	44(%esp), %eax
	xorl	%ebx, %ebx
LVL730:
	movl	$4, 32(%eax)
	jmp	L335
LVL731:
	.p2align 4,,7
L343:
	.loc 1 1494 0
	movl	44(%esp), %eax
	xorl	%ebx, %ebx
LVL732:
	.loc 1 1493 0
	addl	$1, _kvm_stat+24
	.loc 1 1494 0
	movl	$6, 32(%eax)
	jmp	L335
LVL733:
	.p2align 4,,7
L357:
	.loc 1 1480 0
	movl	(%edi), %eax
	movl	$1, %ebx
	movl	%eax, (%esp)
	call	_spin_unlock
	jmp	L335
LVL734:
	.p2align 4,,7
L355:
LBB2083:
LBB2073:
	.loc 4 532 0
	movl	%edi, (%esp)
	call	_kvm_mmu_free_some_pages
	.p2align 4,,6
	jmp	L339
LVL735:
	.p2align 4,,7
L356:
LBE2073:
LBE2083:
	.loc 1 1475 0
	movl	(%edi), %eax
	movl	%eax, (%esp)
	call	_spin_unlock
	.p2align 4,,4
	jmp	L335
LFE180:
	.data
	.align 32
_vmx_arch_ops:
	.long	_cpu_has_kvm_support
	.long	_vmx_disabled_by_bios
	.long	_hardware_enable
	.long	_hardware_disable
	.long	_hardware_setup
	.long	_hardware_unsetup
	.long	_vmx_create_vcpu
	.long	_vmx_free_vcpu
	.long	_vmx_vcpu_load
	.long	_vmx_vcpu_put
	.long	_vmx_vcpu_decache
	.long	_set_guest_debug
	.long	_vmx_get_msr
	.long	_vmx_set_msr
	.long	_vmx_get_segment_base
	.long	_vmx_get_segment
	.long	_vmx_set_segment
	.long	_vmx_get_cs_db_l_bits
	.long	_vmx_decache_cr0_cr4_guest_bits
	.long	_vmx_set_cr0
	.long	_vmx_set_cr0_no_modeswitch
	.long	_vmx_set_cr3
	.long	_vmx_set_cr4
	.space 4
	.long	_vmx_get_idt
	.long	_vmx_set_idt
	.long	_vmx_get_gdt
	.long	_vmx_set_gdt
	.space 8
	.long	_vcpu_load_rsp_rip
	.long	_vcpu_put_rsp_rip
	.long	_vmx_get_rflags
	.long	_vmx_set_rflags
	.space 4
	.long	_vmx_flush_tlb
	.long	_vmx_inject_page_fault
	.long	_vmx_inject_gp
	.long	_vmx_vcpu_run
	.long	_vmx_vcpu_setup
	.long	_skip_emulated_instruction
	.long	_vmx_patch_hypercall
	.section .rdata,"dr"
___FUNCTION__.3857:
	.ascii "vmx_init\0"
	.align 4
_vmx_msr_index:
	.long	-1073741696
	.long	-1073741695
___FUNCTION__.3203:
	.ascii "init_rmode_tss\0"
	.data
	.align 32
_kvm_vmx_segment_fields:
	.long	2050
	.long	26632
	.long	18434
	.long	18454
	.long	2054
	.long	26636
	.long	18438
	.long	18458
	.long	2048
	.long	26630
	.long	18432
	.long	18452
	.long	2056
	.long	26638
	.long	18440
	.long	18460
	.long	2058
	.long	26640
	.long	18442
	.long	18462
	.long	2052
	.long	26634
	.long	18436
	.long	18456
	.long	2062
	.long	26644
	.long	18446
	.long	18466
	.long	2060
	.long	26642
	.long	18444
	.long	18464
	.section .rdata,"dr"
___FUNCTION__.2881:
	.ascii "hardware_setup\0"
___FUNCTION__.2807:
	.ascii "setup_vmcs_descriptor\0"
___FUNCTION__.2866:
	.ascii "alloc_kvm_area\0"
___FUNCTION__.2788:
	.ascii "hardware_enable\0"
___FUNCTION__.2776:
	.ascii "vmx_disabled_by_bios\0"
___FUNCTION__.2768:
	.ascii "cpu_has_kvm_support\0"
___FUNCTION__.3338:
	.ascii "inject_rmode_irq\0"
	.align 32
_kvm_vmx_exit_handlers:
	.long	_handle_exception
	.long	_handle_external_interrupt
	.long	_handle_triple_fault
	.space 16
	.long	_handle_interrupt_window
	.space 8
	.long	_handle_cpuid
	.space 4
	.long	_handle_halt
	.space 20
	.long	_handle_vmcall
	.space 36
	.long	_handle_cr
	.long	_handle_dr
	.long	_handle_io
	.long	_handle_rdmsr
	.long	_handle_wrmsr
___FUNCTION__.3724:
	.ascii "kvm_handle_exit\0"
___FUNCTION__.3455:
	.ascii "handle_exception\0"
.lcomm _g_vmxarea_,16
.lcomm _g_current_vmcs_,16
.lcomm _vmcs_descriptor,16
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
	.long	LFB128
	.long	LFE128-LFB128
	.align 4
LEFDE0:
LSFDE2:
	.long	LEFDE2-LASFDE2
LASFDE2:
	.secrel32	Lframe0
	.long	LFB137
	.long	LFE137-LFB137
	.align 4
LEFDE2:
LSFDE4:
	.long	LEFDE4-LASFDE4
LASFDE4:
	.secrel32	Lframe0
	.long	LFB143
	.long	LFE143-LFB143
	.align 4
LEFDE4:
LSFDE6:
	.long	LEFDE6-LASFDE6
LASFDE6:
	.secrel32	Lframe0
	.long	LFB158
	.long	LFE158-LFB158
	.align 4
LEFDE6:
LSFDE8:
	.long	LEFDE8-LASFDE8
LASFDE8:
	.secrel32	Lframe0
	.long	LFB163
	.long	LFE163-LFB163
	.align 4
LEFDE8:
LSFDE10:
	.long	LEFDE10-LASFDE10
LASFDE10:
	.secrel32	Lframe0
	.long	LFB164
	.long	LFE164-LFB164
	.byte	0x4
	.long	LCFI0-LFB164
	.byte	0xe
	.uleb128 0x1c
	.byte	0x4
	.long	LCFI2-LCFI0
	.byte	0x86
	.uleb128 0x4
	.byte	0x83
	.uleb128 0x5
	.byte	0x4
	.long	LCFI4-LCFI2
	.byte	0x85
	.uleb128 0x2
	.byte	0x87
	.uleb128 0x3
	.align 4
LEFDE10:
LSFDE12:
	.long	LEFDE12-LASFDE12
LASFDE12:
	.secrel32	Lframe0
	.long	LFB166
	.long	LFE166-LFB166
	.align 4
LEFDE12:
LSFDE14:
	.long	LEFDE14-LASFDE14
LASFDE14:
	.secrel32	Lframe0
	.long	LFB167
	.long	LFE167-LFB167
	.align 4
LEFDE14:
LSFDE16:
	.long	LEFDE16-LASFDE16
LASFDE16:
	.secrel32	Lframe0
	.long	LFB169
	.long	LFE169-LFB169
	.align 4
LEFDE16:
LSFDE18:
	.long	LEFDE18-LASFDE18
LASFDE18:
	.secrel32	Lframe0
	.long	LFB181
	.long	LFE181-LFB181
	.align 4
LEFDE18:
LSFDE20:
	.long	LEFDE20-LASFDE20
LASFDE20:
	.secrel32	Lframe0
	.long	LFB182
	.long	LFE182-LFB182
	.align 4
LEFDE20:
LSFDE22:
	.long	LEFDE22-LASFDE22
LASFDE22:
	.secrel32	Lframe0
	.long	LFB185
	.long	LFE185-LFB185
	.align 4
LEFDE22:
LSFDE24:
	.long	LEFDE24-LASFDE24
LASFDE24:
	.secrel32	Lframe0
	.long	LFB188
	.long	LFE188-LFB188
	.align 4
LEFDE24:
LSFDE26:
	.long	LEFDE26-LASFDE26
LASFDE26:
	.secrel32	Lframe0
	.long	LFB192
	.long	LFE192-LFB192
	.align 4
LEFDE26:
LSFDE28:
	.long	LEFDE28-LASFDE28
LASFDE28:
	.secrel32	Lframe0
	.long	LFB204
	.long	LFE204-LFB204
	.align 4
LEFDE28:
LSFDE30:
	.long	LEFDE30-LASFDE30
LASFDE30:
	.secrel32	Lframe0
	.long	LFB203
	.long	LFE203-LFB203
	.byte	0x4
	.long	LCFI5-LFB203
	.byte	0xe
	.uleb128 0x14
	.align 4
LEFDE30:
LSFDE32:
	.long	LEFDE32-LASFDE32
LASFDE32:
	.secrel32	Lframe0
	.long	LFB120
	.long	LFE120-LFB120
	.byte	0x4
	.long	LCFI6-LFB120
	.byte	0xe
	.uleb128 0x1c
	.byte	0x4
	.long	LCFI7-LCFI6
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	LCFI8-LCFI7
	.byte	0x86
	.uleb128 0x2
	.align 4
LEFDE32:
LSFDE34:
	.long	LEFDE34-LASFDE34
LASFDE34:
	.secrel32	Lframe0
	.long	LFB121
	.long	LFE121-LFB121
	.byte	0x4
	.long	LCFI9-LFB121
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI10-LCFI9
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	LCFI11-LCFI10
	.byte	0x83
	.uleb128 0x3
	.align 4
LEFDE34:
LSFDE36:
	.long	LEFDE36-LASFDE36
LASFDE36:
	.secrel32	Lframe0
	.long	LFB130
	.long	LFE130-LFB130
	.align 4
LEFDE36:
LSFDE38:
	.long	LEFDE38-LASFDE38
LASFDE38:
	.secrel32	Lframe0
	.long	LFB193
	.long	LFE193-LFB193
	.byte	0x4
	.long	LCFI12-LFB193
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI13-LCFI12
	.byte	0xe
	.uleb128 0xc
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE38:
LSFDE40:
	.long	LEFDE40-LASFDE40
LASFDE40:
	.secrel32	Lframe0
	.long	LFB152
	.long	LFE152-LFB152
	.align 4
LEFDE40:
LSFDE42:
	.long	LEFDE42-LASFDE42
LASFDE42:
	.secrel32	Lframe0
	.long	LFB124
	.long	LFE124-LFB124
	.byte	0x4
	.long	LCFI14-LFB124
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI15-LCFI14
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	LCFI16-LCFI15
	.byte	0x86
	.uleb128 0x2
	.align 4
LEFDE42:
LSFDE44:
	.long	LEFDE44-LASFDE44
LASFDE44:
	.secrel32	Lframe0
	.long	LFB173
	.long	LFE173-LFB173
	.byte	0x4
	.long	LCFI17-LFB173
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE44:
LSFDE46:
	.long	LEFDE46-LASFDE46
LASFDE46:
	.secrel32	Lframe0
	.long	LFB156
	.long	LFE156-LFB156
	.byte	0x4
	.long	LCFI18-LFB156
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI19-LCFI18
	.byte	0x87
	.uleb128 0x2
	.byte	0x4
	.long	LCFI20-LCFI19
	.byte	0x83
	.uleb128 0x4
	.byte	0x4
	.long	LCFI21-LCFI20
	.byte	0x86
	.uleb128 0x3
	.align 4
LEFDE46:
LSFDE48:
	.long	LEFDE48-LASFDE48
LASFDE48:
	.secrel32	Lframe0
	.long	LFB198
	.long	LFE198-LFB198
	.align 4
LEFDE48:
LSFDE50:
	.long	LEFDE50-LASFDE50
LASFDE50:
	.secrel32	Lframe0
	.long	LFB129
	.long	LFE129-LFB129
	.align 4
LEFDE50:
LSFDE52:
	.long	LEFDE52-LASFDE52
LASFDE52:
	.secrel32	Lframe0
	.long	LFB138
	.long	LFE138-LFB138
	.byte	0x4
	.long	LCFI22-LFB138
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE52:
LSFDE54:
	.long	LEFDE54-LASFDE54
LASFDE54:
	.secrel32	Lframe0
	.long	LFB187
	.long	LFE187-LFB187
	.byte	0x4
	.long	LCFI23-LFB187
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI24-LCFI23
	.byte	0x87
	.uleb128 0x2
	.byte	0x4
	.long	LCFI26-LCFI24
	.byte	0x86
	.uleb128 0x3
	.byte	0x83
	.uleb128 0x4
	.align 4
LEFDE54:
LSFDE56:
	.long	LEFDE56-LASFDE56
LASFDE56:
	.secrel32	Lframe0
	.long	LFB170
	.long	LFE170-LFB170
	.byte	0x4
	.long	LCFI27-LFB170
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE56:
LSFDE58:
	.long	LEFDE58-LASFDE58
LASFDE58:
	.secrel32	Lframe0
	.long	LFB168
	.long	LFE168-LFB168
	.byte	0x4
	.long	LCFI28-LFB168
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE58:
LSFDE60:
	.long	LEFDE60-LASFDE60
LASFDE60:
	.secrel32	Lframe0
	.long	LFB162
	.long	LFE162-LFB162
	.byte	0x4
	.long	LCFI29-LFB162
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI30-LCFI29
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	LCFI31-LCFI30
	.byte	0x86
	.uleb128 0x2
	.align 4
LEFDE60:
LSFDE62:
	.long	LEFDE62-LASFDE62
LASFDE62:
	.secrel32	Lframe0
	.long	LFB161
	.long	LFE161-LFB161
	.align 4
LEFDE62:
LSFDE64:
	.long	LEFDE64-LASFDE64
LASFDE64:
	.secrel32	Lframe0
	.long	LFB157
	.long	LFE157-LFB157
	.byte	0x4
	.long	LCFI32-LFB157
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE64:
LSFDE66:
	.long	LEFDE66-LASFDE66
LASFDE66:
	.secrel32	Lframe0
	.long	LFB160
	.long	LFE160-LFB160
	.byte	0x4
	.long	LCFI33-LFB160
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI34-LCFI33
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	LCFI35-LCFI34
	.byte	0x83
	.uleb128 0x3
	.align 4
LEFDE66:
LSFDE68:
	.long	LEFDE68-LASFDE68
LASFDE68:
	.secrel32	Lframe0
	.long	LFB153
	.long	LFE153-LFB153
	.byte	0x4
	.long	LCFI36-LFB153
	.byte	0xe
	.uleb128 0x8
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	LCFI37-LCFI36
	.byte	0xe
	.uleb128 0xc
	.byte	0x83
	.uleb128 0x3
	.align 4
LEFDE68:
LSFDE70:
	.long	LEFDE70-LASFDE70
LASFDE70:
	.secrel32	Lframe0
	.long	LFB159
	.long	LFE159-LFB159
	.byte	0x4
	.long	LCFI38-LFB159
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI39-LCFI38
	.byte	0xe
	.uleb128 0xc
	.byte	0x83
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.align 4
LEFDE70:
LSFDE72:
	.long	LEFDE72-LASFDE72
LASFDE72:
	.secrel32	Lframe0
	.long	LFB165
	.long	LFE165-LFB165
	.byte	0x4
	.long	LCFI40-LFB165
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI41-LCFI40
	.byte	0x83
	.uleb128 0x4
	.byte	0x4
	.long	LCFI42-LCFI41
	.byte	0x86
	.uleb128 0x3
	.byte	0x4
	.long	LCFI43-LCFI42
	.byte	0x87
	.uleb128 0x2
	.align 4
LEFDE72:
LSFDE74:
	.long	LEFDE74-LASFDE74
LASFDE74:
	.secrel32	Lframe0
	.long	LFB139
	.long	LFE139-LFB139
	.byte	0x4
	.long	LCFI44-LFB139
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.long	LCFI45-LCFI44
	.byte	0x86
	.uleb128 0x4
	.byte	0x4
	.long	LCFI46-LCFI45
	.byte	0x87
	.uleb128 0x3
	.byte	0x4
	.long	LCFI48-LCFI46
	.byte	0x85
	.uleb128 0x2
	.byte	0x83
	.uleb128 0x5
	.align 4
LEFDE74:
LSFDE76:
	.long	LEFDE76-LASFDE76
LASFDE76:
	.secrel32	Lframe0
	.long	LFB131
	.long	LFE131-LFB131
	.byte	0x4
	.long	LCFI49-LFB131
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI50-LCFI49
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE76:
LSFDE78:
	.long	LEFDE78-LASFDE78
LASFDE78:
	.secrel32	Lframe0
	.long	LFB199
	.long	LFE199-LFB199
	.byte	0x4
	.long	LCFI51-LFB199
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.long	LCFI53-LCFI51
	.byte	0x86
	.uleb128 0x2
	.byte	0x83
	.uleb128 0x3
	.align 4
LEFDE78:
LSFDE80:
	.long	LEFDE80-LASFDE80
LASFDE80:
	.secrel32	Lframe0
	.long	LFB141
	.long	LFE141-LFB141
	.byte	0x4
	.long	LCFI54-LFB141
	.byte	0xe
	.uleb128 0xc
	.align 4
LEFDE80:
LSFDE82:
	.long	LEFDE82-LASFDE82
LASFDE82:
	.secrel32	Lframe0
	.long	LFB140
	.long	LFE140-LFB140
	.byte	0x4
	.long	LCFI55-LFB140
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI56-LCFI55
	.byte	0xe
	.uleb128 0x14
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE82:
LSFDE84:
	.long	LEFDE84-LASFDE84
LASFDE84:
	.secrel32	Lframe0
	.long	LFB174
	.long	LFE174-LFB174
	.byte	0x4
	.long	LCFI57-LFB174
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI58-LCFI57
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI59-LCFI58
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI60-LCFI59
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI61-LCFI60
	.byte	0xe
	.uleb128 0x48
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.align 4
LEFDE84:
LSFDE86:
	.long	LEFDE86-LASFDE86
LASFDE86:
	.secrel32	Lframe0
	.long	LFB113
	.long	LFE113-LFB113
	.byte	0x4
	.long	LCFI62-LFB113
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x4
	.long	LCFI63-LCFI62
	.byte	0xe
	.uleb128 0x20
	.align 4
LEFDE86:
LSFDE88:
	.long	LEFDE88-LASFDE88
LASFDE88:
	.secrel32	Lframe0
	.long	LFB136
	.long	LFE136-LFB136
	.byte	0x4
	.long	LCFI64-LFB136
	.byte	0xe
	.uleb128 0x1c
	.byte	0x4
	.long	LCFI65-LCFI64
	.byte	0x83
	.uleb128 0x5
	.byte	0x4
	.long	LCFI66-LCFI65
	.byte	0x87
	.uleb128 0x3
	.byte	0x4
	.long	LCFI67-LCFI66
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI68-LCFI67
	.byte	0x86
	.uleb128 0x4
	.align 4
LEFDE88:
LSFDE90:
	.long	LEFDE90-LASFDE90
LASFDE90:
	.secrel32	Lframe0
	.long	LFB190
	.long	LFE190-LFB190
	.byte	0x4
	.long	LCFI69-LFB190
	.byte	0xe
	.uleb128 0x1c
	.byte	0x4
	.long	LCFI70-LCFI69
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	LCFI71-LCFI70
	.byte	0x83
	.uleb128 0x3
	.align 4
LEFDE90:
LSFDE92:
	.long	LEFDE92-LASFDE92
LASFDE92:
	.secrel32	Lframe0
	.long	LFB135
	.long	LFE135-LFB135
	.byte	0x4
	.long	LCFI72-LFB135
	.byte	0xe
	.uleb128 0x1c
	.byte	0x4
	.long	LCFI73-LCFI72
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	LCFI74-LCFI73
	.byte	0x86
	.uleb128 0x4
	.byte	0x4
	.long	LCFI76-LCFI74
	.byte	0x87
	.uleb128 0x3
	.byte	0x83
	.uleb128 0x5
	.align 4
LEFDE92:
LSFDE94:
	.long	LEFDE94-LASFDE94
LASFDE94:
	.secrel32	Lframe0
	.long	LFB189
	.long	LFE189-LFB189
	.byte	0x4
	.long	LCFI77-LFB189
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI78-LCFI77
	.byte	0xe
	.uleb128 0x1c
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE94:
LSFDE96:
	.long	LEFDE96-LASFDE96
LASFDE96:
	.secrel32	Lframe0
	.long	LFB114
	.long	LFE114-LFB114
	.byte	0x4
	.long	LCFI79-LFB114
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI80-LCFI79
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	LCFI81-LCFI80
	.byte	0x83
	.uleb128 0x3
	.align 4
LEFDE96:
LSFDE98:
	.long	LEFDE98-LASFDE98
LASFDE98:
	.secrel32	Lframe0
	.long	LFB115
	.long	LFE115-LFB115
	.byte	0x4
	.long	LCFI82-LFB115
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.long	LCFI83-LCFI82
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	LCFI84-LCFI83
	.byte	0x83
	.uleb128 0x3
	.align 4
LEFDE98:
LSFDE100:
	.long	LEFDE100-LASFDE100
LASFDE100:
	.secrel32	Lframe0
	.long	LFB127
	.long	LFE127-LFB127
	.align 4
LEFDE100:
LSFDE102:
	.long	LEFDE102-LASFDE102
LASFDE102:
	.secrel32	Lframe0
	.long	LFB126
	.long	LFE126-LFB126
	.align 4
LEFDE102:
LSFDE104:
	.long	LEFDE104-LASFDE104
LASFDE104:
	.secrel32	Lframe0
	.long	LFB125
	.long	LFE125-LFB125
	.byte	0x4
	.long	LCFI85-LFB125
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI86-LCFI85
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI87-LCFI86
	.byte	0xe
	.uleb128 0x2c
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
	.long	LFB201
	.long	LFE201-LFB201
	.byte	0x4
	.long	LCFI88-LFB201
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI89-LCFI88
	.byte	0xe
	.uleb128 0x18
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE106:
LSFDE108:
	.long	LEFDE108-LASFDE108
LASFDE108:
	.secrel32	Lframe0
	.long	LFB145
	.long	LFE145-LFB145
	.byte	0x4
	.long	LCFI90-LFB145
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x4
	.long	LCFI91-LCFI90
	.byte	0xe
	.uleb128 0x14
	.align 4
LEFDE108:
LSFDE110:
	.long	LEFDE110-LASFDE110
LASFDE110:
	.secrel32	Lframe0
	.long	LFB202
	.long	LFE202-LFB202
	.byte	0x4
	.long	LCFI92-LFB202
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI93-LCFI92
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI94-LCFI93
	.byte	0xe
	.uleb128 0x14
	.byte	0x83
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.align 4
LEFDE110:
LSFDE112:
	.long	LEFDE112-LASFDE112
LASFDE112:
	.secrel32	Lframe0
	.long	LFB148
	.long	LFE148-LFB148
	.byte	0x4
	.long	LCFI95-LFB148
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI96-LCFI95
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x2
	.align 4
LEFDE112:
LSFDE114:
	.long	LEFDE114-LASFDE114
LASFDE114:
	.secrel32	Lframe0
	.long	LFB151
	.long	LFE151-LFB151
	.align 4
LEFDE114:
LSFDE116:
	.long	LEFDE116-LASFDE116
LASFDE116:
	.secrel32	Lframe0
	.long	LFB150
	.long	LFE150-LFB150
	.byte	0x4
	.long	LCFI97-LFB150
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI98-LCFI97
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI99-LCFI98
	.byte	0xe
	.uleb128 0x18
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
	.long	LFB142
	.long	LFE142-LFB142
	.byte	0x4
	.long	LCFI100-LFB142
	.byte	0xe
	.uleb128 0x2c
	.byte	0x4
	.long	LCFI104-LCFI100
	.byte	0x85
	.uleb128 0x2
	.byte	0x87
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x4
	.byte	0x83
	.uleb128 0x5
	.align 4
LEFDE118:
LSFDE120:
	.long	LEFDE120-LASFDE120
LASFDE120:
	.secrel32	Lframe0
	.long	LFB184
	.long	LFE184-LFB184
	.byte	0x4
	.long	LCFI105-LFB184
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI106-LCFI105
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI107-LCFI106
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI108-LCFI107
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI109-LCFI108
	.byte	0xe
	.uleb128 0x34
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
	.long	LFB197
	.long	LFE197-LFB197
	.byte	0x4
	.long	LCFI110-LFB197
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.long	LCFI111-LCFI110
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.long	LCFI112-LCFI111
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI113-LCFI112
	.byte	0xe
	.uleb128 0x14
	.byte	0x4
	.long	LCFI114-LCFI113
	.byte	0xe
	.uleb128 0x6c
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
LSFDE124:
	.long	LEFDE124-LASFDE124
LASFDE124:
	.secrel32	Lframe0
	.long	LFB186
	.long	LFE186-LFB186
	.byte	0x4
	.long	LCFI115-LFB186
	.byte	0xe
	.uleb128 0x24
	.byte	0x4
	.long	LCFI119-LCFI115
	.byte	0x85
	.uleb128 0x2
	.byte	0x87
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x4
	.byte	0x83
	.uleb128 0x5
	.align 4
LEFDE124:
LSFDE126:
	.long	LEFDE126-LASFDE126
LASFDE126:
	.secrel32	Lframe0
	.long	LFB194
	.long	LFE194-LFB194
	.byte	0x4
	.long	LCFI120-LFB194
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.long	LCFI121-LCFI120
	.byte	0x83
	.uleb128 0x3
	.byte	0x4
	.long	LCFI122-LCFI121
	.byte	0x86
	.uleb128 0x2
	.align 4
LEFDE126:
LSFDE128:
	.long	LEFDE128-LASFDE128
LASFDE128:
	.secrel32	Lframe0
	.long	LFB180
	.long	LFE180-LFB180
	.byte	0x4
	.long	LCFI123-LFB180
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.long	LCFI124-LCFI123
	.byte	0x87
	.uleb128 0x3
	.byte	0x4
	.long	LCFI127-LCFI124
	.byte	0x85
	.uleb128 0x2
	.byte	0x86
	.uleb128 0x4
	.byte	0x83
	.uleb128 0x5
	.align 4
LEFDE128:
	.text
Letext0:
	.section	.debug_loc,"dr"
Ldebug_loc0:
LLST1:
	.long	LVL1-Ltext0
	.long	LVL2-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST3:
	.long	LVL4-Ltext0
	.long	LVL5-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST6:
	.long	LVL8-Ltext0
	.long	LVL9-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST8:
	.long	LVL11-Ltext0
	.long	LVL12-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL12-Ltext0
	.long	LVL13-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST9:
	.long	LVL13-Ltext0
	.long	LVL14-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST10:
	.long	LFB164-Ltext0
	.long	LCFI0-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI0-Ltext0
	.long	LFE164-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 28
	.long	0x0
	.long	0x0
LLST11:
	.long	LVL15-Ltext0
	.long	LVL21-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL21-Ltext0
	.long	LVL24-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL24-Ltext0
	.long	LVL25-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL25-Ltext0
	.long	LFE164-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST12:
	.long	LVL16-Ltext0
	.long	LVL22-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL25-Ltext0
	.long	LVL36-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST13:
	.long	LVL20-Ltext0
	.long	LVL23-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL25-Ltext0
	.long	LVL26-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL27-Ltext0
	.long	LVL28-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL29-Ltext0
	.long	LVL30-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL31-Ltext0
	.long	LVL32-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL33-Ltext0
	.long	LVL34-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL35-Ltext0
	.long	LVL36-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL37-Ltext0
	.long	LVL38-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL39-Ltext0
	.long	LVL40-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL41-Ltext0
	.long	LVL42-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST14:
	.long	LVL17-Ltext0
	.long	LVL18-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST15:
	.long	LVL18-Ltext0
	.long	LVL19-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST16:
	.long	LVL19-Ltext0
	.long	LVL20-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST19:
	.long	LVL46-Ltext0
	.long	LVL47-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST21:
	.long	LVL49-Ltext0
	.long	LVL50-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST27:
	.long	LVL55-Ltext0
	.long	LVL56-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL56-Ltext0
	.long	LVL57-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL57-Ltext0
	.long	LVL58-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL58-Ltext0
	.long	LVL59-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL59-Ltext0
	.long	LFE192-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST29:
	.long	LFB203-Ltext0
	.long	LCFI5-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI5-Ltext0
	.long	LFE203-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST30:
	.long	LFB120-Ltext0
	.long	LCFI6-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI6-Ltext0
	.long	LFE120-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 28
	.long	0x0
	.long	0x0
LLST31:
	.long	LVL60-Ltext0
	.long	LVL62-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL62-Ltext0
	.long	LVL65-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST32:
	.long	LVL60-Ltext0
	.long	LVL61-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL61-Ltext0
	.long	LVL66-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST33:
	.long	LVL63-Ltext0
	.long	LVL64-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST34:
	.long	LFB121-Ltext0
	.long	LCFI9-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI9-Ltext0
	.long	LFE121-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
LLST35:
	.long	LVL67-Ltext0
	.long	LVL68-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL68-Ltext0
	.long	LVL76-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST36:
	.long	LVL67-Ltext0
	.long	LVL69-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL69-Ltext0
	.long	LVL72-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL73-Ltext0
	.long	LVL75-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST37:
	.long	LVL70-Ltext0
	.long	LVL71-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL73-Ltext0
	.long	LVL74-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST39:
	.long	LVL78-Ltext0
	.long	LVL81-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST40:
	.long	LVL82-Ltext0
	.long	LVL83-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL84-Ltext0
	.long	LVL85-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST41:
	.long	LVL79-Ltext0
	.long	LVL80-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST42:
	.long	LFB193-Ltext0
	.long	LCFI12-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI12-Ltext0
	.long	LCFI13-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI13-Ltext0
	.long	LFE193-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
LLST43:
	.long	LVL86-Ltext0
	.long	LVL87-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL87-Ltext0
	.long	LVL88-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL88-Ltext0
	.long	LFE193-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST45:
	.long	LVL89-Ltext0
	.long	LVL90-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST46:
	.long	LFB124-Ltext0
	.long	LCFI14-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI14-Ltext0
	.long	LFE124-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
LLST47:
	.long	LVL91-Ltext0
	.long	LVL93-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL93-Ltext0
	.long	LVL94-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST48:
	.long	LVL91-Ltext0
	.long	LVL93-Ltext0
	.word	0x6
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST49:
	.long	LFB173-Ltext0
	.long	LCFI17-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI17-Ltext0
	.long	LFE173-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	0x0
	.long	0x0
LLST50:
	.long	LVL96-Ltext0
	.long	LVL97-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST51:
	.long	LVL98-Ltext0
	.long	LVL99-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST52:
	.long	LFB156-Ltext0
	.long	LCFI18-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI18-Ltext0
	.long	LFE156-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST53:
	.long	LVL100-Ltext0
	.long	LVL103-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST54:
	.long	LVL100-Ltext0
	.long	LVL102-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL102-Ltext0
	.long	LVL115-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST55:
	.long	LVL101-Ltext0
	.long	LVL114-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST56:
	.long	LVL106-Ltext0
	.long	LVL107-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST57:
	.long	LVL108-Ltext0
	.long	LVL109-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST58:
	.long	LVL110-Ltext0
	.long	LVL111-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST59:
	.long	LVL112-Ltext0
	.long	LVL113-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST61:
	.long	LVL117-Ltext0
	.long	LVL118-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST63:
	.long	LFB138-Ltext0
	.long	LCFI22-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI22-Ltext0
	.long	LFE138-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	0x0
	.long	0x0
LLST64:
	.long	LFB187-Ltext0
	.long	LCFI23-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI23-Ltext0
	.long	LFE187-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST65:
	.long	LVL121-Ltext0
	.long	LVL128-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL128-Ltext0
	.long	LVL139-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL139-Ltext0
	.long	LFE187-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST66:
	.long	LVL125-Ltext0
	.long	LVL128-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	LVL129-Ltext0
	.long	LVL134-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	LVL136-Ltext0
	.long	LVL137-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST67:
	.long	LVL130-Ltext0
	.long	LVL136-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST68:
	.long	LVL122-Ltext0
	.long	LVL129-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL135-Ltext0
	.long	LVL136-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST69:
	.long	LVL123-Ltext0
	.long	LVL126-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST70:
	.long	LVL127-Ltext0
	.long	LVL129-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL135-Ltext0
	.long	LVL136-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST71:
	.long	LVL126-Ltext0
	.long	LVL127-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST72:
	.long	LFB170-Ltext0
	.long	LCFI27-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI27-Ltext0
	.long	LFE170-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	0x0
	.long	0x0
LLST73:
	.long	LFB168-Ltext0
	.long	LCFI28-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI28-Ltext0
	.long	LFE168-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	0x0
	.long	0x0
LLST74:
	.long	LFB162-Ltext0
	.long	LCFI29-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI29-Ltext0
	.long	LFE162-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
LLST76:
	.long	LFB157-Ltext0
	.long	LCFI32-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI32-Ltext0
	.long	LFE157-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	0x0
	.long	0x0
LLST77:
	.long	LVL144-Ltext0
	.long	LVL145-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL145-Ltext0
	.long	LVL159-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST78:
	.long	LVL151-Ltext0
	.long	LVL152-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST79:
	.long	LVL145-Ltext0
	.long	LVL146-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST80:
	.long	LVL147-Ltext0
	.long	LVL148-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST81:
	.long	LVL149-Ltext0
	.long	LVL150-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST82:
	.long	LVL153-Ltext0
	.long	LVL154-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST83:
	.long	LVL155-Ltext0
	.long	LVL156-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST84:
	.long	LVL157-Ltext0
	.long	LVL158-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST85:
	.long	LFB160-Ltext0
	.long	LCFI33-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI33-Ltext0
	.long	LFE160-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
LLST86:
	.long	LVL160-Ltext0
	.long	LVL161-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL161-Ltext0
	.long	LVL163-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL163-Ltext0
	.long	LVL164-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL164-Ltext0
	.long	LFE160-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST87:
	.long	LVL160-Ltext0
	.long	LVL161-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL161-Ltext0
	.long	LVL162-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL162-Ltext0
	.long	LVL164-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL164-Ltext0
	.long	LFE160-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST88:
	.long	LFB153-Ltext0
	.long	LCFI36-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI36-Ltext0
	.long	LCFI37-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI37-Ltext0
	.long	LFE153-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
LLST89:
	.long	LVL165-Ltext0
	.long	LVL168-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST90:
	.long	LVL165-Ltext0
	.long	LVL167-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL167-Ltext0
	.long	LVL172-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL174-Ltext0
	.long	LVL177-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST91:
	.long	LVL166-Ltext0
	.long	LVL171-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL174-Ltext0
	.long	LVL176-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST92:
	.long	LVL168-Ltext0
	.long	LVL169-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL174-Ltext0
	.long	LVL175-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST93:
	.long	LVL170-Ltext0
	.long	LVL174-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST94:
	.long	LFB159-Ltext0
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
	.long	LFE159-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
LLST95:
	.long	LVL178-Ltext0
	.long	LVL179-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL179-Ltext0
	.long	LVL180-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL180-Ltext0
	.long	LVL182-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL182-Ltext0
	.long	LFE159-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST96:
	.long	LVL178-Ltext0
	.long	LVL179-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL179-Ltext0
	.long	LVL181-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL181-Ltext0
	.long	LVL182-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL182-Ltext0
	.long	LFE159-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST97:
	.long	LVL183-Ltext0
	.long	LVL184-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST98:
	.long	LVL185-Ltext0
	.long	LVL188-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST99:
	.long	LVL186-Ltext0
	.long	LVL187-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST100:
	.long	LVL189-Ltext0
	.long	LVL190-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST101:
	.long	LFB165-Ltext0
	.long	LCFI40-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI40-Ltext0
	.long	LFE165-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST102:
	.long	LVL191-Ltext0
	.long	LVL194-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL194-Ltext0
	.long	LVL197-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL197-Ltext0
	.long	LFE165-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	0x0
	.long	0x0
LLST103:
	.long	LVL192-Ltext0
	.long	LVL198-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST104:
	.long	LVL193-Ltext0
	.long	LVL195-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL196-Ltext0
	.long	LVL199-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST105:
	.long	LFB139-Ltext0
	.long	LCFI44-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI44-Ltext0
	.long	LFE139-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST106:
	.long	LVL200-Ltext0
	.long	LVL203-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL203-Ltext0
	.long	LVL209-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL209-Ltext0
	.long	LVL211-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL211-Ltext0
	.long	LFE139-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST107:
	.long	LVL200-Ltext0
	.long	LVL203-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL203-Ltext0
	.long	LVL208-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL208-Ltext0
	.long	LVL211-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL211-Ltext0
	.long	LFE139-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST108:
	.long	LVL204-Ltext0
	.long	LVL207-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL212-Ltext0
	.long	LFE139-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST109:
	.long	LVL201-Ltext0
	.long	LVL205-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL205-Ltext0
	.long	LVL210-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL211-Ltext0
	.long	LVL213-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL213-Ltext0
	.long	LFE139-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST110:
	.long	LVL202-Ltext0
	.long	LVL206-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 0
	.long	LVL206-Ltext0
	.long	LVL211-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -24
	.long	LVL211-Ltext0
	.long	LVL214-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 0
	.long	LVL214-Ltext0
	.long	LFE139-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -24
	.long	0x0
	.long	0x0
LLST111:
	.long	LVL215-Ltext0
	.long	LVL216-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST112:
	.long	LFB131-Ltext0
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
	.long	LFE131-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST113:
	.long	LVL218-Ltext0
	.long	LVL219-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST114:
	.long	LFB199-Ltext0
	.long	LCFI51-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI51-Ltext0
	.long	LFE199-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST115:
	.long	LVL220-Ltext0
	.long	LVL222-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL222-Ltext0
	.long	LVL225-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL225-Ltext0
	.long	LVL227-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL227-Ltext0
	.long	LFE199-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST116:
	.long	LVL220-Ltext0
	.long	LVL222-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL222-Ltext0
	.long	LVL226-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL226-Ltext0
	.long	LVL227-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL227-Ltext0
	.long	LFE199-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST117:
	.long	LVL220-Ltext0
	.long	LVL222-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL222-Ltext0
	.long	LVL224-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL224-Ltext0
	.long	LVL227-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL227-Ltext0
	.long	LVL229-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL229-Ltext0
	.long	LFE199-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	0x0
	.long	0x0
LLST118:
	.long	LVL221-Ltext0
	.long	LVL223-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL227-Ltext0
	.long	LVL228-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST119:
	.long	LVL228-Ltext0
	.long	LVL229-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST120:
	.long	LFB141-Ltext0
	.long	LCFI54-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI54-Ltext0
	.long	LFE141-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
LLST121:
	.long	LVL230-Ltext0
	.long	LVL231-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST122:
	.long	LFB140-Ltext0
	.long	LCFI55-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI55-Ltext0
	.long	LCFI56-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI56-Ltext0
	.long	LFE140-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST123:
	.long	LVL232-Ltext0
	.long	LVL236-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST124:
	.long	LVL234-Ltext0
	.long	LVL240-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST125:
	.long	LVL233-Ltext0
	.long	LVL236-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST126:
	.long	LVL234-Ltext0
	.long	LVL236-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST127:
	.long	LVL237-Ltext0
	.long	LVL239-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST128:
	.long	LFB174-Ltext0
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
	.long	LCFI60-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI60-Ltext0
	.long	LCFI61-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI61-Ltext0
	.long	LFE174-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 72
	.long	0x0
	.long	0x0
LLST129:
	.long	LVL309-Ltext0
	.long	LVL325-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -52
	.long	0x0
	.long	0x0
LLST130:
	.long	LVL321-Ltext0
	.long	LVL323-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL327-Ltext0
	.long	LVL329-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST131:
	.long	LVL316-Ltext0
	.long	LVL322-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST132:
	.long	LVL244-Ltext0
	.long	LVL248-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -44
	.long	LVL248-Ltext0
	.long	LVL310-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 28
	.long	LVL310-Ltext0
	.long	LVL325-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -44
	.long	LVL325-Ltext0
	.long	LFE174-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 28
	.long	0x0
	.long	0x0
LLST133:
	.long	LVL252-Ltext0
	.long	LVL256-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -48
	.long	LVL256-Ltext0
	.long	LVL310-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	LVL310-Ltext0
	.long	LVL325-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -48
	.long	LVL325-Ltext0
	.long	LFE174-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST134:
	.long	LVL258-Ltext0
	.long	LVL311-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL325-Ltext0
	.long	LVL330-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST135:
	.long	LVL242-Ltext0
	.long	LVL243-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL243-Ltext0
	.long	LVL246-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL246-Ltext0
	.long	LVL254-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL254-Ltext0
	.long	LVL258-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL258-Ltext0
	.long	LVL264-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL325-Ltext0
	.long	LVL328-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST136:
	.long	LVL245-Ltext0
	.long	LVL247-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL249-Ltext0
	.long	LVL251-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST137:
	.long	LVL253-Ltext0
	.long	LVL255-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL257-Ltext0
	.long	LVL259-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST138:
	.long	LVL260-Ltext0
	.long	LVL261-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL262-Ltext0
	.long	LVL263-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL325-Ltext0
	.long	LVL326-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST139:
	.long	LVL265-Ltext0
	.long	LVL266-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	LVL267-Ltext0
	.long	LVL268-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST140:
	.long	LVL274-Ltext0
	.long	LVL275-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST141:
	.long	LVL276-Ltext0
	.long	LVL277-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST142:
	.long	LVL278-Ltext0
	.long	LVL279-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST143:
	.long	LVL280-Ltext0
	.long	LVL282-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST144:
	.long	LVL283-Ltext0
	.long	LVL284-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST145:
	.long	LVL285-Ltext0
	.long	LVL286-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST146:
	.long	LVL287-Ltext0
	.long	LVL289-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST147:
	.long	LVL290-Ltext0
	.long	LVL292-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST148:
	.long	LVL293-Ltext0
	.long	LVL295-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST149:
	.long	LVL296-Ltext0
	.long	LVL297-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST150:
	.long	LVL298-Ltext0
	.long	LVL299-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST151:
	.long	LVL300-Ltext0
	.long	LVL302-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST152:
	.long	LVL303-Ltext0
	.long	LVL304-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST153:
	.long	LVL305-Ltext0
	.long	LVL306-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST154:
	.long	LVL307-Ltext0
	.long	LVL308-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST155:
	.long	LVL311-Ltext0
	.long	LVL324-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST156:
	.long	LVL313-Ltext0
	.long	LVL325-Ltext0
	.word	0x8
	.byte	0x91
	.sleb128 -60
	.byte	0x93
	.uleb128 0x4
	.byte	0x74
	.sleb128 16
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST157:
	.long	LVL317-Ltext0
	.long	LVL318-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST158:
	.long	LVL319-Ltext0
	.long	LVL320-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST159:
	.long	LFB113-Ltext0
	.long	LCFI62-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI62-Ltext0
	.long	LCFI63-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI63-Ltext0
	.long	LFE113-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 32
	.long	0x0
	.long	0x0
LLST160:
	.long	LVL331-Ltext0
	.long	LVL332-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL332-Ltext0
	.long	LVL340-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST161:
	.long	LVL335-Ltext0
	.long	LVL337-Ltext0
	.word	0x7
	.byte	0x74
	.sleb128 16
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	LVL337-Ltext0
	.long	LFE113-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -16
	.long	0x0
	.long	0x0
LLST162:
	.long	LVL336-Ltext0
	.long	LVL338-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL339-Ltext0
	.long	LFE113-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST163:
	.long	LFB136-Ltext0
	.long	LCFI64-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI64-Ltext0
	.long	LFE136-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 28
	.long	0x0
	.long	0x0
LLST164:
	.long	LVL341-Ltext0
	.long	LVL343-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL343-Ltext0
	.long	LVL351-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 0
	.long	LVL351-Ltext0
	.long	LVL358-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -28
	.long	LVL358-Ltext0
	.long	LVL364-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 0
	.long	LVL364-Ltext0
	.long	LFE136-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -28
	.long	0x0
	.long	0x0
LLST165:
	.long	LVL341-Ltext0
	.long	LVL344-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL344-Ltext0
	.long	LVL346-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL346-Ltext0
	.long	LVL350-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL350-Ltext0
	.long	LVL357-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL357-Ltext0
	.long	LVL358-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL358-Ltext0
	.long	LFE136-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST166:
	.long	LVL341-Ltext0
	.long	LVL342-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL342-Ltext0
	.long	LVL344-Ltext0
	.word	0x7
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 12
	.byte	0x93
	.uleb128 0x4
	.long	LVL344-Ltext0
	.long	LVL348-Ltext0
	.word	0x6
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.long	LVL348-Ltext0
	.long	LVL349-Ltext0
	.word	0x7
	.byte	0x91
	.sleb128 8
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.long	LVL349-Ltext0
	.long	LVL350-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL350-Ltext0
	.long	LVL355-Ltext0
	.word	0x6
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.long	LVL355-Ltext0
	.long	LVL356-Ltext0
	.word	0x7
	.byte	0x91
	.sleb128 8
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.long	LVL356-Ltext0
	.long	LVL358-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL358-Ltext0
	.long	LFE136-Ltext0
	.word	0x6
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST167:
	.long	LVL345-Ltext0
	.long	LVL347-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL352-Ltext0
	.long	LVL354-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL364-Ltext0
	.long	LFE136-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST168:
	.long	LVL345-Ltext0
	.long	LVL350-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL353-Ltext0
	.long	LVL358-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL364-Ltext0
	.long	LFE136-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST169:
	.long	LVL359-Ltext0
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
LLST170:
	.long	LFB190-Ltext0
	.long	LCFI69-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI69-Ltext0
	.long	LFE190-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 28
	.long	0x0
	.long	0x0
LLST171:
	.long	LVL365-Ltext0
	.long	LVL366-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL366-Ltext0
	.long	LVL367-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL367-Ltext0
	.long	LVL368-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL368-Ltext0
	.long	LFE190-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST172:
	.long	LFB135-Ltext0
	.long	LCFI72-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI72-Ltext0
	.long	LFE135-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 28
	.long	0x0
	.long	0x0
LLST173:
	.long	LVL369-Ltext0
	.long	LVL370-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL370-Ltext0
	.long	LVL382-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LVL382-Ltext0
	.long	LVL389-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -24
	.long	LVL389-Ltext0
	.long	LVL404-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LVL404-Ltext0
	.long	LVL407-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -24
	.long	LVL407-Ltext0
	.long	LFE135-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	0x0
	.long	0x0
LLST174:
	.long	LVL369-Ltext0
	.long	LVL371-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL371-Ltext0
	.long	LVL374-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL374-Ltext0
	.long	LVL381-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL381-Ltext0
	.long	LVL387-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL387-Ltext0
	.long	LVL389-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL389-Ltext0
	.long	LVL392-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL392-Ltext0
	.long	LVL393-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL393-Ltext0
	.long	LVL396-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL396-Ltext0
	.long	LVL397-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL397-Ltext0
	.long	LVL399-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL399-Ltext0
	.long	LVL404-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL404-Ltext0
	.long	LVL405-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL405-Ltext0
	.long	LVL407-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL407-Ltext0
	.long	LFE135-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST175:
	.long	LVL369-Ltext0
	.long	LVL371-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL371-Ltext0
	.long	LVL380-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL380-Ltext0
	.long	LVL381-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL381-Ltext0
	.long	LVL388-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL388-Ltext0
	.long	LVL389-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 8
	.long	LVL389-Ltext0
	.long	LFE135-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST176:
	.long	LVL374-Ltext0
	.long	LVL378-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	LVL392-Ltext0
	.long	LVL393-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	LVL396-Ltext0
	.long	LVL397-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	LVL399-Ltext0
	.long	LVL404-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	LVL406-Ltext0
	.long	LVL407-Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST177:
	.long	LVL374-Ltext0
	.long	LVL381-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL383-Ltext0
	.long	LVL385-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL404-Ltext0
	.long	LVL407-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST178:
	.long	LVL372-Ltext0
	.long	LVL375-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST179:
	.long	LVL374-Ltext0
	.long	LVL377-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL384-Ltext0
	.long	LVL386-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL404-Ltext0
	.long	LVL407-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST180:
	.long	LVL374-Ltext0
	.long	LVL375-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL390-Ltext0
	.long	LVL393-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST181:
	.long	LVL374-Ltext0
	.long	LVL375-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL394-Ltext0
	.long	LVL397-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST182:
	.long	LVL374-Ltext0
	.long	LVL377-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.long	LVL400-Ltext0
	.long	LVL403-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL403-Ltext0
	.long	LVL404-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST183:
	.long	LVL374-Ltext0
	.long	LVL381-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL401-Ltext0
	.long	LVL404-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST184:
	.long	LFB189-Ltext0
	.long	LCFI77-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI77-Ltext0
	.long	LCFI78-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI78-Ltext0
	.long	LFE189-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 28
	.long	0x0
	.long	0x0
LLST185:
	.long	LVL408-Ltext0
	.long	LVL409-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL409-Ltext0
	.long	LVL412-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL412-Ltext0
	.long	LVL413-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL413-Ltext0
	.long	LVL414-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL414-Ltext0
	.long	LFE189-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST186:
	.long	LVL411-Ltext0
	.long	LVL413-Ltext0
	.word	0x7
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -12
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST187:
	.long	LFB114-Ltext0
	.long	LCFI79-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI79-Ltext0
	.long	LFE114-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	0x0
	.long	0x0
LLST188:
	.long	LVL415-Ltext0
	.long	LVL418-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL418-Ltext0
	.long	LVL420-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL420-Ltext0
	.long	LVL421-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL421-Ltext0
	.long	LVL422-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL422-Ltext0
	.long	LVL424-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL424-Ltext0
	.long	LFE114-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST189:
	.long	LVL416-Ltext0
	.long	LVL417-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL421-Ltext0
	.long	LVL423-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL424-Ltext0
	.long	LFE114-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST190:
	.long	LFB115-Ltext0
	.long	LCFI82-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI82-Ltext0
	.long	LFE115-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 32
	.long	0x0
	.long	0x0
LLST191:
	.long	LVL425-Ltext0
	.long	LVL426-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL426-Ltext0
	.long	LVL427-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL428-Ltext0
	.long	LFE115-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST194:
	.long	LFB125-Ltext0
	.long	LCFI85-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI85-Ltext0
	.long	LCFI86-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI86-Ltext0
	.long	LCFI87-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI87-Ltext0
	.long	LFE125-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 44
	.long	0x0
	.long	0x0
LLST195:
	.long	LVL431-Ltext0
	.long	LVL437-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL437-Ltext0
	.long	LVL447-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL447-Ltext0
	.long	LVL448-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL448-Ltext0
	.long	LFE125-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST196:
	.long	LVL433-Ltext0
	.long	LVL434-Ltext0
	.word	0x7
	.byte	0x74
	.sleb128 16
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	LVL434-Ltext0
	.long	LVL448-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LVL448-Ltext0
	.long	LFE125-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -28
	.long	0x0
	.long	0x0
LLST197:
	.long	LVL435-Ltext0
	.long	LVL436-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL448-Ltext0
	.long	LFE125-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST198:
	.long	LVL438-Ltext0
	.long	LVL440-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL445-Ltext0
	.long	LVL449-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST199:
	.long	LVL440-Ltext0
	.long	LVL442-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST200:
	.long	LVL443-Ltext0
	.long	LVL444-Ltext0
	.word	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST201:
	.long	LFB201-Ltext0
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
	.long	LFE201-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST202:
	.long	LVL450-Ltext0
	.long	LVL451-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL451-Ltext0
	.long	LVL452-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL452-Ltext0
	.long	LFE201-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST203:
	.long	LFB145-Ltext0
	.long	LCFI90-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI90-Ltext0
	.long	LCFI91-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI91-Ltext0
	.long	LFE145-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST204:
	.long	LVL453-Ltext0
	.long	LVL455-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST205:
	.long	LVL456-Ltext0
	.long	LVL457-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST206:
	.long	LVL458-Ltext0
	.long	LVL459-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL460-Ltext0
	.long	LVL461-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST207:
	.long	LVL454-Ltext0
	.long	LVL462-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST208:
	.long	LFB202-Ltext0
	.long	LCFI92-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI92-Ltext0
	.long	LCFI93-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI93-Ltext0
	.long	LCFI94-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI94-Ltext0
	.long	LFE202-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	0x0
	.long	0x0
LLST209:
	.long	LVL463-Ltext0
	.long	LVL464-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL464-Ltext0
	.long	LVL468-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL468-Ltext0
	.long	LVL469-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL469-Ltext0
	.long	LVL471-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL471-Ltext0
	.long	LFE202-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	0x0
	.long	0x0
LLST210:
	.long	LVL465-Ltext0
	.long	LVL466-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL469-Ltext0
	.long	LVL470-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST211:
	.long	LFB148-Ltext0
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
	.long	LFE148-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST212:
	.long	LVL472-Ltext0
	.long	LVL473-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST214:
	.long	LFB150-Ltext0
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
	.long	LFE150-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 24
	.long	0x0
	.long	0x0
LLST215:
	.long	LVL475-Ltext0
	.long	LVL476-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST216:
	.long	LVL478-Ltext0
	.long	LVL481-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL482-Ltext0
	.long	LVL484-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST217:
	.long	LVL479-Ltext0
	.long	LVL480-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL482-Ltext0
	.long	LVL483-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST218:
	.long	LFB142-Ltext0
	.long	LCFI100-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI100-Ltext0
	.long	LFE142-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 44
	.long	0x0
	.long	0x0
LLST219:
	.long	LVL488-Ltext0
	.long	LVL489-Ltext0
	.word	0x7
	.byte	0x74
	.sleb128 16
	.byte	0x93
	.uleb128 0x4
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.long	LVL489-Ltext0
	.long	LFE142-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST220:
	.long	LVL491-Ltext0
	.long	LVL492-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST221:
	.long	LVL495-Ltext0
	.long	LVL496-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST222:
	.long	LFB184-Ltext0
	.long	LCFI105-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI105-Ltext0
	.long	LCFI106-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI106-Ltext0
	.long	LCFI107-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI107-Ltext0
	.long	LCFI108-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI108-Ltext0
	.long	LCFI109-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI109-Ltext0
	.long	LFE184-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 52
	.long	0x0
	.long	0x0
LLST223:
	.long	LVL498-Ltext0
	.long	LVL510-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL510-Ltext0
	.long	LVL524-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL524-Ltext0
	.long	LVL525-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL525-Ltext0
	.long	LVL537-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL537-Ltext0
	.long	LVL538-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL538-Ltext0
	.long	LFE184-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST224:
	.long	LVL498-Ltext0
	.long	LVL510-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL510-Ltext0
	.long	LVL523-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL523-Ltext0
	.long	LVL525-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL525-Ltext0
	.long	LVL536-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL536-Ltext0
	.long	LVL538-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL538-Ltext0
	.long	LFE184-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST225:
	.long	LVL501-Ltext0
	.long	LVL503-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LVL503-Ltext0
	.long	LVL505-Ltext0
	.word	0x8
	.byte	0x74
	.sleb128 16
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -32
	.byte	0x93
	.uleb128 0x4
	.long	LVL508-Ltext0
	.long	LVL509-Ltext0
	.word	0x8
	.byte	0x74
	.sleb128 16
	.byte	0x93
	.uleb128 0x4
	.byte	0x91
	.sleb128 -32
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST226:
	.long	LVL501-Ltext0
	.long	LVL502-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST227:
	.long	LVL499-Ltext0
	.long	LVL504-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST228:
	.long	LVL506-Ltext0
	.long	LVL507-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST229:
	.long	LVL514-Ltext0
	.long	LVL516-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST230:
	.long	LVL512-Ltext0
	.long	LVL520-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL521-Ltext0
	.long	LVL522-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL527-Ltext0
	.long	LVL535-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL538-Ltext0
	.long	LFE184-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST231:
	.long	LVL519-Ltext0
	.long	LVL520-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL521-Ltext0
	.long	LVL525-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL528-Ltext0
	.long	LVL530-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL531-Ltext0
	.long	LVL532-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL538-Ltext0
	.long	LFE184-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST232:
	.long	LVL517-Ltext0
	.long	LVL518-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL521-Ltext0
	.long	LVL525-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL528-Ltext0
	.long	LVL529-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL531-Ltext0
	.long	LFE184-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST233:
	.long	LVL515-Ltext0
	.long	LVL516-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST234:
	.long	LVL512-Ltext0
	.long	LVL513-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL526-Ltext0
	.long	LVL528-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST235:
	.long	LVL511-Ltext0
	.long	LVL513-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL525-Ltext0
	.long	LVL526-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST236:
	.long	LVL533-Ltext0
	.long	LVL534-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST237:
	.long	LFB197-Ltext0
	.long	LCFI110-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI110-Ltext0
	.long	LCFI111-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 8
	.long	LCFI111-Ltext0
	.long	LCFI112-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 12
	.long	LCFI112-Ltext0
	.long	LCFI113-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LCFI113-Ltext0
	.long	LCFI114-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LCFI114-Ltext0
	.long	LFE197-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 108
	.long	0x0
	.long	0x0
LLST238:
	.long	LVL539-Ltext0
	.long	LVL540-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL540-Ltext0
	.long	LVL595-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL595-Ltext0
	.long	LVL597-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL597-Ltext0
	.long	LVL605-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL605-Ltext0
	.long	LVL607-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL607-Ltext0
	.long	LFE197-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST239:
	.long	LVL539-Ltext0
	.long	LVL540-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL540-Ltext0
	.long	LVL596-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL596-Ltext0
	.long	LVL597-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL597-Ltext0
	.long	LVL606-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL606-Ltext0
	.long	LVL607-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 4
	.long	LVL607-Ltext0
	.long	LFE197-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST240:
	.long	LVL570-Ltext0
	.long	LVL580-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL601-Ltext0
	.long	LVL604-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL610-Ltext0
	.long	LVL612-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL621-Ltext0
	.long	LVL622-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL628-Ltext0
	.long	LVL633-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST241:
	.long	LVL540-Ltext0
	.long	LVL542-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -58
	.long	LVL542-Ltext0
	.long	LVL545-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL572-Ltext0
	.long	LVL607-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -58
	.long	LVL611-Ltext0
	.long	LVL615-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -58
	.long	LVL621-Ltext0
	.long	LVL623-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -58
	.long	LVL628-Ltext0
	.long	LVL636-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -58
	.long	0x0
	.long	0x0
LLST242:
	.long	LVL540-Ltext0
	.long	LVL544-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -56
	.long	LVL544-Ltext0
	.long	LVL572-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 52
	.long	LVL572-Ltext0
	.long	LVL607-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -56
	.long	LVL607-Ltext0
	.long	LVL610-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 52
	.long	LVL610-Ltext0
	.long	LVL615-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -56
	.long	LVL615-Ltext0
	.long	LVL621-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 52
	.long	LVL621-Ltext0
	.long	LVL623-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -56
	.long	LVL623-Ltext0
	.long	LVL628-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 52
	.long	LVL628-Ltext0
	.long	LVL636-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -56
	.long	LVL636-Ltext0
	.long	LFE197-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 52
	.long	0x0
	.long	0x0
LLST243:
	.long	LVL585-Ltext0
	.long	LVL586-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL593-Ltext0
	.long	LVL597-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL600-Ltext0
	.long	LVL607-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL621-Ltext0
	.long	LVL623-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL632-Ltext0
	.long	LVL633-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST244:
	.long	LVL566-Ltext0
	.long	LVL568-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL568-Ltext0
	.long	LVL569-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL608-Ltext0
	.long	LVL609-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL609-Ltext0
	.long	LVL610-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST245:
	.long	LVL540-Ltext0
	.long	LVL564-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LVL564-Ltext0
	.long	LVL567-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -88
	.long	LVL567-Ltext0
	.long	LVL619-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LVL619-Ltext0
	.long	LVL621-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -88
	.long	LVL621-Ltext0
	.long	LVL636-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 20
	.long	LVL636-Ltext0
	.long	LFE197-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -88
	.long	0x0
	.long	0x0
LLST246:
	.long	LVL540-Ltext0
	.long	LVL645-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 80
	.long	LVL645-Ltext0
	.long	LVL646-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST247:
	.long	LVL540-Ltext0
	.long	LVL644-Ltext0
	.word	0x3
	.byte	0x74
	.sleb128 64
	.long	LVL644-Ltext0
	.long	LFE197-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -44
	.long	0x0
	.long	0x0
LLST248:
	.long	LVL540-Ltext0
	.long	LVL561-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -78
	.long	LVL561-Ltext0
	.long	LVL563-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 30
	.long	LVL563-Ltext0
	.long	LFE197-Ltext0
	.word	0x3
	.byte	0x91
	.sleb128 -78
	.long	0x0
	.long	0x0
LLST249:
	.long	LVL641-Ltext0
	.long	LVL643-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST250:
	.long	LVL639-Ltext0
	.long	LVL641-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST251:
	.long	LVL637-Ltext0
	.long	LVL639-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST252:
	.long	LVL560-Ltext0
	.long	LVL562-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST253:
	.long	LVL565-Ltext0
	.long	LVL571-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL608-Ltext0
	.long	LVL610-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL615-Ltext0
	.long	LVL618-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL624-Ltext0
	.long	LVL628-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST254:
	.long	LVL565-Ltext0
	.long	LVL570-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL608-Ltext0
	.long	LVL610-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL615-Ltext0
	.long	LVL618-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL625-Ltext0
	.long	LVL628-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST255:
	.long	LVL626-Ltext0
	.long	LVL627-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST256:
	.long	LVL647-Ltext0
	.long	LVL650-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST257:
	.long	LVL555-Ltext0
	.long	LVL558-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL618-Ltext0
	.long	LVL620-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST258:
	.long	LVL553-Ltext0
	.long	LVL557-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST259:
	.long	LVL550-Ltext0
	.long	LVL551-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL565-Ltext0
	.long	LVL566-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL607-Ltext0
	.long	LVL608-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST260:
	.long	LVL551-Ltext0
	.long	LVL552-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL565-Ltext0
	.long	LVL566-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL607-Ltext0
	.long	LVL608-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST261:
	.long	LVL552-Ltext0
	.long	LVL554-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL565-Ltext0
	.long	LVL566-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST262:
	.long	LVL546-Ltext0
	.long	LVL547-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST263:
	.long	LVL548-Ltext0
	.long	LVL549-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST264:
	.long	LVL616-Ltext0
	.long	LVL617-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST265:
	.long	LVL573-Ltext0
	.long	LVL574-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST266:
	.long	LVL575-Ltext0
	.long	LVL577-Ltext0
	.word	0x1
	.byte	0x52
	.long	LVL628-Ltext0
	.long	LVL629-Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
LLST267:
	.long	LVL576-Ltext0
	.long	LVL578-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL628-Ltext0
	.long	LVL630-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST268:
	.long	LVL579-Ltext0
	.long	LVL584-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL599-Ltext0
	.long	LVL600-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL612-Ltext0
	.long	LVL614-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST269:
	.long	LVL580-Ltext0
	.long	LVL588-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL592-Ltext0
	.long	LVL594-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL599-Ltext0
	.long	LVL604-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL612-Ltext0
	.long	LVL613-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL613-Ltext0
	.long	LVL614-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL614-Ltext0
	.long	LVL615-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL621-Ltext0
	.long	LVL622-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL633-Ltext0
	.long	LVL636-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST270:
	.long	LVL582-Ltext0
	.long	LVL583-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL599-Ltext0
	.long	LVL602-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST271:
	.long	LVL589-Ltext0
	.long	LVL590-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL597-Ltext0
	.long	LVL598-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST272:
	.long	LVL590-Ltext0
	.long	LVL591-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST273:
	.long	LVL602-Ltext0
	.long	LVL603-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST274:
	.long	LVL630-Ltext0
	.long	LVL631-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST275:
	.long	LVL634-Ltext0
	.long	LVL635-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST276:
	.long	LFB186-Ltext0
	.long	LCFI115-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI115-Ltext0
	.long	LFE186-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 36
	.long	0x0
	.long	0x0
LLST277:
	.long	LVL655-Ltext0
	.long	LVL662-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	LVL664-Ltext0
	.long	LVL665-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	LVL667-Ltext0
	.long	LFE186-Ltext0
	.word	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.long	0x0
	.long	0x0
LLST278:
	.long	LVL657-Ltext0
	.long	LVL659-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL660-Ltext0
	.long	LVL663-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL667-Ltext0
	.long	LVL670-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL672-Ltext0
	.long	LVL675-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL677-Ltext0
	.long	LVL680-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL682-Ltext0
	.long	LVL685-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL687-Ltext0
	.long	LVL688-Ltext0
	.word	0x1
	.byte	0x51
	.long	LVL692-Ltext0
	.long	LVL695-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST279:
	.long	LVL652-Ltext0
	.long	LVL657-Ltext0
	.word	0x1
	.byte	0x51
	.long	0x0
	.long	0x0
LLST280:
	.long	LVL653-Ltext0
	.long	LVL656-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST281:
	.long	LVL668-Ltext0
	.long	LVL669-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST282:
	.long	LVL669-Ltext0
	.long	LVL671-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST283:
	.long	LVL673-Ltext0
	.long	LVL674-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST284:
	.long	LVL674-Ltext0
	.long	LVL676-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST285:
	.long	LVL678-Ltext0
	.long	LVL679-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST286:
	.long	LVL679-Ltext0
	.long	LVL681-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST287:
	.long	LVL683-Ltext0
	.long	LVL684-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST288:
	.long	LVL684-Ltext0
	.long	LVL686-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST289:
	.long	LVL689-Ltext0
	.long	LVL690-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST290:
	.long	LVL690-Ltext0
	.long	LVL691-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST291:
	.long	LVL693-Ltext0
	.long	LVL694-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST292:
	.long	LVL694-Ltext0
	.long	LVL696-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST293:
	.long	LFB194-Ltext0
	.long	LCFI120-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI120-Ltext0
	.long	LFE194-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	0x0
	.long	0x0
LLST294:
	.long	LFB180-Ltext0
	.long	LCFI123-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 4
	.long	LCFI123-Ltext0
	.long	LFE180-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 40
	.long	0x0
	.long	0x0
LLST295:
	.long	LVL698-Ltext0
	.long	LVL701-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL701-Ltext0
	.long	LVL709-Ltext0
	.word	0x1
	.byte	0x57
	.long	LVL709-Ltext0
	.long	LVL711-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 0
	.long	LVL711-Ltext0
	.long	LFE180-Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
LLST296:
	.long	LVL700-Ltext0
	.long	LVL707-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL711-Ltext0
	.long	LVL721-Ltext0
	.word	0x1
	.byte	0x56
	.long	LVL722-Ltext0
	.long	LFE180-Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
LLST297:
	.long	LVL703-Ltext0
	.long	LVL710-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL711-Ltext0
	.long	LVL717-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL717-Ltext0
	.long	LVL718-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL720-Ltext0
	.long	LVL724-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL729-Ltext0
	.long	LVL731-Ltext0
	.word	0x1
	.byte	0x55
	.long	LVL733-Ltext0
	.long	LFE180-Ltext0
	.word	0x1
	.byte	0x55
	.long	0x0
	.long	0x0
LLST298:
	.long	LVL705-Ltext0
	.long	LVL711-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -24
	.long	LVL713-Ltext0
	.long	LVL716-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LVL716-Ltext0
	.long	LVL724-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -24
	.long	LVL729-Ltext0
	.long	LVL734-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -24
	.long	LVL734-Ltext0
	.long	LVL735-Ltext0
	.word	0x2
	.byte	0x74
	.sleb128 16
	.long	LVL735-Ltext0
	.long	LFE180-Ltext0
	.word	0x2
	.byte	0x91
	.sleb128 -24
	.long	0x0
	.long	0x0
LLST299:
	.long	LVL702-Ltext0
	.long	LVL704-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL711-Ltext0
	.long	LVL712-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
LLST300:
	.long	LVL699-Ltext0
	.long	LVL706-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL711-Ltext0
	.long	LVL715-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL720-Ltext0
	.long	LVL723-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL724-Ltext0
	.long	LVL727-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL728-Ltext0
	.long	LVL730-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL734-Ltext0
	.long	LVL735-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST301:
	.long	LVL706-Ltext0
	.long	LVL708-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL714-Ltext0
	.long	LVL715-Ltext0
	.word	0x1
	.byte	0x50
	.long	LVL723-Ltext0
	.long	LVL724-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL727-Ltext0
	.long	LVL728-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL730-Ltext0
	.long	LVL731-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL732-Ltext0
	.long	LVL734-Ltext0
	.word	0x1
	.byte	0x53
	.long	LVL735-Ltext0
	.long	LFE180-Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
LLST302:
	.long	LVL725-Ltext0
	.long	LVL726-Ltext0
	.word	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
	.file 5 "include/linux/winkvmint.h"
	.file 6 "include/linux/winkvmlist.h"
	.file 7 "include/linux/winkvm.h"
	.file 8 "include/linux/kvm.h"
	.file 9 "/home/ddk50/vmware/winkvm/kvm/kernel/segment_descriptor.h"
	.file 10 "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.h"
	.section	.debug_info,"dr"
	.long	0x8132
	.word	0x2
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C 4.3.4 20090804 (release) 1\0"
	.byte	0x1
	.ascii "/home/ddk50/vmware/winkvm/kvm/kernel/vmx.c\0"
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
	.byte	0x5
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
	.byte	0x5
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
	.byte	0x5
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
	.byte	0x5
	.byte	0x17
	.long	0x12b
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x3
	.ascii "u8\0"
	.byte	0x5
	.byte	0x1a
	.long	0xa8
	.uleb128 0x3
	.ascii "u16\0"
	.byte	0x5
	.byte	0x1b
	.long	0xd3
	.uleb128 0x3
	.ascii "u32\0"
	.byte	0x5
	.byte	0x1c
	.long	0xfd
	.uleb128 0x3
	.ascii "u64\0"
	.byte	0x5
	.byte	0x1d
	.long	0x11e
	.uleb128 0x4
	.ascii "list_head\0"
	.byte	0x8
	.byte	0x6
	.byte	0x1a
	.long	0x1a1
	.uleb128 0x5
	.ascii "next\0"
	.byte	0x6
	.byte	0x1b
	.long	0x1a1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "prev\0"
	.byte	0x6
	.byte	0x1b
	.long	0x1a1
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x170
	.uleb128 0x7
	.ascii "hlist_head\0"
	.byte	0x4
	.byte	0x6
	.word	0x2c1
	.long	0x1cd
	.uleb128 0x8
	.ascii "first\0"
	.byte	0x6
	.word	0x2c2
	.long	0x203
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.ascii "hlist_node\0"
	.byte	0x8
	.byte	0x6
	.word	0x2c2
	.long	0x203
	.uleb128 0x8
	.ascii "next\0"
	.byte	0x6
	.word	0x2c6
	.long	0x203
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "pprev\0"
	.byte	0x6
	.word	0x2c6
	.long	0x209
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1cd
	.uleb128 0x6
	.byte	0x4
	.long	0x203
	.uleb128 0x4
	.ascii "page_mapped\0"
	.byte	0x18
	.byte	0x7
	.byte	0xd
	.long	0x281
	.uleb128 0x5
	.ascii "size\0"
	.byte	0x7
	.byte	0xe
	.long	0x281
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.secrel32	LASF0
	.byte	0x7
	.byte	0xf
	.long	0x296
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "h_pfn\0"
	.byte	0x7
	.byte	0x10
	.long	0x281
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "g_pfn\0"
	.byte	0x7
	.byte	0x11
	.long	0x281
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "pMdl\0"
	.byte	0x7
	.byte	0x12
	.long	0x296
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "userVA\0"
	.byte	0x7
	.byte	0x13
	.long	0x296
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
	.long	0x2f2
	.uleb128 0x5
	.ascii "size\0"
	.byte	0x7
	.byte	0x17
	.long	0x281
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.secrel32	LASF0
	.byte	0x7
	.byte	0x18
	.long	0x296
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "h_pfn\0"
	.byte	0x7
	.byte	0x19
	.long	0x281
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "head_page\0"
	.byte	0x7
	.byte	0x1a
	.long	0x334
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x4
	.ascii "page\0"
	.byte	0x24
	.byte	0x7
	.byte	0xb
	.long	0x334
	.uleb128 0xb
	.long	0x33a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "index\0"
	.byte	0x7
	.byte	0x22
	.long	0x281
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
	.uleb128 0xb
	.long	0x363
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2f2
	.uleb128 0xc
	.byte	0x4
	.byte	0x7
	.byte	0x1e
	.long	0x363
	.uleb128 0xd
	.ascii "private\0"
	.byte	0x7
	.byte	0x1f
	.long	0x281
	.uleb128 0xd
	.ascii "__mapping\0"
	.byte	0x7
	.byte	0x20
	.long	0x296
	.byte	0x0
	.uleb128 0xc
	.byte	0x18
	.byte	0x7
	.byte	0x24
	.long	0x38c
	.uleb128 0xd
	.ascii "mapped\0"
	.byte	0x7
	.byte	0x25
	.long	0x20f
	.uleb128 0xd
	.ascii "independed\0"
	.byte	0x7
	.byte	0x26
	.long	0x298
	.byte	0x0
	.uleb128 0x4
	.ascii "inode\0"
	.byte	0x4
	.byte	0x7
	.byte	0x2a
	.long	0x3ad
	.uleb128 0x5
	.ascii "__inode\0"
	.byte	0x7
	.byte	0x2b
	.long	0x296
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xe
	.byte	0x4
	.byte	0x7
	.byte	0x2e
	.long	0x3d0
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
	.long	0x3ad
	.uleb128 0x4
	.ascii "mutex\0"
	.byte	0x4
	.byte	0x7
	.byte	0x32
	.long	0x408
	.uleb128 0x5
	.ascii "mutex_number\0"
	.byte	0x7
	.byte	0x33
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x4
	.ascii "file\0"
	.byte	0x18
	.byte	0x7
	.byte	0x3b
	.long	0x48e
	.uleb128 0x5
	.ascii "private_data\0"
	.byte	0x7
	.byte	0x3c
	.long	0x296
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
	.long	0x48e
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
	.long	0x38c
	.uleb128 0x4
	.ascii "task_struct\0"
	.byte	0x4
	.byte	0x7
	.byte	0x44
	.long	0x4bb
	.uleb128 0x5
	.ascii "counter\0"
	.byte	0x7
	.byte	0x45
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xf
	.ascii "km_type\0"
	.byte	0x4
	.byte	0x7
	.byte	0x4a
	.long	0x591
	.uleb128 0x10
	.ascii "KM_BOUNCE_READ\0"
	.sleb128 0
	.uleb128 0x10
	.ascii "KM_SKB_SUNRPC_DATA\0"
	.sleb128 1
	.uleb128 0x10
	.ascii "KM_SKB_DATA_SOFTIRQ\0"
	.sleb128 2
	.uleb128 0x10
	.ascii "KM_USER0\0"
	.sleb128 3
	.uleb128 0x10
	.ascii "KM_USER1\0"
	.sleb128 4
	.uleb128 0x10
	.ascii "KM_BIO_SRC_IRQ\0"
	.sleb128 5
	.uleb128 0x10
	.ascii "KM_BIO_DST_IRQ\0"
	.sleb128 6
	.uleb128 0x10
	.ascii "KM_PTE0\0"
	.sleb128 7
	.uleb128 0x10
	.ascii "KM_PTE1\0"
	.sleb128 8
	.uleb128 0x10
	.ascii "KM_IRQ0\0"
	.sleb128 9
	.uleb128 0x10
	.ascii "KM_IRQ1\0"
	.sleb128 10
	.uleb128 0x10
	.ascii "KM_SOFTIRQ0\0"
	.sleb128 11
	.uleb128 0x10
	.ascii "KM_SOFTIRQ1\0"
	.sleb128 12
	.uleb128 0x10
	.ascii "KM_TYPE_NR\0"
	.sleb128 13
	.byte	0x0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x11
	.byte	0x4
	.byte	0x7
	.uleb128 0x6
	.byte	0x4
	.long	0x408
	.uleb128 0x6
	.byte	0x4
	.long	0xe9
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0xf
	.ascii "kvm_exit_reason\0"
	.byte	0x4
	.byte	0x8
	.byte	0x69
	.long	0x673
	.uleb128 0x10
	.ascii "KVM_EXIT_UNKNOWN\0"
	.sleb128 0
	.uleb128 0x10
	.ascii "KVM_EXIT_EXCEPTION\0"
	.sleb128 1
	.uleb128 0x10
	.ascii "KVM_EXIT_IO\0"
	.sleb128 2
	.uleb128 0x10
	.ascii "KVM_EXIT_CPUID\0"
	.sleb128 3
	.uleb128 0x10
	.ascii "KVM_EXIT_DEBUG\0"
	.sleb128 4
	.uleb128 0x10
	.ascii "KVM_EXIT_HLT\0"
	.sleb128 5
	.uleb128 0x10
	.ascii "KVM_EXIT_MMIO\0"
	.sleb128 6
	.uleb128 0x10
	.ascii "KVM_EXIT_IRQ_WINDOW_OPEN\0"
	.sleb128 7
	.uleb128 0x10
	.ascii "KVM_EXIT_SHUTDOWN\0"
	.sleb128 8
	.byte	0x0
	.uleb128 0xe
	.byte	0x4
	.byte	0x8
	.byte	0x92
	.long	0x69b
	.uleb128 0x5
	.ascii "hardware_exit_reason\0"
	.byte	0x8
	.byte	0x93
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0xe
	.byte	0x8
	.byte	0x8
	.byte	0x96
	.long	0x6c6
	.uleb128 0x5
	.ascii "exception\0"
	.byte	0x8
	.byte	0x97
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.secrel32	LASF1
	.byte	0x8
	.byte	0x98
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xc
	.byte	0x8
	.byte	0x8
	.byte	0xa6
	.long	0x6e5
	.uleb128 0x12
	.secrel32	LASF2
	.byte	0x8
	.byte	0xa7
	.long	0x11e
	.uleb128 0x12
	.secrel32	LASF3
	.byte	0x8
	.byte	0xa8
	.long	0xf0
	.byte	0x0
	.uleb128 0xe
	.byte	0x18
	.byte	0x8
	.byte	0x9b
	.long	0x77b
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
	.uleb128 0xb
	.long	0x6c6
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0xe
	.byte	0x15
	.byte	0x8
	.byte	0xb0
	.long	0x7c1
	.uleb128 0x9
	.secrel32	LASF4
	.byte	0x8
	.byte	0xb1
	.long	0x11e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.secrel32	LASF5
	.byte	0x8
	.byte	0xb2
	.long	0x7c1
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
	.uleb128 0x13
	.long	0x9c
	.long	0x7d1
	.uleb128 0x14
	.long	0x59d
	.byte	0x7
	.byte	0x0
	.uleb128 0xc
	.byte	0x18
	.byte	0x8
	.byte	0x90
	.long	0x804
	.uleb128 0xd
	.ascii "hw\0"
	.byte	0x8
	.byte	0x94
	.long	0x673
	.uleb128 0xd
	.ascii "ex\0"
	.byte	0x8
	.byte	0x99
	.long	0x69b
	.uleb128 0xd
	.ascii "io\0"
	.byte	0x8
	.byte	0xaa
	.long	0x6e5
	.uleb128 0xd
	.ascii "mmio\0"
	.byte	0x8
	.byte	0xb5
	.long	0x77b
	.byte	0x0
	.uleb128 0x15
	.secrel32	LASF6
	.byte	0x54
	.byte	0x8
	.byte	0x78
	.long	0x958
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
	.long	0x958
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
	.uleb128 0x9
	.secrel32	LASF7
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
	.uleb128 0x9
	.secrel32	LASF8
	.byte	0x8
	.byte	0x8e
	.long	0x11e
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0xb
	.long	0x7d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.byte	0x0
	.uleb128 0x13
	.long	0x9c
	.long	0x968
	.uleb128 0x14
	.long	0x59d
	.byte	0x6
	.byte	0x0
	.uleb128 0x4
	.ascii "kvm_segment\0"
	.byte	0x18
	.byte	0x8
	.byte	0xc6
	.long	0xa3b
	.uleb128 0x5
	.ascii "base\0"
	.byte	0x8
	.byte	0xc7
	.long	0x11e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.secrel32	LASF9
	.byte	0x8
	.byte	0xc8
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.secrel32	LASF10
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
	.uleb128 0x4
	.ascii "kvm_msr_entry\0"
	.byte	0x10
	.byte	0x8
	.byte	0xe5
	.long	0xa83
	.uleb128 0x5
	.ascii "index\0"
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
	.uleb128 0x9
	.secrel32	LASF5
	.byte	0x8
	.byte	0xe8
	.long	0x11e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x7
	.ascii "kvm_breakpoint\0"
	.byte	0x10
	.byte	0x8
	.word	0x112
	.long	0xacd
	.uleb128 0x16
	.secrel32	LASF11
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
	.uleb128 0x16
	.secrel32	LASF2
	.byte	0x8
	.word	0x115
	.long	0x11e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x7
	.ascii "kvm_debug_guest\0"
	.byte	0x4c
	.byte	0x8
	.word	0x119
	.long	0xb2b
	.uleb128 0x16
	.secrel32	LASF11
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
	.long	0xb2b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x16
	.secrel32	LASF12
	.byte	0x8
	.word	0x11e
	.long	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.byte	0x0
	.uleb128 0x13
	.long	0xa83
	.long	0xb3b
	.uleb128 0x14
	.long	0x59d
	.byte	0x3
	.byte	0x0
	.uleb128 0x17
	.secrel32	LASF13
	.byte	0x4
	.byte	0xa
	.byte	0x35
	.long	0x15d7
	.uleb128 0x10
	.ascii "GUEST_ES_SELECTOR\0"
	.sleb128 2048
	.uleb128 0x10
	.ascii "GUEST_CS_SELECTOR\0"
	.sleb128 2050
	.uleb128 0x10
	.ascii "GUEST_SS_SELECTOR\0"
	.sleb128 2052
	.uleb128 0x10
	.ascii "GUEST_DS_SELECTOR\0"
	.sleb128 2054
	.uleb128 0x10
	.ascii "GUEST_FS_SELECTOR\0"
	.sleb128 2056
	.uleb128 0x10
	.ascii "GUEST_GS_SELECTOR\0"
	.sleb128 2058
	.uleb128 0x10
	.ascii "GUEST_LDTR_SELECTOR\0"
	.sleb128 2060
	.uleb128 0x10
	.ascii "GUEST_TR_SELECTOR\0"
	.sleb128 2062
	.uleb128 0x10
	.ascii "HOST_ES_SELECTOR\0"
	.sleb128 3072
	.uleb128 0x10
	.ascii "HOST_CS_SELECTOR\0"
	.sleb128 3074
	.uleb128 0x10
	.ascii "HOST_SS_SELECTOR\0"
	.sleb128 3076
	.uleb128 0x10
	.ascii "HOST_DS_SELECTOR\0"
	.sleb128 3078
	.uleb128 0x10
	.ascii "HOST_FS_SELECTOR\0"
	.sleb128 3080
	.uleb128 0x10
	.ascii "HOST_GS_SELECTOR\0"
	.sleb128 3082
	.uleb128 0x10
	.ascii "HOST_TR_SELECTOR\0"
	.sleb128 3084
	.uleb128 0x10
	.ascii "IO_BITMAP_A\0"
	.sleb128 8192
	.uleb128 0x10
	.ascii "IO_BITMAP_A_HIGH\0"
	.sleb128 8193
	.uleb128 0x10
	.ascii "IO_BITMAP_B\0"
	.sleb128 8194
	.uleb128 0x10
	.ascii "IO_BITMAP_B_HIGH\0"
	.sleb128 8195
	.uleb128 0x10
	.ascii "MSR_BITMAP\0"
	.sleb128 8196
	.uleb128 0x10
	.ascii "MSR_BITMAP_HIGH\0"
	.sleb128 8197
	.uleb128 0x10
	.ascii "VM_EXIT_MSR_STORE_ADDR\0"
	.sleb128 8198
	.uleb128 0x10
	.ascii "VM_EXIT_MSR_STORE_ADDR_HIGH\0"
	.sleb128 8199
	.uleb128 0x10
	.ascii "VM_EXIT_MSR_LOAD_ADDR\0"
	.sleb128 8200
	.uleb128 0x10
	.ascii "VM_EXIT_MSR_LOAD_ADDR_HIGH\0"
	.sleb128 8201
	.uleb128 0x10
	.ascii "VM_ENTRY_MSR_LOAD_ADDR\0"
	.sleb128 8202
	.uleb128 0x10
	.ascii "VM_ENTRY_MSR_LOAD_ADDR_HIGH\0"
	.sleb128 8203
	.uleb128 0x10
	.ascii "TSC_OFFSET\0"
	.sleb128 8208
	.uleb128 0x10
	.ascii "TSC_OFFSET_HIGH\0"
	.sleb128 8209
	.uleb128 0x10
	.ascii "VIRTUAL_APIC_PAGE_ADDR\0"
	.sleb128 8210
	.uleb128 0x10
	.ascii "VIRTUAL_APIC_PAGE_ADDR_HIGH\0"
	.sleb128 8211
	.uleb128 0x10
	.ascii "VMCS_LINK_POINTER\0"
	.sleb128 10240
	.uleb128 0x10
	.ascii "VMCS_LINK_POINTER_HIGH\0"
	.sleb128 10241
	.uleb128 0x10
	.ascii "GUEST_IA32_DEBUGCTL\0"
	.sleb128 10242
	.uleb128 0x10
	.ascii "GUEST_IA32_DEBUGCTL_HIGH\0"
	.sleb128 10243
	.uleb128 0x10
	.ascii "PIN_BASED_VM_EXEC_CONTROL\0"
	.sleb128 16384
	.uleb128 0x10
	.ascii "CPU_BASED_VM_EXEC_CONTROL\0"
	.sleb128 16386
	.uleb128 0x10
	.ascii "EXCEPTION_BITMAP\0"
	.sleb128 16388
	.uleb128 0x10
	.ascii "PAGE_FAULT_ERROR_CODE_MASK\0"
	.sleb128 16390
	.uleb128 0x10
	.ascii "PAGE_FAULT_ERROR_CODE_MATCH\0"
	.sleb128 16392
	.uleb128 0x10
	.ascii "CR3_TARGET_COUNT\0"
	.sleb128 16394
	.uleb128 0x10
	.ascii "VM_EXIT_CONTROLS\0"
	.sleb128 16396
	.uleb128 0x10
	.ascii "VM_EXIT_MSR_STORE_COUNT\0"
	.sleb128 16398
	.uleb128 0x10
	.ascii "VM_EXIT_MSR_LOAD_COUNT\0"
	.sleb128 16400
	.uleb128 0x10
	.ascii "VM_ENTRY_CONTROLS\0"
	.sleb128 16402
	.uleb128 0x10
	.ascii "VM_ENTRY_MSR_LOAD_COUNT\0"
	.sleb128 16404
	.uleb128 0x10
	.ascii "VM_ENTRY_INTR_INFO_FIELD\0"
	.sleb128 16406
	.uleb128 0x10
	.ascii "VM_ENTRY_EXCEPTION_ERROR_CODE\0"
	.sleb128 16408
	.uleb128 0x10
	.ascii "VM_ENTRY_INSTRUCTION_LEN\0"
	.sleb128 16410
	.uleb128 0x10
	.ascii "TPR_THRESHOLD\0"
	.sleb128 16412
	.uleb128 0x10
	.ascii "SECONDARY_VM_EXEC_CONTROL\0"
	.sleb128 16414
	.uleb128 0x10
	.ascii "VM_INSTRUCTION_ERROR\0"
	.sleb128 17408
	.uleb128 0x10
	.ascii "VM_EXIT_REASON\0"
	.sleb128 17410
	.uleb128 0x10
	.ascii "VM_EXIT_INTR_INFO\0"
	.sleb128 17412
	.uleb128 0x10
	.ascii "VM_EXIT_INTR_ERROR_CODE\0"
	.sleb128 17414
	.uleb128 0x10
	.ascii "IDT_VECTORING_INFO_FIELD\0"
	.sleb128 17416
	.uleb128 0x10
	.ascii "IDT_VECTORING_ERROR_CODE\0"
	.sleb128 17418
	.uleb128 0x10
	.ascii "VM_EXIT_INSTRUCTION_LEN\0"
	.sleb128 17420
	.uleb128 0x10
	.ascii "VMX_INSTRUCTION_INFO\0"
	.sleb128 17422
	.uleb128 0x10
	.ascii "GUEST_ES_LIMIT\0"
	.sleb128 18432
	.uleb128 0x10
	.ascii "GUEST_CS_LIMIT\0"
	.sleb128 18434
	.uleb128 0x10
	.ascii "GUEST_SS_LIMIT\0"
	.sleb128 18436
	.uleb128 0x10
	.ascii "GUEST_DS_LIMIT\0"
	.sleb128 18438
	.uleb128 0x10
	.ascii "GUEST_FS_LIMIT\0"
	.sleb128 18440
	.uleb128 0x10
	.ascii "GUEST_GS_LIMIT\0"
	.sleb128 18442
	.uleb128 0x10
	.ascii "GUEST_LDTR_LIMIT\0"
	.sleb128 18444
	.uleb128 0x10
	.ascii "GUEST_TR_LIMIT\0"
	.sleb128 18446
	.uleb128 0x10
	.ascii "GUEST_GDTR_LIMIT\0"
	.sleb128 18448
	.uleb128 0x10
	.ascii "GUEST_IDTR_LIMIT\0"
	.sleb128 18450
	.uleb128 0x10
	.ascii "GUEST_ES_AR_BYTES\0"
	.sleb128 18452
	.uleb128 0x10
	.ascii "GUEST_CS_AR_BYTES\0"
	.sleb128 18454
	.uleb128 0x10
	.ascii "GUEST_SS_AR_BYTES\0"
	.sleb128 18456
	.uleb128 0x10
	.ascii "GUEST_DS_AR_BYTES\0"
	.sleb128 18458
	.uleb128 0x10
	.ascii "GUEST_FS_AR_BYTES\0"
	.sleb128 18460
	.uleb128 0x10
	.ascii "GUEST_GS_AR_BYTES\0"
	.sleb128 18462
	.uleb128 0x10
	.ascii "GUEST_LDTR_AR_BYTES\0"
	.sleb128 18464
	.uleb128 0x10
	.ascii "GUEST_TR_AR_BYTES\0"
	.sleb128 18466
	.uleb128 0x10
	.ascii "GUEST_INTERRUPTIBILITY_INFO\0"
	.sleb128 18468
	.uleb128 0x10
	.ascii "GUEST_ACTIVITY_STATE\0"
	.sleb128 18470
	.uleb128 0x10
	.ascii "GUEST_SYSENTER_CS\0"
	.sleb128 18474
	.uleb128 0x10
	.ascii "HOST_IA32_SYSENTER_CS\0"
	.sleb128 19456
	.uleb128 0x10
	.ascii "CR0_GUEST_HOST_MASK\0"
	.sleb128 24576
	.uleb128 0x10
	.ascii "CR4_GUEST_HOST_MASK\0"
	.sleb128 24578
	.uleb128 0x10
	.ascii "CR0_READ_SHADOW\0"
	.sleb128 24580
	.uleb128 0x10
	.ascii "CR4_READ_SHADOW\0"
	.sleb128 24582
	.uleb128 0x10
	.ascii "CR3_TARGET_VALUE0\0"
	.sleb128 24584
	.uleb128 0x10
	.ascii "CR3_TARGET_VALUE1\0"
	.sleb128 24586
	.uleb128 0x10
	.ascii "CR3_TARGET_VALUE2\0"
	.sleb128 24588
	.uleb128 0x10
	.ascii "CR3_TARGET_VALUE3\0"
	.sleb128 24590
	.uleb128 0x10
	.ascii "EXIT_QUALIFICATION\0"
	.sleb128 25600
	.uleb128 0x10
	.ascii "GUEST_LINEAR_ADDRESS\0"
	.sleb128 25610
	.uleb128 0x10
	.ascii "GUEST_CR0\0"
	.sleb128 26624
	.uleb128 0x10
	.ascii "GUEST_CR3\0"
	.sleb128 26626
	.uleb128 0x10
	.ascii "GUEST_CR4\0"
	.sleb128 26628
	.uleb128 0x10
	.ascii "GUEST_ES_BASE\0"
	.sleb128 26630
	.uleb128 0x10
	.ascii "GUEST_CS_BASE\0"
	.sleb128 26632
	.uleb128 0x10
	.ascii "GUEST_SS_BASE\0"
	.sleb128 26634
	.uleb128 0x10
	.ascii "GUEST_DS_BASE\0"
	.sleb128 26636
	.uleb128 0x10
	.ascii "GUEST_FS_BASE\0"
	.sleb128 26638
	.uleb128 0x10
	.ascii "GUEST_GS_BASE\0"
	.sleb128 26640
	.uleb128 0x10
	.ascii "GUEST_LDTR_BASE\0"
	.sleb128 26642
	.uleb128 0x10
	.ascii "GUEST_TR_BASE\0"
	.sleb128 26644
	.uleb128 0x10
	.ascii "GUEST_GDTR_BASE\0"
	.sleb128 26646
	.uleb128 0x10
	.ascii "GUEST_IDTR_BASE\0"
	.sleb128 26648
	.uleb128 0x10
	.ascii "GUEST_DR7\0"
	.sleb128 26650
	.uleb128 0x10
	.ascii "GUEST_RSP\0"
	.sleb128 26652
	.uleb128 0x10
	.ascii "GUEST_RIP\0"
	.sleb128 26654
	.uleb128 0x10
	.ascii "GUEST_RFLAGS\0"
	.sleb128 26656
	.uleb128 0x10
	.ascii "GUEST_PENDING_DBG_EXCEPTIONS\0"
	.sleb128 26658
	.uleb128 0x10
	.ascii "GUEST_SYSENTER_ESP\0"
	.sleb128 26660
	.uleb128 0x10
	.ascii "GUEST_SYSENTER_EIP\0"
	.sleb128 26662
	.uleb128 0x10
	.ascii "HOST_CR0\0"
	.sleb128 27648
	.uleb128 0x10
	.ascii "HOST_CR3\0"
	.sleb128 27650
	.uleb128 0x10
	.ascii "HOST_CR4\0"
	.sleb128 27652
	.uleb128 0x10
	.ascii "HOST_FS_BASE\0"
	.sleb128 27654
	.uleb128 0x10
	.ascii "HOST_GS_BASE\0"
	.sleb128 27656
	.uleb128 0x10
	.ascii "HOST_TR_BASE\0"
	.sleb128 27658
	.uleb128 0x10
	.ascii "HOST_GDTR_BASE\0"
	.sleb128 27660
	.uleb128 0x10
	.ascii "HOST_IDTR_BASE\0"
	.sleb128 27662
	.uleb128 0x10
	.ascii "HOST_IA32_SYSENTER_ESP\0"
	.sleb128 27664
	.uleb128 0x10
	.ascii "HOST_IA32_SYSENTER_EIP\0"
	.sleb128 27666
	.uleb128 0x10
	.ascii "HOST_RSP\0"
	.sleb128 27668
	.uleb128 0x10
	.ascii "HOST_RIP\0"
	.sleb128 27670
	.byte	0x0
	.uleb128 0x3
	.ascii "gva_t\0"
	.byte	0x4
	.byte	0x5b
	.long	0x281
	.uleb128 0x3
	.ascii "gpa_t\0"
	.byte	0x4
	.byte	0x5c
	.long	0x165
	.uleb128 0x3
	.ascii "gfn_t\0"
	.byte	0x4
	.byte	0x5d
	.long	0x281
	.uleb128 0x3
	.ascii "hpa_t\0"
	.byte	0x4
	.byte	0x60
	.long	0x165
	.uleb128 0x6
	.byte	0x4
	.long	0x165
	.uleb128 0xe
	.byte	0x3
	.byte	0x4
	.byte	0x76
	.long	0x1697
	.uleb128 0x18
	.ascii "glevels\0"
	.byte	0x4
	.byte	0x77
	.long	0xfd
	.byte	0x4
	.byte	0x4
	.byte	0x1c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x18
	.ascii "level\0"
	.byte	0x4
	.byte	0x78
	.long	0xfd
	.byte	0x4
	.byte	0x4
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x18
	.ascii "quadrant\0"
	.byte	0x4
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
	.byte	0x4
	.byte	0x7a
	.long	0xfd
	.byte	0x4
	.byte	0x6
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x18
	.ascii "metaphysical\0"
	.byte	0x4
	.byte	0x7b
	.long	0xfd
	.byte	0x4
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x19
	.ascii "kvm_mmu_page_role\0"
	.byte	0x4
	.byte	0x4
	.byte	0x74
	.long	0x16c3
	.uleb128 0xd
	.ascii "word\0"
	.byte	0x4
	.byte	0x75
	.long	0xfd
	.uleb128 0x1a
	.long	0x1611
	.byte	0x0
	.uleb128 0xc
	.byte	0x4
	.byte	0x4
	.byte	0x91
	.long	0x16f1
	.uleb128 0xd
	.ascii "parent_pte\0"
	.byte	0x4
	.byte	0x92
	.long	0x160b
	.uleb128 0xd
	.ascii "parent_ptes\0"
	.byte	0x4
	.byte	0x93
	.long	0x1a7
	.byte	0x0
	.uleb128 0x4
	.ascii "kvm_mmu_page\0"
	.byte	0x34
	.byte	0x4
	.byte	0x7f
	.long	0x17b4
	.uleb128 0x5
	.ascii "link\0"
	.byte	0x4
	.byte	0x80
	.long	0x170
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "hash_link\0"
	.byte	0x4
	.byte	0x81
	.long	0x1cd
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "gfn\0"
	.byte	0x4
	.byte	0x87
	.long	0x15f1
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "role\0"
	.byte	0x4
	.byte	0x88
	.long	0x1697
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.ascii "page_hpa\0"
	.byte	0x4
	.byte	0x8a
	.long	0x15fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.ascii "slot_bitmap\0"
	.byte	0x4
	.byte	0x8b
	.long	0x281
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x5
	.ascii "global\0"
	.byte	0x4
	.byte	0x8e
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x5
	.ascii "multimapped\0"
	.byte	0x4
	.byte	0x8f
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x5
	.ascii "root_count\0"
	.byte	0x4
	.byte	0x90
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0xb
	.long	0x16c3
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.byte	0x0
	.uleb128 0x15
	.secrel32	LASF14
	.byte	0x8
	.byte	0x4
	.byte	0x97
	.long	0x17ed
	.uleb128 0x9
	.secrel32	LASF15
	.byte	0x4
	.byte	0x98
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "abort\0"
	.byte	0x4
	.byte	0x99
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.secrel32	LASF5
	.byte	0x4
	.byte	0x9a
	.long	0x17ed
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x13
	.long	0x5ac
	.long	0x17fc
	.uleb128 0x1b
	.long	0x59d
	.byte	0x0
	.uleb128 0x4
	.ascii "kvm_mmu\0"
	.byte	0x24
	.byte	0x4
	.byte	0xa6
	.long	0x18af
	.uleb128 0x5
	.ascii "new_cr3\0"
	.byte	0x4
	.byte	0xa7
	.long	0x1c9e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "page_fault\0"
	.byte	0x4
	.byte	0xa8
	.long	0x1cbe
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "free\0"
	.byte	0x4
	.byte	0xa9
	.long	0x1c9e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "gva_to_gpa\0"
	.byte	0x4
	.byte	0xaa
	.long	0x1cd9
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "root_hpa\0"
	.byte	0x4
	.byte	0xab
	.long	0x15fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "root_level\0"
	.byte	0x4
	.byte	0xac
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.ascii "shadow_root_level\0"
	.byte	0x4
	.byte	0xad
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.ascii "pae_root\0"
	.byte	0x4
	.byte	0xae
	.long	0x160b
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.long	0x18bb
	.uleb128 0x1d
	.long	0x18bb
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x18c1
	.uleb128 0x1e
	.ascii "kvm_vcpu\0"
	.word	0x3a47
	.byte	0x4
	.byte	0x9f
	.long	0x1c9e
	.uleb128 0x5
	.ascii "kvm\0"
	.byte	0x4
	.byte	0xee
	.long	0x20bc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.long	0x1e9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii "mutex\0"
	.byte	0x4
	.byte	0xf3
	.long	0x3e2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "cpu\0"
	.byte	0x4
	.byte	0xf4
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.ascii "launched\0"
	.byte	0x4
	.byte	0xf5
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.ascii "interrupt_window_open\0"
	.byte	0x4
	.byte	0xf6
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.ascii "irq_summary\0"
	.byte	0x4
	.byte	0xf7
	.long	0x281
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.ascii "irq_pending\0"
	.byte	0x4
	.byte	0xf9
	.long	0x20c2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.ascii "regs\0"
	.byte	0x4
	.byte	0xfa
	.long	0x20c2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x5
	.ascii "rip\0"
	.byte	0x4
	.byte	0xfb
	.long	0x281
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x5
	.ascii "cr0\0"
	.byte	0x4
	.byte	0xfd
	.long	0x281
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x5
	.ascii "cr2\0"
	.byte	0x4
	.byte	0xfe
	.long	0x281
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x5
	.ascii "cr3\0"
	.byte	0x4
	.byte	0xff
	.long	0x281
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x8
	.ascii "para_state_gpa\0"
	.byte	0x4
	.word	0x100
	.long	0x15e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x8
	.ascii "para_state_page\0"
	.byte	0x4
	.word	0x101
	.long	0x334
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x8
	.ascii "hypercall_gpa\0"
	.byte	0x4
	.word	0x102
	.long	0x15e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x8
	.ascii "cr4\0"
	.byte	0x4
	.word	0x103
	.long	0x281
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x8
	.ascii "cr8\0"
	.byte	0x4
	.word	0x104
	.long	0x281
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0x8
	.ascii "pdptrs\0"
	.byte	0x4
	.word	0x105
	.long	0x20d2
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0x8
	.ascii "shadow_efer\0"
	.byte	0x4
	.word	0x106
	.long	0x165
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x16
	.secrel32	LASF8
	.byte	0x4
	.word	0x107
	.long	0x165
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x8
	.ascii "ia32_misc_enable_msr\0"
	.byte	0x4
	.word	0x108
	.long	0x165
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.uleb128 0x8
	.ascii "nmsrs\0"
	.byte	0x4
	.word	0x109
	.long	0xe9
	.byte	0x3
	.byte	0x23
	.uleb128 0xc0
	.uleb128 0x8
	.ascii "guest_msrs\0"
	.byte	0x4
	.word	0x10a
	.long	0x20e2
	.byte	0x3
	.byte	0x23
	.uleb128 0xc4
	.uleb128 0x8
	.ascii "host_msrs\0"
	.byte	0x4
	.word	0x10b
	.long	0x20e2
	.byte	0x3
	.byte	0x23
	.uleb128 0xc8
	.uleb128 0x8
	.ascii "free_pages\0"
	.byte	0x4
	.word	0x10d
	.long	0x170
	.byte	0x3
	.byte	0x23
	.uleb128 0xcc
	.uleb128 0x8
	.ascii "page_header_buf\0"
	.byte	0x4
	.word	0x10e
	.long	0x20e8
	.byte	0x3
	.byte	0x23
	.uleb128 0xd4
	.uleb128 0x8
	.ascii "mmu\0"
	.byte	0x4
	.word	0x10f
	.long	0x17fc
	.byte	0x3
	.byte	0x23
	.uleb128 0x34d4
	.uleb128 0x8
	.ascii "mmu_pte_chain_cache\0"
	.byte	0x4
	.word	0x111
	.long	0x1cdf
	.byte	0x3
	.byte	0x23
	.uleb128 0x34f8
	.uleb128 0x8
	.ascii "mmu_rmap_desc_cache\0"
	.byte	0x4
	.word	0x112
	.long	0x1cdf
	.byte	0x3
	.byte	0x23
	.uleb128 0x354c
	.uleb128 0x8
	.ascii "last_pt_write_gfn\0"
	.byte	0x4
	.word	0x114
	.long	0x15f1
	.byte	0x3
	.byte	0x23
	.uleb128 0x35a0
	.uleb128 0x8
	.ascii "last_pt_write_count\0"
	.byte	0x4
	.word	0x115
	.long	0xe9
	.byte	0x3
	.byte	0x23
	.uleb128 0x35a4
	.uleb128 0x8
	.ascii "guest_debug\0"
	.byte	0x4
	.word	0x117
	.long	0x1d2f
	.byte	0x3
	.byte	0x23
	.uleb128 0x35a8
	.uleb128 0x8
	.ascii "fx_buf\0"
	.byte	0x4
	.word	0x119
	.long	0x20f8
	.byte	0x3
	.byte	0x23
	.uleb128 0x35c0
	.uleb128 0x8
	.ascii "host_fx_image\0"
	.byte	0x4
	.word	0x11a
	.long	0x2109
	.byte	0x3
	.byte	0x23
	.uleb128 0x39d0
	.uleb128 0x8
	.ascii "guest_fx_image\0"
	.byte	0x4
	.word	0x11b
	.long	0x2109
	.byte	0x3
	.byte	0x23
	.uleb128 0x39d4
	.uleb128 0x8
	.ascii "mmio_needed\0"
	.byte	0x4
	.word	0x11d
	.long	0xe9
	.byte	0x3
	.byte	0x23
	.uleb128 0x39d8
	.uleb128 0x8
	.ascii "mmio_read_completed\0"
	.byte	0x4
	.word	0x11e
	.long	0xe9
	.byte	0x3
	.byte	0x23
	.uleb128 0x39dc
	.uleb128 0x8
	.ascii "mmio_is_write\0"
	.byte	0x4
	.word	0x11f
	.long	0xe9
	.byte	0x3
	.byte	0x23
	.uleb128 0x39e0
	.uleb128 0x8
	.ascii "mmio_size\0"
	.byte	0x4
	.word	0x120
	.long	0xe9
	.byte	0x3
	.byte	0x23
	.uleb128 0x39e4
	.uleb128 0x8
	.ascii "mmio_data\0"
	.byte	0x4
	.word	0x121
	.long	0x210f
	.byte	0x3
	.byte	0x23
	.uleb128 0x39e8
	.uleb128 0x8
	.ascii "mmio_phys_addr\0"
	.byte	0x4
	.word	0x122
	.long	0x15e4
	.byte	0x3
	.byte	0x23
	.uleb128 0x39f0
	.uleb128 0x8
	.ascii "mmio_fault_cr2\0"
	.byte	0x4
	.word	0x123
	.long	0x15d7
	.byte	0x3
	.byte	0x23
	.uleb128 0x39f8
	.uleb128 0x8
	.ascii "rmode\0"
	.byte	0x4
	.word	0x12e
	.long	0x1f29
	.byte	0x3
	.byte	0x23
	.uleb128 0x39fc
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x18af
	.uleb128 0x1f
	.byte	0x1
	.long	0xe9
	.long	0x1cbe
	.uleb128 0x1d
	.long	0x18bb
	.uleb128 0x1d
	.long	0x15d7
	.uleb128 0x1d
	.long	0x15a
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1ca4
	.uleb128 0x1f
	.byte	0x1
	.long	0x15e4
	.long	0x1cd9
	.uleb128 0x1d
	.long	0x18bb
	.uleb128 0x1d
	.long	0x15d7
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1cc4
	.uleb128 0x4
	.ascii "kvm_mmu_memory_cache\0"
	.byte	0x54
	.byte	0x4
	.byte	0xbd
	.long	0x1d1f
	.uleb128 0x5
	.ascii "nobjs\0"
	.byte	0x4
	.byte	0xbe
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "objects\0"
	.byte	0x4
	.byte	0xbf
	.long	0x1d1f
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x13
	.long	0x296
	.long	0x1d2f
	.uleb128 0x14
	.long	0x59d
	.byte	0x13
	.byte	0x0
	.uleb128 0x4
	.ascii "kvm_guest_debug\0"
	.byte	0x18
	.byte	0x4
	.byte	0xc6
	.long	0x1d71
	.uleb128 0x9
	.secrel32	LASF11
	.byte	0x4
	.byte	0xc7
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "bp\0"
	.byte	0x4
	.byte	0xc8
	.long	0x1d71
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.secrel32	LASF12
	.byte	0x4
	.byte	0xc9
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0x0
	.uleb128 0x13
	.long	0x281
	.long	0x1d81
	.uleb128 0x14
	.long	0x59d
	.byte	0x3
	.byte	0x0
	.uleb128 0x20
	.byte	0x4
	.byte	0x4
	.byte	0xcc
	.long	0x1e19
	.uleb128 0x10
	.ascii "VCPU_REGS_RAX\0"
	.sleb128 0
	.uleb128 0x10
	.ascii "VCPU_REGS_RCX\0"
	.sleb128 1
	.uleb128 0x10
	.ascii "VCPU_REGS_RDX\0"
	.sleb128 2
	.uleb128 0x10
	.ascii "VCPU_REGS_RBX\0"
	.sleb128 3
	.uleb128 0x10
	.ascii "VCPU_REGS_RSP\0"
	.sleb128 4
	.uleb128 0x10
	.ascii "VCPU_REGS_RBP\0"
	.sleb128 5
	.uleb128 0x10
	.ascii "VCPU_REGS_RSI\0"
	.sleb128 6
	.uleb128 0x10
	.ascii "VCPU_REGS_RDI\0"
	.sleb128 7
	.uleb128 0x10
	.ascii "NR_VCPU_REGS\0"
	.sleb128 8
	.byte	0x0
	.uleb128 0x20
	.byte	0x4
	.byte	0x4
	.byte	0xe2
	.long	0x1e9c
	.uleb128 0x10
	.ascii "VCPU_SREG_CS\0"
	.sleb128 0
	.uleb128 0x10
	.ascii "VCPU_SREG_DS\0"
	.sleb128 1
	.uleb128 0x10
	.ascii "VCPU_SREG_ES\0"
	.sleb128 2
	.uleb128 0x10
	.ascii "VCPU_SREG_FS\0"
	.sleb128 3
	.uleb128 0x10
	.ascii "VCPU_SREG_GS\0"
	.sleb128 4
	.uleb128 0x10
	.ascii "VCPU_SREG_SS\0"
	.sleb128 5
	.uleb128 0x10
	.ascii "VCPU_SREG_TR\0"
	.sleb128 6
	.uleb128 0x10
	.ascii "VCPU_SREG_LDTR\0"
	.sleb128 7
	.byte	0x0
	.uleb128 0xc
	.byte	0x4
	.byte	0x4
	.byte	0xef
	.long	0x1ebb
	.uleb128 0x12
	.secrel32	LASF14
	.byte	0x4
	.byte	0xf0
	.long	0x1ebb
	.uleb128 0xd
	.ascii "svm\0"
	.byte	0x4
	.byte	0xf1
	.long	0x1ecc
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x17b4
	.uleb128 0x21
	.ascii "vcpu_svm\0"
	.byte	0x1
	.uleb128 0x6
	.byte	0x4
	.long	0x1ec1
	.uleb128 0x7
	.ascii "kvm_save_segment\0"
	.byte	0xe
	.byte	0x4
	.word	0x128
	.long	0x1f29
	.uleb128 0x16
	.secrel32	LASF10
	.byte	0x4
	.word	0x129
	.long	0x14f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "base\0"
	.byte	0x4
	.word	0x12a
	.long	0x281
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x16
	.secrel32	LASF9
	.byte	0x4
	.word	0x12b
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x8
	.ascii "ar\0"
	.byte	0x4
	.word	0x12c
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x22
	.byte	0x4b
	.byte	0x4
	.word	0x125
	.long	0x1fa0
	.uleb128 0x8
	.ascii "active\0"
	.byte	0x4
	.word	0x126
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "save_iopl\0"
	.byte	0x4
	.word	0x127
	.long	0x145
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.ascii "tr\0"
	.byte	0x4
	.word	0x12d
	.long	0x1ed2
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x8
	.ascii "es\0"
	.byte	0x4
	.word	0x12d
	.long	0x1ed2
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0x8
	.ascii "ds\0"
	.byte	0x4
	.word	0x12d
	.long	0x1ed2
	.byte	0x2
	.byte	0x23
	.uleb128 0x21
	.uleb128 0x8
	.ascii "fs\0"
	.byte	0x4
	.word	0x12d
	.long	0x1ed2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2f
	.uleb128 0x8
	.ascii "gs\0"
	.byte	0x4
	.word	0x12d
	.long	0x1ed2
	.byte	0x2
	.byte	0x23
	.uleb128 0x3d
	.byte	0x0
	.uleb128 0x1e
	.ascii "kvm\0"
	.word	0x3ec3
	.byte	0x4
	.byte	0xee
	.long	0x20bc
	.uleb128 0x8
	.ascii "lock\0"
	.byte	0x4
	.word	0x13a
	.long	0x3d0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "nmemslots\0"
	.byte	0x4
	.word	0x13b
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.ascii "memslots\0"
	.byte	0x4
	.word	0x13c
	.long	0x21a1
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.ascii "active_mmu_pages\0"
	.byte	0x4
	.word	0x140
	.long	0x170
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x8
	.ascii "n_free_mmu_pages\0"
	.byte	0x4
	.word	0x141
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x8
	.ascii "mmu_page_hash\0"
	.byte	0x4
	.word	0x142
	.long	0x21b1
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x8
	.ascii "vcpus\0"
	.byte	0x4
	.word	0x143
	.long	0x21c1
	.byte	0x3
	.byte	0x23
	.uleb128 0x464
	.uleb128 0x8
	.ascii "memory_config_version\0"
	.byte	0x4
	.word	0x144
	.long	0xe9
	.byte	0x3
	.byte	0x23
	.uleb128 0x3eab
	.uleb128 0x8
	.ascii "busy\0"
	.byte	0x4
	.word	0x145
	.long	0xe9
	.byte	0x3
	.byte	0x23
	.uleb128 0x3eaf
	.uleb128 0x8
	.ascii "rmap_overflow\0"
	.byte	0x4
	.word	0x146
	.long	0x281
	.byte	0x3
	.byte	0x23
	.uleb128 0x3eb3
	.uleb128 0x8
	.ascii "vm_list\0"
	.byte	0x4
	.word	0x147
	.long	0x170
	.byte	0x3
	.byte	0x23
	.uleb128 0x3eb7
	.uleb128 0x8
	.ascii "filp\0"
	.byte	0x4
	.word	0x148
	.long	0x5a0
	.byte	0x3
	.byte	0x23
	.uleb128 0x3ebf
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1fa0
	.uleb128 0x13
	.long	0x281
	.long	0x20d2
	.uleb128 0x14
	.long	0x59d
	.byte	0x7
	.byte	0x0
	.uleb128 0x13
	.long	0x165
	.long	0x20e2
	.uleb128 0x14
	.long	0x59d
	.byte	0x3
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xa3b
	.uleb128 0x13
	.long	0x16f1
	.long	0x20f8
	.uleb128 0x14
	.long	0x59d
	.byte	0xff
	.byte	0x0
	.uleb128 0x13
	.long	0x5ac
	.long	0x2109
	.uleb128 0x23
	.long	0x59d
	.word	0x40f
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x5ac
	.uleb128 0x13
	.long	0xa8
	.long	0x211f
	.uleb128 0x14
	.long	0x59d
	.byte	0x7
	.byte	0x0
	.uleb128 0x7
	.ascii "kvm_memory_slot\0"
	.byte	0x14
	.byte	0x4
	.word	0x131
	.long	0x2195
	.uleb128 0x16
	.secrel32	LASF16
	.byte	0x4
	.word	0x132
	.long	0x15f1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "npages\0"
	.byte	0x4
	.word	0x133
	.long	0x281
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x16
	.secrel32	LASF17
	.byte	0x4
	.word	0x134
	.long	0x281
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.ascii "phys_mem\0"
	.byte	0x4
	.word	0x135
	.long	0x2195
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.ascii "dirty_bitmap\0"
	.byte	0x4
	.word	0x136
	.long	0x219b
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x334
	.uleb128 0x6
	.byte	0x4
	.long	0x281
	.uleb128 0x13
	.long	0x211f
	.long	0x21b1
	.uleb128 0x14
	.long	0x59d
	.byte	0x3
	.byte	0x0
	.uleb128 0x13
	.long	0x1a7
	.long	0x21c1
	.uleb128 0x14
	.long	0x59d
	.byte	0xff
	.byte	0x0
	.uleb128 0x13
	.long	0x18c1
	.long	0x21d1
	.uleb128 0x14
	.long	0x59d
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.secrel32	LASF18
	.byte	0x30
	.byte	0x4
	.word	0x14b
	.long	0x22df
	.uleb128 0x8
	.ascii "pf_fixed\0"
	.byte	0x4
	.word	0x14c
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "pf_guest\0"
	.byte	0x4
	.word	0x14d
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x16
	.secrel32	LASF19
	.byte	0x4
	.word	0x14e
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.ascii "invlpg\0"
	.byte	0x4
	.word	0x14f
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.ascii "exits\0"
	.byte	0x4
	.word	0x151
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.ascii "io_exits\0"
	.byte	0x4
	.word	0x152
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.ascii "mmio_exits\0"
	.byte	0x4
	.word	0x153
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x8
	.ascii "signal_exits\0"
	.byte	0x4
	.word	0x154
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x8
	.ascii "irq_window_exits\0"
	.byte	0x4
	.word	0x155
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x8
	.ascii "halt_exits\0"
	.byte	0x4
	.word	0x156
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x8
	.ascii "request_irq_exits\0"
	.byte	0x4
	.word	0x157
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.ascii "irq_exits\0"
	.byte	0x4
	.word	0x158
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.byte	0x0
	.uleb128 0x7
	.ascii "descriptor_table\0"
	.byte	0x6
	.byte	0x4
	.word	0x15b
	.long	0x2319
	.uleb128 0x16
	.secrel32	LASF9
	.byte	0x4
	.word	0x15c
	.long	0x14f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "base\0"
	.byte	0x4
	.word	0x15d
	.long	0x281
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x7
	.ascii "kvm_arch_ops\0"
	.byte	0xa8
	.byte	0x4
	.word	0x160
	.long	0x26a9
	.uleb128 0x16
	.secrel32	LASF20
	.byte	0x4
	.word	0x161
	.long	0x26af
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii "disabled_by_bios\0"
	.byte	0x4
	.word	0x162
	.long	0x26af
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x16
	.secrel32	LASF21
	.byte	0x4
	.word	0x163
	.long	0x26c1
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x16
	.secrel32	LASF22
	.byte	0x4
	.word	0x164
	.long	0x26c1
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x16
	.secrel32	LASF23
	.byte	0x4
	.word	0x165
	.long	0x26af
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x16
	.secrel32	LASF24
	.byte	0x4
	.word	0x166
	.long	0x26c9
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.ascii "vcpu_create\0"
	.byte	0x4
	.word	0x168
	.long	0x26df
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x8
	.ascii "vcpu_free\0"
	.byte	0x4
	.word	0x169
	.long	0x1c9e
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x8
	.ascii "vcpu_load\0"
	.byte	0x4
	.word	0x16b
	.long	0x1c9e
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x8
	.ascii "vcpu_put\0"
	.byte	0x4
	.word	0x16c
	.long	0x1c9e
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x8
	.ascii "vcpu_decache\0"
	.byte	0x4
	.word	0x16d
	.long	0x1c9e
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x16
	.secrel32	LASF25
	.byte	0x4
	.word	0x16f
	.long	0x2700
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x8
	.ascii "get_msr\0"
	.byte	0x4
	.word	0x171
	.long	0x2720
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x8
	.ascii "set_msr\0"
	.byte	0x4
	.word	0x172
	.long	0x2740
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x8
	.ascii "get_segment_base\0"
	.byte	0x4
	.word	0x173
	.long	0x275b
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x8
	.ascii "get_segment\0"
	.byte	0x4
	.word	0x174
	.long	0x277d
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x8
	.ascii "set_segment\0"
	.byte	0x4
	.word	0x176
	.long	0x277d
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x8
	.ascii "get_cs_db_l_bits\0"
	.byte	0x4
	.word	0x178
	.long	0x2799
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x8
	.ascii "decache_cr0_cr4_guest_bits\0"
	.byte	0x4
	.word	0x179
	.long	0x1c9e
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x8
	.ascii "set_cr0\0"
	.byte	0x4
	.word	0x17a
	.long	0x27b0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x8
	.ascii "set_cr0_no_modeswitch\0"
	.byte	0x4
	.word	0x17b
	.long	0x27b0
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x8
	.ascii "set_cr3\0"
	.byte	0x4
	.word	0x17d
	.long	0x27b0
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x8
	.ascii "set_cr4\0"
	.byte	0x4
	.word	0x17e
	.long	0x27b0
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x8
	.ascii "set_efer\0"
	.byte	0x4
	.word	0x17f
	.long	0x27c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x8
	.ascii "get_idt\0"
	.byte	0x4
	.word	0x180
	.long	0x27e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x8
	.ascii "set_idt\0"
	.byte	0x4
	.word	0x181
	.long	0x27e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x8
	.ascii "get_gdt\0"
	.byte	0x4
	.word	0x182
	.long	0x27e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x8
	.ascii "set_gdt\0"
	.byte	0x4
	.word	0x183
	.long	0x27e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x8
	.ascii "get_dr\0"
	.byte	0x4
	.word	0x184
	.long	0x27ff
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x8
	.ascii "set_dr\0"
	.byte	0x4
	.word	0x185
	.long	0x2820
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x8
	.ascii "cache_regs\0"
	.byte	0x4
	.word	0x187
	.long	0x1c9e
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x8
	.ascii "decache_regs\0"
	.byte	0x4
	.word	0x188
	.long	0x1c9e
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0x8
	.ascii "get_rflags\0"
	.byte	0x4
	.word	0x189
	.long	0x2836
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x8
	.ascii "set_rflags\0"
	.byte	0x4
	.word	0x18a
	.long	0x27b0
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0x8
	.ascii "invlpg\0"
	.byte	0x4
	.word	0x18c
	.long	0x284d
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0x16
	.secrel32	LASF19
	.byte	0x4
	.word	0x18d
	.long	0x1c9e
	.byte	0x3
	.byte	0x23
	.uleb128 0x8c
	.uleb128 0x8
	.ascii "inject_page_fault\0"
	.byte	0x4
	.word	0x18e
	.long	0x2869
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0x8
	.ascii "inject_gp\0"
	.byte	0x4
	.word	0x191
	.long	0x2880
	.byte	0x3
	.byte	0x23
	.uleb128 0x94
	.uleb128 0x8
	.ascii "run\0"
	.byte	0x4
	.word	0x193
	.long	0x28a1
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0x8
	.ascii "vcpu_setup\0"
	.byte	0x4
	.word	0x194
	.long	0x26df
	.byte	0x3
	.byte	0x23
	.uleb128 0x9c
	.uleb128 0x16
	.secrel32	LASF26
	.byte	0x4
	.word	0x195
	.long	0x1c9e
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x8
	.ascii "patch_hypercall\0"
	.byte	0x4
	.word	0x196
	.long	0x28be
	.byte	0x3
	.byte	0x23
	.uleb128 0xa4
	.byte	0x0
	.uleb128 0x25
	.byte	0x1
	.long	0xe9
	.uleb128 0x6
	.byte	0x4
	.long	0x26a9
	.uleb128 0x1c
	.byte	0x1
	.long	0x26c1
	.uleb128 0x1d
	.long	0x296
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x26b5
	.uleb128 0x26
	.byte	0x1
	.uleb128 0x6
	.byte	0x4
	.long	0x26c7
	.uleb128 0x1f
	.byte	0x1
	.long	0xe9
	.long	0x26df
	.uleb128 0x1d
	.long	0x18bb
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x26cf
	.uleb128 0x1f
	.byte	0x1
	.long	0xe9
	.long	0x26fa
	.uleb128 0x1d
	.long	0x18bb
	.uleb128 0x1d
	.long	0x26fa
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xacd
	.uleb128 0x6
	.byte	0x4
	.long	0x26e5
	.uleb128 0x1f
	.byte	0x1
	.long	0xe9
	.long	0x2720
	.uleb128 0x1d
	.long	0x18bb
	.uleb128 0x1d
	.long	0x15a
	.uleb128 0x1d
	.long	0x160b
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2706
	.uleb128 0x1f
	.byte	0x1
	.long	0xe9
	.long	0x2740
	.uleb128 0x1d
	.long	0x18bb
	.uleb128 0x1d
	.long	0x15a
	.uleb128 0x1d
	.long	0x165
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2726
	.uleb128 0x1f
	.byte	0x1
	.long	0x165
	.long	0x275b
	.uleb128 0x1d
	.long	0x18bb
	.uleb128 0x1d
	.long	0xe9
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2746
	.uleb128 0x1c
	.byte	0x1
	.long	0x2777
	.uleb128 0x1d
	.long	0x18bb
	.uleb128 0x1d
	.long	0x2777
	.uleb128 0x1d
	.long	0xe9
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x968
	.uleb128 0x6
	.byte	0x4
	.long	0x2761
	.uleb128 0x1c
	.byte	0x1
	.long	0x2799
	.uleb128 0x1d
	.long	0x18bb
	.uleb128 0x1d
	.long	0x5a6
	.uleb128 0x1d
	.long	0x5a6
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2783
	.uleb128 0x1c
	.byte	0x1
	.long	0x27b0
	.uleb128 0x1d
	.long	0x18bb
	.uleb128 0x1d
	.long	0x281
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x279f
	.uleb128 0x1c
	.byte	0x1
	.long	0x27c7
	.uleb128 0x1d
	.long	0x18bb
	.uleb128 0x1d
	.long	0x165
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x27b6
	.uleb128 0x1c
	.byte	0x1
	.long	0x27de
	.uleb128 0x1d
	.long	0x18bb
	.uleb128 0x1d
	.long	0x27de
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x22df
	.uleb128 0x6
	.byte	0x4
	.long	0x27cd
	.uleb128 0x1f
	.byte	0x1
	.long	0x281
	.long	0x27ff
	.uleb128 0x1d
	.long	0x18bb
	.uleb128 0x1d
	.long	0xe9
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x27ea
	.uleb128 0x1c
	.byte	0x1
	.long	0x2820
	.uleb128 0x1d
	.long	0x18bb
	.uleb128 0x1d
	.long	0xe9
	.uleb128 0x1d
	.long	0x281
	.uleb128 0x1d
	.long	0x5a6
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2805
	.uleb128 0x1f
	.byte	0x1
	.long	0x281
	.long	0x2836
	.uleb128 0x1d
	.long	0x18bb
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2826
	.uleb128 0x1c
	.byte	0x1
	.long	0x284d
	.uleb128 0x1d
	.long	0x18bb
	.uleb128 0x1d
	.long	0x15d7
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x283c
	.uleb128 0x1c
	.byte	0x1
	.long	0x2869
	.uleb128 0x1d
	.long	0x18bb
	.uleb128 0x1d
	.long	0x281
	.uleb128 0x1d
	.long	0x15a
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2853
	.uleb128 0x1c
	.byte	0x1
	.long	0x2880
	.uleb128 0x1d
	.long	0x18bb
	.uleb128 0x1d
	.long	0xfd
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x286f
	.uleb128 0x1f
	.byte	0x1
	.long	0xe9
	.long	0x289b
	.uleb128 0x1d
	.long	0x18bb
	.uleb128 0x1d
	.long	0x289b
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x804
	.uleb128 0x6
	.byte	0x4
	.long	0x2886
	.uleb128 0x1c
	.byte	0x1
	.long	0x28b8
	.uleb128 0x1d
	.long	0x18bb
	.uleb128 0x1d
	.long	0x28b8
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xa8
	.uleb128 0x6
	.byte	0x4
	.long	0x28a7
	.uleb128 0x27
	.ascii "emulation_result\0"
	.byte	0x4
	.byte	0x4
	.word	0x1bc
	.long	0x290f
	.uleb128 0x10
	.ascii "EMULATE_DONE\0"
	.sleb128 0
	.uleb128 0x10
	.ascii "EMULATE_DO_MMIO\0"
	.sleb128 1
	.uleb128 0x10
	.ascii "EMULATE_FAIL\0"
	.sleb128 2
	.byte	0x0
	.uleb128 0x4
	.ascii "Xgt_desc_struct\0"
	.byte	0x8
	.byte	0x2
	.byte	0x12
	.long	0x2953
	.uleb128 0x5
	.ascii "size\0"
	.byte	0x2
	.byte	0x13
	.long	0xd3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.secrel32	LASF2
	.byte	0x2
	.byte	0x14
	.long	0x281
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x5
	.ascii "pad\0"
	.byte	0x2
	.byte	0x15
	.long	0xd3
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.byte	0x0
	.uleb128 0x4
	.ascii "desc_struct\0"
	.byte	0x8
	.byte	0x2
	.byte	0x18
	.long	0x2a3f
	.uleb128 0x5
	.ascii "limit0\0"
	.byte	0x2
	.byte	0x19
	.long	0x14f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "base0\0"
	.byte	0x2
	.byte	0x1a
	.long	0x14f
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x18
	.ascii "base1\0"
	.byte	0x2
	.byte	0x1b
	.long	0xfd
	.byte	0x4
	.byte	0x8
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x18
	.ascii "type\0"
	.byte	0x2
	.byte	0x1b
	.long	0xfd
	.byte	0x4
	.byte	0x4
	.byte	0x14
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x18
	.ascii "s\0"
	.byte	0x2
	.byte	0x1b
	.long	0xfd
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x18
	.ascii "dpl\0"
	.byte	0x2
	.byte	0x1b
	.long	0xfd
	.byte	0x4
	.byte	0x2
	.byte	0x11
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x18
	.ascii "p\0"
	.byte	0x2
	.byte	0x1b
	.long	0xfd
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x28
	.secrel32	LASF9
	.byte	0x2
	.byte	0x1c
	.long	0xfd
	.byte	0x4
	.byte	0x4
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x18
	.ascii "avl\0"
	.byte	0x2
	.byte	0x1c
	.long	0xfd
	.byte	0x4
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x18
	.ascii "l\0"
	.byte	0x2
	.byte	0x1c
	.long	0xfd
	.byte	0x4
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x18
	.ascii "d\0"
	.byte	0x2
	.byte	0x1c
	.long	0xfd
	.byte	0x4
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x18
	.ascii "g\0"
	.byte	0x2
	.byte	0x1c
	.long	0xfd
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x18
	.ascii "base2\0"
	.byte	0x2
	.byte	0x1c
	.long	0xfd
	.byte	0x4
	.byte	0x8
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x4
	.ascii "segment_descriptor\0"
	.byte	0x8
	.byte	0x9
	.byte	0x1
	.long	0x2b66
	.uleb128 0x5
	.ascii "limit_low\0"
	.byte	0x9
	.byte	0x2
	.long	0x14f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "base_low\0"
	.byte	0x9
	.byte	0x3
	.long	0x14f
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x5
	.ascii "base_mid\0"
	.byte	0x9
	.byte	0x4
	.long	0x145
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x18
	.ascii "type\0"
	.byte	0x9
	.byte	0x5
	.long	0x145
	.byte	0x1
	.byte	0x4
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x18
	.ascii "system\0"
	.byte	0x9
	.byte	0x6
	.long	0x145
	.byte	0x1
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x18
	.ascii "dpl\0"
	.byte	0x9
	.byte	0x7
	.long	0x145
	.byte	0x1
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x18
	.ascii "present\0"
	.byte	0x9
	.byte	0x8
	.long	0x145
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x18
	.ascii "limit_high\0"
	.byte	0x9
	.byte	0x9
	.long	0x145
	.byte	0x1
	.byte	0x4
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x18
	.ascii "avl\0"
	.byte	0x9
	.byte	0xa
	.long	0x145
	.byte	0x1
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x18
	.ascii "long_mode\0"
	.byte	0x9
	.byte	0xb
	.long	0x145
	.byte	0x1
	.byte	0x1
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x18
	.ascii "default_op\0"
	.byte	0x9
	.byte	0xc
	.long	0x145
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x18
	.ascii "granularity\0"
	.byte	0x9
	.byte	0xd
	.long	0x145
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x5
	.ascii "base_high\0"
	.byte	0x9
	.byte	0xe
	.long	0x145
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.byte	0x0
	.uleb128 0x15
	.secrel32	LASF27
	.byte	0xc
	.byte	0x1
	.byte	0x38
	.long	0x2ba0
	.uleb128 0x5
	.ascii "size\0"
	.byte	0x1
	.byte	0x39
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "order\0"
	.byte	0x1
	.byte	0x3a
	.long	0xe9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.secrel32	LASF15
	.byte	0x1
	.byte	0x3b
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x4
	.ascii "kvm_vmx_segment_field\0"
	.byte	0x10
	.byte	0x1
	.byte	0x46
	.long	0x2bfd
	.uleb128 0x9
	.secrel32	LASF10
	.byte	0x1
	.byte	0x47
	.long	0xfd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.ascii "base\0"
	.byte	0x1
	.byte	0x48
	.long	0xfd
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.secrel32	LASF9
	.byte	0x1
	.byte	0x49
	.long	0xfd
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.ascii "ar_bytes\0"
	.byte	0x1
	.byte	0x4a
	.long	0xfd
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x29
	.ascii "native_cpuid\0"
	.byte	0x2
	.byte	0x32
	.byte	0x1
	.byte	0x3
	.long	0x2c40
	.uleb128 0x2a
	.ascii "eax\0"
	.byte	0x2
	.byte	0x30
	.long	0x2c40
	.uleb128 0x2a
	.ascii "ebx\0"
	.byte	0x2
	.byte	0x30
	.long	0x2c40
	.uleb128 0x2a
	.ascii "ecx\0"
	.byte	0x2
	.byte	0x31
	.long	0x2c40
	.uleb128 0x2a
	.ascii "edx\0"
	.byte	0x2
	.byte	0x31
	.long	0x2c40
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0xfd
	.uleb128 0x29
	.ascii "cpuid\0"
	.byte	0x2
	.byte	0x46
	.byte	0x1
	.byte	0x3
	.long	0x2c8d
	.uleb128 0x2a
	.ascii "op\0"
	.byte	0x2
	.byte	0x43
	.long	0xfd
	.uleb128 0x2a
	.ascii "eax\0"
	.byte	0x2
	.byte	0x44
	.long	0x2c40
	.uleb128 0x2a
	.ascii "ebx\0"
	.byte	0x2
	.byte	0x44
	.long	0x2c40
	.uleb128 0x2a
	.ascii "ecx\0"
	.byte	0x2
	.byte	0x45
	.long	0x2c40
	.uleb128 0x2a
	.ascii "edx\0"
	.byte	0x2
	.byte	0x45
	.long	0x2c40
	.uleb128 0x2b
	.byte	0x0
	.uleb128 0x29
	.ascii "native_write_msr\0"
	.byte	0x2
	.byte	0xa6
	.byte	0x1
	.byte	0x3
	.long	0x2cbe
	.uleb128 0x2a
	.ascii "msr\0"
	.byte	0x2
	.byte	0xa5
	.long	0xfd
	.uleb128 0x2a
	.ascii "val\0"
	.byte	0x2
	.byte	0xa5
	.long	0x12b
	.byte	0x0
	.uleb128 0x2c
	.ascii "store_fs\0"
	.byte	0x2
	.word	0x15f
	.byte	0x1
	.long	0xd3
	.byte	0x3
	.long	0x2ce0
	.uleb128 0x2d
	.ascii "r\0"
	.byte	0x2
	.word	0x160
	.long	0xd3
	.byte	0x0
	.uleb128 0x29
	.ascii "store_gdt\0"
	.byte	0x2
	.byte	0xfe
	.byte	0x1
	.byte	0x3
	.long	0x2cff
	.uleb128 0x2a
	.ascii "dtr\0"
	.byte	0x2
	.byte	0xfd
	.long	0x2cff
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x290f
	.uleb128 0x2c
	.ascii "store_gs\0"
	.byte	0x2
	.word	0x166
	.byte	0x1
	.long	0xd3
	.byte	0x3
	.long	0x2d27
	.uleb128 0x2d
	.ascii "r\0"
	.byte	0x2
	.word	0x167
	.long	0xd3
	.byte	0x0
	.uleb128 0x2e
	.ascii "vmcs_readl\0"
	.byte	0x1
	.byte	0x9a
	.byte	0x1
	.long	0x281
	.byte	0x0
	.long	0x2d56
	.uleb128 0x2f
	.secrel32	LASF28
	.byte	0x1
	.byte	0x99
	.long	0x281
	.uleb128 0x30
	.secrel32	LASF3
	.byte	0x1
	.byte	0x9b
	.long	0x281
	.byte	0x0
	.uleb128 0x2e
	.ascii "native_read_tsc\0"
	.byte	0x2
	.byte	0xd5
	.byte	0x1
	.long	0x12b
	.byte	0x3
	.long	0x2d7f
	.uleb128 0x31
	.ascii "val\0"
	.byte	0x2
	.byte	0xd6
	.long	0x12b
	.byte	0x0
	.uleb128 0x2e
	.ascii "vmcs_read64\0"
	.byte	0x1
	.byte	0xad
	.byte	0x1
	.long	0x165
	.byte	0x0
	.long	0x2dba
	.uleb128 0x2f
	.secrel32	LASF28
	.byte	0x1
	.byte	0xac
	.long	0x281
	.uleb128 0x32
	.long	0x2db0
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
	.ascii "get_gdt\0"
	.byte	0x4
	.word	0x271
	.byte	0x1
	.byte	0x3
	.long	0x2ddb
	.uleb128 0x36
	.ascii "table\0"
	.byte	0x4
	.word	0x270
	.long	0x27de
	.byte	0x0
	.uleb128 0x37
	.ascii "load_TR_desc\0"
	.byte	0x2
	.byte	0xef
	.byte	0x1
	.byte	0x3
	.uleb128 0x2e
	.ascii "vmcs_read32\0"
	.byte	0x1
	.byte	0xa8
	.byte	0x1
	.long	0x15a
	.byte	0x0
	.long	0x2e1b
	.uleb128 0x2f
	.secrel32	LASF28
	.byte	0x1
	.byte	0xa7
	.long	0x281
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.ascii "vmcs_read16\0"
	.byte	0x1
	.byte	0xa3
	.byte	0x1
	.long	0x14f
	.byte	0x0
	.long	0x2e49
	.uleb128 0x2f
	.secrel32	LASF28
	.byte	0x1
	.byte	0xa2
	.long	0x281
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
	.ascii "vmcs_write32\0"
	.byte	0x1
	.byte	0xcc
	.byte	0x1
	.byte	0x0
	.long	0x2e76
	.uleb128 0x2f
	.secrel32	LASF28
	.byte	0x1
	.byte	0xcb
	.long	0x281
	.uleb128 0x2f
	.secrel32	LASF3
	.byte	0x1
	.byte	0xcb
	.long	0x15a
	.byte	0x0
	.uleb128 0x2e
	.ascii "native_read_msr\0"
	.byte	0x2
	.byte	0x9e
	.byte	0x1
	.long	0x12b
	.byte	0x3
	.long	0x2eaa
	.uleb128 0x2a
	.ascii "msr\0"
	.byte	0x2
	.byte	0x9d
	.long	0xfd
	.uleb128 0x31
	.ascii "val\0"
	.byte	0x2
	.byte	0x9f
	.long	0x12b
	.byte	0x0
	.uleb128 0x29
	.ascii "vmcs_write16\0"
	.byte	0x1
	.byte	0xc7
	.byte	0x1
	.byte	0x0
	.long	0x2ed7
	.uleb128 0x2f
	.secrel32	LASF28
	.byte	0x1
	.byte	0xc6
	.long	0x281
	.uleb128 0x2f
	.secrel32	LASF3
	.byte	0x1
	.byte	0xc6
	.long	0x14f
	.byte	0x0
	.uleb128 0x35
	.ascii "vcpu_load_rsp_rip\0"
	.byte	0x1
	.word	0x1cf
	.byte	0x1
	.byte	0x0
	.long	0x2f16
	.uleb128 0x38
	.secrel32	LASF29
	.byte	0x1
	.word	0x1ce
	.long	0x18bb
	.uleb128 0x32
	.long	0x2f0c
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.ascii "rmode_tss_base\0"
	.byte	0x1
	.word	0x2ec
	.byte	0x1
	.long	0xe9
	.byte	0x0
	.long	0x2f4c
	.uleb128 0x36
	.ascii "kvm\0"
	.byte	0x1
	.word	0x2eb
	.long	0x20bc
	.uleb128 0x39
	.secrel32	LASF16
	.byte	0x1
	.word	0x2ed
	.long	0x15f1
	.byte	0x0
	.uleb128 0x35
	.ascii "native_set_debugreg\0"
	.byte	0x2
	.word	0x1a8
	.byte	0x1
	.byte	0x3
	.long	0x2f85
	.uleb128 0x36
	.ascii "regno\0"
	.byte	0x2
	.word	0x1a7
	.long	0xe9
	.uleb128 0x38
	.secrel32	LASF3
	.byte	0x2
	.word	0x1a7
	.long	0x281
	.byte	0x0
	.uleb128 0x2e
	.ascii "is_page_fault\0"
	.byte	0x1
	.byte	0x5f
	.byte	0x1
	.long	0xe9
	.byte	0x3
	.long	0x2fac
	.uleb128 0x2f
	.secrel32	LASF30
	.byte	0x1
	.byte	0x5e
	.long	0x15a
	.byte	0x0
	.uleb128 0x2e
	.ascii "cpuid_ecx\0"
	.byte	0x2
	.byte	0x68
	.byte	0x1
	.long	0xfd
	.byte	0x3
	.long	0x2ffd
	.uleb128 0x2a
	.ascii "op\0"
	.byte	0x2
	.byte	0x67
	.long	0xfd
	.uleb128 0x31
	.ascii "eax\0"
	.byte	0x2
	.byte	0x69
	.long	0xfd
	.uleb128 0x31
	.ascii "ebx\0"
	.byte	0x2
	.byte	0x69
	.long	0xfd
	.uleb128 0x31
	.ascii "ecx\0"
	.byte	0x2
	.byte	0x69
	.long	0xfd
	.uleb128 0x31
	.ascii "edx\0"
	.byte	0x2
	.byte	0x69
	.long	0xfd
	.uleb128 0x33
	.uleb128 0x2b
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.ascii "test_bit\0"
	.byte	0x3
	.word	0x132
	.byte	0x1
	.long	0xe9
	.byte	0x3
	.long	0x3041
	.uleb128 0x36
	.ascii "nr\0"
	.byte	0x3
	.word	0x131
	.long	0xe9
	.uleb128 0x36
	.ascii "addr\0"
	.byte	0x3
	.word	0x131
	.long	0x3041
	.uleb128 0x2d
	.ascii "v\0"
	.byte	0x3
	.word	0x133
	.long	0x145
	.uleb128 0x2d
	.ascii "p\0"
	.byte	0x3
	.word	0x134
	.long	0x3048
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x3047
	.uleb128 0x3a
	.uleb128 0x6
	.byte	0x4
	.long	0x304e
	.uleb128 0x3b
	.long	0x15a
	.uleb128 0x2c
	.ascii "_gfn_to_page\0"
	.byte	0x4
	.word	0x21c
	.byte	0x1
	.long	0x334
	.byte	0x3
	.long	0x3094
	.uleb128 0x36
	.ascii "kvm\0"
	.byte	0x4
	.word	0x21b
	.long	0x20bc
	.uleb128 0x36
	.ascii "gfn\0"
	.byte	0x4
	.word	0x21b
	.long	0x15f1
	.uleb128 0x2d
	.ascii "slot\0"
	.byte	0x4
	.word	0x21d
	.long	0x3094
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x211f
	.uleb128 0x3c
	.ascii "get_rdx_init_val\0"
	.byte	0x4
	.word	0x296
	.byte	0x1
	.long	0x15a
	.byte	0x3
	.uleb128 0x35
	.ascii "guest_write_tsc\0"
	.byte	0x1
	.word	0x152
	.byte	0x1
	.byte	0x0
	.long	0x30f7
	.uleb128 0x36
	.ascii "guest_tsc\0"
	.byte	0x1
	.word	0x151
	.long	0x165
	.uleb128 0x39
	.secrel32	LASF31
	.byte	0x1
	.word	0x153
	.long	0x165
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d73
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
	.ascii "vmcs_write32_fixedbits\0"
	.byte	0x1
	.word	0x419
	.byte	0x1
	.byte	0x0
	.long	0x3185
	.uleb128 0x36
	.ascii "msr\0"
	.byte	0x1
	.word	0x418
	.long	0x15a
	.uleb128 0x38
	.secrel32	LASF13
	.byte	0x1
	.word	0x418
	.long	0x15a
	.uleb128 0x36
	.ascii "val\0"
	.byte	0x1
	.word	0x418
	.long	0x15a
	.uleb128 0x2d
	.ascii "msr_high\0"
	.byte	0x1
	.word	0x41a
	.long	0x15a
	.uleb128 0x2d
	.ascii "msr_low\0"
	.byte	0x1
	.word	0x41a
	.long	0x15a
	.uleb128 0x32
	.long	0x3178
	.uleb128 0x39
	.secrel32	LASF32
	.byte	0x1
	.word	0x41c
	.long	0x165
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2e9e
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.ascii "read_cr0\0"
	.byte	0x2
	.word	0x11b
	.byte	0x1
	.long	0x281
	.byte	0x3
	.long	0x31a9
	.uleb128 0x2d
	.ascii "val\0"
	.byte	0x2
	.word	0x11c
	.long	0x281
	.byte	0x0
	.uleb128 0x2c
	.ascii "read_cr4\0"
	.byte	0x2
	.word	0x114
	.byte	0x1
	.long	0x281
	.byte	0x3
	.long	0x31cd
	.uleb128 0x2d
	.ascii "val\0"
	.byte	0x2
	.word	0x115
	.long	0x281
	.byte	0x0
	.uleb128 0x2c
	.ascii "read_cr3\0"
	.byte	0x2
	.word	0x133
	.byte	0x1
	.long	0x281
	.byte	0x3
	.long	0x31f1
	.uleb128 0x2d
	.ascii "val\0"
	.byte	0x2
	.word	0x134
	.long	0x281
	.byte	0x0
	.uleb128 0x2c
	.ascii "read_cs\0"
	.byte	0x2
	.word	0x14a
	.byte	0x1
	.long	0xd3
	.byte	0x3
	.long	0x3212
	.uleb128 0x2d
	.ascii "r\0"
	.byte	0x2
	.word	0x14b
	.long	0xd3
	.byte	0x0
	.uleb128 0x2c
	.ascii "read_ds\0"
	.byte	0x2
	.word	0x158
	.byte	0x1
	.long	0xd3
	.byte	0x3
	.long	0x3233
	.uleb128 0x2d
	.ascii "r\0"
	.byte	0x2
	.word	0x159
	.long	0xd3
	.byte	0x0
	.uleb128 0x2c
	.ascii "read_es\0"
	.byte	0x2
	.word	0x143
	.byte	0x1
	.long	0xd3
	.byte	0x3
	.long	0x3254
	.uleb128 0x2d
	.ascii "r\0"
	.byte	0x2
	.word	0x144
	.long	0xd3
	.byte	0x0
	.uleb128 0x2c
	.ascii "read_fs\0"
	.byte	0x4
	.word	0x246
	.byte	0x1
	.long	0x14f
	.byte	0x3
	.long	0x3277
	.uleb128 0x2d
	.ascii "seg\0"
	.byte	0x4
	.word	0x247
	.long	0x14f
	.byte	0x0
	.uleb128 0x2c
	.ascii "read_gs\0"
	.byte	0x4
	.word	0x24d
	.byte	0x1
	.long	0x14f
	.byte	0x3
	.long	0x329a
	.uleb128 0x2d
	.ascii "seg\0"
	.byte	0x4
	.word	0x24e
	.long	0x14f
	.byte	0x0
	.uleb128 0x2c
	.ascii "read_ss\0"
	.byte	0x2
	.word	0x151
	.byte	0x1
	.long	0xd3
	.byte	0x3
	.long	0x32bb
	.uleb128 0x2d
	.ascii "r\0"
	.byte	0x2
	.word	0x152
	.long	0xd3
	.byte	0x0
	.uleb128 0x2c
	.ascii "read_fs_base\0"
	.byte	0x2
	.word	0x16d
	.byte	0x1
	.long	0x281
	.byte	0x3
	.long	0x3317
	.uleb128 0x2d
	.ascii "fs_s\0"
	.byte	0x2
	.word	0x16e
	.long	0xd3
	.uleb128 0x39
	.secrel32	LASF33
	.byte	0x2
	.word	0x16f
	.long	0x281
	.uleb128 0x39
	.secrel32	LASF34
	.byte	0x2
	.word	0x170
	.long	0x290f
	.uleb128 0x2d
	.ascii "desc\0"
	.byte	0x2
	.word	0x171
	.long	0x3317
	.uleb128 0x32
	.long	0x3315
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2cd5
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2953
	.uleb128 0x2c
	.ascii "read_gs_base\0"
	.byte	0x2
	.word	0x180
	.byte	0x1
	.long	0x281
	.byte	0x3
	.long	0x3379
	.uleb128 0x2d
	.ascii "gs_s\0"
	.byte	0x2
	.word	0x181
	.long	0xd3
	.uleb128 0x39
	.secrel32	LASF33
	.byte	0x2
	.word	0x182
	.long	0x281
	.uleb128 0x39
	.secrel32	LASF34
	.byte	0x2
	.word	0x183
	.long	0x290f
	.uleb128 0x2d
	.ascii "desc\0"
	.byte	0x2
	.word	0x184
	.long	0x3317
	.uleb128 0x32
	.long	0x3377
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d1c
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
	.byte	0x0
	.uleb128 0x2c
	.ascii "store_tr\0"
	.byte	0x2
	.word	0x108
	.byte	0x1
	.long	0x281
	.byte	0x3
	.long	0x339c
	.uleb128 0x2d
	.ascii "tr\0"
	.byte	0x2
	.word	0x109
	.long	0x281
	.byte	0x0
	.uleb128 0x35
	.ascii "get_idt\0"
	.byte	0x4
	.word	0x26c
	.byte	0x1
	.byte	0x3
	.long	0x33bd
	.uleb128 0x36
	.ascii "table\0"
	.byte	0x4
	.word	0x26b
	.long	0x27de
	.byte	0x0
	.uleb128 0x2e
	.ascii "wrmsr_safe\0"
	.byte	0x2
	.byte	0xba
	.byte	0x1
	.long	0xe9
	.byte	0x3
	.long	0x33ff
	.uleb128 0x2a
	.ascii "__msr\0"
	.byte	0x2
	.byte	0xb9
	.long	0x15a
	.uleb128 0x2a
	.ascii "__low\0"
	.byte	0x2
	.byte	0xb9
	.long	0x15a
	.uleb128 0x2a
	.ascii "__high\0"
	.byte	0x2
	.byte	0xb9
	.long	0x15a
	.uleb128 0x2b
	.byte	0x0
	.uleb128 0x2e
	.ascii "virt_to_phys\0"
	.byte	0x3
	.byte	0xf1
	.byte	0x1
	.long	0x281
	.byte	0x3
	.long	0x3425
	.uleb128 0x2f
	.secrel32	LASF2
	.byte	0x3
	.byte	0xf0
	.long	0x296
	.byte	0x0
	.uleb128 0x2e
	.ascii "find_msr_entry\0"
	.byte	0x1
	.byte	0x6e
	.byte	0x1
	.long	0x20e2
	.byte	0x0
	.long	0x3461
	.uleb128 0x2f
	.secrel32	LASF29
	.byte	0x1
	.byte	0x6d
	.long	0x18bb
	.uleb128 0x2a
	.ascii "msr\0"
	.byte	0x1
	.byte	0x6d
	.long	0x15a
	.uleb128 0x31
	.ascii "i\0"
	.byte	0x1
	.byte	0x6f
	.long	0xe9
	.byte	0x0
	.uleb128 0x2c
	.ascii "guest_read_tsc\0"
	.byte	0x1
	.word	0x145
	.byte	0x1
	.long	0x165
	.byte	0x0
	.long	0x34c8
	.uleb128 0x39
	.secrel32	LASF31
	.byte	0x1
	.word	0x146
	.long	0x165
	.uleb128 0x2d
	.ascii "tsc_offset\0"
	.byte	0x1
	.word	0x146
	.long	0x165
	.uleb128 0x32
	.long	0x34aa
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d73
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.uleb128 0x3d
	.long	0x2d98
	.uleb128 0x32
	.long	0x34bd
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.ascii "read_tr_base\0"
	.byte	0x4
	.word	0x276
	.byte	0x1
	.long	0x281
	.byte	0x3
	.long	0x34ef
	.uleb128 0x2d
	.ascii "tr\0"
	.byte	0x4
	.word	0x277
	.long	0x14f
	.byte	0x0
	.uleb128 0x35
	.ascii "free_vmcs\0"
	.byte	0x1
	.word	0x274
	.byte	0x1
	.byte	0x0
	.long	0x3510
	.uleb128 0x38
	.secrel32	LASF14
	.byte	0x1
	.word	0x273
	.long	0x1ebb
	.byte	0x0
	.uleb128 0x35
	.ascii "vmx_free_vmcs\0"
	.byte	0x1
	.word	0x8a9
	.byte	0x1
	.byte	0x0
	.long	0x353c
	.uleb128 0x38
	.secrel32	LASF29
	.byte	0x1
	.word	0x8a8
	.long	0x18bb
	.uleb128 0x33
	.uleb128 0x3d
	.long	0x3503
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.ascii "alloc_vmcs\0"
	.byte	0x1
	.word	0x26b
	.byte	0x1
	.long	0x1ebb
	.byte	0x0
	.long	0x3562
	.uleb128 0x2d
	.ascii "ptr\0"
	.byte	0x1
	.word	0x26c
	.long	0x1ebb
	.byte	0x0
	.uleb128 0x35
	.ascii "setup_vmcs_descriptor\0"
	.byte	0x1
	.word	0x246
	.byte	0x1
	.byte	0x0
	.long	0x35d7
	.uleb128 0x2d
	.ascii "vmx_msr_low\0"
	.byte	0x1
	.word	0x247
	.long	0x15a
	.uleb128 0x2d
	.ascii "vmx_msr_high\0"
	.byte	0x1
	.word	0x247
	.long	0x15a
	.uleb128 0x32
	.long	0x35c6
	.uleb128 0x39
	.secrel32	LASF32
	.byte	0x1
	.word	0x24b
	.long	0x165
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2e9e
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3e
	.secrel32	LASF35
	.long	0x7fb6
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.2807
	.byte	0x0
	.uleb128 0x35
	.ascii "write_cr4\0"
	.byte	0x2
	.word	0x10f
	.byte	0x1
	.byte	0x3
	.long	0x35f8
	.uleb128 0x36
	.ascii "val\0"
	.byte	0x2
	.word	0x10e
	.long	0x281
	.byte	0x0
	.uleb128 0x2c
	.ascii "get_io_count\0"
	.byte	0x1
	.word	0x602
	.byte	0x1
	.long	0xe9
	.byte	0x0
	.long	0x36ba
	.uleb128 0x38
	.secrel32	LASF29
	.byte	0x1
	.word	0x601
	.long	0x18bb
	.uleb128 0x36
	.ascii "count\0"
	.byte	0x1
	.word	0x601
	.long	0x160b
	.uleb128 0x2d
	.ascii "inst\0"
	.byte	0x1
	.word	0x603
	.long	0x165
	.uleb128 0x2d
	.ascii "rip\0"
	.byte	0x1
	.word	0x604
	.long	0x15d7
	.uleb128 0x2d
	.ascii "countr_size\0"
	.byte	0x1
	.word	0x605
	.long	0xe9
	.uleb128 0x2d
	.ascii "i\0"
	.byte	0x1
	.word	0x606
	.long	0xe9
	.uleb128 0x2d
	.ascii "n\0"
	.byte	0x1
	.word	0x606
	.long	0xe9
	.uleb128 0x3f
	.ascii "done\0"
	.byte	0x1
	.word	0x62b
	.uleb128 0x32
	.long	0x3696
	.uleb128 0x2d
	.ascii "cs_ar\0"
	.byte	0x1
	.word	0x60b
	.long	0x15a
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x36a3
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x36b0
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.ascii "__ffs\0"
	.byte	0x2
	.byte	0x7d
	.byte	0x1
	.long	0x281
	.byte	0x3
	.long	0x36da
	.uleb128 0x2a
	.ascii "word\0"
	.byte	0x2
	.byte	0x7c
	.long	0x281
	.byte	0x0
	.uleb128 0x29
	.ascii "clear_bit\0"
	.byte	0x2
	.byte	0x8f
	.byte	0x1
	.byte	0x3
	.long	0x3704
	.uleb128 0x2a
	.ascii "nr\0"
	.byte	0x2
	.byte	0x8e
	.long	0xe9
	.uleb128 0x2a
	.ascii "addr\0"
	.byte	0x2
	.byte	0x8e
	.long	0x3704
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x370a
	.uleb128 0x40
	.long	0x281
	.uleb128 0x35
	.ascii "kvm_do_inject_irq\0"
	.byte	0x1
	.word	0x53b
	.byte	0x1
	.byte	0x0
	.long	0x3797
	.uleb128 0x38
	.secrel32	LASF29
	.byte	0x1
	.word	0x53a
	.long	0x18bb
	.uleb128 0x2d
	.ascii "word_index\0"
	.byte	0x1
	.word	0x53c
	.long	0xe9
	.uleb128 0x2d
	.ascii "bit_index\0"
	.byte	0x1
	.word	0x53d
	.long	0xe9
	.uleb128 0x2d
	.ascii "irq\0"
	.byte	0x1
	.word	0x53e
	.long	0xe9
	.uleb128 0x2b
	.uleb128 0x2b
	.uleb128 0x32
	.long	0x377a
	.uleb128 0x3d
	.long	0x36f7
	.uleb128 0x3d
	.long	0x36ed
	.byte	0x0
	.uleb128 0x32
	.long	0x378a
	.uleb128 0x3d
	.long	0x36f7
	.uleb128 0x3d
	.long	0x36ed
	.byte	0x0
	.uleb128 0x33
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.ascii "read_ldt\0"
	.byte	0x4
	.word	0x254
	.byte	0x1
	.long	0x14f
	.byte	0x3
	.long	0x37bb
	.uleb128 0x2d
	.ascii "ldt\0"
	.byte	0x4
	.word	0x255
	.long	0x14f
	.byte	0x0
	.uleb128 0x35
	.ascii "do_interrupt_requests\0"
	.byte	0x1
	.word	0x554
	.byte	0x1
	.byte	0x0
	.long	0x38a6
	.uleb128 0x38
	.secrel32	LASF29
	.byte	0x1
	.word	0x552
	.long	0x18bb
	.uleb128 0x38
	.secrel32	LASF6
	.byte	0x1
	.word	0x553
	.long	0x289b
	.uleb128 0x2d
	.ascii "cpu_based_vm_exec_control\0"
	.byte	0x1
	.word	0x555
	.long	0x15a
	.uleb128 0x32
	.long	0x3822
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x3831
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x3840
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x388a
	.uleb128 0x3d
	.long	0x372b
	.uleb128 0x33
	.uleb128 0x34
	.long	0x3737
	.uleb128 0x34
	.long	0x374a
	.uleb128 0x34
	.long	0x375c
	.uleb128 0x2b
	.uleb128 0x2b
	.uleb128 0x32
	.long	0x386c
	.uleb128 0x3d
	.long	0x36f7
	.uleb128 0x3d
	.long	0x36ed
	.byte	0x0
	.uleb128 0x32
	.long	0x387c
	.uleb128 0x3d
	.long	0x36f7
	.uleb128 0x3d
	.long	0x36ed
	.byte	0x0
	.uleb128 0x33
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x3899
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
	.ascii "kvm_guest_debug_pre\0"
	.byte	0x1
	.word	0x574
	.byte	0x1
	.byte	0x0
	.long	0x38fc
	.uleb128 0x38
	.secrel32	LASF29
	.byte	0x1
	.word	0x573
	.long	0x18bb
	.uleb128 0x2d
	.ascii "dbg\0"
	.byte	0x1
	.word	0x575
	.long	0x38fc
	.uleb128 0x32
	.long	0x38f7
	.uleb128 0x39
	.secrel32	LASF17
	.byte	0x1
	.word	0x57d
	.long	0x281
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
	.uleb128 0x2b
	.uleb128 0x2b
	.uleb128 0x2b
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1d2f
	.uleb128 0x35
	.ascii "fx_save\0"
	.byte	0x4
	.word	0x287
	.byte	0x1
	.byte	0x3
	.long	0x3923
	.uleb128 0x36
	.ascii "image\0"
	.byte	0x4
	.word	0x286
	.long	0x296
	.byte	0x0
	.uleb128 0x35
	.ascii "fx_restore\0"
	.byte	0x4
	.word	0x28c
	.byte	0x1
	.byte	0x3
	.long	0x3947
	.uleb128 0x36
	.ascii "image\0"
	.byte	0x4
	.word	0x28b
	.long	0x296
	.byte	0x0
	.uleb128 0x35
	.ascii "load_ldt\0"
	.byte	0x4
	.word	0x266
	.byte	0x1
	.byte	0x3
	.long	0x3967
	.uleb128 0x36
	.ascii "sel\0"
	.byte	0x4
	.word	0x265
	.long	0x14f
	.byte	0x0
	.uleb128 0x35
	.ascii "load_fs\0"
	.byte	0x4
	.word	0x25b
	.byte	0x1
	.byte	0x3
	.long	0x3986
	.uleb128 0x36
	.ascii "sel\0"
	.byte	0x4
	.word	0x25a
	.long	0x14f
	.byte	0x0
	.uleb128 0x35
	.ascii "load_gs\0"
	.byte	0x4
	.word	0x260
	.byte	0x1
	.byte	0x3
	.long	0x39a5
	.uleb128 0x36
	.ascii "sel\0"
	.byte	0x4
	.word	0x25f
	.long	0x14f
	.byte	0x0
	.uleb128 0x35
	.ascii "reload_tss\0"
	.byte	0x1
	.word	0x15a
	.byte	0x1
	.byte	0x0
	.long	0x39d7
	.uleb128 0x2d
	.ascii "gdt\0"
	.byte	0x1
	.word	0x160
	.long	0x22df
	.uleb128 0x2d
	.ascii "descs\0"
	.byte	0x1
	.word	0x161
	.long	0x39d7
	.uleb128 0x2b
	.uleb128 0x2b
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2a3f
	.uleb128 0x2c
	.ascii "kvm_handle_exit\0"
	.byte	0x1
	.word	0x72b
	.byte	0x1
	.long	0xe9
	.byte	0x0
	.long	0x3a7e
	.uleb128 0x38
	.secrel32	LASF6
	.byte	0x1
	.word	0x72a
	.long	0x289b
	.uleb128 0x38
	.secrel32	LASF29
	.byte	0x1
	.word	0x72a
	.long	0x18bb
	.uleb128 0x2d
	.ascii "vectoring_info\0"
	.byte	0x1
	.word	0x72c
	.long	0x15a
	.uleb128 0x39
	.secrel32	LASF7
	.byte	0x1
	.word	0x72d
	.long	0x15a
	.uleb128 0x2d
	.ascii "r\0"
	.byte	0x1
	.word	0x72e
	.long	0xe9
	.uleb128 0x32
	.long	0x3a4f
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x3a5e
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x3a6d
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3e
	.secrel32	LASF35
	.long	0x7f58
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.3724
	.byte	0x0
	.uleb128 0x35
	.ascii "post_kvm_run_save\0"
	.byte	0x1
	.word	0x6e3
	.byte	0x1
	.byte	0x0
	.long	0x3abc
	.uleb128 0x38
	.secrel32	LASF29
	.byte	0x1
	.word	0x6e1
	.long	0x18bb
	.uleb128 0x38
	.secrel32	LASF6
	.byte	0x1
	.word	0x6e2
	.long	0x289b
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.ascii "dm_request_for_irq_injection\0"
	.byte	0x1
	.word	0x74c
	.byte	0x1
	.long	0xe9
	.byte	0x0
	.long	0x3b09
	.uleb128 0x38
	.secrel32	LASF29
	.byte	0x1
	.word	0x74a
	.long	0x18bb
	.uleb128 0x38
	.secrel32	LASF6
	.byte	0x1
	.word	0x74b
	.long	0x289b
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
	.ascii "dump_context\0"
	.byte	0x4
	.word	0x1fc
	.byte	0x1
	.byte	0x3
	.long	0x3b31
	.uleb128 0x36
	.ascii "context\0"
	.byte	0x4
	.word	0x1fb
	.long	0x3b31
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x17fc
	.uleb128 0x2e
	.ascii "is_external_interrupt\0"
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.long	0xe9
	.byte	0x3
	.long	0x3b66
	.uleb128 0x2f
	.secrel32	LASF30
	.byte	0x1
	.byte	0x65
	.long	0x15a
	.byte	0x0
	.uleb128 0x35
	.ascii "set_bit\0"
	.byte	0x3
	.word	0x122
	.byte	0x1
	.byte	0x3
	.long	0x3b91
	.uleb128 0x36
	.ascii "nr\0"
	.byte	0x3
	.word	0x121
	.long	0xe9
	.uleb128 0x36
	.ascii "addr\0"
	.byte	0x3
	.word	0x121
	.long	0x3704
	.byte	0x0
	.uleb128 0x2c
	.ascii "kvm_mmu_page_fault\0"
	.byte	0x4
	.word	0x20e
	.byte	0x1
	.long	0xe9
	.byte	0x3
	.long	0x3bd8
	.uleb128 0x38
	.secrel32	LASF29
	.byte	0x4
	.word	0x20c
	.long	0x18bb
	.uleb128 0x36
	.ascii "gva\0"
	.byte	0x4
	.word	0x20c
	.long	0x15d7
	.uleb128 0x38
	.secrel32	LASF1
	.byte	0x4
	.word	0x20d
	.long	0x15a
	.uleb128 0x2b
	.byte	0x0
	.uleb128 0x2c
	.ascii "handle_rmode_exception\0"
	.byte	0x1
	.word	0x587
	.byte	0x1
	.long	0xe9
	.byte	0x0
	.long	0x3c22
	.uleb128 0x38
	.secrel32	LASF29
	.byte	0x1
	.word	0x585
	.long	0x18bb
	.uleb128 0x36
	.ascii "vec\0"
	.byte	0x1
	.word	0x586
	.long	0xe9
	.uleb128 0x38
	.secrel32	LASF36
	.byte	0x1
	.word	0x586
	.long	0x15a
	.byte	0x0
	.uleb128 0x41
	.ascii "vmx_get_rflags\0"
	.byte	0x1
	.word	0x117
	.byte	0x1
	.long	0x281
	.long	LFB128
	.long	LFE128
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x3c7d
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x116
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x43
	.long	0x2d27
	.long	LBB827
	.long	LBE827
	.byte	0x1
	.word	0x118
	.uleb128 0x44
	.long	LBB828
	.long	LBE828
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST1
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x46
	.long	0x2ed7
	.long	LFB137
	.long	LFE137
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x3ce4
	.uleb128 0x47
	.long	0x2ef3
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB829
	.long	LBE829
	.byte	0x1
	.word	0x1d0
	.long	0x3cc1
	.uleb128 0x44
	.long	LBB830
	.long	LBE830
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST3
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2d27
	.long	LBB831
	.long	LBE831
	.byte	0x1
	.word	0x1d1
	.uleb128 0x44
	.long	LBB832
	.long	LBE832
	.uleb128 0x49
	.long	0x2d4a
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x4a
	.secrel32	LASF22
	.byte	0x1
	.word	0x23f
	.byte	0x1
	.long	LFB143
	.long	LFE143
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x3d10
	.uleb128 0x4b
	.ascii "garbage\0"
	.byte	0x1
	.word	0x23e
	.long	0x296
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0x0
	.uleb128 0x4c
	.ascii "vmx_decache_cr0_cr4_guest_bits\0"
	.byte	0x1
	.word	0x347
	.byte	0x1
	.long	LFB158
	.long	LFE158
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x3d9d
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x346
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB833
	.long	LBE833
	.byte	0x1
	.word	0x349
	.long	0x3d7a
	.uleb128 0x44
	.long	LBB834
	.long	LBE834
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST6
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2d27
	.long	LBB835
	.long	LBE835
	.byte	0x1
	.word	0x34c
	.uleb128 0x44
	.long	LBB836
	.long	LBE836
	.uleb128 0x49
	.long	0x2d4a
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x41
	.ascii "vmx_get_segment_base\0"
	.byte	0x1
	.word	0x39c
	.byte	0x1
	.long	0x165
	.long	LFB163
	.long	LFE163
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x3e19
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x39b
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4d
	.ascii "seg\0"
	.byte	0x1
	.word	0x39b
	.long	0xe9
	.secrel32	LLST8
	.uleb128 0x2d
	.ascii "sf\0"
	.byte	0x1
	.word	0x39d
	.long	0x3e19
	.uleb128 0x43
	.long	0x2d27
	.long	LBB837
	.long	LBE837
	.byte	0x1
	.word	0x39f
	.uleb128 0x44
	.long	LBB838
	.long	LBE838
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST9
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x2ba0
	.uleb128 0x4e
	.ascii "vmx_get_segment\0"
	.byte	0x1
	.word	0x3a4
	.byte	0x1
	.long	LFB164
	.long	LFE164
	.secrel32	LLST10
	.long	0x3f5e
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x3a2
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4d
	.ascii "var\0"
	.byte	0x1
	.word	0x3a3
	.long	0x2777
	.secrel32	LLST11
	.uleb128 0x4b
	.ascii "seg\0"
	.byte	0x1
	.word	0x3a3
	.long	0xe9
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x4f
	.ascii "sf\0"
	.byte	0x1
	.word	0x3a5
	.long	0x3e19
	.secrel32	LLST12
	.uleb128 0x4f
	.ascii "ar\0"
	.byte	0x1
	.word	0x3a6
	.long	0x15a
	.secrel32	LLST13
	.uleb128 0x48
	.long	0x2d27
	.long	LBB839
	.long	LBE839
	.byte	0x1
	.word	0x3a8
	.long	0x3eb8
	.uleb128 0x44
	.long	LBB840
	.long	LBE840
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST14
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2ded
	.long	LBB841
	.long	LBE841
	.byte	0x1
	.word	0x3a9
	.long	0x3ef0
	.uleb128 0x50
	.long	0x2d27
	.long	LBB843
	.long	LBE843
	.byte	0x1
	.byte	0xa9
	.uleb128 0x44
	.long	LBB844
	.long	LBE844
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST15
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2e1b
	.long	LBB845
	.long	LBE845
	.byte	0x1
	.word	0x3aa
	.long	0x3f2d
	.uleb128 0x3d
	.long	0x2e34
	.uleb128 0x50
	.long	0x2d27
	.long	LBB847
	.long	LBE847
	.byte	0x1
	.byte	0xa4
	.uleb128 0x44
	.long	LBB848
	.long	LBE848
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST16
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2ded
	.long	LBB849
	.long	LBE849
	.byte	0x1
	.word	0x3ab
	.uleb128 0x50
	.long	0x2d27
	.long	LBB851
	.long	LBE851
	.byte	0x1
	.byte	0xa9
	.uleb128 0x44
	.long	LBB852
	.long	LBE852
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x4c
	.ascii "vmx_get_cs_db_l_bits\0"
	.byte	0x1
	.word	0x3d4
	.byte	0x1
	.long	LFB166
	.long	LFE166
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x3fe3
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x3d3
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4b
	.ascii "db\0"
	.byte	0x1
	.word	0x3d3
	.long	0x5a6
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x4b
	.ascii "l\0"
	.byte	0x1
	.word	0x3d3
	.long	0x5a6
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x51
	.ascii "ar\0"
	.byte	0x1
	.word	0x3d5
	.long	0x15a
	.byte	0x1
	.byte	0x51
	.uleb128 0x52
	.long	0x2ded
	.secrel32	Ldebug_ranges0+0x0
	.byte	0x1
	.word	0x3d5
	.uleb128 0x53
	.long	0x2d27
	.secrel32	Ldebug_ranges0+0x18
	.byte	0x1
	.byte	0xa9
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x30
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x4c
	.ascii "vmx_get_idt\0"
	.byte	0x1
	.word	0x3dc
	.byte	0x1
	.long	LFB167
	.long	LFE167
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x407b
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x3db
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4b
	.ascii "dt\0"
	.byte	0x1
	.word	0x3db
	.long	0x27de
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x48
	.long	0x2ded
	.long	LBB861
	.long	LBE861
	.byte	0x1
	.word	0x3dd
	.long	0x4058
	.uleb128 0x50
	.long	0x2d27
	.long	LBB863
	.long	LBE863
	.byte	0x1
	.byte	0xa9
	.uleb128 0x44
	.long	LBB864
	.long	LBE864
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST19
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2d27
	.long	LBB865
	.long	LBE865
	.byte	0x1
	.word	0x3de
	.uleb128 0x44
	.long	LBB866
	.long	LBE866
	.uleb128 0x49
	.long	0x2d4a
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x4c
	.ascii "vmx_get_gdt\0"
	.byte	0x1
	.word	0x3e8
	.byte	0x1
	.long	LFB169
	.long	LFE169
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x4113
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x3e7
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4b
	.ascii "dt\0"
	.byte	0x1
	.word	0x3e7
	.long	0x27de
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x48
	.long	0x2ded
	.long	LBB867
	.long	LBE867
	.byte	0x1
	.word	0x3e9
	.long	0x40f0
	.uleb128 0x50
	.long	0x2d27
	.long	LBB869
	.long	LBE869
	.byte	0x1
	.byte	0xa9
	.uleb128 0x44
	.long	LBB870
	.long	LBE870
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST21
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2d27
	.long	LBB871
	.long	LBE871
	.byte	0x1
	.word	0x3ea
	.uleb128 0x44
	.long	LBB872
	.long	LBE872
	.uleb128 0x49
	.long	0x2d4a
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x41
	.ascii "handle_external_interrupt\0"
	.byte	0x1
	.word	0x5f6
	.byte	0x1
	.long	0xe9
	.long	LFB181
	.long	LFE181
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x4164
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x5f4
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x42
	.secrel32	LASF6
	.byte	0x1
	.word	0x5f5
	.long	0x289b
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0x0
	.uleb128 0x41
	.ascii "handle_triple_fault\0"
	.byte	0x1
	.word	0x5fc
	.byte	0x1
	.long	0xe9
	.long	LFB182
	.long	LFE182
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x41af
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x5fb
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x42
	.secrel32	LASF6
	.byte	0x1
	.word	0x5fb
	.long	0x289b
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0x0
	.uleb128 0x4c
	.ascii "vmx_patch_hypercall\0"
	.byte	0x1
	.word	0x64c
	.byte	0x1
	.long	LFB185
	.long	LFE185
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x41fc
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x64b
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4b
	.ascii "hypercall\0"
	.byte	0x1
	.word	0x64b
	.long	0x28b8
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0x0
	.uleb128 0x41
	.ascii "handle_cpuid\0"
	.byte	0x1
	.word	0x6bc
	.byte	0x1
	.long	0xe9
	.long	LFB188
	.long	LFE188
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x4240
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x6bb
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x42
	.secrel32	LASF6
	.byte	0x1
	.word	0x6bb
	.long	0x289b
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0x0
	.uleb128 0x41
	.ascii "handle_interrupt_window\0"
	.byte	0x1
	.word	0x6ef
	.byte	0x1
	.long	0xe9
	.long	LFB192
	.long	LFE192
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x4290
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x6ed
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x55
	.secrel32	LASF6
	.byte	0x1
	.word	0x6ee
	.long	0x289b
	.secrel32	LLST27
	.byte	0x0
	.uleb128 0x56
	.byte	0x1
	.ascii "vmx_exit\0"
	.byte	0x1
	.word	0x930
	.byte	0x1
	.long	LFB204
	.long	LFE204
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.uleb128 0x57
	.byte	0x1
	.ascii "vmx_init\0"
	.byte	0x1
	.word	0x91f
	.byte	0x1
	.long	0xe9
	.long	LFB203
	.long	LFE203
	.secrel32	LLST29
	.long	0x42de
	.uleb128 0x3e
	.secrel32	LASF35
	.long	0x7fd5
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.3857
	.byte	0x0
	.uleb128 0x58
	.ascii "vmwrite_error\0"
	.byte	0x1
	.byte	0xb6
	.byte	0x1
	.long	LFB120
	.long	LFE120
	.secrel32	LLST30
	.long	0x4346
	.uleb128 0x59
	.secrel32	LASF28
	.byte	0x1
	.byte	0xb5
	.long	0x281
	.secrel32	LLST31
	.uleb128 0x59
	.secrel32	LASF3
	.byte	0x1
	.byte	0xb5
	.long	0x281
	.secrel32	LLST32
	.uleb128 0x53
	.long	0x2ded
	.secrel32	Ldebug_ranges0+0x48
	.byte	0x1
	.byte	0xb7
	.uleb128 0x53
	.long	0x2d27
	.secrel32	Ldebug_ranges0+0x60
	.byte	0x1
	.byte	0xa9
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x78
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST33
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x58
	.ascii "vmcs_writel\0"
	.byte	0x1
	.byte	0xbd
	.byte	0x1
	.long	LFB121
	.long	LFE121
	.secrel32	LLST34
	.long	0x4396
	.uleb128 0x59
	.secrel32	LASF28
	.byte	0x1
	.byte	0xbc
	.long	0x281
	.secrel32	LLST35
	.uleb128 0x59
	.secrel32	LASF3
	.byte	0x1
	.byte	0xbc
	.long	0x281
	.secrel32	LLST36
	.uleb128 0x5a
	.ascii "error\0"
	.byte	0x1
	.byte	0xbe
	.long	0x145
	.secrel32	LLST37
	.byte	0x0
	.uleb128 0x4a
	.secrel32	LASF26
	.byte	0x1
	.word	0x121
	.byte	0x1
	.long	LFB130
	.long	LFE130
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x4496
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x120
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4f
	.ascii "rip\0"
	.byte	0x1
	.word	0x122
	.long	0x281
	.secrel32	LLST39
	.uleb128 0x4f
	.ascii "interruptibility\0"
	.byte	0x1
	.word	0x123
	.long	0x15a
	.secrel32	LLST40
	.uleb128 0x48
	.long	0x2d27
	.long	LBB881
	.long	LBE881
	.byte	0x1
	.word	0x125
	.long	0x440e
	.uleb128 0x44
	.long	LBB882
	.long	LBE882
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2ded
	.long	LBB883
	.long	LBE883
	.byte	0x1
	.word	0x126
	.long	0x4446
	.uleb128 0x50
	.long	0x2d27
	.long	LBB885
	.long	LBE885
	.byte	0x1
	.byte	0xa9
	.uleb128 0x44
	.long	LBB886
	.long	LBE886
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST41
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2ded
	.long	LBB887
	.long	LBE887
	.byte	0x1
	.word	0x12d
	.long	0x447a
	.uleb128 0x50
	.long	0x2d27
	.long	LBB889
	.long	LBE889
	.byte	0x1
	.byte	0xa9
	.uleb128 0x44
	.long	LBB890
	.long	LBE890
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2e49
	.long	LBB891
	.long	LBE891
	.byte	0x1
	.word	0x12f
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.uleb128 0x5b
	.ascii "handle_halt\0"
	.byte	0x1
	.word	0x6fe
	.byte	0x1
	.long	0xe9
	.long	LFB193
	.long	LFE193
	.secrel32	LLST42
	.long	0x44db
	.uleb128 0x55
	.secrel32	LASF29
	.byte	0x1
	.word	0x6fd
	.long	0x18bb
	.secrel32	LLST43
	.uleb128 0x42
	.secrel32	LASF6
	.byte	0x1
	.word	0x6fd
	.long	0x289b
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0x0
	.uleb128 0x4c
	.ascii "update_exception_bitmap\0"
	.byte	0x1
	.word	0x2b3
	.byte	0x1
	.long	LFB152
	.long	LFE152
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x4552
	.uleb128 0x55
	.secrel32	LASF29
	.byte	0x1
	.word	0x2b2
	.long	0x18bb
	.secrel32	LLST45
	.uleb128 0x48
	.long	0x2e49
	.long	LBB893
	.long	LBE893
	.byte	0x1
	.word	0x2b7
	.long	0x4536
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x43
	.long	0x2e49
	.long	LBB895
	.long	LBE895
	.byte	0x1
	.word	0x2b5
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.uleb128 0x58
	.ascii "vmcs_write64\0"
	.byte	0x1
	.byte	0xd1
	.byte	0x1
	.long	LFB124
	.long	LFE124
	.secrel32	LLST46
	.long	0x4592
	.uleb128 0x59
	.secrel32	LASF28
	.byte	0x1
	.byte	0xd0
	.long	0x281
	.secrel32	LLST47
	.uleb128 0x59
	.secrel32	LASF3
	.byte	0x1
	.byte	0xd0
	.long	0x165
	.secrel32	LLST48
	.byte	0x0
	.uleb128 0x4e
	.ascii "seg_setup\0"
	.byte	0x1
	.word	0x424
	.byte	0x1
	.long	LFB173
	.long	LFE173
	.secrel32	LLST49
	.long	0x4622
	.uleb128 0x4d
	.ascii "seg\0"
	.byte	0x1
	.word	0x423
	.long	0xe9
	.secrel32	LLST50
	.uleb128 0x4f
	.ascii "sf\0"
	.byte	0x1
	.word	0x425
	.long	0x3e19
	.secrel32	LLST51
	.uleb128 0x5c
	.long	0x2eaa
	.secrel32	Ldebug_ranges0+0x90
	.byte	0x1
	.word	0x427
	.long	0x45eb
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB901
	.long	LBE901
	.byte	0x1
	.word	0x429
	.long	0x460a
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x52
	.long	0x2e49
	.secrel32	Ldebug_ranges0+0xa8
	.byte	0x1
	.word	0x42a
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.uleb128 0x4e
	.ascii "fix_rmode_seg\0"
	.byte	0x1
	.word	0x2f2
	.byte	0x1
	.long	LFB156
	.long	LFE156
	.secrel32	LLST52
	.long	0x47ba
	.uleb128 0x4d
	.ascii "seg\0"
	.byte	0x1
	.word	0x2f1
	.long	0xe9
	.secrel32	LLST53
	.uleb128 0x4d
	.ascii "save\0"
	.byte	0x1
	.word	0x2f1
	.long	0x47ba
	.secrel32	LLST54
	.uleb128 0x4f
	.ascii "sf\0"
	.byte	0x1
	.word	0x2f3
	.long	0x3e19
	.secrel32	LLST55
	.uleb128 0x5c
	.long	0x2e1b
	.secrel32	Ldebug_ranges0+0xc0
	.byte	0x1
	.word	0x2f5
	.long	0x46a4
	.uleb128 0x3d
	.long	0x2e34
	.uleb128 0x53
	.long	0x2d27
	.secrel32	Ldebug_ranges0+0xd8
	.byte	0x1
	.byte	0xa4
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0xf0
	.uleb128 0x49
	.long	0x2d4a
	.byte	0x1
	.byte	0x51
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB915
	.long	LBE915
	.byte	0x1
	.word	0x2f6
	.long	0x46cc
	.uleb128 0x44
	.long	LBB916
	.long	LBE916
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST56
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2ded
	.long	LBB917
	.long	LBE917
	.byte	0x1
	.word	0x2f7
	.long	0x4704
	.uleb128 0x50
	.long	0x2d27
	.long	LBB919
	.long	LBE919
	.byte	0x1
	.byte	0xa9
	.uleb128 0x44
	.long	LBB920
	.long	LBE920
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST57
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2ded
	.long	LBB921
	.long	LBE921
	.byte	0x1
	.word	0x2f8
	.long	0x473c
	.uleb128 0x50
	.long	0x2d27
	.long	LBB923
	.long	LBE923
	.byte	0x1
	.byte	0xa9
	.uleb128 0x44
	.long	LBB924
	.long	LBE924
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST58
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB925
	.long	LBE925
	.byte	0x1
	.word	0x2f9
	.long	0x4764
	.uleb128 0x44
	.long	LBB926
	.long	LBE926
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST59
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2eaa
	.long	LBB927
	.long	LBE927
	.byte	0x1
	.word	0x2f9
	.long	0x4783
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB929
	.long	LBE929
	.byte	0x1
	.word	0x2fa
	.long	0x47a2
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x52
	.long	0x2e49
	.secrel32	Ldebug_ranges0+0x108
	.byte	0x1
	.word	0x2fb
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.long	0x1ed2
	.uleb128 0x4c
	.ascii "vmx_flush_tlb\0"
	.byte	0x1
	.word	0x886
	.byte	0x1
	.long	LFB198
	.long	LFE198
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x4816
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x885
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x43
	.long	0x2d27
	.long	LBB935
	.long	LBE935
	.byte	0x1
	.word	0x887
	.uleb128 0x44
	.long	LBB936
	.long	LBE936
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST61
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x4c
	.ascii "vmx_set_rflags\0"
	.byte	0x1
	.word	0x11c
	.byte	0x1
	.long	LFB129
	.long	LFE129
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x485b
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x11b
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4b
	.ascii "rflags\0"
	.byte	0x1
	.word	0x11b
	.long	0x281
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0x0
	.uleb128 0x4e
	.ascii "vcpu_put_rsp_rip\0"
	.byte	0x1
	.word	0x1d9
	.byte	0x1
	.long	LFB138
	.long	LFE138
	.secrel32	LLST63
	.long	0x4891
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x1d8
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0x0
	.uleb128 0x5b
	.ascii "handle_dr\0"
	.byte	0x1
	.word	0x699
	.byte	0x1
	.long	0xe9
	.long	LFB187
	.long	LFE187
	.secrel32	LLST64
	.long	0x49c1
	.uleb128 0x55
	.secrel32	LASF29
	.byte	0x1
	.word	0x698
	.long	0x18bb
	.secrel32	LLST65
	.uleb128 0x42
	.secrel32	LASF6
	.byte	0x1
	.word	0x698
	.long	0x289b
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x5d
	.secrel32	LASF37
	.byte	0x1
	.word	0x69a
	.long	0x165
	.secrel32	LLST66
	.uleb128 0x4f
	.ascii "val\0"
	.byte	0x1
	.word	0x69b
	.long	0x281
	.secrel32	LLST67
	.uleb128 0x2d
	.ascii "dr\0"
	.byte	0x1
	.word	0x69c
	.long	0xe9
	.uleb128 0x2d
	.ascii "reg\0"
	.byte	0x1
	.word	0x69c
	.long	0xe9
	.uleb128 0x5c
	.long	0x2d7f
	.secrel32	Ldebug_ranges0+0x120
	.byte	0x1
	.word	0x6a2
	.long	0x4962
	.uleb128 0x3d
	.long	0x2d98
	.uleb128 0x5e
	.long	0x2d27
	.secrel32	Ldebug_ranges0+0x138
	.byte	0x1
	.byte	0xb1
	.long	0x493e
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x150
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST68
	.byte	0x0
	.byte	0x0
	.uleb128 0x50
	.long	0x2d27
	.long	LBB943
	.long	LBE943
	.byte	0x1
	.byte	0xb1
	.uleb128 0x44
	.long	LBB944
	.long	LBE944
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST69
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x52
	.long	0x2ed7
	.secrel32	Ldebug_ranges0+0x168
	.byte	0x1
	.word	0x6a5
	.uleb128 0x3d
	.long	0x3c91
	.uleb128 0x48
	.long	0x2d27
	.long	LBB949
	.long	LBE949
	.byte	0x1
	.word	0x1d1
	.long	0x499b
	.uleb128 0x44
	.long	LBB950
	.long	LBE950
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST70
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2d27
	.long	LBB951
	.long	LBE951
	.byte	0x1
	.word	0x1d0
	.uleb128 0x44
	.long	LBB952
	.long	LBE952
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST71
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x4e
	.ascii "vmx_set_gdt\0"
	.byte	0x1
	.word	0x3ee
	.byte	0x1
	.long	LFB170
	.long	LFE170
	.secrel32	LLST72
	.long	0x4a1b
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x3ed
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4b
	.ascii "dt\0"
	.byte	0x1
	.word	0x3ed
	.long	0x27de
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x43
	.long	0x2e49
	.long	LBB955
	.long	LBE955
	.byte	0x1
	.word	0x3ef
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.uleb128 0x4e
	.ascii "vmx_set_idt\0"
	.byte	0x1
	.word	0x3e2
	.byte	0x1
	.long	LFB168
	.long	LFE168
	.secrel32	LLST73
	.long	0x4a75
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x3e1
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4b
	.ascii "dt\0"
	.byte	0x1
	.word	0x3e1
	.long	0x27de
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x43
	.long	0x2e49
	.long	LBB957
	.long	LBE957
	.byte	0x1
	.word	0x3e3
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.uleb128 0x4e
	.ascii "vmx_set_cr4\0"
	.byte	0x1
	.word	0x37c
	.byte	0x1
	.long	LFB162
	.long	LFE162
	.secrel32	LLST74
	.long	0x4ab5
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x37b
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4b
	.ascii "cr4\0"
	.byte	0x1
	.word	0x37b
	.long	0x281
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0x0
	.uleb128 0x4c
	.ascii "vmx_set_cr3\0"
	.byte	0x1
	.word	0x377
	.byte	0x1
	.long	LFB161
	.long	LFE161
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x4af4
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x376
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4b
	.ascii "cr3\0"
	.byte	0x1
	.word	0x376
	.long	0x281
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0x0
	.uleb128 0x4e
	.ascii "enter_rmode\0"
	.byte	0x1
	.word	0x2ff
	.byte	0x1
	.long	LFB157
	.long	LFE157
	.secrel32	LLST76
	.long	0x4d56
	.uleb128 0x55
	.secrel32	LASF29
	.byte	0x1
	.word	0x2fe
	.long	0x18bb
	.secrel32	LLST77
	.uleb128 0x5d
	.secrel32	LASF17
	.byte	0x1
	.word	0x300
	.long	0x281
	.secrel32	LLST78
	.uleb128 0x5c
	.long	0x2d27
	.secrel32	Ldebug_ranges0+0x180
	.byte	0x1
	.word	0x304
	.long	0x4b55
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x198
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST79
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2ded
	.long	LBB963
	.long	LBE963
	.byte	0x1
	.word	0x307
	.long	0x4b8d
	.uleb128 0x50
	.long	0x2d27
	.long	LBB965
	.long	LBE965
	.byte	0x1
	.byte	0xa9
	.uleb128 0x44
	.long	LBB966
	.long	LBE966
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST80
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB967
	.long	LBE967
	.byte	0x1
	.word	0x308
	.long	0x4bac
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2ded
	.long	LBB969
	.long	LBE969
	.byte	0x1
	.word	0x30a
	.long	0x4be4
	.uleb128 0x50
	.long	0x2d27
	.long	LBB971
	.long	LBE971
	.byte	0x1
	.byte	0xa9
	.uleb128 0x44
	.long	LBB972
	.long	LBE972
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST81
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB973
	.long	LBE973
	.byte	0x1
	.word	0x30b
	.long	0x4c03
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB975
	.long	LBE975
	.byte	0x1
	.word	0x30d
	.long	0x4c27
	.uleb128 0x44
	.long	LBB976
	.long	LBE976
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB977
	.long	LBE977
	.byte	0x1
	.word	0x313
	.long	0x4c4f
	.uleb128 0x44
	.long	LBB978
	.long	LBE978
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST82
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB979
	.long	LBE979
	.byte	0x1
	.word	0x316
	.long	0x4c77
	.uleb128 0x44
	.long	LBB980
	.long	LBE980
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST83
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2eaa
	.long	LBB981
	.long	LBE981
	.byte	0x1
	.word	0x316
	.long	0x4c96
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB983
	.long	LBE983
	.byte	0x1
	.word	0x317
	.long	0x4cb5
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB985
	.long	LBE985
	.byte	0x1
	.word	0x318
	.long	0x4cd4
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB987
	.long	LBE987
	.byte	0x1
	.word	0x31a
	.long	0x4cf3
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB989
	.long	LBE989
	.byte	0x1
	.word	0x31b
	.long	0x4d12
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB991
	.long	LBE991
	.byte	0x1
	.word	0x31c
	.long	0x4d3a
	.uleb128 0x44
	.long	LBB992
	.long	LBE992
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST84
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2eaa
	.long	LBB993
	.long	LBE993
	.byte	0x1
	.word	0x31c
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.byte	0x0
	.uleb128 0x4e
	.ascii "vmx_set_cr0_no_modeswitch\0"
	.byte	0x1
	.word	0x36a
	.byte	0x1
	.long	LFB160
	.long	LFE160
	.secrel32	LLST85
	.long	0x4da6
	.uleb128 0x55
	.secrel32	LASF29
	.byte	0x1
	.word	0x369
	.long	0x18bb
	.secrel32	LLST86
	.uleb128 0x4d
	.ascii "cr0\0"
	.byte	0x1
	.word	0x369
	.long	0x281
	.secrel32	LLST87
	.byte	0x0
	.uleb128 0x4e
	.ascii "fix_pmode_dataseg\0"
	.byte	0x1
	.word	0x2bb
	.byte	0x1
	.long	LFB153
	.long	LFE153
	.secrel32	LLST88
	.long	0x4ee5
	.uleb128 0x4d
	.ascii "seg\0"
	.byte	0x1
	.word	0x2ba
	.long	0xe9
	.secrel32	LLST89
	.uleb128 0x4d
	.ascii "save\0"
	.byte	0x1
	.word	0x2ba
	.long	0x47ba
	.secrel32	LLST90
	.uleb128 0x4f
	.ascii "sf\0"
	.byte	0x1
	.word	0x2bc
	.long	0x3e19
	.secrel32	LLST91
	.uleb128 0x48
	.long	0x2d27
	.long	LBB995
	.long	LBE995
	.byte	0x1
	.word	0x2be
	.long	0x4e25
	.uleb128 0x44
	.long	LBB996
	.long	LBE996
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST92
	.byte	0x0
	.byte	0x0
	.uleb128 0x5f
	.secrel32	Ldebug_ranges0+0x1b0
	.long	0x4e8f
	.uleb128 0x2d
	.ascii "dpl\0"
	.byte	0x1
	.word	0x2c4
	.long	0x15a
	.uleb128 0x5c
	.long	0x2e49
	.secrel32	Ldebug_ranges0+0x1c8
	.byte	0x1
	.word	0x2c6
	.long	0x4e55
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x43
	.long	0x2e1b
	.long	LBB1001
	.long	LBE1001
	.byte	0x1
	.word	0x2c5
	.uleb128 0x3d
	.long	0x2e34
	.uleb128 0x50
	.long	0x2d27
	.long	LBB1003
	.long	LBE1003
	.byte	0x1
	.byte	0xa4
	.uleb128 0x44
	.long	LBB1004
	.long	LBE1004
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST93
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2eaa
	.long	LBB1007
	.long	LBE1007
	.byte	0x1
	.word	0x2bf
	.long	0x4eae
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1009
	.long	LBE1009
	.byte	0x1
	.word	0x2c1
	.long	0x4ecd
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x52
	.long	0x2e49
	.secrel32	Ldebug_ranges0+0x1e0
	.byte	0x1
	.word	0x2c2
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
	.ascii "enter_pmode\0"
	.byte	0x1
	.word	0x2cb
	.byte	0x1
	.byte	0x1
	.long	0x4fab
	.uleb128 0x38
	.secrel32	LASF29
	.byte	0x1
	.word	0x2ca
	.long	0x18bb
	.uleb128 0x39
	.secrel32	LASF17
	.byte	0x1
	.word	0x2cc
	.long	0x281
	.uleb128 0x32
	.long	0x4f23
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x32
	.long	0x4f33
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x32
	.long	0x4f40
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x4f4d
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x4f5a
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x4f6a
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x32
	.long	0x4f7a
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x32
	.long	0x4f8e
	.uleb128 0x3d
	.long	0x2e34
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x4f9e
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x33
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.uleb128 0x4e
	.ascii "vmx_set_cr0\0"
	.byte	0x1
	.word	0x350
	.byte	0x1
	.long	LFB159
	.long	LFE159
	.secrel32	LLST94
	.long	0x5191
	.uleb128 0x55
	.secrel32	LASF29
	.byte	0x1
	.word	0x34f
	.long	0x18bb
	.secrel32	LLST95
	.uleb128 0x4d
	.ascii "cr0\0"
	.byte	0x1
	.word	0x34f
	.long	0x281
	.secrel32	LLST96
	.uleb128 0x43
	.long	0x4ee5
	.long	LBB1039
	.long	LBE1039
	.byte	0x1
	.word	0x352
	.uleb128 0x3d
	.long	0x4efb
	.uleb128 0x44
	.long	LBB1040
	.long	LBE1040
	.uleb128 0x45
	.long	0x4f07
	.secrel32	LLST97
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1041
	.long	LBE1041
	.byte	0x1
	.word	0x2d1
	.long	0x5032
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1043
	.long	LBE1043
	.byte	0x1
	.word	0x2d2
	.long	0x5051
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB1045
	.long	LBE1045
	.byte	0x1
	.word	0x2d4
	.long	0x507a
	.uleb128 0x3d
	.long	0x2d3f
	.uleb128 0x44
	.long	LBB1046
	.long	LBE1046
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB1047
	.long	LBE1047
	.byte	0x1
	.word	0x2d9
	.long	0x50a7
	.uleb128 0x3d
	.long	0x2d3f
	.uleb128 0x44
	.long	LBB1048
	.long	LBE1048
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST98
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB1049
	.long	LBE1049
	.byte	0x1
	.word	0x2d9
	.long	0x50d4
	.uleb128 0x3d
	.long	0x2d3f
	.uleb128 0x44
	.long	LBB1050
	.long	LBE1050
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST99
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2eaa
	.long	LBB1051
	.long	LBE1051
	.byte	0x1
	.word	0x2e3
	.long	0x50f3
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1053
	.long	LBE1053
	.byte	0x1
	.word	0x2e4
	.long	0x5112
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e1b
	.long	LBB1055
	.long	LBE1055
	.byte	0x1
	.word	0x2e6
	.long	0x5154
	.uleb128 0x3d
	.long	0x2e34
	.uleb128 0x50
	.long	0x2d27
	.long	LBB1057
	.long	LBE1057
	.byte	0x1
	.byte	0xa4
	.uleb128 0x3d
	.long	0x2d3f
	.uleb128 0x44
	.long	LBB1058
	.long	LBE1058
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST100
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2eaa
	.long	LBB1059
	.long	LBE1059
	.byte	0x1
	.word	0x2e6
	.long	0x5173
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x43
	.long	0x2e49
	.long	LBB1061
	.long	LBE1061
	.byte	0x1
	.word	0x2e8
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x4e
	.ascii "vmx_set_segment\0"
	.byte	0x1
	.word	0x3bb
	.byte	0x1
	.long	LFB165
	.long	LFE165
	.secrel32	LLST101
	.long	0x5258
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x3b9
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4d
	.ascii "var\0"
	.byte	0x1
	.word	0x3ba
	.long	0x2777
	.secrel32	LLST102
	.uleb128 0x4b
	.ascii "seg\0"
	.byte	0x1
	.word	0x3ba
	.long	0xe9
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x4f
	.ascii "sf\0"
	.byte	0x1
	.word	0x3bc
	.long	0x3e19
	.secrel32	LLST103
	.uleb128 0x4f
	.ascii "ar\0"
	.byte	0x1
	.word	0x3bd
	.long	0x15a
	.secrel32	LLST104
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1063
	.long	LBE1063
	.byte	0x1
	.word	0x3c0
	.long	0x5221
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2eaa
	.long	LBB1065
	.long	LBE1065
	.byte	0x1
	.word	0x3c1
	.long	0x5240
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x52
	.long	0x2e49
	.secrel32	Ldebug_ranges0+0x1f8
	.byte	0x1
	.word	0x3d0
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.uleb128 0x60
	.secrel32	LASF25
	.byte	0x1
	.word	0x1df
	.byte	0x1
	.long	0xe9
	.long	LFB139
	.long	LFE139
	.secrel32	LLST105
	.long	0x5377
	.uleb128 0x55
	.secrel32	LASF29
	.byte	0x1
	.word	0x1de
	.long	0x18bb
	.secrel32	LLST106
	.uleb128 0x4d
	.ascii "dbg\0"
	.byte	0x1
	.word	0x1de
	.long	0x26fa
	.secrel32	LLST107
	.uleb128 0x4f
	.ascii "dr7\0"
	.byte	0x1
	.word	0x1e0
	.long	0x281
	.secrel32	LLST108
	.uleb128 0x4f
	.ascii "exception_bitmap\0"
	.byte	0x1
	.word	0x1e1
	.long	0x15a
	.secrel32	LLST109
	.uleb128 0x4f
	.ascii "old_singlestep\0"
	.byte	0x1
	.word	0x1e2
	.long	0xe9
	.secrel32	LLST110
	.uleb128 0x5c
	.long	0x2ded
	.secrel32	Ldebug_ranges0+0x210
	.byte	0x1
	.word	0x1e4
	.long	0x5305
	.uleb128 0x53
	.long	0x2d27
	.secrel32	Ldebug_ranges0+0x228
	.byte	0x1
	.byte	0xa9
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x240
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x61
	.long	LBB1079
	.long	LBE1079
	.long	0x531d
	.uleb128 0x2d
	.ascii "i\0"
	.byte	0x1
	.word	0x1e9
	.long	0xe9
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1080
	.long	LBE1080
	.byte	0x1
	.word	0x204
	.long	0x533c
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x44
	.long	LBB1082
	.long	LBE1082
	.uleb128 0x5d
	.secrel32	LASF17
	.byte	0x1
	.word	0x1fd
	.long	0x281
	.secrel32	LLST111
	.uleb128 0x43
	.long	0x2d27
	.long	LBB1083
	.long	LBE1083
	.byte	0x1
	.word	0x1ff
	.uleb128 0x44
	.long	LBB1084
	.long	LBE1084
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x4e
	.ascii "vmx_inject_gp\0"
	.byte	0x1
	.word	0x135
	.byte	0x1
	.long	LFB131
	.long	LFE131
	.secrel32	LLST112
	.long	0x540f
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x134
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x42
	.secrel32	LASF1
	.byte	0x1
	.word	0x134
	.long	0xfd
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x5c
	.long	0x2d27
	.secrel32	Ldebug_ranges0+0x258
	.byte	0x1
	.word	0x136
	.long	0x53d8
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x270
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST113
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1089
	.long	LBE1089
	.byte	0x1
	.word	0x138
	.long	0x53f7
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x52
	.long	0x2e49
	.secrel32	Ldebug_ranges0+0x288
	.byte	0x1
	.word	0x139
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.uleb128 0x4e
	.ascii "vmx_inject_page_fault\0"
	.byte	0x1
	.word	0x88d
	.byte	0x1
	.long	LFB199
	.long	LFE199
	.secrel32	LLST114
	.long	0x553c
	.uleb128 0x55
	.secrel32	LASF29
	.byte	0x1
	.word	0x88a
	.long	0x18bb
	.secrel32	LLST115
	.uleb128 0x4d
	.ascii "addr\0"
	.byte	0x1
	.word	0x88b
	.long	0x281
	.secrel32	LLST116
	.uleb128 0x55
	.secrel32	LASF36
	.byte	0x1
	.word	0x88c
	.long	0x15a
	.secrel32	LLST117
	.uleb128 0x5d
	.secrel32	LASF38
	.byte	0x1
	.word	0x88e
	.long	0x15a
	.secrel32	LLST118
	.uleb128 0x5c
	.long	0x2ded
	.secrel32	Ldebug_ranges0+0x2a0
	.byte	0x1
	.word	0x88e
	.long	0x54a3
	.uleb128 0x53
	.long	0x2d27
	.secrel32	Ldebug_ranges0+0x2b8
	.byte	0x1
	.byte	0xa9
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x2d0
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x2e49
	.secrel32	Ldebug_ranges0+0x2e8
	.byte	0x1
	.word	0x89f
	.long	0x54be
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x5c
	.long	0x2e49
	.secrel32	Ldebug_ranges0+0x300
	.byte	0x1
	.word	0x8a0
	.long	0x54d9
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB1113
	.long	LBE1113
	.byte	0x1
	.word	0x893
	.long	0x5501
	.uleb128 0x44
	.long	LBB1114
	.long	LBE1114
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST119
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1115
	.long	LBE1115
	.byte	0x1
	.word	0x896
	.long	0x5520
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x43
	.long	0x2e49
	.long	LBB1117
	.long	LBE1117
	.byte	0x1
	.word	0x897
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.uleb128 0x5b
	.ascii "vmx_disabled_by_bios\0"
	.byte	0x1
	.word	0x212
	.byte	0x1
	.long	0xe9
	.long	LFB141
	.long	LFE141
	.secrel32	LLST120
	.long	0x55a7
	.uleb128 0x4f
	.ascii "msr\0"
	.byte	0x1
	.word	0x213
	.long	0x165
	.secrel32	LLST121
	.uleb128 0x5c
	.long	0x2e76
	.secrel32	Ldebug_ranges0+0x320
	.byte	0x1
	.word	0x217
	.long	0x5596
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x338
	.uleb128 0x34
	.long	0x2e9e
	.byte	0x0
	.byte	0x0
	.uleb128 0x3e
	.secrel32	LASF35
	.long	0x7f87
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.2776
	.byte	0x0
	.uleb128 0x60
	.secrel32	LASF20
	.byte	0x1
	.word	0x20b
	.byte	0x1
	.long	0xe9
	.long	LFB140
	.long	LFE140
	.secrel32	LLST122
	.long	0x5665
	.uleb128 0x51
	.ascii "ecx\0"
	.byte	0x1
	.word	0x20c
	.long	0x281
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.uleb128 0x5c
	.long	0x2fac
	.secrel32	Ldebug_ranges0+0x350
	.byte	0x1
	.word	0x20c
	.long	0x5625
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x370
	.uleb128 0x45
	.long	0x2fcd
	.secrel32	LLST123
	.uleb128 0x45
	.long	0x2fd8
	.secrel32	LLST124
	.uleb128 0x45
	.long	0x2fe3
	.secrel32	LLST125
	.uleb128 0x45
	.long	0x2fee
	.secrel32	LLST126
	.uleb128 0x53
	.long	0x2c46
	.secrel32	Ldebug_ranges0+0x390
	.byte	0x2
	.byte	0x6b
	.uleb128 0x62
	.long	0x2bfd
	.secrel32	Ldebug_ranges0+0x3b0
	.byte	0x2
	.byte	0x49
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x2ffd
	.secrel32	Ldebug_ranges0+0x3d0
	.byte	0x1
	.word	0x20e
	.long	0x5654
	.uleb128 0x3d
	.long	0x301f
	.uleb128 0x3d
	.long	0x3014
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x3e8
	.uleb128 0x45
	.long	0x302c
	.secrel32	LLST127
	.uleb128 0x34
	.long	0x3036
	.byte	0x0
	.byte	0x0
	.uleb128 0x3e
	.secrel32	LASF35
	.long	0x7f72
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.2768
	.byte	0x0
	.uleb128 0x2c
	.ascii "init_rmode_tss\0"
	.byte	0x1
	.word	0x3f4
	.byte	0x1
	.long	0xe9
	.byte	0x1
	.long	0x572f
	.uleb128 0x36
	.ascii "kvm\0"
	.byte	0x1
	.word	0x3f3
	.long	0x20bc
	.uleb128 0x2d
	.ascii "p1\0"
	.byte	0x1
	.word	0x3f5
	.long	0x334
	.uleb128 0x2d
	.ascii "p2\0"
	.byte	0x1
	.word	0x3f5
	.long	0x334
	.uleb128 0x2d
	.ascii "p3\0"
	.byte	0x1
	.word	0x3f5
	.long	0x334
	.uleb128 0x2d
	.ascii "fn\0"
	.byte	0x1
	.word	0x3f6
	.long	0x15f1
	.uleb128 0x2d
	.ascii "page\0"
	.byte	0x1
	.word	0x3f7
	.long	0x2109
	.uleb128 0x32
	.long	0x56d9
	.uleb128 0x3d
	.long	0x2f33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2f3f
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x56f0
	.uleb128 0x3d
	.long	0x307a
	.uleb128 0x3d
	.long	0x306e
	.uleb128 0x33
	.uleb128 0x34
	.long	0x3086
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x5707
	.uleb128 0x3d
	.long	0x307a
	.uleb128 0x3d
	.long	0x306e
	.uleb128 0x33
	.uleb128 0x34
	.long	0x3086
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x571e
	.uleb128 0x3d
	.long	0x307a
	.uleb128 0x3d
	.long	0x306e
	.uleb128 0x33
	.uleb128 0x34
	.long	0x3086
	.byte	0x0
	.byte	0x0
	.uleb128 0x3e
	.secrel32	LASF35
	.long	0x7fc0
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.3203
	.byte	0x0
	.uleb128 0x5b
	.ascii "vmx_vcpu_setup\0"
	.byte	0x1
	.word	0x434
	.byte	0x1
	.long	0xe9
	.long	LFB174
	.long	LFE174
	.secrel32	LLST128
	.long	0x62ef
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x433
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2d
	.ascii "host_sysenter_cs\0"
	.byte	0x1
	.word	0x435
	.long	0x15a
	.uleb128 0x2d
	.ascii "junk\0"
	.byte	0x1
	.word	0x436
	.long	0x15a
	.uleb128 0x2d
	.ascii "a\0"
	.byte	0x1
	.word	0x437
	.long	0x281
	.uleb128 0x51
	.ascii "dt\0"
	.byte	0x1
	.word	0x438
	.long	0x22df
	.byte	0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x4f
	.ascii "i\0"
	.byte	0x1
	.word	0x439
	.long	0xe9
	.secrel32	LLST129
	.uleb128 0x4f
	.ascii "ret\0"
	.byte	0x1
	.word	0x43a
	.long	0xe9
	.secrel32	LLST130
	.uleb128 0x4f
	.ascii "nr_good_msrs\0"
	.byte	0x1
	.word	0x43b
	.long	0xe9
	.secrel32	LLST131
	.uleb128 0x3f
	.ascii "out\0"
	.byte	0x1
	.word	0x509
	.uleb128 0x5c
	.long	0x5665
	.secrel32	Ldebug_ranges0+0x400
	.byte	0x1
	.word	0x43f
	.long	0x58aa
	.uleb128 0x3d
	.long	0x5682
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x420
	.uleb128 0x45
	.long	0x568e
	.secrel32	LLST132
	.uleb128 0x45
	.long	0x5699
	.secrel32	LLST133
	.uleb128 0x45
	.long	0x56a4
	.secrel32	LLST134
	.uleb128 0x45
	.long	0x56af
	.secrel32	LLST135
	.uleb128 0x34
	.long	0x56ba
	.uleb128 0x5c
	.long	0x3053
	.secrel32	Ldebug_ranges0+0x470
	.byte	0x1
	.word	0x3fb
	.long	0x5854
	.uleb128 0x3d
	.long	0x307a
	.uleb128 0x3d
	.long	0x306e
	.uleb128 0x44
	.long	LBB1309
	.long	LBE1309
	.uleb128 0x45
	.long	0x3086
	.secrel32	LLST136
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x3053
	.secrel32	Ldebug_ranges0+0x490
	.byte	0x1
	.word	0x3fc
	.long	0x587e
	.uleb128 0x3d
	.long	0x307a
	.uleb128 0x3d
	.long	0x306e
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x4a8
	.uleb128 0x45
	.long	0x3086
	.secrel32	LLST137
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x3053
	.long	LBB1316
	.long	LBE1316
	.byte	0x1
	.word	0x3fd
	.uleb128 0x3d
	.long	0x307a
	.uleb128 0x3d
	.long	0x306e
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x4c0
	.uleb128 0x45
	.long	0x3086
	.secrel32	LLST138
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2eaa
	.long	LBB1326
	.long	LBE1326
	.byte	0x1
	.word	0x451
	.long	0x58c9
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1328
	.long	LBE1328
	.byte	0x1
	.word	0x453
	.long	0x58e8
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1330
	.long	LBE1330
	.byte	0x1
	.word	0x454
	.long	0x5907
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2eaa
	.long	LBB1332
	.long	LBE1332
	.byte	0x1
	.word	0x45c
	.long	0x5926
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1334
	.long	LBE1334
	.byte	0x1
	.word	0x45e
	.long	0x5945
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1336
	.long	LBE1336
	.byte	0x1
	.word	0x45f
	.long	0x5964
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2eaa
	.long	LBB1338
	.long	LBE1338
	.byte	0x1
	.word	0x461
	.long	0x5983
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1340
	.long	LBE1340
	.byte	0x1
	.word	0x463
	.long	0x59a2
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1342
	.long	LBE1342
	.byte	0x1
	.word	0x464
	.long	0x59c1
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1344
	.long	LBE1344
	.byte	0x1
	.word	0x466
	.long	0x59e0
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1346
	.long	LBE1346
	.byte	0x1
	.word	0x472
	.long	0x59ff
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1348
	.long	LBE1348
	.byte	0x1
	.word	0x475
	.long	0x5a1e
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1350
	.long	LBE1350
	.byte	0x1
	.word	0x477
	.long	0x5a3d
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1352
	.long	LBE1352
	.byte	0x1
	.word	0x478
	.long	0x5a5c
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1354
	.long	LBE1354
	.byte	0x1
	.word	0x479
	.long	0x5a7b
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x30b5
	.long	LBB1356
	.long	LBE1356
	.byte	0x1
	.word	0x47f
	.long	0x5ac8
	.uleb128 0x3d
	.long	0x30cf
	.uleb128 0x44
	.long	LBB1357
	.long	LBE1357
	.uleb128 0x45
	.long	0x30e1
	.secrel32	LLST139
	.uleb128 0x43
	.long	0x2d56
	.long	LBB1358
	.long	LBE1358
	.byte	0x1
	.word	0x155
	.uleb128 0x44
	.long	LBB1359
	.long	LBE1359
	.uleb128 0x34
	.long	0x2d73
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x30f7
	.long	LBB1360
	.long	LBE1360
	.byte	0x1
	.word	0x487
	.long	0x5b55
	.uleb128 0x3d
	.long	0x3130
	.uleb128 0x3d
	.long	0x3124
	.uleb128 0x3d
	.long	0x3118
	.uleb128 0x44
	.long	LBB1361
	.long	LBE1361
	.uleb128 0x34
	.long	0x313c
	.uleb128 0x34
	.long	0x314d
	.uleb128 0x61
	.long	LBB1362
	.long	LBE1362
	.long	0x5b38
	.uleb128 0x49
	.long	0x3162
	.byte	0x6
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.uleb128 0x43
	.long	0x2e76
	.long	LBB1363
	.long	LBE1363
	.byte	0x1
	.word	0x41c
	.uleb128 0x44
	.long	LBB1364
	.long	LBE1364
	.uleb128 0x34
	.long	0x2e9e
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2e49
	.long	LBB1365
	.long	LBE1365
	.byte	0x1
	.word	0x420
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x30f7
	.long	LBB1367
	.long	LBE1367
	.byte	0x1
	.word	0x48c
	.long	0x5be2
	.uleb128 0x3d
	.long	0x3130
	.uleb128 0x3d
	.long	0x3124
	.uleb128 0x3d
	.long	0x3118
	.uleb128 0x44
	.long	LBB1368
	.long	LBE1368
	.uleb128 0x34
	.long	0x313c
	.uleb128 0x34
	.long	0x314d
	.uleb128 0x61
	.long	LBB1369
	.long	LBE1369
	.long	0x5bc5
	.uleb128 0x49
	.long	0x3162
	.byte	0x6
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.uleb128 0x43
	.long	0x2e76
	.long	LBB1370
	.long	LBE1370
	.byte	0x1
	.word	0x41c
	.uleb128 0x44
	.long	LBB1371
	.long	LBE1371
	.uleb128 0x34
	.long	0x2e9e
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2e49
	.long	LBB1372
	.long	LBE1372
	.byte	0x1
	.word	0x420
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1374
	.long	LBE1374
	.byte	0x1
	.word	0x496
	.long	0x5c01
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1376
	.long	LBE1376
	.byte	0x1
	.word	0x497
	.long	0x5c20
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1378
	.long	LBE1378
	.byte	0x1
	.word	0x498
	.long	0x5c3f
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1380
	.long	LBE1380
	.byte	0x1
	.word	0x499
	.long	0x5c5e
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x3185
	.long	LBB1382
	.long	LBE1382
	.byte	0x1
	.word	0x49b
	.long	0x5c86
	.uleb128 0x44
	.long	LBB1383
	.long	LBE1383
	.uleb128 0x45
	.long	0x319c
	.secrel32	LLST140
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x31a9
	.long	LBB1384
	.long	LBE1384
	.byte	0x1
	.word	0x49c
	.long	0x5cae
	.uleb128 0x44
	.long	LBB1385
	.long	LBE1385
	.uleb128 0x45
	.long	0x31c0
	.secrel32	LLST141
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x31cd
	.long	LBB1386
	.long	LBE1386
	.byte	0x1
	.word	0x49d
	.long	0x5cd6
	.uleb128 0x44
	.long	LBB1387
	.long	LBE1387
	.uleb128 0x45
	.long	0x31e4
	.secrel32	LLST142
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x31f1
	.long	LBB1388
	.long	LBE1388
	.byte	0x1
	.word	0x4a7
	.long	0x5cfe
	.uleb128 0x44
	.long	LBB1389
	.long	LBE1389
	.uleb128 0x45
	.long	0x3207
	.secrel32	LLST143
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2eaa
	.long	LBB1390
	.long	LBE1390
	.byte	0x1
	.word	0x4a7
	.long	0x5d1d
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x48
	.long	0x3212
	.long	LBB1392
	.long	LBE1392
	.byte	0x1
	.word	0x4a8
	.long	0x5d45
	.uleb128 0x44
	.long	LBB1393
	.long	LBE1393
	.uleb128 0x45
	.long	0x3228
	.secrel32	LLST144
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2eaa
	.long	LBB1394
	.long	LBE1394
	.byte	0x1
	.word	0x4a8
	.long	0x5d64
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x48
	.long	0x3233
	.long	LBB1396
	.long	LBE1396
	.byte	0x1
	.word	0x4a9
	.long	0x5d8c
	.uleb128 0x44
	.long	LBB1397
	.long	LBE1397
	.uleb128 0x45
	.long	0x3249
	.secrel32	LLST145
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2eaa
	.long	LBB1398
	.long	LBE1398
	.byte	0x1
	.word	0x4a9
	.long	0x5dab
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x5c
	.long	0x2eaa
	.secrel32	Ldebug_ranges0+0x4d8
	.byte	0x1
	.word	0x4aa
	.long	0x5dc6
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x48
	.long	0x3254
	.long	LBB1403
	.long	LBE1403
	.byte	0x1
	.word	0x4aa
	.long	0x5dee
	.uleb128 0x44
	.long	LBB1404
	.long	LBE1404
	.uleb128 0x45
	.long	0x326a
	.secrel32	LLST146
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x2eaa
	.secrel32	Ldebug_ranges0+0x4f0
	.byte	0x1
	.word	0x4ab
	.long	0x5e09
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x48
	.long	0x3277
	.long	LBB1409
	.long	LBE1409
	.byte	0x1
	.word	0x4ab
	.long	0x5e31
	.uleb128 0x44
	.long	LBB1410
	.long	LBE1410
	.uleb128 0x45
	.long	0x328d
	.secrel32	LLST147
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x329a
	.long	LBB1412
	.long	LBE1412
	.byte	0x1
	.word	0x4ac
	.long	0x5e59
	.uleb128 0x44
	.long	LBB1413
	.long	LBE1413
	.uleb128 0x45
	.long	0x32b0
	.secrel32	LLST148
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2eaa
	.long	LBB1414
	.long	LBE1414
	.byte	0x1
	.word	0x4ac
	.long	0x5e78
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x48
	.long	0x32bb
	.long	LBB1416
	.long	LBE1416
	.byte	0x1
	.word	0x4b9
	.long	0x5ee6
	.uleb128 0x44
	.long	LBB1417
	.long	LBE1417
	.uleb128 0x34
	.long	0x32d6
	.uleb128 0x34
	.long	0x32e3
	.uleb128 0x49
	.long	0x32ef
	.byte	0x2
	.byte	0x91
	.sleb128 -34
	.uleb128 0x34
	.long	0x32fb
	.uleb128 0x48
	.long	0x2cbe
	.long	LBB1418
	.long	LBE1418
	.byte	0x2
	.word	0x16e
	.long	0x5ed4
	.uleb128 0x44
	.long	LBB1419
	.long	LBE1419
	.uleb128 0x45
	.long	0x2cd5
	.secrel32	LLST149
	.byte	0x0
	.byte	0x0
	.uleb128 0x63
	.long	0x2ce0
	.long	LBB1420
	.long	LBE1420
	.byte	0x2
	.word	0x175
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x331d
	.long	LBB1422
	.long	LBE1422
	.byte	0x1
	.word	0x4ba
	.long	0x5f54
	.uleb128 0x44
	.long	LBB1423
	.long	LBE1423
	.uleb128 0x34
	.long	0x3338
	.uleb128 0x34
	.long	0x3345
	.uleb128 0x49
	.long	0x3351
	.byte	0x2
	.byte	0x91
	.sleb128 -34
	.uleb128 0x34
	.long	0x335d
	.uleb128 0x48
	.long	0x2d05
	.long	LBB1424
	.long	LBE1424
	.byte	0x2
	.word	0x181
	.long	0x5f42
	.uleb128 0x44
	.long	LBB1425
	.long	LBE1425
	.uleb128 0x45
	.long	0x2d1c
	.secrel32	LLST150
	.byte	0x0
	.byte	0x0
	.uleb128 0x63
	.long	0x2ce0
	.long	LBB1426
	.long	LBE1426
	.byte	0x2
	.word	0x188
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x2eaa
	.secrel32	Ldebug_ranges0+0x508
	.byte	0x1
	.word	0x4c1
	.long	0x5f6f
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x48
	.long	0x3379
	.long	LBB1431
	.long	LBE1431
	.byte	0x1
	.word	0x4c1
	.long	0x5f97
	.uleb128 0x44
	.long	LBB1432
	.long	LBE1432
	.uleb128 0x45
	.long	0x3390
	.secrel32	LLST151
	.byte	0x0
	.byte	0x0
	.uleb128 0x63
	.long	0x339c
	.long	LBB1434
	.long	LBE1434
	.byte	0x1
	.word	0x4c4
	.uleb128 0x61
	.long	LBB1436
	.long	LBE1436
	.long	0x5fe5
	.uleb128 0x5d
	.secrel32	LASF32
	.byte	0x1
	.word	0x4cb
	.long	0x165
	.secrel32	LLST152
	.uleb128 0x43
	.long	0x2e76
	.long	LBB1437
	.long	LBE1437
	.byte	0x1
	.word	0x4cb
	.uleb128 0x44
	.long	LBB1438
	.long	LBE1438
	.uleb128 0x34
	.long	0x2e9e
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1439
	.long	LBE1439
	.byte	0x1
	.word	0x4cc
	.long	0x6004
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e76
	.long	LBB1441
	.long	LBE1441
	.byte	0x1
	.word	0x4cd
	.long	0x602c
	.uleb128 0x44
	.long	LBB1442
	.long	LBE1442
	.uleb128 0x45
	.long	0x2e9e
	.secrel32	LLST153
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2e76
	.long	LBB1443
	.long	LBE1443
	.byte	0x1
	.word	0x4cf
	.long	0x6054
	.uleb128 0x44
	.long	LBB1444
	.long	LBE1444
	.uleb128 0x45
	.long	0x2e9e
	.secrel32	LLST154
	.byte	0x0
	.byte	0x0
	.uleb128 0x61
	.long	LBB1445
	.long	LBE1445
	.long	0x6118
	.uleb128 0x4f
	.ascii "index\0"
	.byte	0x1
	.word	0x4d3
	.long	0x15a
	.secrel32	LLST155
	.uleb128 0x2d
	.ascii "data_low\0"
	.byte	0x1
	.word	0x4d4
	.long	0x15a
	.uleb128 0x2d
	.ascii "data_high\0"
	.byte	0x1
	.word	0x4d4
	.long	0x15a
	.uleb128 0x39
	.secrel32	LASF5
	.byte	0x1
	.word	0x4d5
	.long	0x165
	.uleb128 0x2d
	.ascii "j\0"
	.byte	0x1
	.word	0x4d6
	.long	0xe9
	.uleb128 0x5f
	.secrel32	Ldebug_ranges0+0x520
	.long	0x60ec
	.uleb128 0x2d
	.ascii "__err\0"
	.byte	0x1
	.word	0x4d8
	.long	0xe9
	.uleb128 0x5d
	.secrel32	LASF32
	.byte	0x1
	.word	0x4d8
	.long	0x165
	.secrel32	LLST156
	.uleb128 0x52
	.long	0x2e76
	.secrel32	Ldebug_ranges0+0x538
	.byte	0x1
	.word	0x4d8
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x550
	.uleb128 0x34
	.long	0x2e9e
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x52
	.long	0x33bd
	.secrel32	Ldebug_ranges0+0x568
	.byte	0x1
	.word	0x4da
	.uleb128 0x3d
	.long	0x33ef
	.uleb128 0x3d
	.long	0x33e2
	.uleb128 0x3d
	.long	0x33d5
	.uleb128 0x64
	.long	0x2c8d
	.long	LBB1453
	.long	LBE1453
	.byte	0x2
	.byte	0xbc
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x33ff
	.secrel32	Ldebug_ranges0+0x580
	.byte	0x1
	.word	0x4e6
	.long	0x612e
	.uleb128 0x3d
	.long	0x3419
	.byte	0x0
	.uleb128 0x48
	.long	0x33ff
	.long	LBB1460
	.long	LBE1460
	.byte	0x1
	.word	0x4e8
	.long	0x6148
	.uleb128 0x3d
	.long	0x3419
	.byte	0x0
	.uleb128 0x48
	.long	0x33ff
	.long	LBB1461
	.long	LBE1461
	.byte	0x1
	.word	0x4ea
	.long	0x6162
	.uleb128 0x3d
	.long	0x3419
	.byte	0x0
	.uleb128 0x48
	.long	0x30f7
	.long	LBB1462
	.long	LBE1462
	.byte	0x1
	.word	0x4ec
	.long	0x61ec
	.uleb128 0x3d
	.long	0x3130
	.uleb128 0x3d
	.long	0x3124
	.uleb128 0x3d
	.long	0x3118
	.uleb128 0x44
	.long	LBB1463
	.long	LBE1463
	.uleb128 0x34
	.long	0x313c
	.uleb128 0x34
	.long	0x314d
	.uleb128 0x61
	.long	LBB1464
	.long	LBE1464
	.long	0x61cf
	.uleb128 0x45
	.long	0x3162
	.secrel32	LLST157
	.uleb128 0x43
	.long	0x2e76
	.long	LBB1465
	.long	LBE1465
	.byte	0x1
	.word	0x41c
	.uleb128 0x44
	.long	LBB1466
	.long	LBE1466
	.uleb128 0x34
	.long	0x2e9e
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2e49
	.long	LBB1467
	.long	LBE1467
	.byte	0x1
	.word	0x420
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1469
	.long	LBE1469
	.byte	0x1
	.word	0x4ee
	.long	0x620b
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1471
	.long	LBE1471
	.byte	0x1
	.word	0x4ef
	.long	0x622a
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x2e49
	.long	LBB1473
	.long	LBE1473
	.byte	0x1
	.word	0x4f0
	.long	0x6249
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.uleb128 0x48
	.long	0x30f7
	.long	LBB1475
	.long	LBE1475
	.byte	0x1
	.word	0x4f4
	.long	0x62d3
	.uleb128 0x3d
	.long	0x3130
	.uleb128 0x3d
	.long	0x3124
	.uleb128 0x3d
	.long	0x3118
	.uleb128 0x44
	.long	LBB1476
	.long	LBE1476
	.uleb128 0x34
	.long	0x313c
	.uleb128 0x34
	.long	0x314d
	.uleb128 0x61
	.long	LBB1477
	.long	LBE1477
	.long	0x62b6
	.uleb128 0x45
	.long	0x3162
	.secrel32	LLST158
	.uleb128 0x43
	.long	0x2e76
	.long	LBB1478
	.long	LBE1478
	.byte	0x1
	.word	0x41c
	.uleb128 0x44
	.long	LBB1479
	.long	LBE1479
	.uleb128 0x34
	.long	0x2e9e
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2e49
	.long	LBB1480
	.long	LBE1480
	.byte	0x1
	.word	0x420
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2e49
	.long	LBB1482
	.long	LBE1482
	.byte	0x1
	.word	0x4f6
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.uleb128 0x58
	.ascii "vmcs_clear\0"
	.byte	0x1
	.byte	0x78
	.byte	0x1
	.long	LFB113
	.long	LFE113
	.secrel32	LLST159
	.long	0x633e
	.uleb128 0x59
	.secrel32	LASF14
	.byte	0x1
	.byte	0x77
	.long	0x1ebb
	.secrel32	LLST160
	.uleb128 0x65
	.secrel32	LASF4
	.byte	0x1
	.byte	0x79
	.long	0x165
	.secrel32	LLST161
	.uleb128 0x5a
	.ascii "error\0"
	.byte	0x1
	.byte	0x7a
	.long	0x145
	.secrel32	LLST162
	.byte	0x0
	.uleb128 0x5b
	.ascii "vmx_set_msr\0"
	.byte	0x1
	.word	0x1a3
	.byte	0x1
	.long	0xe9
	.long	LFB136
	.long	LFE136
	.secrel32	LLST163
	.long	0x642e
	.uleb128 0x55
	.secrel32	LASF29
	.byte	0x1
	.word	0x1a2
	.long	0x18bb
	.secrel32	LLST164
	.uleb128 0x55
	.secrel32	LASF39
	.byte	0x1
	.word	0x1a2
	.long	0x15a
	.secrel32	LLST165
	.uleb128 0x55
	.secrel32	LASF5
	.byte	0x1
	.word	0x1a2
	.long	0x165
	.secrel32	LLST166
	.uleb128 0x4f
	.ascii "msr\0"
	.byte	0x1
	.word	0x1a4
	.long	0x20e2
	.secrel32	LLST167
	.uleb128 0x5c
	.long	0x3425
	.secrel32	Ldebug_ranges0+0x598
	.byte	0x1
	.word	0x1bd
	.long	0x63cd
	.uleb128 0x3d
	.long	0x344c
	.uleb128 0x3d
	.long	0x3441
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x5b8
	.uleb128 0x45
	.long	0x3457
	.secrel32	LLST168
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x30b5
	.secrel32	Ldebug_ranges0+0x5d8
	.byte	0x1
	.word	0x1ba
	.long	0x6412
	.uleb128 0x3d
	.long	0x30cf
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x5f0
	.uleb128 0x45
	.long	0x30e1
	.secrel32	LLST169
	.uleb128 0x43
	.long	0x2d56
	.long	LBB1493
	.long	LBE1493
	.byte	0x1
	.word	0x155
	.uleb128 0x44
	.long	LBB1494
	.long	LBE1494
	.uleb128 0x34
	.long	0x2d73
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2e49
	.long	LBB1497
	.long	LBE1497
	.byte	0x1
	.word	0x1b1
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.uleb128 0x5b
	.ascii "handle_wrmsr\0"
	.byte	0x1
	.word	0x6d3
	.byte	0x1
	.long	0xe9
	.long	LFB190
	.long	LFE190
	.secrel32	LLST170
	.long	0x648c
	.uleb128 0x55
	.secrel32	LASF29
	.byte	0x1
	.word	0x6d2
	.long	0x18bb
	.secrel32	LLST171
	.uleb128 0x42
	.secrel32	LASF6
	.byte	0x1
	.word	0x6d2
	.long	0x289b
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x2d
	.ascii "ecx\0"
	.byte	0x1
	.word	0x6d4
	.long	0x15a
	.uleb128 0x39
	.secrel32	LASF5
	.byte	0x1
	.word	0x6d5
	.long	0x165
	.byte	0x0
	.uleb128 0x5b
	.ascii "vmx_get_msr\0"
	.byte	0x1
	.word	0x170
	.byte	0x1
	.long	0xe9
	.long	LFB135
	.long	LFE135
	.secrel32	LLST172
	.long	0x665f
	.uleb128 0x55
	.secrel32	LASF29
	.byte	0x1
	.word	0x16f
	.long	0x18bb
	.secrel32	LLST173
	.uleb128 0x55
	.secrel32	LASF39
	.byte	0x1
	.word	0x16f
	.long	0x15a
	.secrel32	LLST174
	.uleb128 0x4d
	.ascii "pdata\0"
	.byte	0x1
	.word	0x16f
	.long	0x160b
	.secrel32	LLST175
	.uleb128 0x5d
	.secrel32	LASF5
	.byte	0x1
	.word	0x171
	.long	0x165
	.secrel32	LLST176
	.uleb128 0x4f
	.ascii "msr\0"
	.byte	0x1
	.word	0x172
	.long	0x20e2
	.secrel32	LLST177
	.uleb128 0x48
	.long	0x2d27
	.long	LBB1500
	.long	LBE1500
	.byte	0x1
	.word	0x18b
	.long	0x652b
	.uleb128 0x44
	.long	LBB1501
	.long	LBE1501
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST178
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x3425
	.secrel32	Ldebug_ranges0+0x608
	.byte	0x1
	.word	0x191
	.long	0x6555
	.uleb128 0x3d
	.long	0x344c
	.uleb128 0x3d
	.long	0x3441
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x628
	.uleb128 0x45
	.long	0x3457
	.secrel32	LLST179
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2ded
	.long	LBB1508
	.long	LBE1508
	.byte	0x1
	.word	0x188
	.long	0x658d
	.uleb128 0x50
	.long	0x2d27
	.long	LBB1510
	.long	LBE1510
	.byte	0x1
	.byte	0xa9
	.uleb128 0x44
	.long	LBB1511
	.long	LBE1511
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST180
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB1512
	.long	LBE1512
	.byte	0x1
	.word	0x18e
	.long	0x65b5
	.uleb128 0x44
	.long	LBB1513
	.long	LBE1513
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST181
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x3461
	.long	LBB1514
	.long	LBE1514
	.byte	0x1
	.word	0x185
	.uleb128 0x44
	.long	LBB1515
	.long	LBE1515
	.uleb128 0x34
	.long	0x347e
	.uleb128 0x34
	.long	0x348a
	.uleb128 0x48
	.long	0x2d56
	.long	LBB1516
	.long	LBE1516
	.byte	0x1
	.word	0x148
	.long	0x65fc
	.uleb128 0x44
	.long	LBB1517
	.long	LBE1517
	.uleb128 0x34
	.long	0x2d73
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2d7f
	.long	LBB1518
	.long	LBE1518
	.byte	0x1
	.word	0x149
	.uleb128 0x3d
	.long	0x2d98
	.uleb128 0x66
	.long	0x2d27
	.long	LBB1520
	.long	LBE1520
	.byte	0x1
	.byte	0xb1
	.long	0x6638
	.uleb128 0x44
	.long	LBB1521
	.long	LBE1521
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST182
	.byte	0x0
	.byte	0x0
	.uleb128 0x50
	.long	0x2d27
	.long	LBB1522
	.long	LBE1522
	.byte	0x1
	.byte	0xb1
	.uleb128 0x44
	.long	LBB1523
	.long	LBE1523
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST183
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x5b
	.ascii "handle_rdmsr\0"
	.byte	0x1
	.word	0x6c2
	.byte	0x1
	.long	0xe9
	.long	LFB189
	.long	LFE189
	.secrel32	LLST184
	.long	0x66c1
	.uleb128 0x55
	.secrel32	LASF29
	.byte	0x1
	.word	0x6c1
	.long	0x18bb
	.secrel32	LLST185
	.uleb128 0x42
	.secrel32	LASF6
	.byte	0x1
	.word	0x6c1
	.long	0x289b
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x2d
	.ascii "ecx\0"
	.byte	0x1
	.word	0x6c3
	.long	0x15a
	.uleb128 0x5d
	.secrel32	LASF5
	.byte	0x1
	.word	0x6c4
	.long	0x165
	.secrel32	LLST186
	.byte	0x0
	.uleb128 0x58
	.ascii "__vcpu_clear\0"
	.byte	0x1
	.byte	0x85
	.byte	0x1
	.long	LFB114
	.long	LFE114
	.secrel32	LLST187
	.long	0x670c
	.uleb128 0x67
	.ascii "arg\0"
	.byte	0x1
	.byte	0x84
	.long	0x296
	.secrel32	LLST188
	.uleb128 0x30
	.secrel32	LASF29
	.byte	0x1
	.byte	0x86
	.long	0x18bb
	.uleb128 0x5a
	.ascii "cpu\0"
	.byte	0x1
	.byte	0x87
	.long	0xe9
	.secrel32	LLST189
	.byte	0x0
	.uleb128 0x58
	.ascii "vcpu_clear\0"
	.byte	0x1
	.byte	0x91
	.byte	0x1
	.long	LFB115
	.long	LFE115
	.secrel32	LLST190
	.long	0x673b
	.uleb128 0x59
	.secrel32	LASF29
	.byte	0x1
	.byte	0x90
	.long	0x18bb
	.secrel32	LLST191
	.byte	0x0
	.uleb128 0x4c
	.ascii "vmx_vcpu_decache\0"
	.byte	0x1
	.word	0x112
	.byte	0x1
	.long	LFB127
	.long	LFE127
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x6770
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x111
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0x0
	.uleb128 0x4c
	.ascii "vmx_vcpu_put\0"
	.byte	0x1
	.word	0x10d
	.byte	0x1
	.long	LFB126
	.long	LFE126
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.long	0x67a1
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x10c
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0x0
	.uleb128 0x58
	.ascii "vmx_vcpu_load\0"
	.byte	0x1
	.byte	0xe0
	.byte	0x1
	.long	LFB125
	.long	LFE125
	.secrel32	LLST194
	.long	0x6893
	.uleb128 0x59
	.secrel32	LASF29
	.byte	0x1
	.byte	0xdf
	.long	0x18bb
	.secrel32	LLST195
	.uleb128 0x65
	.secrel32	LASF4
	.byte	0x1
	.byte	0xe1
	.long	0x165
	.secrel32	LLST196
	.uleb128 0x5a
	.ascii "cpu\0"
	.byte	0x1
	.byte	0xe2
	.long	0xe9
	.secrel32	LLST197
	.uleb128 0x5f
	.secrel32	Ldebug_ranges0+0x648
	.long	0x680b
	.uleb128 0x5a
	.ascii "error\0"
	.byte	0x1
	.byte	0xec
	.long	0x145
	.secrel32	LLST198
	.byte	0x0
	.uleb128 0x44
	.long	LBB1525
	.long	LBE1525
	.uleb128 0x68
	.ascii "dt\0"
	.byte	0x1
	.byte	0xf9
	.long	0x22df
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x31
	.ascii "sysenter_esp\0"
	.byte	0x1
	.byte	0xfa
	.long	0x281
	.uleb128 0x48
	.long	0x34c8
	.long	LBB1526
	.long	LBE1526
	.byte	0x1
	.word	0x101
	.long	0x685d
	.uleb128 0x44
	.long	LBB1527
	.long	LBE1527
	.uleb128 0x45
	.long	0x34e3
	.secrel32	LLST199
	.byte	0x0
	.byte	0x0
	.uleb128 0x63
	.long	0x2dba
	.long	LBB1528
	.long	LBE1528
	.byte	0x1
	.word	0x102
	.uleb128 0x43
	.long	0x2e76
	.long	LBB1530
	.long	LBE1530
	.byte	0x1
	.word	0x105
	.uleb128 0x44
	.long	LBB1531
	.long	LBE1531
	.uleb128 0x45
	.long	0x2e9e
	.secrel32	LLST200
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x4e
	.ascii "vmx_free_vcpu\0"
	.byte	0x1
	.word	0x8b4
	.byte	0x1
	.long	LFB201
	.long	LFE201
	.secrel32	LLST201
	.long	0x68f3
	.uleb128 0x55
	.secrel32	LASF29
	.byte	0x1
	.word	0x8b3
	.long	0x18bb
	.secrel32	LLST202
	.uleb128 0x43
	.long	0x3510
	.long	LBB1533
	.long	LBE1533
	.byte	0x1
	.word	0x8b5
	.uleb128 0x3d
	.long	0x3528
	.uleb128 0x43
	.long	0x34ef
	.long	LBB1535
	.long	LBE1535
	.byte	0x1
	.word	0x8ad
	.uleb128 0x3d
	.long	0x3503
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x5b
	.ascii "alloc_vmcs_cpu\0"
	.byte	0x1
	.word	0x252
	.byte	0x1
	.long	0x1ebb
	.long	LFB145
	.long	LFE145
	.secrel32	LLST203
	.long	0x695f
	.uleb128 0x4d
	.ascii "cpu\0"
	.byte	0x1
	.word	0x251
	.long	0xe9
	.secrel32	LLST204
	.uleb128 0x4f
	.ascii "node\0"
	.byte	0x1
	.word	0x253
	.long	0xe9
	.secrel32	LLST205
	.uleb128 0x4f
	.ascii "pages\0"
	.byte	0x1
	.word	0x254
	.long	0x334
	.secrel32	LLST206
	.uleb128 0x5d
	.secrel32	LASF14
	.byte	0x1
	.word	0x255
	.long	0x1ebb
	.secrel32	LLST207
	.byte	0x0
	.uleb128 0x5b
	.ascii "vmx_create_vcpu\0"
	.byte	0x1
	.word	0x8b9
	.byte	0x1
	.long	0xe9
	.long	LFB202
	.long	LFE202
	.secrel32	LLST208
	.long	0x69e7
	.uleb128 0x55
	.secrel32	LASF29
	.byte	0x1
	.word	0x8b8
	.long	0x18bb
	.secrel32	LLST209
	.uleb128 0x5d
	.secrel32	LASF14
	.byte	0x1
	.word	0x8ba
	.long	0x1ebb
	.secrel32	LLST210
	.uleb128 0x69
	.ascii "out_free_guest_msrs\0"
	.byte	0x1
	.word	0x8d5
	.long	L222
	.uleb128 0x69
	.ascii "out_free_msrs\0"
	.byte	0x1
	.word	0x8d1
	.long	L223
	.uleb128 0x6a
	.long	0x353c
	.secrel32	Ldebug_ranges0+0x660
	.byte	0x1
	.word	0x8c6
	.byte	0x0
	.uleb128 0x4e
	.ascii "free_kvm_area\0"
	.byte	0x1
	.word	0x27b
	.byte	0x1
	.long	LFB148
	.long	LFE148
	.secrel32	LLST211
	.long	0x6a31
	.uleb128 0x4f
	.ascii "cpu\0"
	.byte	0x1
	.word	0x27c
	.long	0xe9
	.secrel32	LLST212
	.uleb128 0x43
	.long	0x34ef
	.long	LBB1539
	.long	LBE1539
	.byte	0x1
	.word	0x281
	.uleb128 0x3d
	.long	0x3503
	.byte	0x0
	.byte	0x0
	.uleb128 0x6b
	.secrel32	LASF24
	.byte	0x1
	.word	0x2ae
	.byte	0x1
	.long	LFB151
	.long	LFE151
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.uleb128 0x2c
	.ascii "alloc_kvm_area\0"
	.byte	0x1
	.word	0x289
	.byte	0x1
	.long	0xe9
	.byte	0x1
	.long	0x6a91
	.uleb128 0x2d
	.ascii "cpu\0"
	.byte	0x1
	.word	0x28a
	.long	0xe9
	.uleb128 0x32
	.long	0x6a80
	.uleb128 0x39
	.secrel32	LASF14
	.byte	0x1
	.word	0x292
	.long	0x1ebb
	.byte	0x0
	.uleb128 0x3e
	.secrel32	LASF35
	.long	0x7fa1
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.2866
	.byte	0x0
	.uleb128 0x60
	.secrel32	LASF23
	.byte	0x1
	.word	0x2a7
	.byte	0x1
	.long	0xe9
	.long	LFB150
	.long	LFE150
	.secrel32	LLST214
	.long	0x6b46
	.uleb128 0x48
	.long	0x3562
	.long	LBB1549
	.long	LBE1549
	.byte	0x1
	.word	0x2a9
	.long	0x6b06
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x678
	.uleb128 0x34
	.long	0x3582
	.uleb128 0x34
	.long	0x3596
	.uleb128 0x44
	.long	LBB1551
	.long	LBE1551
	.uleb128 0x45
	.long	0x35b0
	.secrel32	LLST215
	.uleb128 0x43
	.long	0x2e76
	.long	LBB1552
	.long	LBE1552
	.byte	0x1
	.word	0x24b
	.uleb128 0x44
	.long	LBB1553
	.long	LBE1553
	.uleb128 0x34
	.long	0x2e9e
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x6a45
	.secrel32	Ldebug_ranges0+0x690
	.byte	0x1
	.word	0x2aa
	.long	0x6b35
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x6b8
	.uleb128 0x45
	.long	0x6a62
	.secrel32	LLST216
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x6f8
	.uleb128 0x45
	.long	0x6a73
	.secrel32	LLST217
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3e
	.secrel32	LASF35
	.long	0x7fbb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.2881
	.byte	0x0
	.uleb128 0x6c
	.secrel32	LASF21
	.byte	0x1
	.word	0x220
	.byte	0x1
	.long	LFB142
	.long	LFE142
	.secrel32	LLST218
	.long	0x6c1d
	.uleb128 0x4b
	.ascii "garbage\0"
	.byte	0x1
	.word	0x21f
	.long	0x296
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x51
	.ascii "cpu\0"
	.byte	0x1
	.word	0x221
	.long	0xe9
	.byte	0x1
	.byte	0x50
	.uleb128 0x5d
	.secrel32	LASF4
	.byte	0x1
	.word	0x222
	.long	0x165
	.secrel32	LLST219
	.uleb128 0x4f
	.ascii "old\0"
	.byte	0x1
	.word	0x223
	.long	0x165
	.secrel32	LLST220
	.uleb128 0x48
	.long	0x2e76
	.long	LBB1570
	.long	LBE1570
	.byte	0x1
	.word	0x227
	.long	0x6bc4
	.uleb128 0x44
	.long	LBB1571
	.long	LBE1571
	.uleb128 0x34
	.long	0x2e9e
	.byte	0x0
	.byte	0x0
	.uleb128 0x63
	.long	0x2c8d
	.long	LBB1572
	.long	LBE1572
	.byte	0x1
	.word	0x22d
	.uleb128 0x48
	.long	0x31a9
	.long	LBB1574
	.long	LBE1574
	.byte	0x1
	.word	0x231
	.long	0x6bfc
	.uleb128 0x44
	.long	LBB1575
	.long	LBE1575
	.uleb128 0x45
	.long	0x31c0
	.secrel32	LLST221
	.byte	0x0
	.byte	0x0
	.uleb128 0x63
	.long	0x35d7
	.long	LBB1576
	.long	LBE1576
	.byte	0x1
	.word	0x231
	.uleb128 0x3e
	.secrel32	LASF35
	.long	0x7f8c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.2788
	.byte	0x0
	.uleb128 0x5b
	.ascii "handle_io\0"
	.byte	0x1
	.word	0x632
	.byte	0x1
	.long	0xe9
	.long	LFB184
	.long	LFE184
	.secrel32	LLST222
	.long	0x6e06
	.uleb128 0x55
	.secrel32	LASF29
	.byte	0x1
	.word	0x631
	.long	0x18bb
	.secrel32	LLST223
	.uleb128 0x55
	.secrel32	LASF6
	.byte	0x1
	.word	0x631
	.long	0x289b
	.secrel32	LLST224
	.uleb128 0x5d
	.secrel32	LASF37
	.byte	0x1
	.word	0x633
	.long	0x165
	.secrel32	LLST225
	.uleb128 0x5c
	.long	0x2d7f
	.secrel32	Ldebug_ranges0+0x720
	.byte	0x1
	.word	0x636
	.long	0x6cc8
	.uleb128 0x3d
	.long	0x2d98
	.uleb128 0x66
	.long	0x2d27
	.long	LBB1581
	.long	LBE1581
	.byte	0x1
	.byte	0xb1
	.long	0x6cac
	.uleb128 0x44
	.long	LBB1582
	.long	LBE1582
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST226
	.byte	0x0
	.byte	0x0
	.uleb128 0x53
	.long	0x2d27
	.secrel32	Ldebug_ranges0+0x740
	.byte	0x1
	.byte	0xb1
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x758
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST227
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x2d27
	.secrel32	Ldebug_ranges0+0x770
	.byte	0x1
	.word	0x63e
	.long	0x6ce8
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x790
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST228
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x35f8
	.secrel32	Ldebug_ranges0+0x7b0
	.byte	0x1
	.word	0x643
	.long	0x6de9
	.uleb128 0x3d
	.long	0x361f
	.uleb128 0x3d
	.long	0x3613
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x7d8
	.uleb128 0x49
	.long	0x362d
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x45
	.long	0x363a
	.secrel32	LLST229
	.uleb128 0x45
	.long	0x3646
	.secrel32	LLST230
	.uleb128 0x45
	.long	0x365a
	.secrel32	LLST231
	.uleb128 0x45
	.long	0x3664
	.secrel32	LLST232
	.uleb128 0x6d
	.long	0x366e
	.long	L257
	.uleb128 0x48
	.long	0x2d27
	.long	LBB1601
	.long	LBE1601
	.byte	0x1
	.word	0x613
	.long	0x6d64
	.uleb128 0x44
	.long	LBB1602
	.long	LBE1602
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST233
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x2d27
	.secrel32	Ldebug_ranges0+0x810
	.byte	0x1
	.word	0x611
	.long	0x6d80
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x828
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x5f
	.secrel32	Ldebug_ranges0+0x840
	.long	0x6dc3
	.uleb128 0x45
	.long	0x367c
	.secrel32	LLST234
	.uleb128 0x43
	.long	0x2ded
	.long	LBB1608
	.long	LBE1608
	.byte	0x1
	.word	0x60b
	.uleb128 0x50
	.long	0x2d27
	.long	LBB1610
	.long	LBE1610
	.byte	0x1
	.byte	0xa9
	.uleb128 0x44
	.long	LBB1611
	.long	LBE1611
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2d27
	.long	LBB1612
	.long	LBE1612
	.byte	0x1
	.word	0x608
	.uleb128 0x44
	.long	LBB1613
	.long	LBE1613
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST235
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x52
	.long	0x2d27
	.secrel32	Ldebug_ranges0+0x858
	.byte	0x1
	.word	0x645
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x870
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST236
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
	.ascii "inject_rmode_irq\0"
	.byte	0x1
	.word	0x50e
	.byte	0x1
	.byte	0x1
	.long	0x6f3a
	.uleb128 0x38
	.secrel32	LASF29
	.byte	0x1
	.word	0x50d
	.long	0x18bb
	.uleb128 0x36
	.ascii "irq\0"
	.byte	0x1
	.word	0x50d
	.long	0xe9
	.uleb128 0x2d
	.ascii "ent\0"
	.byte	0x1
	.word	0x50f
	.long	0x6f3a
	.uleb128 0x2d
	.ascii "cs\0"
	.byte	0x1
	.word	0x510
	.long	0x14f
	.uleb128 0x2d
	.ascii "ip\0"
	.byte	0x1
	.word	0x511
	.long	0x14f
	.uleb128 0x39
	.secrel32	LASF17
	.byte	0x1
	.word	0x512
	.long	0x281
	.uleb128 0x2d
	.ascii "ss_base\0"
	.byte	0x1
	.word	0x513
	.long	0x281
	.uleb128 0x2d
	.ascii "sp\0"
	.byte	0x1
	.word	0x514
	.long	0x14f
	.uleb128 0x2d
	.ascii "ss_limit\0"
	.byte	0x1
	.word	0x515
	.long	0x15a
	.uleb128 0x32
	.long	0x6ea0
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x6ead
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x6ebc
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x6ecb
	.uleb128 0x33
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x6ed8
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x6ee5
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x6ef2
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x6eff
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x6f0c
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.long	0x6f1c
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x32
	.long	0x6f29
	.uleb128 0x33
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x3e
	.secrel32	LASF35
	.long	0x7f5d
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.3338
	.byte	0x0
	.uleb128 0x13
	.long	0x14f
	.long	0x6f4a
	.uleb128 0x14
	.long	0x59d
	.byte	0x1
	.byte	0x0
	.uleb128 0x57
	.byte	0x1
	.ascii "vmx_vcpu_run\0"
	.byte	0x1
	.word	0x757
	.byte	0x1
	.long	0xe9
	.long	LFB197
	.long	LFE197
	.secrel32	LLST237
	.long	0x799a
	.uleb128 0x55
	.secrel32	LASF29
	.byte	0x1
	.word	0x756
	.long	0x18bb
	.secrel32	LLST238
	.uleb128 0x55
	.secrel32	LASF6
	.byte	0x1
	.word	0x756
	.long	0x289b
	.secrel32	LLST239
	.uleb128 0x4f
	.ascii "fail\0"
	.byte	0x1
	.word	0x758
	.long	0x145
	.secrel32	LLST240
	.uleb128 0x2d
	.ascii "fs_sel\0"
	.byte	0x1
	.word	0x759
	.long	0x14f
	.uleb128 0x2d
	.ascii "gs_sel\0"
	.byte	0x1
	.word	0x759
	.long	0x14f
	.uleb128 0x4f
	.ascii "ldt_sel\0"
	.byte	0x1
	.word	0x759
	.long	0x14f
	.secrel32	LLST241
	.uleb128 0x4f
	.ascii "fs_gs_ldt_reload_needed\0"
	.byte	0x1
	.word	0x75a
	.long	0xe9
	.secrel32	LLST242
	.uleb128 0x4f
	.ascii "r\0"
	.byte	0x1
	.word	0x75b
	.long	0xe9
	.secrel32	LLST243
	.uleb128 0x69
	.ascii "again\0"
	.byte	0x1
	.word	0x87c
	.long	L267
	.uleb128 0x48
	.long	0x3254
	.long	LBB1783
	.long	LBE1783
	.byte	0x1
	.word	0x764
	.long	0x7038
	.uleb128 0x44
	.long	LBB1784
	.long	LBE1784
	.uleb128 0x34
	.long	0x326a
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x3277
	.long	LBB1785
	.long	LBE1785
	.byte	0x1
	.word	0x765
	.long	0x705c
	.uleb128 0x44
	.long	LBB1786
	.long	LBE1786
	.uleb128 0x34
	.long	0x328d
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x37bb
	.secrel32	Ldebug_ranges0+0x888
	.byte	0x1
	.word	0x780
	.long	0x7471
	.uleb128 0x3d
	.long	0x37e7
	.uleb128 0x3d
	.long	0x37db
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x8c8
	.uleb128 0x45
	.long	0x37f3
	.secrel32	LLST244
	.uleb128 0x5c
	.long	0x370f
	.secrel32	Ldebug_ranges0+0x908
	.byte	0x1
	.word	0x563
	.long	0x7388
	.uleb128 0x3d
	.long	0x372b
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x940
	.uleb128 0x34
	.long	0x3737
	.uleb128 0x34
	.long	0x374a
	.uleb128 0x45
	.long	0x375c
	.secrel32	LLST245
	.uleb128 0x5c
	.long	0x6e06
	.secrel32	Ldebug_ranges0+0x978
	.byte	0x1
	.word	0x547
	.long	0x72f9
	.uleb128 0x3d
	.long	0x6e2d
	.uleb128 0x3d
	.long	0x6e21
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x998
	.uleb128 0x49
	.long	0x6e39
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x49
	.long	0x6e45
	.byte	0x3
	.byte	0x74
	.sleb128 86
	.uleb128 0x49
	.long	0x6e50
	.byte	0x3
	.byte	0x74
	.sleb128 84
	.uleb128 0x45
	.long	0x6e5b
	.secrel32	LLST246
	.uleb128 0x45
	.long	0x6e67
	.secrel32	LLST247
	.uleb128 0x45
	.long	0x6e77
	.secrel32	LLST248
	.uleb128 0x49
	.long	0x6e82
	.byte	0x1
	.byte	0x50
	.uleb128 0x5c
	.long	0x2d27
	.secrel32	Ldebug_ranges0+0x9d8
	.byte	0x1
	.word	0x528
	.long	0x7131
	.uleb128 0x3d
	.long	0x2d3f
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0x9f0
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST249
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB1806
	.long	LBE1806
	.byte	0x1
	.word	0x527
	.long	0x715e
	.uleb128 0x3d
	.long	0x2d3f
	.uleb128 0x44
	.long	LBB1807
	.long	LBE1807
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST250
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB1808
	.long	LBE1808
	.byte	0x1
	.word	0x526
	.long	0x718b
	.uleb128 0x3d
	.long	0x2d3f
	.uleb128 0x44
	.long	LBB1809
	.long	LBE1809
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST251
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB1810
	.long	LBE1810
	.byte	0x1
	.word	0x513
	.long	0x71b4
	.uleb128 0x3d
	.long	0x2d3f
	.uleb128 0x44
	.long	LBB1811
	.long	LBE1811
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB1812
	.long	LBE1812
	.byte	0x1
	.word	0x514
	.long	0x71e1
	.uleb128 0x3d
	.long	0x2d3f
	.uleb128 0x44
	.long	LBB1813
	.long	LBE1813
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST252
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x2ded
	.secrel32	Ldebug_ranges0+0xa08
	.byte	0x1
	.word	0x515
	.long	0x7213
	.uleb128 0x3d
	.long	0x2e06
	.uleb128 0x53
	.long	0x2d27
	.secrel32	Ldebug_ranges0+0xa20
	.byte	0x1
	.byte	0xa9
	.uleb128 0x3d
	.long	0x2d3f
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0xa38
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2ded
	.long	LBB1822
	.long	LBE1822
	.byte	0x1
	.word	0x518
	.long	0x7255
	.uleb128 0x3d
	.long	0x2e06
	.uleb128 0x50
	.long	0x2d27
	.long	LBB1824
	.long	LBE1824
	.byte	0x1
	.byte	0xa9
	.uleb128 0x3d
	.long	0x2d3f
	.uleb128 0x44
	.long	LBB1825
	.long	LBE1825
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST253
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB1826
	.long	LBE1826
	.byte	0x1
	.word	0x518
	.long	0x7282
	.uleb128 0x3d
	.long	0x2d3f
	.uleb128 0x44
	.long	LBB1827
	.long	LBE1827
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST254
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB1828
	.long	LBE1828
	.byte	0x1
	.word	0x518
	.long	0x72af
	.uleb128 0x3d
	.long	0x2d3f
	.uleb128 0x44
	.long	LBB1829
	.long	LBE1829
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST255
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2eaa
	.long	LBB1830
	.long	LBE1830
	.byte	0x1
	.word	0x534
	.long	0x72ce
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x43
	.long	0x2d27
	.long	LBB1832
	.long	LBE1832
	.byte	0x1
	.word	0x537
	.uleb128 0x3d
	.long	0x2d3f
	.uleb128 0x44
	.long	LBB1833
	.long	LBE1833
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST256
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x36ba
	.long	LBB1841
	.long	LBE1841
	.byte	0x1
	.word	0x53d
	.long	0x7317
	.uleb128 0x6e
	.long	0x36cd
	.secrel32	LLST257
	.byte	0x0
	.uleb128 0x48
	.long	0x36ba
	.long	LBB1843
	.long	LBE1843
	.byte	0x1
	.word	0x53c
	.long	0x7335
	.uleb128 0x6e
	.long	0x36cd
	.secrel32	LLST258
	.byte	0x0
	.uleb128 0x5c
	.long	0x36da
	.secrel32	Ldebug_ranges0+0xa50
	.byte	0x1
	.word	0x542
	.long	0x7350
	.uleb128 0x3d
	.long	0x36f7
	.uleb128 0x3d
	.long	0x36ed
	.byte	0x0
	.uleb128 0x5c
	.long	0x36da
	.secrel32	Ldebug_ranges0+0xa68
	.byte	0x1
	.word	0x544
	.long	0x736b
	.uleb128 0x3d
	.long	0x36f7
	.uleb128 0x3d
	.long	0x36ed
	.byte	0x0
	.uleb128 0x43
	.long	0x2e49
	.long	LBB1853
	.long	LBE1853
	.byte	0x1
	.word	0x54b
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB1859
	.long	LBE1859
	.byte	0x1
	.word	0x559
	.long	0x73b0
	.uleb128 0x44
	.long	LBB1860
	.long	LBE1860
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST259
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2ded
	.long	LBB1861
	.long	LBE1861
	.byte	0x1
	.word	0x559
	.long	0x73e8
	.uleb128 0x50
	.long	0x2d27
	.long	LBB1863
	.long	LBE1863
	.byte	0x1
	.byte	0xa9
	.uleb128 0x44
	.long	LBB1864
	.long	LBE1864
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST260
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2ded
	.long	LBB1865
	.long	LBE1865
	.byte	0x1
	.word	0x55d
	.long	0x7420
	.uleb128 0x50
	.long	0x2d27
	.long	LBB1867
	.long	LBE1867
	.byte	0x1
	.byte	0xa9
	.uleb128 0x44
	.long	LBB1868
	.long	LBE1868
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST261
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2ded
	.long	LBB1870
	.long	LBE1870
	.byte	0x1
	.word	0x565
	.long	0x7454
	.uleb128 0x50
	.long	0x2d27
	.long	LBB1872
	.long	LBE1872
	.byte	0x1
	.byte	0xa9
	.uleb128 0x44
	.long	LBB1873
	.long	LBE1873
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2e49
	.long	LBB1874
	.long	LBE1874
	.byte	0x1
	.word	0x56e
	.uleb128 0x3d
	.long	0x2e6a
	.uleb128 0x3d
	.long	0x2e5f
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x3797
	.long	LBB1882
	.long	LBE1882
	.byte	0x1
	.word	0x766
	.long	0x7495
	.uleb128 0x44
	.long	LBB1883
	.long	LBE1883
	.uleb128 0x34
	.long	0x37ae
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x2eaa
	.secrel32	Ldebug_ranges0+0xa88
	.byte	0x1
	.word	0x770
	.long	0x74b0
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x48
	.long	0x2eaa
	.long	LBB1888
	.long	LBE1888
	.byte	0x1
	.word	0x771
	.long	0x74cf
	.uleb128 0x3d
	.long	0x2ecb
	.uleb128 0x3d
	.long	0x2ec0
	.byte	0x0
	.uleb128 0x48
	.long	0x32bb
	.long	LBB1890
	.long	LBE1890
	.byte	0x1
	.word	0x77b
	.long	0x753d
	.uleb128 0x44
	.long	LBB1891
	.long	LBE1891
	.uleb128 0x34
	.long	0x32d6
	.uleb128 0x34
	.long	0x32e3
	.uleb128 0x49
	.long	0x32ef
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x34
	.long	0x32fb
	.uleb128 0x48
	.long	0x2cbe
	.long	LBB1892
	.long	LBE1892
	.byte	0x2
	.word	0x16e
	.long	0x752b
	.uleb128 0x44
	.long	LBB1893
	.long	LBE1893
	.uleb128 0x45
	.long	0x2cd5
	.secrel32	LLST262
	.byte	0x0
	.byte	0x0
	.uleb128 0x63
	.long	0x2ce0
	.long	LBB1894
	.long	LBE1894
	.byte	0x2
	.word	0x175
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x331d
	.long	LBB1896
	.long	LBE1896
	.byte	0x1
	.word	0x77c
	.long	0x75ab
	.uleb128 0x44
	.long	LBB1897
	.long	LBE1897
	.uleb128 0x34
	.long	0x3338
	.uleb128 0x34
	.long	0x3345
	.uleb128 0x49
	.long	0x3351
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x34
	.long	0x335d
	.uleb128 0x48
	.long	0x2d05
	.long	LBB1898
	.long	LBE1898
	.byte	0x2
	.word	0x181
	.long	0x7599
	.uleb128 0x44
	.long	LBB1899
	.long	LBE1899
	.uleb128 0x45
	.long	0x2d1c
	.secrel32	LLST263
	.byte	0x0
	.byte	0x0
	.uleb128 0x63
	.long	0x2ce0
	.long	LBB1900
	.long	LBE1900
	.byte	0x2
	.word	0x188
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x38a6
	.secrel32	Ldebug_ranges0+0xaa0
	.byte	0x1
	.word	0x783
	.long	0x763f
	.uleb128 0x3d
	.long	0x38c4
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0xab8
	.uleb128 0x34
	.long	0x38d0
	.uleb128 0x63
	.long	0x2f4c
	.long	LBB1905
	.long	LBE1905
	.byte	0x1
	.word	0x57a
	.uleb128 0x63
	.long	0x2f4c
	.long	LBB1907
	.long	LBE1907
	.byte	0x1
	.word	0x579
	.uleb128 0x63
	.long	0x2f4c
	.long	LBB1909
	.long	LBE1909
	.byte	0x1
	.word	0x578
	.uleb128 0x63
	.long	0x2f4c
	.long	LBB1911
	.long	LBE1911
	.byte	0x1
	.word	0x577
	.uleb128 0x44
	.long	LBB1913
	.long	LBE1913
	.uleb128 0x45
	.long	0x38e1
	.secrel32	LLST264
	.uleb128 0x43
	.long	0x2d27
	.long	LBB1914
	.long	LBE1914
	.byte	0x1
	.word	0x57f
	.uleb128 0x44
	.long	LBB1915
	.long	LBE1915
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x63
	.long	0x3902
	.long	LBB1917
	.long	LBE1917
	.byte	0x1
	.word	0x785
	.uleb128 0x63
	.long	0x3923
	.long	LBB1919
	.long	LBE1919
	.byte	0x1
	.word	0x786
	.uleb128 0x63
	.long	0x3902
	.long	LBB1921
	.long	LBE1921
	.byte	0x1
	.word	0x84c
	.uleb128 0x63
	.long	0x3923
	.long	LBB1923
	.long	LBE1923
	.byte	0x1
	.word	0x84d
	.uleb128 0x48
	.long	0x2ded
	.long	LBB1925
	.long	LBE1925
	.byte	0x1
	.word	0x84e
	.long	0x76b7
	.uleb128 0x50
	.long	0x2d27
	.long	LBB1927
	.long	LBE1927
	.byte	0x1
	.byte	0xa9
	.uleb128 0x44
	.long	LBB1928
	.long	LBE1928
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST265
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x3212
	.long	LBB1929
	.long	LBE1929
	.byte	0x1
	.word	0x853
	.long	0x76df
	.uleb128 0x44
	.long	LBB1930
	.long	LBE1930
	.uleb128 0x45
	.long	0x3228
	.secrel32	LLST266
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x3233
	.long	LBB1931
	.long	LBE1931
	.byte	0x1
	.word	0x853
	.long	0x7707
	.uleb128 0x44
	.long	LBB1932
	.long	LBE1932
	.uleb128 0x45
	.long	0x3249
	.secrel32	LLST267
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x39dd
	.secrel32	Ldebug_ranges0+0xad0
	.byte	0x1
	.word	0x868
	.long	0x77c3
	.uleb128 0x3d
	.long	0x3a07
	.uleb128 0x3d
	.long	0x39fb
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0xb00
	.uleb128 0x45
	.long	0x3a13
	.secrel32	LLST268
	.uleb128 0x45
	.long	0x3a2a
	.secrel32	LLST269
	.uleb128 0x34
	.long	0x3a36
	.uleb128 0x5c
	.long	0x2ded
	.secrel32	Ldebug_ranges0+0xb28
	.byte	0x1
	.word	0x72c
	.long	0x7765
	.uleb128 0x53
	.long	0x2d27
	.secrel32	Ldebug_ranges0+0xb40
	.byte	0x1
	.byte	0xa9
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0xb58
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x2ded
	.secrel32	Ldebug_ranges0+0xb70
	.byte	0x1
	.word	0x72d
	.long	0x778d
	.uleb128 0x53
	.long	0x2d27
	.secrel32	Ldebug_ranges0+0xb88
	.byte	0x1
	.byte	0xa9
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0xba0
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2ded
	.long	LBB1953
	.long	LBE1953
	.byte	0x1
	.word	0x736
	.uleb128 0x50
	.long	0x2d27
	.long	LBB1955
	.long	LBE1955
	.byte	0x1
	.byte	0xa9
	.uleb128 0x44
	.long	LBB1956
	.long	LBE1956
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST270
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x3abc
	.long	LBB1960
	.long	LBE1960
	.byte	0x1
	.word	0x874
	.long	0x7806
	.uleb128 0x3d
	.long	0x3af3
	.uleb128 0x3d
	.long	0x3ae7
	.uleb128 0x43
	.long	0x2d27
	.long	LBB1962
	.long	LBE1962
	.byte	0x1
	.word	0x74d
	.uleb128 0x44
	.long	LBB1963
	.long	LBE1963
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST271
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x3a7e
	.long	LBB1964
	.long	LBE1964
	.byte	0x1
	.word	0x876
	.long	0x7849
	.uleb128 0x3d
	.long	0x3aa6
	.uleb128 0x3d
	.long	0x3a9a
	.uleb128 0x43
	.long	0x2d27
	.long	LBB1966
	.long	LBE1966
	.byte	0x1
	.word	0x6e5
	.uleb128 0x44
	.long	LBB1967
	.long	LBE1967
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST272
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x3a7e
	.secrel32	Ldebug_ranges0+0xbb8
	.byte	0x1
	.word	0x880
	.long	0x7888
	.uleb128 0x3d
	.long	0x3aa6
	.uleb128 0x3d
	.long	0x3a9a
	.uleb128 0x43
	.long	0x2d27
	.long	LBB1971
	.long	LBE1971
	.byte	0x1
	.word	0x6e5
	.uleb128 0x44
	.long	LBB1972
	.long	LBE1972
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST273
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x3947
	.long	LBB1975
	.long	LBE1975
	.byte	0x1
	.word	0x838
	.long	0x78a2
	.uleb128 0x3d
	.long	0x395a
	.byte	0x0
	.uleb128 0x48
	.long	0x3967
	.long	LBB1977
	.long	LBE1977
	.byte	0x1
	.word	0x839
	.long	0x78bc
	.uleb128 0x3d
	.long	0x3979
	.byte	0x0
	.uleb128 0x48
	.long	0x3986
	.long	LBB1979
	.long	LBE1979
	.byte	0x1
	.word	0x83f
	.long	0x78d6
	.uleb128 0x3d
	.long	0x3998
	.byte	0x0
	.uleb128 0x48
	.long	0x39a5
	.long	LBB1981
	.long	LBE1981
	.byte	0x1
	.word	0x845
	.long	0x7922
	.uleb128 0x44
	.long	LBB1982
	.long	LBE1982
	.uleb128 0x49
	.long	0x39ba
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x34
	.long	0x39c6
	.uleb128 0x63
	.long	0x2dba
	.long	LBB1983
	.long	LBE1983
	.byte	0x1
	.word	0x163
	.uleb128 0x63
	.long	0x2ddb
	.long	LBB1985
	.long	LBE1985
	.byte	0x1
	.word	0x166
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2ded
	.long	LBB1992
	.long	LBE1992
	.byte	0x1
	.word	0x859
	.long	0x795a
	.uleb128 0x50
	.long	0x2d27
	.long	LBB1994
	.long	LBE1994
	.byte	0x1
	.byte	0xa9
	.uleb128 0x44
	.long	LBB1995
	.long	LBE1995
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST274
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x3a7e
	.long	LBB1996
	.long	LBE1996
	.byte	0x1
	.word	0x86f
	.uleb128 0x3d
	.long	0x3aa6
	.uleb128 0x3d
	.long	0x3a9a
	.uleb128 0x43
	.long	0x2d27
	.long	LBB1998
	.long	LBE1998
	.byte	0x1
	.word	0x6e5
	.uleb128 0x44
	.long	LBB1999
	.long	LBE1999
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST275
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x5b
	.ascii "handle_cr\0"
	.byte	0x1
	.word	0x657
	.byte	0x1
	.long	0xe9
	.long	LFB186
	.long	LFE186
	.secrel32	LLST276
	.long	0x7cc2
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x656
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x42
	.secrel32	LASF6
	.byte	0x1
	.word	0x656
	.long	0x289b
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x5d
	.secrel32	LASF37
	.byte	0x1
	.word	0x658
	.long	0x165
	.secrel32	LLST277
	.uleb128 0x4f
	.ascii "cr\0"
	.byte	0x1
	.word	0x659
	.long	0xe9
	.secrel32	LLST278
	.uleb128 0x51
	.ascii "reg\0"
	.byte	0x1
	.word	0x65a
	.long	0xe9
	.byte	0x2
	.byte	0x74
	.sleb128 12
	.uleb128 0x5c
	.long	0x2d7f
	.secrel32	Ldebug_ranges0+0xbd0
	.byte	0x1
	.word	0x65c
	.long	0x7a61
	.uleb128 0x3d
	.long	0x2d98
	.uleb128 0x5e
	.long	0x2d27
	.secrel32	Ldebug_ranges0+0xbe8
	.byte	0x1
	.byte	0xb1
	.long	0x7a3d
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0xc00
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST279
	.byte	0x0
	.byte	0x0
	.uleb128 0x50
	.long	0x2d27
	.long	LBB2007
	.long	LBE2007
	.byte	0x1
	.byte	0xb1
	.uleb128 0x44
	.long	LBB2008
	.long	LBE2008
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST280
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2ed7
	.long	LBB2011
	.long	LBE2011
	.byte	0x1
	.word	0x663
	.long	0x7ac7
	.uleb128 0x3d
	.long	0x3c91
	.uleb128 0x48
	.long	0x2d27
	.long	LBB2013
	.long	LBE2013
	.byte	0x1
	.word	0x1d0
	.long	0x7aa2
	.uleb128 0x44
	.long	LBB2014
	.long	LBE2014
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST281
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2d27
	.long	LBB2015
	.long	LBE2015
	.byte	0x1
	.word	0x1d1
	.uleb128 0x44
	.long	LBB2016
	.long	LBE2016
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST282
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2ed7
	.long	LBB2017
	.long	LBE2017
	.byte	0x1
	.word	0x67b
	.long	0x7b2d
	.uleb128 0x3d
	.long	0x3c91
	.uleb128 0x48
	.long	0x2d27
	.long	LBB2019
	.long	LBE2019
	.byte	0x1
	.word	0x1d0
	.long	0x7b08
	.uleb128 0x44
	.long	LBB2020
	.long	LBE2020
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST283
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2d27
	.long	LBB2021
	.long	LBE2021
	.byte	0x1
	.word	0x1d1
	.uleb128 0x44
	.long	LBB2022
	.long	LBE2022
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST284
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2ed7
	.long	LBB2023
	.long	LBE2023
	.byte	0x1
	.word	0x668
	.long	0x7b93
	.uleb128 0x3d
	.long	0x3c91
	.uleb128 0x48
	.long	0x2d27
	.long	LBB2025
	.long	LBE2025
	.byte	0x1
	.word	0x1d0
	.long	0x7b6e
	.uleb128 0x44
	.long	LBB2026
	.long	LBE2026
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST285
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2d27
	.long	LBB2027
	.long	LBE2027
	.byte	0x1
	.word	0x1d1
	.uleb128 0x44
	.long	LBB2028
	.long	LBE2028
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST286
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2ed7
	.long	LBB2029
	.long	LBE2029
	.byte	0x1
	.word	0x672
	.long	0x7bf9
	.uleb128 0x3d
	.long	0x3c91
	.uleb128 0x48
	.long	0x2d27
	.long	LBB2031
	.long	LBE2031
	.byte	0x1
	.word	0x1d0
	.long	0x7bd4
	.uleb128 0x44
	.long	LBB2032
	.long	LBE2032
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST287
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2d27
	.long	LBB2033
	.long	LBE2033
	.byte	0x1
	.word	0x1d1
	.uleb128 0x44
	.long	LBB2034
	.long	LBE2034
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST288
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2ed7
	.long	LBB2035
	.long	LBE2035
	.byte	0x1
	.word	0x683
	.long	0x7c5f
	.uleb128 0x3d
	.long	0x3c91
	.uleb128 0x48
	.long	0x2d27
	.long	LBB2037
	.long	LBE2037
	.byte	0x1
	.word	0x1d0
	.long	0x7c3a
	.uleb128 0x44
	.long	LBB2038
	.long	LBE2038
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST289
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2d27
	.long	LBB2039
	.long	LBE2039
	.byte	0x1
	.word	0x1d1
	.uleb128 0x44
	.long	LBB2040
	.long	LBE2040
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST290
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2ed7
	.long	LBB2041
	.long	LBE2041
	.byte	0x1
	.word	0x66d
	.uleb128 0x3d
	.long	0x3c91
	.uleb128 0x48
	.long	0x2d27
	.long	LBB2043
	.long	LBE2043
	.byte	0x1
	.word	0x1d0
	.long	0x7c9c
	.uleb128 0x44
	.long	LBB2044
	.long	LBE2044
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST291
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.long	0x2d27
	.long	LBB2045
	.long	LBE2045
	.byte	0x1
	.word	0x1d1
	.uleb128 0x44
	.long	LBB2046
	.long	LBE2046
	.uleb128 0x45
	.long	0x2d4a
	.secrel32	LLST292
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x5b
	.ascii "handle_vmcall\0"
	.byte	0x1
	.word	0x709
	.byte	0x1
	.long	0xe9
	.long	LFB194
	.long	LFE194
	.secrel32	LLST293
	.long	0x7d08
	.uleb128 0x42
	.secrel32	LASF29
	.byte	0x1
	.word	0x708
	.long	0x18bb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x42
	.secrel32	LASF6
	.byte	0x1
	.word	0x708
	.long	0x289b
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0x0
	.uleb128 0x5b
	.ascii "handle_exception\0"
	.byte	0x1
	.word	0x59a
	.byte	0x1
	.long	0xe9
	.long	LFB180
	.long	LFE180
	.secrel32	LLST294
	.long	0x7f33
	.uleb128 0x55
	.secrel32	LASF29
	.byte	0x1
	.word	0x599
	.long	0x18bb
	.secrel32	LLST295
	.uleb128 0x42
	.secrel32	LASF6
	.byte	0x1
	.word	0x599
	.long	0x289b
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x5d
	.secrel32	LASF30
	.byte	0x1
	.word	0x59b
	.long	0x15a
	.secrel32	LLST296
	.uleb128 0x5d
	.secrel32	LASF1
	.byte	0x1
	.word	0x59b
	.long	0x15a
	.secrel32	LLST297
	.uleb128 0x4f
	.ascii "cr2\0"
	.byte	0x1
	.word	0x59c
	.long	0x281
	.secrel32	LLST298
	.uleb128 0x4f
	.ascii "rip\0"
	.byte	0x1
	.word	0x59c
	.long	0x281
	.secrel32	LLST299
	.uleb128 0x5d
	.secrel32	LASF38
	.byte	0x1
	.word	0x59d
	.long	0x15a
	.secrel32	LLST300
	.uleb128 0x2d
	.ascii "er\0"
	.byte	0x1
	.word	0x59e
	.long	0x28c4
	.uleb128 0x4f
	.ascii "r\0"
	.byte	0x1
	.word	0x59f
	.long	0xe9
	.secrel32	LLST301
	.uleb128 0x5c
	.long	0x2ded
	.secrel32	Ldebug_ranges0+0xc18
	.byte	0x1
	.word	0x5a3
	.long	0x7de2
	.uleb128 0x53
	.long	0x2d27
	.secrel32	Ldebug_ranges0+0xc30
	.byte	0x1
	.byte	0xa9
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0xc48
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x2ded
	.secrel32	Ldebug_ranges0+0xc60
	.byte	0x1
	.word	0x5a4
	.long	0x7e0a
	.uleb128 0x53
	.long	0x2d27
	.secrel32	Ldebug_ranges0+0xc78
	.byte	0x1
	.byte	0xa9
	.uleb128 0x54
	.secrel32	Ldebug_ranges0+0xc90
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB2063
	.long	LBE2063
	.byte	0x1
	.word	0x5b9
	.long	0x7e2e
	.uleb128 0x44
	.long	LBB2064
	.long	LBE2064
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2ded
	.long	LBB2065
	.long	LBE2065
	.byte	0x1
	.word	0x5bb
	.long	0x7e62
	.uleb128 0x50
	.long	0x2d27
	.long	LBB2067
	.long	LBE2067
	.byte	0x1
	.byte	0xa9
	.uleb128 0x44
	.long	LBB2068
	.long	LBE2068
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x2d27
	.long	LBB2069
	.long	LBE2069
	.byte	0x1
	.word	0x5bd
	.long	0x7e86
	.uleb128 0x44
	.long	LBB2070
	.long	LBE2070
	.uleb128 0x34
	.long	0x2d4a
	.byte	0x0
	.byte	0x0
	.uleb128 0x5c
	.long	0x3b91
	.secrel32	Ldebug_ranges0+0xca8
	.byte	0x1
	.word	0x5c1
	.long	0x7ea6
	.uleb128 0x3d
	.long	0x3bca
	.uleb128 0x3d
	.long	0x3bbe
	.uleb128 0x3d
	.long	0x3bb2
	.byte	0x0
	.uleb128 0x48
	.long	0x3bd8
	.long	LBB2075
	.long	LBE2075
	.byte	0x1
	.word	0x5e1
	.long	0x7eca
	.uleb128 0x3d
	.long	0x3c15
	.uleb128 0x3d
	.long	0x3c09
	.uleb128 0x3d
	.long	0x3bfd
	.byte	0x0
	.uleb128 0x61
	.long	LBB2078
	.long	LBE2078
	.long	0x7f22
	.uleb128 0x4f
	.ascii "irq\0"
	.byte	0x1
	.word	0x5ad
	.long	0xe9
	.secrel32	LLST302
	.uleb128 0x48
	.long	0x3b66
	.long	LBB2079
	.long	LBE2079
	.byte	0x1
	.word	0x5ae
	.long	0x7f06
	.uleb128 0x3d
	.long	0x3b83
	.uleb128 0x3d
	.long	0x3b78
	.byte	0x0
	.uleb128 0x43
	.long	0x3b66
	.long	LBB2081
	.long	LBE2081
	.byte	0x1
	.word	0x5af
	.uleb128 0x3d
	.long	0x3b83
	.uleb128 0x3d
	.long	0x3b78
	.byte	0x0
	.byte	0x0
	.uleb128 0x3e
	.secrel32	LASF35
	.long	0x7f43
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	___FUNCTION__.3455
	.byte	0x0
	.uleb128 0x13
	.long	0x5ac
	.long	0x7f43
	.uleb128 0x14
	.long	0x59d
	.byte	0x10
	.byte	0x0
	.uleb128 0x3b
	.long	0x7f33
	.uleb128 0x13
	.long	0x5ac
	.long	0x7f58
	.uleb128 0x14
	.long	0x59d
	.byte	0xf
	.byte	0x0
	.uleb128 0x3b
	.long	0x7f48
	.uleb128 0x3b
	.long	0x7f33
	.uleb128 0x13
	.long	0x5ac
	.long	0x7f72
	.uleb128 0x14
	.long	0x59d
	.byte	0x13
	.byte	0x0
	.uleb128 0x3b
	.long	0x7f62
	.uleb128 0x13
	.long	0x5ac
	.long	0x7f87
	.uleb128 0x14
	.long	0x59d
	.byte	0x14
	.byte	0x0
	.uleb128 0x3b
	.long	0x7f77
	.uleb128 0x3b
	.long	0x7f48
	.uleb128 0x13
	.long	0x5ac
	.long	0x7fa1
	.uleb128 0x14
	.long	0x59d
	.byte	0xe
	.byte	0x0
	.uleb128 0x3b
	.long	0x7f91
	.uleb128 0x13
	.long	0x5ac
	.long	0x7fb6
	.uleb128 0x14
	.long	0x59d
	.byte	0x15
	.byte	0x0
	.uleb128 0x3b
	.long	0x7fa6
	.uleb128 0x3b
	.long	0x7f91
	.uleb128 0x3b
	.long	0x7f91
	.uleb128 0x13
	.long	0x5ac
	.long	0x7fd5
	.uleb128 0x14
	.long	0x59d
	.byte	0x8
	.byte	0x0
	.uleb128 0x3b
	.long	0x7fc5
	.uleb128 0x13
	.long	0x1ebb
	.long	0x7fea
	.uleb128 0x14
	.long	0x59d
	.byte	0x0
	.byte	0x0
	.uleb128 0x68
	.ascii "g_vmxarea_\0"
	.byte	0x1
	.byte	0x2e
	.long	0x7fda
	.byte	0x5
	.byte	0x3
	.long	_g_vmxarea_
	.uleb128 0x68
	.ascii "g_current_vmcs_\0"
	.byte	0x1
	.byte	0x2f
	.long	0x7fda
	.byte	0x5
	.byte	0x3
	.long	_g_current_vmcs_
	.uleb128 0x6f
	.secrel32	LASF27
	.byte	0x1
	.byte	0x3c
	.long	0x2b66
	.byte	0x5
	.byte	0x3
	.long	_vmcs_descriptor
	.uleb128 0x13
	.long	0x2ba0
	.long	0x8040
	.uleb128 0x14
	.long	0x59d
	.byte	0x7
	.byte	0x0
	.uleb128 0x68
	.ascii "kvm_vmx_segment_fields\0"
	.byte	0x1
	.byte	0x4b
	.long	0x8030
	.byte	0x5
	.byte	0x3
	.long	_kvm_vmx_segment_fields
	.uleb128 0x13
	.long	0x15a
	.long	0x8074
	.uleb128 0x14
	.long	0x59d
	.byte	0x1
	.byte	0x0
	.uleb128 0x68
	.ascii "vmx_msr_index\0"
	.byte	0x1
	.byte	0x56
	.long	0x808f
	.byte	0x5
	.byte	0x3
	.long	_vmx_msr_index
	.uleb128 0x3b
	.long	0x8064
	.uleb128 0x13
	.long	0x28a1
	.long	0x80a4
	.uleb128 0x14
	.long	0x59d
	.byte	0x20
	.byte	0x0
	.uleb128 0x51
	.ascii "kvm_vmx_exit_handlers\0"
	.byte	0x1
	.word	0x713
	.long	0x80c8
	.byte	0x5
	.byte	0x3
	.long	_kvm_vmx_exit_handlers
	.uleb128 0x3b
	.long	0x8094
	.uleb128 0x70
	.ascii "kvm_vmx_max_exit_handlers\0"
	.byte	0x1
	.word	0x723
	.long	0x80f0
	.byte	0x21
	.uleb128 0x3b
	.long	0xe9
	.uleb128 0x51
	.ascii "vmx_arch_ops\0"
	.byte	0x1
	.word	0x8dc
	.long	0x2319
	.byte	0x5
	.byte	0x3
	.long	_vmx_arch_ops
	.uleb128 0x71
	.ascii "current\0"
	.byte	0x3
	.byte	0x68
	.long	0x8121
	.byte	0x1
	.byte	0x1
	.uleb128 0x6
	.byte	0x4
	.long	0x494
	.uleb128 0x72
	.secrel32	LASF18
	.byte	0x4
	.word	0x19a
	.long	0x21d1
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
	.uleb128 0x10
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x4
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
	.uleb128 0x1a
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0x13
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
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
	.uleb128 0x28
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
	.uleb128 0xb
	.byte	0x0
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
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.uleb128 0x31
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
	.uleb128 0x32
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.uleb128 0xb
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x34
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
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
	.uleb128 0x36
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
	.uleb128 0x37
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
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
	.uleb128 0x39
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
	.uleb128 0x3a
	.uleb128 0x26
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x3d
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3e
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
	.uleb128 0x3f
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
	.uleb128 0x40
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x41
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
	.uleb128 0x42
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
	.uleb128 0x43
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
	.uleb128 0x44
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x45
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
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
	.uleb128 0xa
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
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
	.uleb128 0x49
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x4a
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
	.uleb128 0xa
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x4c
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
	.uleb128 0x4d
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
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x4f
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
	.uleb128 0x50
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
	.uleb128 0x51
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
	.uleb128 0x52
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
	.uleb128 0x53
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
	.uleb128 0x54
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x55
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
	.uleb128 0x56
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x57
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
	.uleb128 0x58
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
	.uleb128 0x5a
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
	.uleb128 0x5b
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
	.uleb128 0x5c
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
	.uleb128 0x5d
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
	.uleb128 0x5e
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
	.uleb128 0x5f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x60
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
	.uleb128 0x61
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
	.uleb128 0x62
	.uleb128 0x1d
	.byte	0x0
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
	.uleb128 0x63
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
	.uleb128 0x64
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
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x65
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
	.uleb128 0x66
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x67
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
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x68
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
	.uleb128 0x69
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
	.uleb128 0x6a
	.uleb128 0x1d
	.byte	0x0
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
	.uleb128 0x6b
	.uleb128 0x2e
	.byte	0x0
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x6c
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
	.uleb128 0x6d
	.uleb128 0xa
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x6e
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x6f
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x70
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x71
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x72
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
	.byte	0x0
	.section	.debug_pubnames,"dr"
	.long	0x39
	.word	0x2
	.secrel32	Ldebug_info0
	.long	0x8136
	.long	0x4290
	.ascii "vmx_exit\0"
	.long	0x42aa
	.ascii "vmx_init\0"
	.long	0x6f4a
	.ascii "vmx_vcpu_run\0"
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
	.long	LBB853-Ltext0
	.long	LBE853-Ltext0
	.long	LBB860-Ltext0
	.long	LBE860-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB855-Ltext0
	.long	LBE855-Ltext0
	.long	LBB858-Ltext0
	.long	LBE858-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB856-Ltext0
	.long	LBE856-Ltext0
	.long	LBB857-Ltext0
	.long	LBE857-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB873-Ltext0
	.long	LBE873-Ltext0
	.long	LBB880-Ltext0
	.long	LBE880-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB875-Ltext0
	.long	LBE875-Ltext0
	.long	LBB878-Ltext0
	.long	LBE878-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB876-Ltext0
	.long	LBE876-Ltext0
	.long	LBB877-Ltext0
	.long	LBE877-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB897-Ltext0
	.long	LBE897-Ltext0
	.long	LBB900-Ltext0
	.long	LBE900-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB903-Ltext0
	.long	LBE903-Ltext0
	.long	LBB906-Ltext0
	.long	LBE906-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB907-Ltext0
	.long	LBE907-Ltext0
	.long	LBB914-Ltext0
	.long	LBE914-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB909-Ltext0
	.long	LBE909-Ltext0
	.long	LBB912-Ltext0
	.long	LBE912-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB910-Ltext0
	.long	LBE910-Ltext0
	.long	LBB911-Ltext0
	.long	LBE911-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB931-Ltext0
	.long	LBE931-Ltext0
	.long	LBB934-Ltext0
	.long	LBE934-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB937-Ltext0
	.long	LBE937-Ltext0
	.long	LBB946-Ltext0
	.long	LBE946-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB939-Ltext0
	.long	LBE939-Ltext0
	.long	LBB942-Ltext0
	.long	LBE942-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB940-Ltext0
	.long	LBE940-Ltext0
	.long	LBB941-Ltext0
	.long	LBE941-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB947-Ltext0
	.long	LBE947-Ltext0
	.long	LBB954-Ltext0
	.long	LBE954-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB959-Ltext0
	.long	LBE959-Ltext0
	.long	LBB962-Ltext0
	.long	LBE962-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB960-Ltext0
	.long	LBE960-Ltext0
	.long	LBB961-Ltext0
	.long	LBE961-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB997-Ltext0
	.long	LBE997-Ltext0
	.long	LBB1006-Ltext0
	.long	LBE1006-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB998-Ltext0
	.long	LBE998-Ltext0
	.long	LBB1005-Ltext0
	.long	LBE1005-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1011-Ltext0
	.long	LBE1011-Ltext0
	.long	LBB1014-Ltext0
	.long	LBE1014-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1067-Ltext0
	.long	LBE1067-Ltext0
	.long	LBB1070-Ltext0
	.long	LBE1070-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1071-Ltext0
	.long	LBE1071-Ltext0
	.long	LBB1078-Ltext0
	.long	LBE1078-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1073-Ltext0
	.long	LBE1073-Ltext0
	.long	LBB1076-Ltext0
	.long	LBE1076-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1074-Ltext0
	.long	LBE1074-Ltext0
	.long	LBB1075-Ltext0
	.long	LBE1075-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1085-Ltext0
	.long	LBE1085-Ltext0
	.long	LBB1088-Ltext0
	.long	LBE1088-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1086-Ltext0
	.long	LBE1086-Ltext0
	.long	LBB1087-Ltext0
	.long	LBE1087-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1091-Ltext0
	.long	LBE1091-Ltext0
	.long	LBB1094-Ltext0
	.long	LBE1094-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1095-Ltext0
	.long	LBE1095-Ltext0
	.long	LBB1102-Ltext0
	.long	LBE1102-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1097-Ltext0
	.long	LBE1097-Ltext0
	.long	LBB1100-Ltext0
	.long	LBE1100-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1098-Ltext0
	.long	LBE1098-Ltext0
	.long	LBB1099-Ltext0
	.long	LBE1099-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1103-Ltext0
	.long	LBE1103-Ltext0
	.long	LBB1106-Ltext0
	.long	LBE1106-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1107-Ltext0
	.long	LBE1107-Ltext0
	.long	LBB1112-Ltext0
	.long	LBE1112-Ltext0
	.long	LBB1111-Ltext0
	.long	LBE1111-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1119-Ltext0
	.long	LBE1119-Ltext0
	.long	LBB1122-Ltext0
	.long	LBE1122-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1120-Ltext0
	.long	LBE1120-Ltext0
	.long	LBB1121-Ltext0
	.long	LBE1121-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1123-Ltext0
	.long	LBE1123-Ltext0
	.long	LBB1140-Ltext0
	.long	LBE1140-Ltext0
	.long	LBB1139-Ltext0
	.long	LBE1139-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1125-Ltext0
	.long	LBE1125-Ltext0
	.long	LBB1138-Ltext0
	.long	LBE1138-Ltext0
	.long	LBB1124-Ltext0
	.long	LBE1124-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1127-Ltext0
	.long	LBE1127-Ltext0
	.long	LBB1137-Ltext0
	.long	LBE1137-Ltext0
	.long	LBB1126-Ltext0
	.long	LBE1126-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1131-Ltext0
	.long	LBE1131-Ltext0
	.long	LBB1135-Ltext0
	.long	LBE1135-Ltext0
	.long	LBB1130-Ltext0
	.long	LBE1130-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1141-Ltext0
	.long	LBE1141-Ltext0
	.long	LBB1144-Ltext0
	.long	LBE1144-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1142-Ltext0
	.long	LBE1142-Ltext0
	.long	LBB1143-Ltext0
	.long	LBE1143-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1305-Ltext0
	.long	LBE1305-Ltext0
	.long	LBB1485-Ltext0
	.long	LBE1485-Ltext0
	.long	LBB1484-Ltext0
	.long	LBE1484-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1307-Ltext0
	.long	LBE1307-Ltext0
	.long	LBB1325-Ltext0
	.long	LBE1325-Ltext0
	.long	LBB1306-Ltext0
	.long	LBE1306-Ltext0
	.long	LBB1324-Ltext0
	.long	LBE1324-Ltext0
	.long	LBB1323-Ltext0
	.long	LBE1323-Ltext0
	.long	LBB1322-Ltext0
	.long	LBE1322-Ltext0
	.long	LBB1321-Ltext0
	.long	LBE1321-Ltext0
	.long	LBB1320-Ltext0
	.long	LBE1320-Ltext0
	.long	LBB1319-Ltext0
	.long	LBE1319-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1308-Ltext0
	.long	LBE1308-Ltext0
	.long	LBB1311-Ltext0
	.long	LBE1311-Ltext0
	.long	LBB1310-Ltext0
	.long	LBE1310-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1312-Ltext0
	.long	LBE1312-Ltext0
	.long	LBB1315-Ltext0
	.long	LBE1315-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1313-Ltext0
	.long	LBE1313-Ltext0
	.long	LBB1314-Ltext0
	.long	LBE1314-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1317-Ltext0
	.long	LBE1317-Ltext0
	.long	LBB1318-Ltext0
	.long	LBE1318-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1400-Ltext0
	.long	LBE1400-Ltext0
	.long	LBB1405-Ltext0
	.long	LBE1405-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1406-Ltext0
	.long	LBE1406-Ltext0
	.long	LBB1411-Ltext0
	.long	LBE1411-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1428-Ltext0
	.long	LBE1428-Ltext0
	.long	LBB1433-Ltext0
	.long	LBE1433-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1446-Ltext0
	.long	LBE1446-Ltext0
	.long	LBB1456-Ltext0
	.long	LBE1456-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1447-Ltext0
	.long	LBE1447-Ltext0
	.long	LBB1450-Ltext0
	.long	LBE1450-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1448-Ltext0
	.long	LBE1448-Ltext0
	.long	LBB1449-Ltext0
	.long	LBE1449-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1451-Ltext0
	.long	LBE1451-Ltext0
	.long	LBB1457-Ltext0
	.long	LBE1457-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1458-Ltext0
	.long	LBE1458-Ltext0
	.long	LBB1459-Ltext0
	.long	LBE1459-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1486-Ltext0
	.long	LBE1486-Ltext0
	.long	LBB1496-Ltext0
	.long	LBE1496-Ltext0
	.long	LBB1490-Ltext0
	.long	LBE1490-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1488-Ltext0
	.long	LBE1488-Ltext0
	.long	LBB1489-Ltext0
	.long	LBE1489-Ltext0
	.long	LBB1487-Ltext0
	.long	LBE1487-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1491-Ltext0
	.long	LBE1491-Ltext0
	.long	LBB1499-Ltext0
	.long	LBE1499-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1492-Ltext0
	.long	LBE1492-Ltext0
	.long	LBB1495-Ltext0
	.long	LBE1495-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1502-Ltext0
	.long	LBE1502-Ltext0
	.long	LBB1507-Ltext0
	.long	LBE1507-Ltext0
	.long	LBB1506-Ltext0
	.long	LBE1506-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1504-Ltext0
	.long	LBE1504-Ltext0
	.long	LBB1505-Ltext0
	.long	LBE1505-Ltext0
	.long	LBB1503-Ltext0
	.long	LBE1503-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1524-Ltext0
	.long	LBE1524-Ltext0
	.long	LBB1532-Ltext0
	.long	LBE1532-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1537-Ltext0
	.long	LBE1537-Ltext0
	.long	LBB1538-Ltext0
	.long	LBE1538-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1550-Ltext0
	.long	LBE1550-Ltext0
	.long	LBB1554-Ltext0
	.long	LBE1554-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1555-Ltext0
	.long	LBE1555-Ltext0
	.long	LBB1569-Ltext0
	.long	LBE1569-Ltext0
	.long	LBB1568-Ltext0
	.long	LBE1568-Ltext0
	.long	LBB1567-Ltext0
	.long	LBE1567-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1560-Ltext0
	.long	LBE1560-Ltext0
	.long	LBB1566-Ltext0
	.long	LBE1566-Ltext0
	.long	LBB1556-Ltext0
	.long	LBE1556-Ltext0
	.long	LBB1565-Ltext0
	.long	LBE1565-Ltext0
	.long	LBB1557-Ltext0
	.long	LBE1557-Ltext0
	.long	LBB1558-Ltext0
	.long	LBE1558-Ltext0
	.long	LBB1559-Ltext0
	.long	LBE1559-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1562-Ltext0
	.long	LBE1562-Ltext0
	.long	LBB1564-Ltext0
	.long	LBE1564-Ltext0
	.long	LBB1561-Ltext0
	.long	LBE1561-Ltext0
	.long	LBB1563-Ltext0
	.long	LBE1563-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1578-Ltext0
	.long	LBE1578-Ltext0
	.long	LBB1593-Ltext0
	.long	LBE1593-Ltext0
	.long	LBB1588-Ltext0
	.long	LBE1588-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1584-Ltext0
	.long	LBE1584-Ltext0
	.long	LBB1583-Ltext0
	.long	LBE1583-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1585-Ltext0
	.long	LBE1585-Ltext0
	.long	LBB1586-Ltext0
	.long	LBE1586-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1589-Ltext0
	.long	LBE1589-Ltext0
	.long	LBB1595-Ltext0
	.long	LBE1595-Ltext0
	.long	LBB1594-Ltext0
	.long	LBE1594-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1591-Ltext0
	.long	LBE1591-Ltext0
	.long	LBB1592-Ltext0
	.long	LBE1592-Ltext0
	.long	LBB1590-Ltext0
	.long	LBE1590-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1596-Ltext0
	.long	LBE1596-Ltext0
	.long	LBB1623-Ltext0
	.long	LBE1623-Ltext0
	.long	LBB1621-Ltext0
	.long	LBE1621-Ltext0
	.long	LBB1617-Ltext0
	.long	LBE1617-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1600-Ltext0
	.long	LBE1600-Ltext0
	.long	LBB1616-Ltext0
	.long	LBE1616-Ltext0
	.long	LBB1597-Ltext0
	.long	LBE1597-Ltext0
	.long	LBB1615-Ltext0
	.long	LBE1615-Ltext0
	.long	LBB1598-Ltext0
	.long	LBE1598-Ltext0
	.long	LBB1599-Ltext0
	.long	LBE1599-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1604-Ltext0
	.long	LBE1604-Ltext0
	.long	LBB1603-Ltext0
	.long	LBE1603-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1605-Ltext0
	.long	LBE1605-Ltext0
	.long	LBB1606-Ltext0
	.long	LBE1606-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1607-Ltext0
	.long	LBE1607-Ltext0
	.long	LBB1614-Ltext0
	.long	LBE1614-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1618-Ltext0
	.long	LBE1618-Ltext0
	.long	LBB1622-Ltext0
	.long	LBE1622-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1619-Ltext0
	.long	LBE1619-Ltext0
	.long	LBB1620-Ltext0
	.long	LBE1620-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1787-Ltext0
	.long	LBE1787-Ltext0
	.long	LBB2000-Ltext0
	.long	LBE2000-Ltext0
	.long	LBB1991-Ltext0
	.long	LBE1991-Ltext0
	.long	LBB1989-Ltext0
	.long	LBE1989-Ltext0
	.long	LBB1974-Ltext0
	.long	LBE1974-Ltext0
	.long	LBB1902-Ltext0
	.long	LBE1902-Ltext0
	.long	LBB1881-Ltext0
	.long	LBE1881-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1791-Ltext0
	.long	LBE1791-Ltext0
	.long	LBB1880-Ltext0
	.long	LBE1880-Ltext0
	.long	LBB1788-Ltext0
	.long	LBE1788-Ltext0
	.long	LBB1879-Ltext0
	.long	LBE1879-Ltext0
	.long	LBB1789-Ltext0
	.long	LBE1789-Ltext0
	.long	LBB1878-Ltext0
	.long	LBE1878-Ltext0
	.long	LBB1790-Ltext0
	.long	LBE1790-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1794-Ltext0
	.long	LBE1794-Ltext0
	.long	LBB1877-Ltext0
	.long	LBE1877-Ltext0
	.long	LBB1792-Ltext0
	.long	LBE1792-Ltext0
	.long	LBB1876-Ltext0
	.long	LBE1876-Ltext0
	.long	LBB1869-Ltext0
	.long	LBE1869-Ltext0
	.long	LBB1793-Ltext0
	.long	LBE1793-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1797-Ltext0
	.long	LBE1797-Ltext0
	.long	LBB1858-Ltext0
	.long	LBE1858-Ltext0
	.long	LBB1795-Ltext0
	.long	LBE1795-Ltext0
	.long	LBB1857-Ltext0
	.long	LBE1857-Ltext0
	.long	LBB1796-Ltext0
	.long	LBE1796-Ltext0
	.long	LBB1856-Ltext0
	.long	LBE1856-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1799-Ltext0
	.long	LBE1799-Ltext0
	.long	LBB1855-Ltext0
	.long	LBE1855-Ltext0
	.long	LBB1798-Ltext0
	.long	LBE1798-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1801-Ltext0
	.long	LBE1801-Ltext0
	.long	LBB1838-Ltext0
	.long	LBE1838-Ltext0
	.long	LBB1837-Ltext0
	.long	LBE1837-Ltext0
	.long	LBB1836-Ltext0
	.long	LBE1836-Ltext0
	.long	LBB1835-Ltext0
	.long	LBE1835-Ltext0
	.long	LBB1800-Ltext0
	.long	LBE1800-Ltext0
	.long	LBB1834-Ltext0
	.long	LBE1834-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1803-Ltext0
	.long	LBE1803-Ltext0
	.long	LBB1802-Ltext0
	.long	LBE1802-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1804-Ltext0
	.long	LBE1804-Ltext0
	.long	LBB1805-Ltext0
	.long	LBE1805-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1814-Ltext0
	.long	LBE1814-Ltext0
	.long	LBB1821-Ltext0
	.long	LBE1821-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1816-Ltext0
	.long	LBE1816-Ltext0
	.long	LBB1819-Ltext0
	.long	LBE1819-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1817-Ltext0
	.long	LBE1817-Ltext0
	.long	LBB1818-Ltext0
	.long	LBE1818-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1845-Ltext0
	.long	LBE1845-Ltext0
	.long	LBB1840-Ltext0
	.long	LBE1840-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1848-Ltext0
	.long	LBE1848-Ltext0
	.long	LBB1839-Ltext0
	.long	LBE1839-Ltext0
	.long	LBB1852-Ltext0
	.long	LBE1852-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1884-Ltext0
	.long	LBE1884-Ltext0
	.long	LBB1887-Ltext0
	.long	LBE1887-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1903-Ltext0
	.long	LBE1903-Ltext0
	.long	LBB1988-Ltext0
	.long	LBE1988-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1904-Ltext0
	.long	LBE1904-Ltext0
	.long	LBB1916-Ltext0
	.long	LBE1916-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1933-Ltext0
	.long	LBE1933-Ltext0
	.long	LBB1987-Ltext0
	.long	LBE1987-Ltext0
	.long	LBB1968-Ltext0
	.long	LBE1968-Ltext0
	.long	LBB1959-Ltext0
	.long	LBE1959-Ltext0
	.long	LBB1958-Ltext0
	.long	LBE1958-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1936-Ltext0
	.long	LBE1936-Ltext0
	.long	LBB1957-Ltext0
	.long	LBE1957-Ltext0
	.long	LBB1934-Ltext0
	.long	LBE1934-Ltext0
	.long	LBB1935-Ltext0
	.long	LBE1935-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1937-Ltext0
	.long	LBE1937-Ltext0
	.long	LBB1944-Ltext0
	.long	LBE1944-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1939-Ltext0
	.long	LBE1939-Ltext0
	.long	LBB1942-Ltext0
	.long	LBE1942-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1940-Ltext0
	.long	LBE1940-Ltext0
	.long	LBB1941-Ltext0
	.long	LBE1941-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1945-Ltext0
	.long	LBE1945-Ltext0
	.long	LBB1952-Ltext0
	.long	LBE1952-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1947-Ltext0
	.long	LBE1947-Ltext0
	.long	LBB1950-Ltext0
	.long	LBE1950-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1948-Ltext0
	.long	LBE1948-Ltext0
	.long	LBB1949-Ltext0
	.long	LBE1949-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB1969-Ltext0
	.long	LBE1969-Ltext0
	.long	LBB1990-Ltext0
	.long	LBE1990-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB2001-Ltext0
	.long	LBE2001-Ltext0
	.long	LBB2010-Ltext0
	.long	LBE2010-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB2003-Ltext0
	.long	LBE2003-Ltext0
	.long	LBB2006-Ltext0
	.long	LBE2006-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB2004-Ltext0
	.long	LBE2004-Ltext0
	.long	LBB2005-Ltext0
	.long	LBE2005-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB2047-Ltext0
	.long	LBE2047-Ltext0
	.long	LBB2054-Ltext0
	.long	LBE2054-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB2049-Ltext0
	.long	LBE2049-Ltext0
	.long	LBB2052-Ltext0
	.long	LBE2052-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB2050-Ltext0
	.long	LBE2050-Ltext0
	.long	LBB2051-Ltext0
	.long	LBE2051-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB2055-Ltext0
	.long	LBE2055-Ltext0
	.long	LBB2062-Ltext0
	.long	LBE2062-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB2057-Ltext0
	.long	LBE2057-Ltext0
	.long	LBB2060-Ltext0
	.long	LBE2060-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB2058-Ltext0
	.long	LBE2058-Ltext0
	.long	LBB2059-Ltext0
	.long	LBE2059-Ltext0
	.long	0x0
	.long	0x0
	.long	LBB2071-Ltext0
	.long	LBE2071-Ltext0
	.long	LBB2083-Ltext0
	.long	LBE2083-Ltext0
	.long	LBB2074-Ltext0
	.long	LBE2074-Ltext0
	.long	0x0
	.long	0x0
	.section	.debug_str,"dr"
LASF24:
	.ascii "hardware_unsetup\0"
LASF14:
	.ascii "vmcs\0"
LASF34:
	.ascii "Xgt_desc\0"
LASF27:
	.ascii "vmcs_descriptor\0"
LASF3:
	.ascii "value\0"
LASF22:
	.ascii "hardware_disable\0"
LASF1:
	.ascii "error_code\0"
LASF19:
	.ascii "tlb_flush\0"
LASF4:
	.ascii "phys_addr\0"
LASF18:
	.ascii "kvm_stat\0"
LASF13:
	.ascii "vmcs_field\0"
LASF9:
	.ascii "limit\0"
LASF35:
	.ascii "__FUNCTION__\0"
LASF38:
	.ascii "vect_info\0"
LASF17:
	.ascii "flags\0"
LASF37:
	.ascii "exit_qualification\0"
LASF10:
	.ascii "selector\0"
LASF0:
	.ascii "systemVA\0"
LASF2:
	.ascii "address\0"
LASF15:
	.ascii "revision_id\0"
LASF28:
	.ascii "field\0"
LASF6:
	.ascii "kvm_run\0"
LASF25:
	.ascii "set_guest_debug\0"
LASF32:
	.ascii "__val\0"
LASF29:
	.ascii "vcpu\0"
LASF36:
	.ascii "err_code\0"
LASF5:
	.ascii "data\0"
LASF20:
	.ascii "cpu_has_kvm_support\0"
LASF21:
	.ascii "hardware_enable\0"
LASF33:
	.ascii "base_address\0"
LASF7:
	.ascii "exit_reason\0"
LASF30:
	.ascii "intr_info\0"
LASF31:
	.ascii "host_tsc\0"
LASF11:
	.ascii "enabled\0"
LASF12:
	.ascii "singlestep\0"
LASF26:
	.ascii "skip_emulated_instruction\0"
LASF23:
	.ascii "hardware_setup\0"
LASF39:
	.ascii "msr_index\0"
LASF8:
	.ascii "apic_base\0"
LASF16:
	.ascii "base_gfn\0"
	.def	_kvm_mmu_free_some_pages;	.scl	2;	.type	32;	.endef
	.def	_gfn_to_memslot;	.scl	2;	.type	32;	.endef
	.def	_segment_base;	.scl	2;	.type	32;	.endef
	.def	_smp_call_function_single;	.scl	2;	.type	32;	.endef
	.def	_get_cpu;	.scl	2;	.type	32;	.endef
	.def	_put_cpu;	.scl	2;	.type	32;	.endef
	.def	_kvm_get_msr_common;	.scl	2;	.type	32;	.endef
	.def	_kvm_set_msr_common;	.scl	2;	.type	32;	.endef
	.def	___pa;	.scl	2;	.type	32;	.endef
	.def	_check_ensure_vmx;	.scl	2;	.type	32;	.endef
	.def	_get_order;	.scl	2;	.type	32;	.endef
	.def	_cpu_to_node;	.scl	2;	.type	32;	.endef
	.def	_alloc_pages_node;	.scl	2;	.type	32;	.endef
	.def	_page_address;	.scl	2;	.type	32;	.endef
	.def	_raw_smp_processor_id;	.scl	2;	.type	32;	.endef
	.def	_free_pages;	.scl	2;	.type	32;	.endef
	.def	_first_cpu;	.scl	2;	.type	32;	.endef
	.def	_get_nr_cpus;	.scl	2;	.type	32;	.endef
	.def	_next_cpu;	.scl	2;	.type	32;	.endef
	.def	_kmap_atomic;	.scl	2;	.type	32;	.endef
	.def	_kunmap_atomic;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_fx_init;	.scl	2;	.type	32;	.endef
	.def	_kvm_write_guest;	.scl	2;	.type	32;	.endef
	.def	_spin_lock;	.scl	2;	.type	32;	.endef
	.def	_emulate_instruction;	.scl	2;	.type	32;	.endef
	.def	_spin_unlock;	.scl	2;	.type	32;	.endef
	.def	_kvm_read_guest;	.scl	2;	.type	32;	.endef
	.def	_set_cr0;	.scl	2;	.type	32;	.endef
	.def	_set_cr3;	.scl	2;	.type	32;	.endef
	.def	_set_cr4;	.scl	2;	.type	32;	.endef
	.def	_set_cr8;	.scl	2;	.type	32;	.endef
	.def	_lmsw;	.scl	2;	.type	32;	.endef
	.def	_kvm_hypercall;	.scl	2;	.type	32;	.endef
	.def	_local_irq_disable;	.scl	2;	.type	32;	.endef
	.def	_local_irq_enable;	.scl	2;	.type	32;	.endef
	.def	_save_msrs;	.scl	2;	.type	32;	.endef
	.def	_load_msrs;	.scl	2;	.type	32;	.endef
	.def	_signal_pending;	.scl	2;	.type	32;	.endef
	.def	_kvm_resched;	.scl	2;	.type	32;	.endef
	.def	_printk;	.scl	2;	.type	32;	.endef
	.def	_on_each_cpu;	.scl	2;	.type	32;	.endef
	.def	_kmalloc;	.scl	2;	.type	32;	.endef
	.def	_kfree;	.scl	2;	.type	32;	.endef
	.def	_test_call;	.scl	2;	.type	32;	.endef
	.def	_test_size;	.scl	2;	.type	32;	.endef
	.def	_test_nullcheck;	.scl	2;	.type	32;	.endef
	.def	_check_page_compatible;	.scl	2;	.type	32;	.endef
	.def	_kvm_init_arch;	.scl	2;	.type	32;	.endef
	.def	_kvm_exit_arch;	.scl	2;	.type	32;	.endef
	.def	_kvm_vmx_fake_return;	.scl	2;	.type	32;	.endef
