.section	.data
output:
	.asciz "The Vendor ID of your machine is %s\n"
.section	.bss
	.comm buffer,100,4
.section	.text
.globl _start
.type _start,@function
_start:
	movl $0,%eax
	cpuid
	movl $buffer,%edi #	%edi holds base address of global var buffer
	movl %ebx,(%edi)
	movl %edx,4(%edi)
	movl %ecx,8(%edi)
	#push printf params on to the stack
	pushl $buffer
	pushl $output
	call printf
	addl $8,%esp	#clear stack params
	pushl $0
	call exit


