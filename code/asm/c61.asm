assume cs:codeseg

codeseg segment     ;����ο�ʼ

    ;�������ڴ�0:0~0:15��Ԫ�е����ݸ�д�����е�����
    dw 0001h, 0002h, 0003h, 0004h, 0005h, 0006h, 0007h, 0008h

start:
    mov ax,0    ;��ʼ�����ݶε�ַ0
    mov ds,ax
    mov bx,0

    mov cx,8
s:
    mov ax, [bx]    ;���ݴ���Ĵ���
    mov cs:[bx],ax  ;�Ĵ���д������е�������������
    add bx,2        ;ƫ�Ƶ�ַ����2��һ���ֵĳ���
    loop s

    mov ax,4c00h    ;���򷵻�
    int 21h

codeseg ends        ;����ο�ʼ
end start           ;֪ͨ�������������