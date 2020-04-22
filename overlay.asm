cseg segment PARA PUBLIC 'code'
assume cs:cseg
start:
    push bp
    mov bp, sp
    mov dx, [ss:bp+6+0]
    mov ax, 0900h
    int 21h
    pop bp
retf
cseg ends
end start