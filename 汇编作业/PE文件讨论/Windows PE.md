# Windows PE可执行文件的装载过程

<center>1911590 周安琪</center>

> 我们用C++等高级语言写的程序源代码，被VS等编译器编译和链接成二进制的exe可执行程序。当鼠标双击exe程序运行之后，Windows如何将该exe程序从硬盘装载到内存并执行的？ 大家先复习课上讲解的知识点，然后扩展阅读相关资料，将Windows装载并执行exe程序的过程整理成文档，发布到雨课堂的讨论版，一起分享和讨论。

Windows操作系统在打开一个PE可执行文件的时候会在内核中另起一个进程，并且把可执行文件的内容装载到进程空间中。

在Windows操作系统中，这部分工作由函数`CreateProcess`完成。

该函数的原型如下：

```c++
BOOL CreateProcess(
    LPCTSTR lpApplicationName,
    LPTSTR lpCommandLine,
    LPSECURITY_ATTRIBUTES lpProcessAttributes,
    LPSECURITY_ATTRIBUTES lpThreadAttributes,
    BOOL bInheritHandles,
    DWORD dwCreationFlags,
    LPVOID lpEnvironment,
    LPCTSTR lpCurrentDirectory,
    LPSTARTUPINFO lpStartupInfo,
    LPPROCESS_INFORMATION lpProcessInformation
);
```

在该函数的参数中，`lpApplicationName`和`lpCommandLine`分别指向新进程要使用的可执行文件的名称，以及要传给新进程的命令行字符串。

`CreateProcess`函数首先检查PE文件的有效性，然后为PE文件分配共享映射去Section，然后将其映射到进程的用户地址空间，然后为其分配物理页面。然后通过PE装载器处理PE文件中的import table.

此外，它还创建一个线程对象，也就是这个进程的主线程，用来运行可执行文件。这个线程将连同一个已初始化了的堆栈一起被创建，堆栈的大小由可执行文件的文件头中的描述决定。线程由文件头处开始执行。
