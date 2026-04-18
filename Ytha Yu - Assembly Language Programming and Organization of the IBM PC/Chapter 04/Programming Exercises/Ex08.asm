.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 0DH,0AH,'THE SUM OF $'
    MSG2 DB ' AND $'
    MSG3 DB ' IS $'

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX 
    
    MOV DL, '?'
    MOV AH, 2
    INT 21H

    ; -------- INPUT FIRST NUMBER --------
    MOV AH, 1
    INT 21H
    SUB AL, 48
    MOV BL, AL

    ; -------- INPUT SECOND NUMBER --------
    MOV AH, 1
    INT 21H
    SUB AL, 48
    MOV CL, AL

    ; -------- PRINT MSG1 --------
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    ; print first number
    MOV DL, BL
    ADD DL, 48
    MOV AH, 2
    INT 21H

    ; -------- PRINT MSG2 --------
    LEA DX, MSG2
    MOV AH, 9
    INT 21H

    ; print second number
    MOV DL, CL
    ADD DL, 48
    MOV AH, 2
    INT 21H

    ; -------- PRINT MSG3 --------
    LEA DX, MSG3
    MOV AH, 9
    INT 21H

    ; -------- ADD CORRECTLY --------
    MOV AL, BL
    ADD AL, CL        ; AL = sum (numeric)

    ; convert to ASCII
    ADD AL, 48
    MOV DL, AL

    MOV AH, 2
    INT 21H

    ; EXIT
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
