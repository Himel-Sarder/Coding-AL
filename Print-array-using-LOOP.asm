.MODEL SMALL
.STACK 100H
.DATA
    MSG DB 'ARRAY: $'
    ARR DB 1, 8, 3, 9, 6
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    ; PRINT MESSAGE
    LEA DX, MSG
    MOV AH, 9
    INT 21H 
    
    ; PRINT ARRAY
    MOV SI, OFFSET ARR     ; SI --> SOURCE INDEX REGISTER, USED AS POINTER TO ACCESS ARRAY
    
    MOV CX, 5
    
    ; LOOP
    L1:
    MOV DL, [SI]
    ADD DL, 48
    MOV AH, 2
    INT 21H
    
    INC SI
           
    LOOP L1
    
    ; EXIT
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN
; Copywrite 2026 Himel Sarder. Feel free to use and learn, but don’t forget to give credit.
