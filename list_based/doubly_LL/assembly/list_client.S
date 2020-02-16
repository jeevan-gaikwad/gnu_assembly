.include	"linux.S"
.include	"asm_lang.S"
.include	"dll_defs.S"

.section	.rodata
p_lst_create_s:
	.string "List created successfully!\n"
p_lst_create_f:
	.string "Failed to create the list. exiting..\n"
p_insrt_beg_s:
	.string "Insert beg success for %d. \n"
p_insrt_beg_f:
	.string "Insert beg failed for %d. \n"

.section	.text
.globl main
.type main,@function
.equ mn_lst, loc1
main:
	pushl %ebp
	movl %esp,%ebp
	call create_list
	movl %eax,mn_lst(%ebp)
	cmpl $SUCCESS,%eax
	jne mn_lst_create_f
	movl $p_lst_create_s,%eax
	movl %eax,arg1(%esp)
	call printf
	
	movl $EXIT_SUCCESS,%eax
	jmp mn_exit
mn_lst_create_f:
	movl $p_lst_create_f,%eax
	movl %eax,arg1(%esp)
	call printf
	jmp mn_exit_f

mn_exit_f:
	movl $EXIT_FAILURE,%eax
mn_exit:
	movl %eax,arg1(%esp)
	call exit
