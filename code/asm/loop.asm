assume cs:codeseg

codeseg segment     ;代码段开始

start:

    mov ax,2    ;循环计算2^12

    mov cx,11
s:  add ax,ax
    loop s

    mov ax,4c00h    ;程序返回
    int 21h

codeseg ends        ;代码段开始
end start           ;通知编译器程序结束