;��̽����ݶεĵ�һ���ַ�ת��Ϊ��д���ڶ����ַ���ת��ΪȫСд
assume cs:code,ds:data

data segment        ;���ݶ�
    db 'BaSiC'
    db 'MiNix'
data ends

code segment        ;����ο�ʼ

start:
    mov ax,data     ;��ʼ���ݶμĴ���ds
    mov ds,ax

    mov bx, 0
    mov cx,5        ;ѭ��1�����ַ���1תΪ��д
s:
    mov al,0[bx]        ;0[bx] means [bx + 0]
    and al,11011111b    ;��д��ĸ�ĵ�3Ϊ��Ϊ0
    mov 0[bx],al
    mov al,5[bx]
    or al,00100000b     ;Сд��ĸ�ĵ�3Ϊ��Ϊ1���ܱ���Ӧ����ĸ��00100000b(20h)
    mov 5[bx],al
    inc bx
    loop s

    mov ax,4c00h    ;���򷵻�
    int 21h

code ends           ;����ο�ʼ
end start           ;֪ͨ���������������ָ���������Ϊstart