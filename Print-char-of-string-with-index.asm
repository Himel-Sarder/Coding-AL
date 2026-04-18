.MODEL SMALL
.STACK 100H

.DATA
    STR DB 'HIMEL$'
    INDEX DB 1

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA SI, STR    ; SI = H (0 Index)

    MOV BL, INDEX  ; BL = 01H
    MOV BH, 0      ; BH = 00   So BX = BH + BL = 00 001H (16 bit)
    ADD SI, BX     ; SI -> 16 bit register so we need another 16 bit register to add with SI

    ; get character
    MOV DL, [SI]

    ; print character
    MOV AH, 2
    INT 21H

    ; exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
