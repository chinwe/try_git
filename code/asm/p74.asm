;��̽����ݶεĵ�һ���ַ�ת��Ϊ��д���ڶ����ַ���ת��ΪȫСд
assume cs:code,ds:data

data segment        ;���ݶ�
    db 'BaSiC'
    db 'iNfOrMaTiOn'
data ends

code segment        ;����ο�ʼ

start:
    mov ax,data     ;��ʼ���ݶμĴ���ds
    mov ds,ax

    mov bx, 0
    mov cx,5        ;ѭ��1�����ַ���1תΪ��д
s:
    mov al,[bx]
    and al,11011111b    ;��д��ĸ�ĵ�3Ϊ��Ϊ0
    mov [bx],al
    inc bx
    loop s

    mov cx,11
s1:
    mov al,[bx]
    or al,00100000b     ;Сд��ĸ�ĵ�3Ϊ��Ϊ1���ܱ���Ӧ����ĸ��00100000b(20h)
    mov [bx],al
    inc bx
    loop s1

    mov ax,4c00h    ;���򷵻�
    int 21h

code ends           ;����ο�ʼ
end start           ;֪ͨ���������������ָ���������Ϊstart