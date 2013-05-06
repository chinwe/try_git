;将数据段每个单词的前4个字母修改为大写
assume cs:code,ds:data,ss:stack

data segment        ;数据段
    db '1. display      '
    db '2. brows        '
    db '3. replace      '
    db '4. modify       '
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
  
    mov cx,4
    mov bx,0
s:
    push cx
    mov cx,4
    mov si,0
    s1:
        mov al,[bx + si + 3]
        and al,0dfh
        mov [bx + si + 3],al
        inc si
        loop s1
    add bx,10h
    pop cx
    loop s

    mov ax,4c00h    ;程序返回
    int 21h

code ends           ;代码段开始
end start           ;通知编译器程序结束，指定程序入口为start