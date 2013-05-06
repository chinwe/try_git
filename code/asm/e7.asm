assume cs:code,ds:data,ss:stack

data segment    ;数据段

data ends

stack segment   ;栈段

stack ends

code segment    ;代码段

start:
    mov ax,data     ;设置数据段寄存器
    mov ds,ax

    mov ax,stack    ;设置栈段寄存器
    mov ss,ax
    mov sp,0h       ;初始化栈顶

    mov ax,4c00h    ;程序返回
    int 21h

code ends

end start      ;通知编译器结束，指定程序入口
