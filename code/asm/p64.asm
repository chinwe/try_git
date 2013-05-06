assume cs:code,ds:data,ss:stack

;编程实现利用栈空间将数据段内容逆序

data segment        ;数据段
    dw 1h, 2h, 3h, 4h, 5h, 6h, 7h, 8h
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
    mov sp,8h       ;设置栈顶

    mov bx, 0
    mov cx,8
s:
    push [bx]
    add bx,2
    loop s

    mov cx,8
    mov bx,0
s0:
    pop [bx]
    add bx,2
    loop s0

    mov ax,4c00h    ;程序返回
    int 21h

code ends           ;代码段开始
end start           ;通知编译器程序结束，指定程序入口为start