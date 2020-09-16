#目的：寻找一组数中的最大值

#寄存器有以下用途：
#	%edi - 保存正在检测的数据的索引
#	%ebx - 当前已经找到的最大数据项
#	%eax - 当前数据项

#使用以下内存位置：
#	data_items - 包含数据项
#		     0表示数据结束

.section .data

data_items:
.quad 3, 67, 34, 222, 45, 75, 54, 34, 44, 33, 22, 11, 66, 0

.section .text
.global _start

_start:
	movq $0, %rdi
	movq data_items(,%rdi,8), %rax
	movq %rax, %rbx

start_loop:
	cmpq $0, %rax	#用第二个操作数(%eax)减去第一个操作数($0)，舍弃结果，根据差值设置ELFAGS状态寄存器的标志位。
	je loop_exit	#相等跳转。loop_exit是满足条件后要跳转的地址。条件为TRUE，跳转到指定地址，否则，执行下一条指令。
	incq %rdi	#递增给定寄存器或内存位置
	movq data_items(,%rdi,8), %rax
	cmpq %rbx, %rax	#ebx是第一操作数，eax是第二操作数。实际比较的是%eax和%ebx。具体做法是用%eax的值减去%ebx的值，根据结果对eflags置位
	jle start_loop	#jng表示不大于，jle表示小于等于，这两条汇编指令对应的底层机器码是一样的
	movq %rax, %rbx
	jmp start_loop	

loop_exit:
	movq $60, %rax
	syscall




