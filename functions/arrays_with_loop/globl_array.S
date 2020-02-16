.section	.data
.globl arr
.type arr,@object
.size arr,20
.align 4
arr:
	.int 10,20,30,40,50

.section	.rodata
p_str1:
	.string "arr[%d]:%d\n"

.section	.text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	subl $4,%esp
	#loop counter => -4(%ebp)
	movl $0,-4(%ebp)		#initialize loop counter
	jmp for_cond
for:
	movl -4(%ebp),%ecx
	pushl arr(,%ecx,4) # push value in array's index location
	pushl %ecx			#push value of counter
	pushl $p_str1		#push format string
	call printf
	addl $12,%esp			#clear the args 
	addl $1,-4(%ebp)	#increment counter

for_cond:
	movl -4(%ebp),%eax
	cmpl $5,%eax		#compare counter with arr size i.e. 5
	jl for				#if counter is less than 5, then jump to for label

	#after loop ends
	movl %ebp,%esp
	popl %ebp
	push $0
	call exit
