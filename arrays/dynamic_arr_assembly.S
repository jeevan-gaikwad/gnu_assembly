.section	.rodata
p_err_str:
	.string "Error:Usage: %s <no_of_elements_in_array>\n"
p_str1:
	.string "Displaying array:\n"
p_str2:
	.string "arr[%d]:%d \n"
p_str3:
	.string "rand no 0 to 1K is:%d\n"
p_str4:
	.string "Seed set. Filling array with random numbers bet 0 to 1K..\n"
p_str5:
	.string "In for loop with i:%d\n"
.section	.text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	subl $32,%esp
	movl 4(%ebp),%eax
	cmpl $2,%eax
	jne usage_error
	movl 12(%ebp),%ebx
	movl %ebx,(%esp)
	call atoi
	movl %eax,-12(%ebp)  #no of elements in array
	movl $4,4(%esp)
	movl %eax,(%esp)
	call calloc
	movl %eax,-4(%ebp) #return address of array
	movl $0,(%esp)
	call time
	movl %eax,(%esp)  #ret val of time(0)
	call srand		  #set seed for random fun
	#movl $p_str4,(%esp)
	#call printf
    #for loop to fill array
	movl $0,-8(%ebp) #initilize i with 0
	jmp cond_for_1
for_loop1:
	#movl -8(%ebp),%ecx
	#movl %ecx ,4(%esp)
	#movl $p_str5,(%esp)
	#call printf
	call rand #will return random no in %eax
	movl -4(%ebp),%ebx #extract base add of arra
	movl -8(%ebp),%ecx		#extract counter i.e. i
	movl %eax,(%ebx,%ecx,4)	#move returned val of rand to array's ith location	
	#movl $1000,%ecx
	#divl %ecx
	#movl %edx,4(%esp)
	#movl $p_str3,(%esp)
	#call printf
	addl $1,-8(%ebp)	#i++
cond_for_1:	
	movl -8(%ebp),%eax
	movl -12(%ebp),%ecx
	cmpl %ecx,%eax
	jl for_loop1

	#display array
	movl $p_str1,(%esp)
	call printf
	movl $0,-8(%ebp)
	jmp cond_for_2
for_loop2:
	movl -8(%ebp),%ecx
	movl -4(%ebp),%ebx
	movl (%ebx,%ecx,4),%eax
	movl %eax,8(%esp)
	movl %ecx,4(%esp)
	movl $p_str2,(%esp)
	call printf
	addl $1,-8(%ebp)
cond_for_2:
	movl -8(%ebp),%eax
	movl -12(%ebp),%ecx
	cmpl %ecx,%eax
	jl for_loop2


	jmp exit_prog
usage_error:
	movl 8(%ebp),%ebx
	movl %ebx,4(%esp)
	movl $p_err_str,(%esp)
	call printf

exit_prog:
	movl %ebp,%esp
	popl %ebp
	pushl $0
	call exit
	ret
