assume cs:codeseg

codeseg segment

start:
    mov ax,1h
    mov bx,2h
    push ax
    push bx
    pop ax
    pop bx
    
    mov ax,4c00h    ;³ÌÐò·µ»Ø
    int 21h

codeseg ends
end