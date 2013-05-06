assume cs:codeseg

codeseg segment     ;代码段开始

start:
    mov ax,2000h
    mov ss,ax
    mov sp,0
    add sp,10
    pop ax
    pop bx
    push ax
    push bx
    pop ax
    pop bx

    mov ax,4c00h    ;程序返回
    int 21h

codeseg ends        ;代码段开始
end start           ;通知编译器程序结束