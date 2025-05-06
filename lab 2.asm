.model small
.stack 100h
.data
    msg1 db 'Enter first number: $'
    msg2 db 10,13,'Enter second number: $'
    msg3 db 10,13,'Enter third number: $'
    msg4 db 10,13,10,13,10,13,'Largest number is: $'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, msg1
    int 21h

    mov ah, 1
    int 21h
    mov bl, al

    mov ah,9
    lea dx,msg2
    int 21h
    
    mov ah,1
    int 21h
    cmp al,bl
    jle skip1
    mov bl,al
    skip1: 
    mov ah,9
    lea dx,msg3
    int 21h
    
    mov ah,1
    int 21h
    cmp al,bl
    jle skip2
    mov bl,al
    skip2:
    mov ah,9
    lea dx,msg4
    int 21h
    
    mov dl,bl
    mov ah,2
    int 21h
exit:
    mov ah, 4ch
    int 21h
    main endp
end main
