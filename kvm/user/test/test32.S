.code32

.text

1:
	mov $0x12, %al
	out %al, $0x80
	jmp 1b
