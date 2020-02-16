.section	.data
output:
	.ascii "The Vendor ID of your machine is 'xxxxxxxxxxxx'\n"
.section	.text
.globl _start
_start:
	movl $0,%eax	#input to cpuid instruction
	cpuid
	movl $output,%edi
	movl %ebx,34(%edi)	#extract output of cpuid instruction
	movl %edx,38(%edi)
	movl %ecx,42(%edi)

	#display output using Linux write sys call
	movl $4,%eax
	movl $1,%ebx
	movl $output,%ecx
	movl $48,%edx
	int $0x80		#invoke the sys call no 4(write sys call)
	movl $1,%eax
	movl $0,%ebx
	int $0x80
