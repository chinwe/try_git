assume cs:codeseg

codeseg segment     ;����ο�ʼ

    ;�������ڴ�0:0~0:15��Ԫ�е����ݸ�д�����е�����
    ;���ݴ���ʹ��ջ
    dw 0001h, 0002h, 0003h, 0004h, 0005h, 0006h, 0007h, 0008h

    dw 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h ;10���ֽ�����ջ�ռ�

start:
    mov ax,cs   ;����ջ��
    mov ss,ax
    mov sp,24h  ;��ʼ��ջ�� 8�����ݿռ� * 2 + 10��ջ�ռ� * 2 = 36(24h)

    mov ax,0    ;�������ݶ�
    mov ds,ax
    mov bx,0    ;��ʼƫ����
    
    mov cx,8    ;ѭ��
s:
    push [bx]
    pop  cs:[bx]
    add bx,2
    loop s

    mov ax,4c00h    ;���򷵻�
    int 21h

codeseg ends        ;����ο�ʼ
end start           ;֪ͨ�������������