.model small
.stack 100h
.data
rows db ?
what db 'Enter number of rows: $'
star db '*$'
space db ' $'
newline db 10,13,'$'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,what
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    cmp al,1
    jl default
    cmp al,9
    jg default
    mov rows,al
    jmp start_print
    
    default:
    mov rows,5
    
    start_print:
    mov ah,9
    lea dx,newline
    int 21h
    mov cl,1  
    
    print_rows:
    cmp cl,rows
    jg exit   
    mov al,rows
    sub al,cl
    mov bl,al
    
    print_space:
    cmp bl,0
    jle print_stars 
    
    mov ah,9
    mov dx,offset space
    int 21h
    dec bl
    jmp print_space
    
    print_stars:
    mov bl,cl      
    
    print_star:
    cmp bl,0
    jle next_line  
    
    mov ah,9
    mov dx,offset star
    int 21h
    dec bl
    jmp print_star
    
    next_line:
    mov ah,9
    lea dx,newline
    int 21h
    
    inc cl
    jmp print_rows
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main
    
    