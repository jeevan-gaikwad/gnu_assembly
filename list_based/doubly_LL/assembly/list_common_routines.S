.include "asm_lang.S"
.include "linux.S"

.section	.rodata
p_err_msg1:
	.string "get_block:Memory allocation failed. Exiting.\n"

.section	.text
.globl get_block
.type get_block,@function
.equ gb_no_of_blocks, p1
.equ gb_size_per_block, p2
get_block:
	pushl %ebp
	movl %esp,%ebp
	subl $16,%esp

	movl gb_no_of_blocks(%ebp),%eax
	movl gb_size_per_block(%ebp),%ebx
	movl %eax,arg1(%esp)
	movl %ebx,arg2(%esp)
	call calloc
	cmpl $0,%eax
	je gb_mem_err
	jmp gb_exit_s

gb_mem_err:
	movl $p_err_msg1,%ebx
	movl %ebx,arg1(%esp)
	call printf
	movl $0,argv(%esp)
	call exit

gb_exit_s:
	movl %ebp,%esp
	popl %ebp
	ret
