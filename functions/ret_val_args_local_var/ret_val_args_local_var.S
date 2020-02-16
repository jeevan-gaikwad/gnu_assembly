.section	.rodata
p_str2:
	.string "Sum of 10 and 20 returned by sum is:%d\n"
p_str3:
	.string "Parameters received from main are %d and %d Sum is:%d\n"
.section	.text
.globl main
.type main,@function
main:
	pushl $20
	pushl $10
	call sum
	movl %eax,%ebx
	addl $8,%esp #clear the args of sum
	pushl %ebx		#pass(push) sum to printf
	pushl $p_str2	#pass format string to printf
	call printf
	addl $8,%esp #clear arg to printf
	pushl $0
	call exit

.globl sum
.type sum,@function
sum:
	pushl %ebp	#save previous ebp
	movl %esp,%ebp 	#load ebp with our esp
	subl $4,%esp
	#copy passed args to %eax and % %ebx
	movl 8(%ebp),%eax	#8 instead of 4 bcz, we pushed ebp on to d stack
	movl 12(%ebp),%ebx
	addl %ebx,%eax
	movl %eax,-4(%ebp) #save result to local var
	pushl -4(%ebp)
	pushl 12(%ebp)
	pushl 8(%ebp)
	pushl $p_str3
	call printf
	addl $16,%esp
	movl -4(%ebp),%eax	#copy result from local var to %eax for return
	movl %ebp,%esp #clear local args
	popl %ebp #restore ebp
	ret
