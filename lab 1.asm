.model small
.stack 100h
.data
a db 'Enter first number: $'
b db 10,13,10,13,'Enter second number: $'
c db 10,13,10,13,'Sum of the two numbers is: $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,1
    int 21h 
    sub al,48
    mov bl,al
    
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,1
    int 21h 
    sub al, 48
    mov bh,al
    
    mov ah,9
    lea dx,c
    int 21h  
    
    add bl,bh 
    mov ax,0 
    mov al,bl      
    
    mov bl,10 
    div bl
    mov cl,ah
    
    add al,48
    mov dl,al
    mov ah,2
    int 21h 
    
    add cl,48
    mov dl,cl
    mov ah,2
    int 21h 
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main