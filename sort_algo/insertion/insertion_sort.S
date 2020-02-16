.section	.rodata
p_str1:
	.string "\n"
p_str2:
	.string "%d "
p_str3:
	.string "Displaying sorted array:first ele is:%d\n"
p_str4:
	.string "Input array to insertion sort is:\n"
p_str5:
	.string "In insertion sort: arr size is:%d arr[0]:%d\n"
p_str6:
	.string "In for loop. j is:%d key is:%d i is:%d\n"
.section	.data
.globl arr
.type arr,@object
.size arr,20
.align 4
arr:
	.int 23,17,3,44,9
.section	.bss
	.comm i,4,4
	.comm j,4,4
	.comm key,4,4

.section 	.text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	subl $48,%esp
	leal 12(%esp),%eax
	movl %eax,-4(%ebp)
	movl $13,(%eax)
	movl $45,4(%eax)
	movl $7,8(%eax)
	movl $20,12(%eax)
	movl $25,16(%eax)
	movl %eax,4(%esp)
	movl $5,(%esp)
	call insertion_sort

#display sorted array
	movl -4(%ebp),%eax
	movl (%eax),%edx
	movl %edx,4(%esp)
	movl $p_str3,(%esp)
	call printf

	movl $0,i
	jmp display_for_cond
display_for:
	movl i,%ecx
	movl -4(%ebp),%eax
	movl (%eax,%ecx,4),%ebx
	movl %ebx,4(%esp)
	movl $p_str2,(%esp)
	call printf
	addl $1,i

display_for_cond:
	movl i,%ecx
	cmpl $5,%ecx
	jl display_for
	
	pushl $p_str1
	call printf
	add $4,%esp
#call insertion sort here
	
	movl %ebp,%esp
	popl %ebp
	pushl $0
	call exit
#main ends



	#insertion sort
.globl	insertion_sort
.type insertion_sort,@function
insertion_sort:
	pushl %ebp
	movl %esp,%ebp
	subl $32,%esp
	
	movl 12(%ebp),%eax		#extract base addr of arrat
	movl $0,%ecx
	movl (%eax,%ecx,4),%ebx
	#movl (%eax),%ebx
	movl %ebx,8(%esp)
	movl 8(%ebp),%ecx		#extract size of array
	movl %ecx,4(%esp)
	movl $p_str5,(%esp)
	call printf

	movl $1,-4(%ebp)	#-4(%ebp) is j
	jmp insrt_for_cond
insrt_for:
	movl -4(%ebp),%ebx
	movl 12(%ebp),%edx #12(%ebp) contains base addrs of array
	movl (%edx,%ebx,4),%eax
	#movl arr(,%ebx,4),%eax
	movl %eax,-12(%ebp)	#-12(%ebp) is key
	subl $1,%ebx
	movl %ebx,-8(%ebp)	#-8(%ebp) is i
	
insrt_while_loop:
	movl -8(%ebp),%ecx
	cmpl $-1,%ecx
	jle place_key
	movl 12(%ebp),%edx #12(%ebp) contains base addrs of array
	movl (%edx,%ecx,4),%eax
	movl -12(%ebp),%edx
	cmpl %edx,%eax
	jle place_key
	#entered in while loop
	movl -8(%ebp),%ecx
	addl $1,%ecx
	movl 12(%ebp),%edx
	movl %eax,(%edx,%ecx,4)
	subl $1,-8(%ebp)
	jmp insrt_while_loop
place_key:
	movl -8(%ebp),%ecx
	add $1,%ecx
	movl -12(%ebp),%eax
	movl 12(%ebp),%edx #12(%ebp) contains base addrs of array
	movl %eax,(%edx,%ecx,4)
	#increment for loop's j by 1
	addl $1,-4(%ebp)

insrt_for_cond:
	movl -4(%ebp),%ecx
	movl 8(%ebp),%ebx
	cmpl %ebx,%ecx
	jl insrt_for

	movl %ebp,%esp
	popl %ebp
	ret
#insertion sort ends

