.section	.rodata
p_str1:
	.string "In function fun v2\n"

.text
.globl main
.type main,@function
main:
	call fun
	subl $4,%esp
	movl $10,(%esp)
	#pushl $10
	call exit

fun:
	movl $p_str1, %ebx
	subl $4,%esp
	movl %ebx,(%esp)
	#pushl %ebx
	call printf
	addl $4, %esp
	ret
	
