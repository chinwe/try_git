;��si��diʵ�ֽ��ַ���'welcome to masm!'���Ƶ����������������
assume cs:code,ds:data

data segment        ;���ݶ�
    db 'welcome to masm!'
    db '................'
data ends

code segment        ;����ο�ʼ

start:
    mov ax,data     ;��ʼ���ݶμĴ���ds
    mov ds,ax

    mov si,0h       ;Դƫ�Ƶ�ַ
    mov di,10h      ;Ŀ��ƫ�Ƶ�ַ
    mov cx,8h       ;һ�θ���һ�����ݣ�ֻ��Ҫ����8��
s:
    mov ax,[si]
    mov [di],ax
    add si,2
    add di,2
    loop s

    mov ax,4c00h    ;���򷵻�
    int 21h

code ends           ;����ο�ʼ
end start           ;֪ͨ���������������ָ���������Ϊstart