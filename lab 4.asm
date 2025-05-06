.model small
.stack 100h
.data
msg1 db '0 to 9 numbers $'
b db '0'
.code
main proc
    mov ax, @data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h  
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov cx,10  
    
    loop1: 
    mov ah,2
    mov dl,b
    int 21h
    inc b  
    
    mov ah,2
    mov dl,' '
    int 21h
    
    ;mov ah,2
    ;mov dl,10
    ;int 21h
    ;mov dl,13
    ;int 21h'
    
    loop loop1
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main