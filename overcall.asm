.286
.model small
.stack 100h     
oseg segment
    retf
oseg ends
.data                          
  overlay_addr dw 0, 0
  overlay_epb dw 0, 0
  fname db 'build\overlay.exe', 0
  over_mes db 'Hello from overlay$'
.code            
main:       
    mov ax, @data
    mov ds, ax 
    mov es, ax 

    ;load overlay
    mov ax, oseg  
    mov [overlay_epb], ax 
    mov [overlay_epb + 2], ax

    mov bx, offset overlay_epb
    mov dx, offset fname
    mov ax, 4B03h
    int 21h 

    ;push msg to stack
    mov ax, offset over_mes
    push ax

    ;call oseg
    mov ax, oseg   
    mov [overlay_addr + 2], ax
    call DWORD PTR overlay_addr 

    exit:
    mov ax, 4C00h
    int 21h
end main        