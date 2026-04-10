.MODEL SMALL
.STACK 100H

.DATA
    MSG DB '?$'
    NL  DB 0DH,0AH,'$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Show '?'
    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    ; Read first letter
    MOV AH, 01H
    INT 21H
    MOV BL, AL

    ; Read second letter
    MOV AH, 01H
    INT 21H
    MOV BH, AL

    ; Compare
    CMP BL, BH
    JG SWAP        ; if BL > BH -> swap

    JMP PRINT

SWAP:
    XCHG BL, BH    ; swap two letters

PRINT:
    ; New line
    MOV AH, 09H
    LEA DX, NL
    INT 21H

    ; Print in order
    MOV DL, BL
    MOV AH, 02H
    INT 21H

    MOV DL, BH
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
