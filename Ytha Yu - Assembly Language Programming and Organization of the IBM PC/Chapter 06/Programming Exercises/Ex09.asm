.MODEL SMALL
.STACK 100H

.DATA
    SPACE DB ' $'
    NEWLINE DB 0DH,0AH,'$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV BL, 80H      ; Starting ASCII
    MOV CX, 0        ; Counter for 10 chars

PRINT_LOOP:

    ; Print character
    MOV DL, BL
    MOV AH, 02H
    INT 21H

    ; Print space
    MOV AH, 09H
    LEA DX, SPACE
    INT 21H

    INC BL           ; Next ASCII
    INC CX           ; Count++

    CMP CX, 10
    JE NEW_LINE

    CMP BL, 00H      ; after FF ? overflow --> 00
    JNE PRINT_LOOP
    JMP END_PROGRAM

NEW_LINE:
    MOV AH, 09H
    LEA DX, NEWLINE
    INT 21H

    MOV CX, 0
    CMP BL, 00H
    JNE PRINT_LOOP

END_PROGRAM:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
