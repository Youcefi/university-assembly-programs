pile segment
    dw 200
pile ends

donne segment
    tab db 'N','o','u','r','a'
donne ends

code segment
  main proc
  assume cs:code,ds:donne,ss:pile 
  mov ax,donne
  mov ds,ax 
  
  ;compteur
  mov cx,4
  mov si,offset tab
  
  etiq:mov ah,02
  mov dl,[si]
  int 21h
  inc si
  dec cx
  jnz etiq
  
  ;sortir du programme
   mov ah,4ch
  int 21h
  main endp
code ends
end main