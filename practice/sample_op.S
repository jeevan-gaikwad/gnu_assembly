	.file	"sample.c"
	.globl	i
	.data
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.long	50
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	movl	i, %eax
	addl	$10, %eax
	movl	%eax, i
	movl	i, %eax
	movl	%eax, (%esp)
	call	exit
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
