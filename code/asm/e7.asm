assume cs:code,ds:data,ss:stack

data segment    ;���ݶ�

data ends

stack segment   ;ջ��

stack ends

code segment    ;�����

start:
    mov ax,data     ;�������ݶμĴ���
    mov ds,ax

    mov ax,stack    ;����ջ�μĴ���
    mov ss,ax
    mov sp,0h       ;��ʼ��ջ��

    mov ax,4c00h    ;���򷵻�
    int 21h

code ends

end start      ;֪ͨ������������ָ���������
