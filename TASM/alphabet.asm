pile segment
    dw 200
pile ends
donne segment
    msg db"les caracteres de l'alphabet sont :$ "
donne ends
code segment
    main proc
    assume cs:code,ds:donne,ss:pile
    mov ax,donne
    mov ds,ax
    ;affichage de premier msg
    mov ah,09
    mov dx,offset msg
    int 21h
    ;affichage les caracteres de l'alphabet 
    mov cx,26
    mov dl,41h
    ;mov dl,61h pour afficher les caracteres en miniscule
    etiq:mov ah,02
    int 21h
    add dl,1
    loop etiq
    ;sortir du programme
    mov ah,4ch
    int 21h
    main endp
code ends
end main