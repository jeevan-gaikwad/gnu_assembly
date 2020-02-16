.section	.rodata
p_str1:
	.string "In function fun\n"

.text
.globl main
.type main,@function
main:
	call fun
	pushl $10
	call exit

fun:
	movl $p_str1, %ebx
	pushl %ebx
	call printf
	addl $4, %esp
	ret
	
