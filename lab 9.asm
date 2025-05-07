.model small
.stack 100h
.data
msg1 db 'Enter a number: $'
msg2 db 10,13,10,13,'Reverse Number is: $'
.code
main proc
    mov ax,@data
    mov ds,ax
    mov ah,9
    mov dx,offset msg1
    int 21h
    
    mov cx,0
    read:
    mov ah,1
    int 21h
    cmp al,13
    je end_read
    sub al,48
    mov ah,0
    push ax
    inc cx
    jmp read
    
    end_read:
    mov ah,9
    lea dx,msg2
    int 21h
    
    mov ah,2
    
    display:
    pop dx
    add dl,48
    int 21h
    loop display
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main