assume cs:codeseg

codeseg segment     ;代码段开始

start:
    
    ;编程，向内存0:200~0:23F依次传送数据0～63(3FH)
    
    mov ax,20h
    mov ds,ax       ;设置数据段地址20h

    mov cx,40h      ;循环次数
    mov bx,0h       ;初始化偏移量

s:
    mov [bx], bx    ;内存赋值
    inc bx          ;偏移量增加
    loop s

    mov ax,4c00h    ;程序返回
    int 21h

codeseg ends        ;代码段开始
end start           ;通知编译器程序结束