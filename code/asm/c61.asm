assume cs:codeseg

codeseg segment     ;代码段开始

    ;依次用内存0:0~0:15单元中的内容改写程序中的数据
    dw 0001h, 0002h, 0003h, 0004h, 0005h, 0006h, 0007h, 0008h

start:
    mov ax,0    ;初始化数据段地址0
    mov ds,ax
    mov bx,0

    mov cx,8
s:
    mov ax, [bx]    ;数据存入寄存器
    mov cs:[bx],ax  ;寄存器写入程序中的数据所在内容
    add bx,2        ;偏移地址增加2，一个字的长度
    loop s

    mov ax,4c00h    ;程序返回
    int 21h

codeseg ends        ;代码段开始
end start           ;通知编译器程序结束