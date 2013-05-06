;编程，使用push指令将a段前8个字型数据逆序存入b段
assume cs:code

a segment
    dw 1h, 2h, 3h, 4h, 5h, 6h, 7h, 8h, 9h, 0ah, 0bh, 0ch, 0dh, 0eh, 0fh, 0ffh
a ends

b segment
    dw 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h
b ends

code segment        ;代码段开始

start:
    mov ax,a        ;初始数据段寄存器ds
    mov ds,ax

    mov ax,b        ;初始化栈段寄存器ss
    mov ss,ax
    mov sp,10h       ;设置栈顶
    
    mov bx,0h
    mov cx,8h
s:
    push [bx]
    add bx,2h
    loop s

    mov ax,4c00h    ;程序返回
    int 21h

code ends           ;代码段开始
end start           ;通知编译器程序结束，指定程序入口为start