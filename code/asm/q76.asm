;将data段中每一个单词的头一个字母修改为大写字母
assume cs:code,ds:data

data segment        ;数据段
    db '1. file         '
    db '2. edit         '
    db '3. search       '
    db '4. view         '
    db '5. options      '
    db '6. help         '
data ends

code segment        ;代码段开始

start:
    mov ax,data     ;初始数据段寄存器ds
    mov ds,ax

    mov cx,6
    mov bx,0
s:
    mov al,[bx + 3]
    and al,0dfh
    mov [bx + 3],al
    add bx,10h
    loop s

    mov ax,4c00h    ;程序返回
    int 21h

code ends           ;代码段开始
end start           ;通知编译器程序结束，指定程序入口为start