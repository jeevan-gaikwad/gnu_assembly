.include	"linux.S"
.include	"asm_lang.S"
.include	"dll_defs.S"

.section	.rodata
p_list_beg:
	.string "[BEG]<->"
p_list_data:
	.string "[%d]<->"
p_list_end:
	.string "[END]\n"

.section	.text
.globl create_list
.type create_list,@function
create_list:
	pushl %ebp
	movl %esp,%ebp
	subl $16,%esp

	movl $0,arg1(%esp)
	call get_node
	cmpl $0,%eax
	je cl_exit_err
	movl %eax,prev(%eax)
	movl %eax,next(%eax)
	jmp cl_exit_s

cl_exit_err:
	movl $FAILURE,%eax
cl_exit_s:
	movl %ebp,%esp
	popl %ebp
	ret
.globl insert_beg
.type insert_beg,@function
.equ ib_list,p1
.equ ib_data,p2
.equ ib_new_node,loc1
insert_beg:
	pushl %ebp
	movl %esp,%ebp
	subl $16,%esp
	
	movl ib_list(%ebp),%ebx
	cmpl $0,%ebx
	je ib_exit_err
	movl ib_data(%ebp),%ecx
	movl %ecx,arg1(%esp)
	call get_node
	movl %eax,ib_new_node(%ebp)
	movl %ebx,arg1(%esp)
	movl %eax,arg2(%esp)
	call generic_insert
	movl $SUCCESS,%eax
	jmp ib_exit_s

ib_exit_err:
	movl $FAILURE,%eax

ib_exit_s:
	movl %ebp,%esp
	popl %ebp
	ret
.globl display_list
.type display_list,@function
.equ dl_list,p1
.equ dl_counter,loc1
display_list:
	pushl %ebp
	movl %esp,%ebp
	sub $16,%esp
	#initilize run with list->next
	movl dl_list(%ebp), %edx
	movl next(%edx),%ebx
	movl %ebx,dl_counter(%ebp)

	#display begining of list
	movl $p_list_beg,%eax
	movl %eax,arg1(%esp)
	call printf

	jmp dl_while_cond
dl_while_loop:
	movl dl_counter(%ebp),%ebx
	movl data(%ebx),%eax
	movl %eax,arg1(%esp)
	movl $p_list_data,%ecx
	movl %ecx,arg2(%esp)
	call printf
	#run=run->next
	movl dl_counter(%ebp),%ebx
	movl next(%ebx),%ebx
	movl %ebx,dl_counter(%ebp)

dl_while_cond:
	movl dl_counter(%ebp),%ecx
	movl dl_list(%ebp),%ebx
	cmpl %ebx,%ecx
	je	dl_while_out
	jmp dl_while_loop

dl_while_out:
	#display_end of list
	movl $p_list_end,%eax
	movl %eax,arg1(%esp)
	call printf

	movl %ebp,%esp
	popl %ebp
	ret

