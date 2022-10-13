pile segment
    dw 200
pile ends
donne segment
    msg1 db "Donner un caractere en miniscule $"
    msg2 db "  le caractere en majuscule est: $"
donne ends
code segment
    main proc
    assume cs:code,ds:donne,ss:pile
    mov ax,donne
    mov ds,ax
    ;affichage de premier msg
    mov ah,09
    mov dx,offset msg1
    int 21h
    ;lire un caractere en miniscule (al)
    mov ah,01
    int 21h
    ;traitement :conversion en majuscule
    sub al,20h
   
    ;affichage de deuxieme msg
    mov ah,09
    mov dx,offset msg2
    int 21h
    mov dl,al
    ;affiche le nouveau caractere
    mov ah,02
    int 21h
    ;sortir du programme
    mov ah,4ch
    int 21h
    main endp
code ends
end main