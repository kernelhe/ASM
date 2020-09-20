#程序目的：
#	求最小值，使用长度计数作为循环结束条件
#
#寄存器使用：
#	%ecx:保存长度计数
#	%edi:保存索引值
#	%eax:保存当前值
#	%ebx:保存最小值

.section .data
data_items:
.long 3,67,34,222,45,75,54,34,44,33,22,11,66,99

.section .text
.globl _start
_start:
	movl $13, %ecx
	movl $0, %edi
	movl data_items(,%edi,4), %eax
	movl %eax, %ebx
	cmpl %edi, %ecx
	je   loop_exit
	jmp  start_loop

start_loop:
	incl %edi
	movl data_items(,%edi,4), %eax
	cmpl %eax, %ebx
	jl   check_count
	movl %eax, %ebx
	jmp check_count

check_count:
	cmpl %edi, %ecx
	je   loop_exit
	jmp  start_loop

loop_exit:
	movl $1, %eax
	int  $0x80
	
	
