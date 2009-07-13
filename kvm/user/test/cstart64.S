

.bss

	. = . + 4096
	.align 16
stacktop:

	. = . + 4096
	.align 16
ring0stacktop:

.data
		
.align 4096
ptl2:
i = 0
	.rept 512
	.quad 0x1e7 | (i << 21)
	i = i + 1
	.endr

.align 4096
ptl3:
	.quad ptl2 + 7

.align 4096
ptl4:
	.quad ptl3 + 7
	
.align 4096

gdt64_desc:
	.word gdt64_end - gdt64 - 1
	.quad gdt64

gdt64:
	.quad 0
	.quad 0x00af9b000000ffff # 64-bit code segment
	.quad 0x00cf93000000ffff # 64-bit data segment
	.quad 0x00affb000000ffff # 64-bit code segment (user)
	.quad 0x00cff3000000ffff # 64-bit data segment (user)
tss_descr:	
	.quad 0x000089000000ffff # 64-bit avail tss
	.quad 0                  # tss high addr
gdt64_end:

tss:
	.long 0
	.quad ring0stacktop
	.quad 0, 0, 0
	.quad 0, 0, 0, 0, 0, 0, 0, 0
	.long 0, 0, 0
			
.section .init

.code32
	lgdt gdt64_desc
	
	mov %cr4, %eax
	bts $5, %eax  # pae
	mov %eax, %cr4

	mov $ptl4, %eax
	mov %eax, %cr3

efer = 0xc0000080
	mov $efer, %ecx
	rdmsr
	bts $8, %eax
	wrmsr

	mov %cr0, %eax
	bts $0, %eax
	bts $31, %eax
	mov %eax, %cr0
	
	jmpl $8, $start64

.code64
start64:	
	lea stacktop, %rsp
	mov $0, %eax
	mov %ax, %ss

	mov $tss, %rax
	mov %ax, tss_descr+2
	shr $16, %rax
	mov %al, tss_descr+4
	shr $8, %rax
	mov %al, tss_descr+7
	shr $8, %rax
	mov %eax, tss_descr+8
	mov $(tss_descr-gdt64), %rax
	ltr %ax
		
	call main
1:	hlt
	jmp 1b
	

