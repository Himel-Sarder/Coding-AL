.model small
.stack 100h

.data

.code
main proc
    
    ; number to print --> 18
    mov bl, 18
    add bl, 22
    add bl, 56 

    ; prepare ax for division       div --> divide ax where ax = ah + al so need both ah and al   
    mov al, bl                      ; AL ---> 18H 
    mov ah, 0                       ; AH ---> 00H
                                    ; AX ---> 0018H     

    mov cl, 10
    div cl                          ; AL = quotient, AH = remainder 
    
    mov bh, ah       

    ; print first digit
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; print second digit
    mov al, bh
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; exit
    mov ah, 4ch
    int 21h

main endp
end main  

; Number ---> divide by 10 ---> divided into tens + units ---> ASCII convert ---> print  

; Copywrite 2026 Himel Sarder. Feel free to use and learn, but don’t forget to give credit.
