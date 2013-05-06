;将data填入table段相应字段
assume cs:code,ds:data,ss:stack

data segment    ;数据段
    db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
    db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
    db '1993','1994','1995'
    ;以上是表示21年的21个字符串
    dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
    dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
    ;以上是表示21年公司总收的21个dword型数据
    dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
    dw 11542,14430,45257,17800
    ;以上是表示21年公司雇员人数的21个word型数据
data ends

table segment
    db 21 dup('year summ ne ?? ')
table ends

stack segment   ;定义16字节栈空间
    dw 8 dup(0)
stack ends

code segment    ;代码段

start:
    mov ax,data     ;设置数据段寄存器
    mov ds,ax
    
    mov ax,table
    mov es,ax

    mov ax,stack    ;设置栈段寄存器
    mov ss,ax
    mov sp,16

    mov cx,21
    mov bx,0
    mov si,0
    mov di,0
s:
    ;传入年份
    mov ax,[si]
    mov es:[di],ax
    mov ax,[si + 2]
    mov es:[di + 2],ax

    ;传入总收入，作为被除数，32位，高字存在dx，低字存在ax
    mov ax,[84 + si]
    mov es:[5 + di],ax
    mov dx,[84 + si + 2]
    mov es:[5 + di + 2],dx
    
    push cx     ;cx入栈

    ;传入人数,作为除数
    mov cx,[168 + bx]
    mov es:[10 + di],cx

    div cx  ;除法计算，32位除数，商存储在ax,余数存储在dx
    pop cx      ;cx出栈
    
    ;计算人均收入
    mov es:[13 + di],ax

    add si,4    ;年份，总收入增加偏移量
    add bx,2    ;人数增加偏移量
    add di,16   ;table行增加偏移量

    loop s

    mov ax,4c00h    ;程序返回
    int 21h

code ends

end start      ;通知编译器结束，指定程序入口
