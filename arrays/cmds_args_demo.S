.section	.rodata
p_str2:
	.string "No of args:%d args[0]:%s 	args[1]:%d args[2]:%d \n"

.section	.text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	subl $32,%esp
	movl 4(%ebp),%eax
	movl %eax,-4(%ebp) #no of args
	#converit first arg to integer
	movl 12(%ebp),%ebx #12 bcz first argv is prog name
	movl %ebx,(%esp)
	call atoi
	movl %eax,-8(%ebp)

	movl 16(%ebp),%ebx
	movl %ebx,(%esp)
	call atoi
	movl %eax,-12(%ebp)
	
	#display
	#push argv[3] i.e. local var 3
	movl -12(%ebp),%eax
	movl %eax,16(%esp)
	
	#push 2nd
	movl -8(%ebp),%eax
	movl %eax,12(%esp)

	#push 3rd
	movl 8(%ebp),%eax	#argv[0] is prog name
	movl %eax,8(%esp)
	
	movl -4(%ebp),%eax
	movl %eax,4(%esp)

	movl $p_str2,(%esp)
	call printf

	movl %ebp,%esp
	popl %ebp
	pushl $0
	call exit
