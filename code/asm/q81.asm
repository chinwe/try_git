;��div����data���е�һ�����ݳ��Եڶ������ݺ�Ľ�����̴��ڵ������ڴ浥Ԫ
assume cs:code,ds:data,ss:stack

data segment        ;���ݶ�
    dd 100001
    dw 100
    dw 0
data ends

stack segment
    dd 200 dup (0)  ;����200���ֽڵ�ջ��
stack ends

code segment        ;����ο�ʼ

start:
    mov ax,data     ;��ʼ���ݶμĴ���ds
    mov ds,ax

    mov ax,ds:[0]
    mov dx,ds:[2]
    mov bx,ds:[4]
    div bx
    mov ds:[6],ax

    mov ax,4c00h    ;���򷵻�
    int 21h

code ends           ;����ο�ʼ
end start           ;֪ͨ���������������ָ���������Ϊstart