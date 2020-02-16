.section	.rodata
p_str1:
	.string "In local_params_fun_test:param 1 is%d param2 is:%d\n"

.section	.text
.globl	main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp	
	subl $16,%esp
	movl $22,4(%esp)
	movl $11,(%esp)
	call local_params_fun_test

	movl %ebp,%esp
	popl %ebp
	pushl $0
	call exit
local_params_fun_test:
	pushl %ebp
	movl %esp,%ebp
	sub $16,%esp
	movl 8(%ebp),%eax
	movl 12(%ebp),%ebx
	movl %ebx,8(%esp)
	movl %eax,4(%esp)
	movl $p_str1,(%esp)
	call printf
	#clean up and return
	movl %ebp,%esp
	popl %ebp
	ret
