assume cs:code

code segment        ;����ο�ʼ

start:

    ;��100001(186a1h)/100
    mov dx,1
    mov ax,86a1h
    mov bx,100
    div bx

    ;��1001/100
    mov ax,1001
    mov bl,100
    div bl

    mov ax,4c00h    ;���򷵻�
    int 21h

code ends           ;����ο�ʼ
end start           ;֪ͨ���������������ָ���������Ϊstart