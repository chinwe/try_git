assume cs:code,ds:data,ss:stack

;���ʵ������ջ�ռ佫���ݶ���������

data segment        ;���ݶ�
    dw 1h, 2h, 3h, 4h, 5h, 6h, 7h, 8h
data ends

stack segment       ;ջ��
    dw 0, 0, 0, 0, 0, 0, 0, 0
stack ends

code segment        ;����ο�ʼ

start:
    mov ax,data     ;��ʼ���ݶμĴ���ds
    mov ds,ax
    mov ax,stack    ;��ʼ��ջ�μĴ���ss
    mov ss,ax
    mov sp,8h       ;����ջ��

    mov bx, 0
    mov cx,8
s:
    push [bx]
    add bx,2
    loop s

    mov cx,8
    mov bx,0
s0:
    pop [bx]
    add bx,2
    loop s0

    mov ax,4c00h    ;���򷵻�
    int 21h

code ends           ;����ο�ʼ
end start           ;֪ͨ���������������ָ���������Ϊstart