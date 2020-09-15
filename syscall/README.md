#### Linux的系统调用号

- [Linux系统调用详解（实现机制分析）--linux内核剖析（六）](https://blog.csdn.net/gatieme/article/details/50779184)

在当前系统查找系统调用号

```shell
find / -name unistd_32.h -print
```

```shell
find / -name unistd_64.h -print
```

查询结果如下：

```
/usr/include/x86_64-linux-gnu/asm/unistd_32.h
```

可以看到在目录`/usr/include/x86_64-linux-gnu/asm/`中。



#### Linux 64位汇编

- [64位Linux汇编](https://blog.csdn.net/dawter/article/details/51918395?utm_medium=distribute.pc_relevant_t0.none-task-blog-BlogCommendFromMachineLearnPai2-1.channel_param&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-BlogCommendFromMachineLearnPai2-1.channel_param)
- [64位at&t汇编](https://blog.csdn.net/iteye_6233/article/details/82297928)

