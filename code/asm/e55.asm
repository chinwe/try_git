;编程，将a段和b段的数据相加，结果存入cc段中
assume cs:code

a segment
    db 1, 2, 3, 4, 5, 6, 7, 8
a ends

b segment
    db 1, 2, 3, 4, 5, 6, 7, 8
b ends

cc segment
    db 0, 0, 0, 0, 0, 0, 0, 0
cc ends

code segment        ;代码段开始

start:
    mov ax,a     ;初始数据段寄存器ds
    mov ds,ax

    mov cx,8
    mov bx,0
s:
    mov al,ds:[bx]          ;a段内容存入寄存器
    add al,ds:[bx + 16]     ;b段内容累加入寄存器
    mov ds:[bx + 32],al     ;赋值给c段内容
    inc bx
    loop s

    mov ax,4c00h    ;程序返回
    int 21h

code ends           ;代码段开始
end start           ;通知编译器程序结束，指定程序入口为start