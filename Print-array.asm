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
    MOV DL, [SI]           ; OFFSET ARR -->  Memory address of ARR variable
    ADD DL, 48             ; SI = address of ARR (e.g., 1000)  --> [SI] = memory[1000] = 1 --> DL = 1
    MOV AH, 2
    INT 21H
    
    MOV DL, [SI+1]
    ADD DL, 48
    MOV AH, 2
    INT 21H
    
    MOV DL, [SI+2]
    ADD DL, 48
    MOV AH, 2
    INT 21H
    
    MOV DL, [SI+3]
    ADD DL, 48
    MOV AH, 2
    INT 21H 
    
    MOV DL, [SI+4]
    ADD DL, 48
    MOV AH, 2
    INT 21H
    
    ; EXIT
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN
; Copywrite 2026 Himel Sarder. Feel free to use and learn, but don’t forget to give credit.
