.section	.rodata
p_str1:
	.string "In main\n"
p_str2:
	.string "In fun1:called by main\n"
p_str3:
	.string "In nested_fun: received 2 params %d and %d. Returning sum to caller\n"
p_str4:
	.string "Sum of 10 and 20 returned by nested fun is:%d\n"
.section	.text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	pushl $p_str1
	call printf
	addl $4,%esp
	
	#call fun1 . No args no ret val
	call fun1

	movl %ebp,%esp
	pop %ebp
	pushl $0
	call exit

.globl fun1
.type fun1,@function
fun1:
	pushl %ebp
	movl %esp,%ebp

	#print msg
	pushl $p_str2
	call printf
	addl $4,%esp
	
	#call nested_fun
	pushl $20
	pushl $10
	call nested_fun
	addl $8,%esp
	#display sum
	pushl %eax
	pushl $p_str4
	call printf
	addl $8,%esp

	movl %ebp,%esp
	pop %ebp
	ret

.globl nested_fun
.type nested_fun,@function
nested_fun:
	pushl %ebp
	movl %esp,%ebp
	
	#print msg
	pushl 12(%ebp)
	pushl 8(%ebp)
	pushl $p_str3
	call printf
	addl $12,%esp
	
	#perform additon and ret val in %eax
	movl 8(%ebp),%eax
	addl 12(%ebp),%eax
	
	movl %ebp,%esp
	pop %ebp
	ret
