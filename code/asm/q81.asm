;用div计算data段中第一个数据除以第二个数据后的结果，商存在第三个内存单元
assume cs:code,ds:data,ss:stack

data segment        ;数据段
    dd 100001
    dw 100
    dw 0
data ends

stack segment
    dd 200 dup (0)  ;定义200个字节的栈段
stack ends

code segment        ;代码段开始

start:
    mov ax,data     ;初始数据段寄存器ds
    mov ds,ax

    mov ax,ds:[0]
    mov dx,ds:[2]
    mov bx,ds:[4]
    div bx
    mov ds:[6],ax

    mov ax,4c00h    ;程序返回
    int 21h

code ends           ;代码段开始
end start           ;通知编译器程序结束，指定程序入口为start