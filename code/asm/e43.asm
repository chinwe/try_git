assume cs:codeseg

codeseg segment     ;����ο�ʼ

start:
    ;��mov ax,4c00h֮ǰ��ָ��Ƶ�0:200��

    mov ax,cs   ;����θ�ֵ�����ݶ�
    mov ds,ax

    mov ax,0020h
    mov es,ax
    mov bx,0    ;Ҫ���Ƶ��ĵ�ַ

    mov cx,16h  ;Ҫ���Ƶ��ֽ������������Ҫ��Debugʱ��ʹ��u����鿴
s:
    mov al,[bx]
    mov es:[bx],al
    inc bx
    loop s

    mov ax,4c00h    ;���򷵻�
    int 21h

codeseg ends        ;����ο�ʼ
end start           ;֪ͨ�������������