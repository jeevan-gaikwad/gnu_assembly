.section	.rodata
p_str1:
	.string "number of args passed:%d\n"
p_str2:
	.string "Args are:"
p_str3:
	.string "%s\n"
.section	.text
.globl main
.type main,@function
main:
	push %ebp
	movl %esp,%ebp
	subl $8,%esp
	movl 4(%ebp),%eax
	movl %eax,4(%esp)
	movl $p_str1,(%esp)
	call printf
	
	movl %ebp,%esp
	popl %ebp
	pushl $0
	call exit
	ret
