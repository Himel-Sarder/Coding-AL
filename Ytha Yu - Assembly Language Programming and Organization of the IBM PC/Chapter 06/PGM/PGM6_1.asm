.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC
    MOV CX, 256      ; loop 256 times
    MOV DL, 0        ; start from ASCII 0

PRINT_LOOP: 
    MOV AH, 02H      ; DOS function: print character
    INT 21H          ; print DL character
    INC DL           ; next character
    DEC CX           ; decrease counter
    JNZ PRINT_LOOP   ; repeat until CX = 0

    ; exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
