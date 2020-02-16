.include	"asm_lang.S"
.include	"linux.S"
.include	"dll_defs.S"
.section	.text
.globl get_node
.type get_node,@function
.equ gn_data, p1
get_node:
	pushl %ebp
	movl %esp,%ebp
	subl $16,%esp

	movl $1,arg1(%esp)
	movl $12,arg2(%esp)
	call get_block

	#copy data to newly allocated node
	movl gn_data(%ebp),%ebx
	movl %ebx,(%eax)	#node->data

	movl %ebp,%esp
	popl %ebp
	ret
.globl search_node
.type search_node,@function
.equ sn_list, p1
.equ sn_data, p2
.equ sn_node, loc1
search_node:
	pushl %ebp
	movl %esp,%ebp
	subl $16, %esp
	
	movl sn_list(%ebp), %ebx
	movl next(%ebx),%ecx
	movl %ecx,sn_node(%ebp)
	jmp sn_while_cond
sn_while_loop:
	movl sn_node(%ebp),%ebx
	movl data(%ebx),%ecx
	cmpl %ecx,sn_data(%ebp)
	je sn_while_out
	movl next(%ebx),%ecx
	movl %ecx,sn_node(%ebp)
sn_while_cond:
	movl sn_node(%ebp),%eax
	movl sn_list(%ebp),%ebx
	cmpl %ebx,%ebx
	jne sn_while_loop
	je sn_exit_s

sn_while_out:
	movl sn_node(%ebp),%eax	
sn_exit_s:
	movl $0, %eax
	movl %ebp,%esp
	popl %ebp
	ret
.globl generic_insert
.type generic_insert,@function
.equ gi_e_node,p1
.equ gi_new_node,p2
generic_insert:
	pushl %ebp
	movl %esp,%ebp
	movl gi_e_node(%ebp),%ebx
	movl gi_new_node(%ebp),%ecx
	
	#new_node->next=e_node->next
	movl next(%ebx),%eax
	movl %eax,next(%ecx)

	#new_node->prev=e_node
	movl %ebx,prev(%ecx)

	#e_node->next=new_node
	movl %ecx,next(%ebx)
	
	#e_node->next->prev=new_node
	movl next(%ebx),%eax
	movl %ecx,prev(%eax)

	movl %ebp,%esp
	popl %ebp
	ret
.globl generic_delete
.type generic_delete,@function
.equ gd_e_node,p1
generic_delete:
	pushl %ebp
	movl %esp,%ebp
	subl $16,%esp

	movl gd_e_node(%ebp),%ebx
	#e_node->prev->next=e_node->next
	movl prev(%ebx),%eax
	movl next(%ebx),%edx
	movl %edx,next(%eax)
	
	#e_node->next->prev=e_node->prev
	movl prev(%ebx),%eax
	movl %eax,prev(%edx)

	#free(e_node)
	movl %ebx,arg1(%esp)
	call free

	movl %ebp,%esp
	popl %ebp
	ret
