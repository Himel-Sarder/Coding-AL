.MODEL SMALL
.STACK 100H
.DATA 
    MSG1 DB 'NUMBER FROM 9 TO 0: $'
    MSG2 DB 0DH, 0AH, '$'
.CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H
    
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H
    
    MOV CX, 10
    MOV DL, 57
    
    L1:  
    
    MOV AH, 2
    INT 21H
    
    SUB DL, 1
    
    LOOP L1 
    
    MOV AH, 4CH
    INT 21H
    
    
MAIN ENDP
END MAIN

; Copywrite 2026 Himel Sarder. Feel free to use and learn, but don’t forget to give credit.
