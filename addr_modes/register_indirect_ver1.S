.data
.globl num
.type num,@object
.size num,4
.align 4
num:
	.long 90
.text
.globl main
.type main,@function
main:
	movl $num,%ebx
	addl $10,(%ebx)
	movl %ebx,(%esp)
	call exit
