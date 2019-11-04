data segment
    bin dw 0ffffh
    bcddata db 3 dup(?)
data ends

stack segment
    db 256 dup(?)
stack ends

code segment
    assume cs:code, ds:data, ss:stack
start:
    push ds
    mov ax, data
    mov ds, ax
    mov si, 10
    lea bx, bcddata+2
    mov cx, 3
bintobcd:
    xor dx, dx
    div si
    mov [bx], dl
    mov dx, 0
    div si
    push cx
    mov cl, 4
    shl dl, cl
    add [bx], dl
    dec bx
    pop cx
    loop bintobcd
    ret
code ends
    end start