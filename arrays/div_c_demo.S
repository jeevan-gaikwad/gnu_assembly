	.file	"div_c_demo.c"
	.globl	num1
	.data
	.align 4
	.type	num1, @object
	.size	num1, 4
num1:
	.long	18
	.globl	num2
	.align 4
	.type	num2, @object
	.size	num2, 4
num2:
	.long	5
	.comm	result,4,4
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	num1, %eax
	movl	num2, %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	movl	%eax, result
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
