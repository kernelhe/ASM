	.file	"func4.cpp"
	.text
	.globl	_Z5func4i
	.type	_Z5func4i, @function
_Z5func4i:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$12, -16(%rbp)
	movl	-36(%rbp), %eax
	cmpl	$1, %eax
	jg	.L2
	movl	$1, %eax
	jmp	.L4
.L2:
	movl	-36(%rbp), %edx
	leaq	-16(%rbp), %rax
	subl	$1, %edx
	movl	%edx, (%rax)
	leaq	-16(%rbp), %rax
	addq	$4, %rax
	movl	$0, (%rax)
	movq	-16(%rbp), %rax
	movl	%eax, %edi
	call	_Z5func4i
	movl	%eax, -20(%rbp)
	movl	-36(%rbp), %eax
	imull	-20(%rbp), %eax
.L4:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z5func4i, .-_Z5func4i
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
