;�����ݶ�ÿ�����ʵ�ǰ4����ĸ�޸�Ϊ��д
assume cs:code,ds:data,ss:stack

data segment        ;���ݶ�
    db '1. display      '
    db '2. brows        '
    db '3. replace      '
    db '4. modify       '
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
  
    mov cx,4
    mov bx,0
s:
    push cx
    mov cx,4
    mov si,0
    s1:
        mov al,[bx + si + 3]
        and al,0dfh
        mov [bx + si + 3],al
        inc si
        loop s1
    add bx,10h
    pop cx
    loop s

    mov ax,4c00h    ;���򷵻�
    int 21h

code ends           ;����ο�ʼ
end start           ;֪ͨ���������������ָ���������Ϊstart