#程序目的：
#	求最小值
#
#寄存器使用：
#	%eax:保存当前值
#	%ebx:保存最小值
#	%esi:保存索引值

.section .data
data_items:
.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text
.globl _start
_start:
	movl $0, %esi	
	movl data_items(,%esi,4), %eax
	movl %eax, %ebx
	cmpl $0, %eax	#比较%eax和0的大小
	je   loop_exit
	jmp  start_loop

start_loop:
	incl %esi
	movl data_items(,%esi,4), %eax
	cmpl $0, %eax
	je   loop_exit
	cmpl %eax, %ebx
	jl   start_loop
	movl %eax, %ebx
	jmp start_loop

loop_exit:
	movl $1, %eax
	int  $0x80	#软中断

