pile segment
    dw 200
pile ends
donne segment
    num1 db 2
    num2 db 7
    msg1 db" num1 est superieur a num2 $"
    msg2 db" num2 est superieur a num1 $"
    msg3 db" Les deux valeurs sont egales $"
donne ends
code segment
    main proc
    assume cs:code,ds:donne,ss:pile
    mov ax,donne
    mov ds,ax
    
    mov al,num1
  
    cmp al,num2
    jl etiq1
    je etiq2
    
    mov ah,09
    mov dx,offset msg1
    int 21h
    jmp fin
    
    etiq1: mov ah,09
    mov dx,offset msg2
    int 21h
    jmp fin
    
    etiq2: mov ah,09
    mov dx,offset msg3
    int 21h
    
    fin: mov ah,4ch
    int 21h
    main endp
code ends
end main