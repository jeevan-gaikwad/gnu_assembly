	.file	"string_demo.c"
	.globl	msg
	.section	.rodata
.LC0:
	.string	"Hello World!"
	.data
	.align 4
	.type	msg, @object
	.size	msg, 4
msg:
	.long	.LC0
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
