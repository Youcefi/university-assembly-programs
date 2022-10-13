Sseg segment
    dw 100 ; partie pile
Sseg ends

Dseg segment ; partie donnees
msg1 db "donnez le premier caractere $"
msg2 db "donnez le deuxieme caractere$"
msg3 db "le tri par ordre alphabetique est comme suit$"
Dseg ends

Cseg segment
    main proc 
    assume cs:Cseg, ds:Dseg, ss:Sseg
    mov ax, Dseg
    mov ds, ax
    ; afficher le premier message
    mov ah, 09
    mov dx, offset msg1
    int 21h
    ; lire le premier caractere
    mov ah, 01
    int 21h
    
    mov bl, al
    
    ; afficher le premeir message
    mov ah, 09
    mov dx, offset msg2
    int 21h
    ; lire le deuxieme  caractere
    mov ah, 01
    int 21h
    
  
    mov cl, al
    ; retour a une nouvelle ligne 
    mov ah, 02
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h
    ; afficher le troisieme message
    mov ah, 09
    mov dx, offset msg3
    int 21h
; retour a une nouvelle ligne 
    mov ah, 02
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h
    ; comparaison
    cmp bl, cl
    JA sup
    mov ah, 02
    mov dl, bl ; afficher la premiere lettre
    int 21h
    mov dl, ' ' ; inserer un espace entre les deux lettres
    int 21h
    mov dl, cl ; afficher la deuxieme lettre
    int 21h
    jmp fin
   sup: mov ah, 02
   mov dl, cl
   int 21h
   mov dl, ' '
   int 21h
   mov dl, bl
   int 21h
   
  fin: 
  mov ah, 4ch
  int 21h
  
  
main endp
Cseg ends
end main
    
    
    
    
