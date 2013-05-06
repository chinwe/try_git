assume cs:code,ds:data,ss:stack

data segment        ;数据段
    dw 0123h, 0456h, 0789h, 0abch, 0defh, 0fedh, 0cbah, 0987h
data ends

stack segment       ;栈段
    dw 0, 0, 0, 0, 0, 0, 0, 0
stack ends

code segment        ;代码段开始

start:
    mov ax,data     ;初始数据段寄存器ds
    mov ds,ax
    mov ax,stack    ;初始化栈段寄存器ss
    mov ss,ax
    mov sp,10h       ;设置栈顶
    
    push ds:[0]
    push ds:[2]
    pop ds:[2]
    pop ds:[0]

    mov ax,4c00h    ;程序返回
    int 21h

code ends           ;代码段开始
end start           ;通知编译器程序结束，指定程序入口为start