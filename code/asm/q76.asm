;��data����ÿһ�����ʵ�ͷһ����ĸ�޸�Ϊ��д��ĸ
assume cs:code,ds:data

data segment        ;���ݶ�
    db '1. file         '
    db '2. edit         '
    db '3. search       '
    db '4. view         '
    db '5. options      '
    db '6. help         '
data ends

code segment        ;����ο�ʼ

start:
    mov ax,data     ;��ʼ���ݶμĴ���ds
    mov ds,ax

    mov cx,6
    mov bx,0
s:
    mov al,[bx + 3]
    and al,0dfh
    mov [bx + 3],al
    add bx,10h
    loop s

    mov ax,4c00h    ;���򷵻�
    int 21h

code ends           ;����ο�ʼ
end start           ;֪ͨ���������������ָ���������Ϊstart