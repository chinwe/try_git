assume cs:code,ds:data,ss:stack

data segment        ;���ݶ�
    dw 0123h, 0456h, 0789h, 0abch, 0defh, 0fedh, 0cbah, 0987h
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
    mov sp,10h       ;����ջ��
    
    push ds:[0]
    push ds:[2]
    pop ds:[2]
    pop ds:[0]

    mov ax,4c00h    ;���򷵻�
    int 21h

code ends           ;����ο�ʼ
end start           ;֪ͨ���������������ָ���������Ϊstart