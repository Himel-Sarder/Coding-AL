.MODEL SMALL
.STACK 100H

.DATA
    PR1 DB 0DH,0AH,'ENTER A HEX DIGIT: $'
    PR2 DB 0DH,0AH,'DO YOU WANT TO DO IT AGAIN? $'
    PR3 DB 0DH,0AH,'ILLEGAL CHARACTER - ENTER 0..9 OR A..F: $'
    PR4 DB 0DH,0AH,'IN DECIMAL IS IT: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

START:
    ; ---- INPUT ----
    LEA DX, PR1
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H

    ; ---- lowercase to uppercase ----
    CMP AL, 'a'
    JL CHECK
    CMP AL, 'f'
    JG CHECK
    SUB AL, 20H    

CHECK:
    ; ---- VALIDATION ----
    CMP AL, '0'
    JL INVALID
    CMP AL, '9'
    JLE CONVERT

    CMP AL, 'A'
    JL INVALID
    CMP AL, 'F'
    JG INVALID

CONVERT:
    MOV BL, AL

    ; ---- HEX TO DECIMAL ----
    CMP BL, '9'
    JLE NUM

    SUB BL, 'A'
    ADD BL, 10
    JMP PRINT

NUM:
    SUB BL, '0'

PRINT:
    LEA DX, PR4
    MOV AH, 09H
    INT 21H

    MOV AL, BL
    MOV AH, 0
    MOV BL, 10
    DIV BL

    MOV BH, AH      ; remainder
    MOV BL, AL      ; quotient

    ; ---- print tens ----
    CMP BL, 0
    JE ONEDIGIT

    ADD BL, 30H
    MOV DL, BL
    MOV AH, 02H
    INT 21H

ONEDIGIT:
    MOV DL, BH
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    ; ---- AGAIN ----
    LEA DX, PR2
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H

    CMP AL, 'Y'
    JE START
    CMP AL, 'y'
    JE START

    MOV AH, 4CH
    INT 21H

INVALID:
    LEA DX, PR3
    MOV AH, 09H
    INT 21H
    JMP START

MAIN ENDP
END MAIN
