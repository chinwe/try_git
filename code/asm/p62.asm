assume cs:codeseg

codeseg segment     ;代码段开始

    ;求下面的数据的和，并存入寄存器ax
    dw 0011h, 0022h, 0033h, 0044h

start:              ;程序入口
    
    mov bx,0h
    mov ax,0h
    
    mov cx,4h
s:
    add ax,cs:[bx]
    add bx,2
    loop s

    mov ax,4c00h    ;程序返回
    int 21h

codeseg ends        ;代码段开始
end start           ;通知编译器程序结束