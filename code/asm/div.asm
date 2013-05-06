assume cs:code

code segment        ;代码段开始

start:

    ;求100001(186a1h)/100
    mov dx,1
    mov ax,86a1h
    mov bx,100
    div bx

    ;求1001/100
    mov ax,1001
    mov bl,100
    div bl

    mov ax,4c00h    ;程序返回
    int 21h

code ends           ;代码段开始
end start           ;通知编译器程序结束，指定程序入口为start