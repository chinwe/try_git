assume cs:codeseg

codeseg segment     ;代码段开始

start:
    mov ax,2000h
    mov ds,ax
    mov bx,1000h
    mov ax,[bx]
    inc bx
    inc bx
    mov [bx],ax
    inc bx
    inc bx
    mov [bx],ax
    inc bx
    mov [bx],al
    inc bx
    mov [bx],al

    mov ax,4c00h    ;程序返回
    int 21h

codeseg ends        ;代码段开始
end start           ;通知编译器程序结束