;用si和di实现将字符串'welcome to masm!'复制到它后面的数据区中
assume cs:code,ds:data

data segment        ;数据段
    db 'welcome to masm!'
    db '................'
data ends

code segment        ;代码段开始

start:
    mov ax,data     ;初始数据段寄存器ds
    mov ds,ax

    mov si,0h       ;源偏移地址
    mov di,10h      ;目的偏移地址
    mov cx,8h       ;一次复制一字数据，只需要复制8次
s:
    mov ax,[si]
    mov [di],ax
    add si,2
    add di,2
    loop s

    mov ax,4c00h    ;程序返回
    int 21h

code ends           ;代码段开始
end start           ;通知编译器程序结束，指定程序入口为start