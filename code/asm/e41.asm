assume cs:codeseg

codeseg segment     ;����ο�ʼ

start:
    
    ;��̣����ڴ�0:200~0:23F���δ�������0��63(3FH)
    
    mov ax,20h
    mov ds,ax       ;�������ݶε�ַ20h

    mov cx,40h      ;ѭ������
    mov bx,0h       ;��ʼ��ƫ����

s:
    mov [bx], bx    ;�ڴ渳ֵ
    inc bx          ;ƫ��������
    loop s

    mov ax,4c00h    ;���򷵻�
    int 21h

codeseg ends        ;����ο�ʼ
end start           ;֪ͨ�������������