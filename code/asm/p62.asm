assume cs:codeseg

codeseg segment     ;����ο�ʼ

    ;����������ݵĺͣ�������Ĵ���ax
    dw 0011h, 0022h, 0033h, 0044h

start:              ;�������
    
    mov bx,0h
    mov ax,0h
    
    mov cx,4h
s:
    add ax,cs:[bx]
    add bx,2
    loop s

    mov ax,4c00h    ;���򷵻�
    int 21h

codeseg ends        ;����ο�ʼ
end start           ;֪ͨ�������������