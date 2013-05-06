;编程将数据段的第一个字符转换为大写，第二个字符串转换为全小写
assume cs:code,ds:data

data segment        ;数据段
    db 'BaSiC'
    db 'iNfOrMaTiOn'
data ends

code segment        ;代码段开始

start:
    mov ax,data     ;初始数据段寄存器ds
    mov ds,ax

    mov bx, 0
    mov cx,5        ;循环1，将字符串1转为大写
s:
    mov al,[bx]
    and al,11011111b    ;大写字母的第3为都为0
    mov [bx],al
    inc bx
    loop s

    mov cx,11
s1:
    mov al,[bx]
    or al,00100000b     ;小写字母的第3为都为1，总比相应的字母大00100000b(20h)
    mov [bx],al
    inc bx
    loop s1

    mov ax,4c00h    ;程序返回
    int 21h

code ends           ;代码段开始
end start           ;通知编译器程序结束，指定程序入口为start