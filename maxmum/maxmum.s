#目的：寻找一组数中的最大值

#寄存器有以下用途：
#	%edi - 保存正在检测的数据的索引
#	%ebx - 当前已经找到的最大数据项
#	%eax - 当前数据项

#使用以下内存位置：
#	data_items - 包含数据项
#		     0表示数据结束

#.section是汇编器as提供的伪操作
#用ELF格式的用法加以描述，其指令格式如下：
#	.section NAME[, "FLAGS"]
#说明：
#	在linux内核中，通过使用.section的伪操作，可以把随后的代码汇编到一个由NAME指定的段中
#	而FLAGS字段则说明了该段的属性。它可以用下面介绍的单个字符来表示，也可以是多个字符的组合。
#	- 'a'可重定位的段
#	- 'w'可写段
#	- 'x'可执行段
#	- 'W'可合并的段
#	- 's'共享段
#举例来说：
#	.section .fixup, "ax"
#	这样的一条指令定义了一个名为.fixup的段，随后的指令会被加入到这个段中，该段的属性是可重定位并可执行 
.section .data

data_items:
.long 3, 67, 34, 222, 45, 75, 54, 34, 44, 33, 22, 11, 66, 0

.section .text
.global _start

_start:
	movl $0, %edi
	movl data_items(,%edi,4), %eax
	movl %eax, %ebx

start_loop:
	cmpl $0, %eax	#用第二个操作数(%eax)减去第一个操作数($0)，舍弃结果，根据差值设置ELFAGS状态寄存器的标志位。
	je loop_exit	#相等跳转。loop_exit是满足条件后要跳转的地址。条件为TRUE，跳转到指定地址，否则，执行下一条指令。
	incl %edi	#递增给定寄存器或内存位置
	movl data_items(,%edi,4), %eax
	cmpl %ebx, %eax	#ebx是第一操作数，eax是第二操作数。实际比较的是%eax和%ebx。具体做法是用%eax的值减去%ebx的值，根据结果对eflags置位
	jle start_loop	#jng表示不大于，jle表示小于等于，这两条汇编指令对应的底层机器码是一样的
	movl %eax, %ebx
	jmp start_loop	

loop_exit:
	movl $1, %eax
	int $0x80




