.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC  
    
    MOV BL, 3
    
    ADD BL, 5   
    
    MOV DL, BL
    
    ADD DL, 48      ; OR use 30H instead of 48       Both work only for digit 0 - 9 (single digit)
    
    MOV AH, 2
    
    INT 21H 
     
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN

Copywrite 2026 Himel Sarder. Feel free to use and learn, but don’t forget to give credit.
