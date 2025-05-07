.model small
.stack 100h
.data
    rows db ?
    what db 'Enter a number: $'
    star db '*$'
    newline db 10,13,'$'
.code
main proc
    mov ax,@data
    mov ds,ax 
    mov ah,9
    lea dx,what
    int 21h
    
    mov ah,1
    int 21h 
    sub al,48
    mov rows,al  
    
    lea dx,newline
    mov ah,9
    int 21h 
    
    mov cl,1
    
    outer_loop:
    cmp cl,rows
    jg exit
    
    mov bl,1
    
    inner_loop:
    cmp bl,cl
    jg next_row
    
    mov ah,9
    lea dx,star
    int 21h
    
    inc bl
    jmp inner_loop
    
    next_row:
    mov ah,9
    lea dx,newline
    int 21h
    
    inc cl
    jmp outer_loop
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main