;��̣���a�κ�b�ε�������ӣ��������cc����
assume cs:code

a segment
    db 1, 2, 3, 4, 5, 6, 7, 8
a ends

b segment
    db 1, 2, 3, 4, 5, 6, 7, 8
b ends

cc segment
    db 0, 0, 0, 0, 0, 0, 0, 0
cc ends

code segment        ;����ο�ʼ

start:
    mov ax,a     ;��ʼ���ݶμĴ���ds
    mov ds,ax

    mov cx,8
    mov bx,0
s:
    mov al,ds:[bx]          ;a�����ݴ���Ĵ���
    add al,ds:[bx + 16]     ;b�������ۼ���Ĵ���
    mov ds:[bx + 32],al     ;��ֵ��c������
    inc bx
    loop s

    mov ax,4c00h    ;���򷵻�
    int 21h

code ends           ;����ο�ʼ
end start           ;֪ͨ���������������ָ���������Ϊstart