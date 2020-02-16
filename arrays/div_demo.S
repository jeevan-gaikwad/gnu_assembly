.section	.rodata
p_str1:
	.string "Division of %d and %d is:%f Reminder is:%d no of args are:%d\n"
p_usage_str:
	.string "Error: please suppy two nos for division.\n"
p_str2:
	.string "Reminder is:%f quotient is:%f\n"

.section	.text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	subl $32,%esp
	#read no of cmd args
	movl 4(%ebp),%eax
	cmpl $3,%eax
	jne usage_error
	#convert string to integer
	movl 12(%ebp),%eax #argv[1] bcz argv[0] is program name
	movl %eax,(%esp)
	call atoi
	movl %eax,-4(%ebp)

	movl 16(%ebp),%eax
	movl %eax,(%esp)
	call atoi
	movl %eax,-8(%ebp)	#stored in 2nd local var
	#perform divison 
	#movl -4(%ebp),%eax
	#movl -8(%ebp),%ebx
	movl $12,%eax
	movl $2,%ebx
	cltd
	idivl %ebx
	#movl %edx,16(%esp)
	#movl %eax,12(%esp)
	movl %eax,8(%esp)
	movl %edx,4(%esp)
	movl $p_str2,(%esp)
	call printf
	jmp exit_prog
usage_error:
	pushl $p_usage_str
	call printf
	addl $4,%esp

exit_prog:
	movl %ebp,%esp
	popl %ebp
	movl -12(%esp),%eax
	pushl %eax
	call exit
	
