Sseg segment
    dw 100 ; partie pile
Sseg ends

Dseg segment 
    msg1 db "donnez le caractere a trouver:  $"
    msg2 db " Ce caractere appartient au tableau $"
    msg3 db " caractere non trouve dans le tableau $"
    tab db 'a', 'b', 'c', 'd', 'e'
Dseg ends

Cseg segment
    main proc 
    assume cs:Cseg, ds:Dseg, ss:Sseg
    mov ax, Dseg
    mov ds, ax
    
    ;affichage du msg1
    mov ah, 09
    mov dx, offset msg1
    int 21h
    
    ; retour a la ligne 
    mov ah, 02
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h
    
    ; lire la caractere par utilisateur
    mov ah, 01
    int 21h
    
    mov cx, 05
    mov si, offset tab
    
    bcl: 
    cmp al, [si]
    je trouve
    inc si
    dec cx
    jnz bcl
     
    ;affichage du msg3
      mov ah, 09
      mov dx, offset msg3
      int 21h
      jmp fin 
     
     ;affichage du msg2
     trouve: mov ah, 09
         mov dx, offset msg2
         int 21h 
      
       ;sortir du programme  
     fin: mov ah, 4ch
     int 21h
     main endp
 Cseg ends
 end main
 
 
 
 