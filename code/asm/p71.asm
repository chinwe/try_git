assume cs:code,ds:data

data segment        ;���ݶ�
    db 'unIX'
    db 'foRK'
data ends

code segment        ;����ο�ʼ

start:
    mov al,'a'
    mov bl,'b'

    mov ax,4c00h    ;���򷵻�
    int 21h

code ends           ;����ο�ʼ
end start           ;֪ͨ���������������ָ���������Ϊstart