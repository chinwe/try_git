assume cs:codeseg

codeseg segment     ;����ο�ʼ

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

    mov ax,4c00h    ;���򷵻�
    int 21h

codeseg ends        ;����ο�ʼ
end start           ;֪ͨ�������������