#程序目的：
#	求最小值,使用列表终止地址作为循环结束条件
#
#寄存器使用：
#	%eax:保存当前值
#	%ebx:保存最小值
#	%esi:保存索引值
#	%ecx:保存列表最后一个元素的地址
#	%edx:列表的基地址
#	%ecx:保存列表最后一个元素的地址

.section .data
data_items:
.long 3,67,34,222,45,75,54,34,44,33,22,11,66,99



.section .text
.globl _start
_start:
	movl data_items, %edx
	movl $13, %esi
	leal (%edx,%esi,4), %ecx	#ecx保存列表的最终地址
	movl $0, %esi	
	leal (%edx,%esi,4), %edi
	movl data_items(,%esi,4), %eax
	movl %eax, %ebx
	cmpl %edx, %ecx	#比较%eax和0的大小
	je   loop_exit
	jmp  start_loop

start_loop:
	incl %esi
	leal (%edx,%esi,4), %edi	#edi保存当前元素的地址
	movl data_items(,%esi,4), %eax	#eax保存当前值
	cmpl %eax, %ebx			#ebx保存最小值
	jl   check_end
	movl %eax, %ebx
	jmp  check_end

check_end:
	cmpl %edi, %ecx
	je   loop_exit
	jmp  start_loop
	
loop_exit:
	movl $1, %eax
	int  $0x80	#软中断

