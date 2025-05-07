.model small
.stack 100h
.data
msg1 db 'Enter a word or Number: $'
msg2 db 10,13,10,13,'It is palindrome! $'
msg3 db 10,13,10,13,'It is not palindrome!$'
input db 20 dup('$')
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov dx,offset msg1
    mov ah,9
    int 21h
    mov si,0   
    
    read:
    mov ah,1
    int 21h
    cmp al,13
    je done
    mov input[si],al
    inc si
    jmp read
    
    done:
    dec si
    mov di,0
    
    check:      
    cmp di,si
    jge is_pali
    mov al,input[si]
    mov bl,input[di]
    cmp al,bl
    jne not_pali
    inc di
    dec si
    jmp check  
    
    is_pali:
    mov dx,offset msg2
    mov ah,9
    int 21h
    jmp exit
    
    not_pali:
    lea dx,msg3
    mov ah,9
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main   


