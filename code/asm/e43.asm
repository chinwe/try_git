assume cs:codeseg

codeseg segment     ;代码段开始

start:
    ;将mov ax,4c00h之前的指令复制到0:200处

    mov ax,cs   ;代码段赋值给数据段
    mov ds,ax

    mov ax,0020h
    mov es,ax
    mov bx,0    ;要复制到的地址

    mov cx,16h  ;要复制的字节数，这个数需要在Debug时，使用u命令查看
s:
    mov al,[bx]
    mov es:[bx],al
    inc bx
    loop s

    mov ax,4c00h    ;程序返回
    int 21h

codeseg ends        ;代码段开始
end start           ;通知编译器程序结束