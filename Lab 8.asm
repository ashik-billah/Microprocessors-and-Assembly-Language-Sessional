.model small
.stack 100h
.data
    eq db '=', '$' 
    what db 'Give a number between 0-9 for multiplication table: $',
    x  db 'x', '$'
    nl db 13,10,'$'
.code
main proc
    mov ax, @data
    mov ds, ax
                
    mov ah,9
    lea dx,what
    int 21h
    mov ah, 1
    int 21h
    sub al, '0'    
    mov bl, al      
    mov bh, 0   
    mov ah,9
    lea dx,nl
    int 21h
    
table_loop:
    mov ah, 2
    mov dl, bl
    add dl, '0'
    int 21h

    mov ah, 9
    mov dx,offset x
    int 21h
                                     
    mov ah, 2
    mov dl, bh
    add dl, '0'
    int 21h

    mov ah, 9
    lea dx, eq
    int 21h

    mov al, bl
    mul bh 
    mov cl,10
    
    div cl
    mov cx,ax

    add cl,48
    mov dl,cl
    mov ah,2 
    int 21h
    add ch,48
    mov dl,ch 
    mov ah,2
    int 21h 
    inc bh
    lea dx,nl
    mov ah,9
    int 21h
    cmp bh,10
    jge exit
    jmp table_loop
    exit:
    mov ah, 4ch
    int 21h
main endp
end main