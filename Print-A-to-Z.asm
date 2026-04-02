.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC   
    MOV CX, 26   ; 26 ALPHABETS
    MOV DL, 65   ; ASCII CODE OF A
    L1:
    
    MOV AH, 2
    INT 21H
    
    ADD DL, 1
    
    
    LOOP L1 
    
    MOV AH, 4CH
    INT 21H
    
    
MAIN ENDP
END MAIN
; Copywrite 2026 Himel Sarder. Feel free to use and learn, but don’t forget to give credit.
