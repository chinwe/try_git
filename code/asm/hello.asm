assume cs:hello

hello segment

start:
    mov ax,0001h
    mov bx,0002h
    push ax
    push bx
    pop ax
    pop bx

    mov ax,4c00h
    int 21H

hello ends
end
