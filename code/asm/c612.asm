assume cs:codeseg

codeseg segment     ;代码段开始

    ;依次用内存0:0~0:15单元中的内容改写程序中的数据
    ;数据传送使用栈
    dw 0001h, 0002h, 0003h, 0004h, 0005h, 0006h, 0007h, 0008h

    dw 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h ;10个字节用作栈空间

start:
    mov ax,cs   ;设置栈段
    mov ss,ax
    mov sp,24h  ;初始化栈顶 8字数据空间 * 2 + 10字栈空间 * 2 = 36(24h)

    mov ax,0    ;设置数据段
    mov ds,ax
    mov bx,0    ;初始偏移量
    
    mov cx,8    ;循环
s:
    push [bx]
    pop  cs:[bx]
    add bx,2
    loop s

    mov ax,4c00h    ;程序返回
    int 21h

codeseg ends        ;代码段开始
end start           ;通知编译器程序结束