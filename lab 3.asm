.model small
.stack 100h
.data
msg1 db 'Enter first 2-digit number: $'
msg2 db 10,13,'Enter second 2-digit number: $'
msg3 db 10,13,10,13,'The Multiplication of the two number is: $'   
num1 dw ?
num2 dw ? 
t db ?
h db ?
te db ?
o db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    mov dx,offset msg1         ;first number
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov bl,10
    mul bl
    mov cx,0 
    mov ah,0
    mov cx,ax
    
    mov ah,1
    int 21h
    sub al,48
    mov ah,0
    add cx,ax    
    mov num1,cx
    
    lea dx,msg2  ; second number
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov bl,10
    mul bl   
    mov cx,0
    mov ah,0
    mov cx,ax
    
    mov ah,1
    int 21h
    sub al,48
    mov ah,0
    add cx,ax
    mov num2,cx
    
    mov ax,num1
    mul num2   
    
    mov bx,1000
    mov dx,0
    div bx
    mov cx,dx
    add al,48
    mov t,al
    
    mov ax,cx
    mov dx,0
    mov bx,100
    div bx
    mov cx,dx
    add al,48
    mov h,al
    
    mov ax,cx
    mov dx,0
    mov bl,10
    div bl
    add al,48
    mov te,al
    add ah,48
    mov o,ah
    
    lea dx,msg3
    mov ah,9
    int 21h
    
    cmp t,'0'
    je hundred
    mov ah,2
    mov dl,t
    int 21h
    
    hundred:
    cmp h,'0'
    je ten
    mov ah,2
    mov dl,h
    int 21h
    
    ten:
    mov dl,te
    mov ah,2
    int 21h
    mov dl,o
    mov ah,2
    int 21h
    exit:
    mov ah,4ch
    int 21h
    main endp
end main