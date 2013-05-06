assume cs:code,ds:data

data segment        ;数据段
    db 'unIX'
    db 'foRK'
data ends

code segment        ;代码段开始

start:
    mov al,'a'
    mov bl,'b'

    mov ax,4c00h    ;程序返回
    int 21h

code ends           ;代码段开始
end start           ;通知编译器程序结束，指定程序入口为start