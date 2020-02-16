.section	.rodata
p_str1:
	.string "In array_test_fun: received size of array:%d first_ele_of_arr:%d\n"
p_str2:
	.string "arr[%d]:%d\n"
.section	.text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	subl $32,%esp
	movl $5,(%esp)
	leal 12(%esp),%eax	#load address for 20 places of local array on the stack
	movl %eax,4(%esp);	#push local array address to stack for array_test_fun
	movl $11,12(%esp)
	movl $22,16(%esp)
	movl $33,20(%esp)
	movl $44,24(%esp)
	movl $55,28(%esp)
	call array_test_fun
	
	#exit prog
	movl %ebp,%esp
	popl %ebp
	pushl $0
	call exit

array_test_fun:
	pushl %ebp
	movl %esp,%ebp
	subl $32,%esp
	movl 8(%ebp),%eax
	movl %eax,4(%esp)
	movl 12(%ebp),%ebx
	movl %ebx,8(%esp)
	movl $p_str1,(%esp)
	call printf
	#for loop to display received array

	movl $0,-4(%ebp)
	jmp for_loop_cond
for_loop:
	movl -4(%ebp),%ecx
	movl 12(%ebp),%ebx #extract base adddrs of array
	leal (%ebx,%ecx,4),%eax #calculate offset
	movl (%eax),%eax
	movl %eax,8(%esp)
	movl %ecx,4(%esp)
	movl $p_str2,(%esp)
	call printf
	addl $1,-4(%ebp)	#i++

for_loop_cond:
	movl -4(%ebp),%ecx #extract i
	movl 8(%ebp), %eax #extract received size of array
	cmpl %eax,%ecx
	jl for_loop

	movl %ebp,%esp
	popl %ebp
	ret
