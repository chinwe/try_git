;��̣�ʹ��pushָ�a��ǰ8�����������������b��
assume cs:code

a segment
    dw 1h, 2h, 3h, 4h, 5h, 6h, 7h, 8h, 9h, 0ah, 0bh, 0ch, 0dh, 0eh, 0fh, 0ffh
a ends

b segment
    dw 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h
b ends

code segment        ;����ο�ʼ

start:
    mov ax,a        ;��ʼ���ݶμĴ���ds
    mov ds,ax

    mov ax,b        ;��ʼ��ջ�μĴ���ss
    mov ss,ax
    mov sp,10h       ;����ջ��
    
    mov bx,0h
    mov cx,8h
s:
    push [bx]
    add bx,2h
    loop s

    mov ax,4c00h    ;���򷵻�
    int 21h

code ends           ;����ο�ʼ
end start           ;֪ͨ���������������ָ���������Ϊstart