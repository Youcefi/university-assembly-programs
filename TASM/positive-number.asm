pile segment
    dw 200
pile ends
donne segment
    msg db" Test si ax > 0 $"
 donne ends
code segment
    main proc
    assume cs:code,ds:donne,ss:pile
    mov ax,donne
    mov ds,ax
    ;affichage du msg
    mov ah,09
    mov dx,offset msg
    int 21h
    ;test condition
    mov ax,5
    cmp ax,0
    ja alors
    sub ax,bx
    mov bx,1
    jmp fin
    alors:add ax,bx
    mov bx,0
    ;sortir du programme
    fin: mov ah,4ch
    int 21h
    main endp
code ends
end main