assume cs:codeseg

codeseg segment     ;����ο�ʼ

start:

    mov ax,2    ;ѭ������2^12

    mov cx,11
s:  add ax,ax
    loop s

    mov ax,4c00h    ;���򷵻�
    int 21h

codeseg ends        ;����ο�ʼ
end start           ;֪ͨ�������������