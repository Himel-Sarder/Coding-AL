.MODEL SMALL              ; Use small memory model
.STACK 100H

.DATA

.CODE
MAIN PROC   
    
    MOV DX, 123
    ADD DX, 234
    ADD DX, 475

    MOV AX, DX           ; Number 852 (can be >100)

    ; -------- hundreds --------
    MOV DX, 0             ; Clear DX (for 16-bit DIV)   CPU uses DX when divide 16 bit
    MOV BX, 100
    DIV BX                ; AX ÷ 100
                          ; AX = quotient (hundreds)
                          ; DX = remainder   
                          
                          ; 852 ÷ 100 = 8 remainder 52    
                          ; AX = 8   (hundreds)
                          ; DX = 52   (remainder)   
                          
                          
                          ; DIV reg/mem16:

                                ; Dividend = DX:AX (32-bit combined)
                                ; Divisor = 16-bit (BX)
                                ; Result:
                                  ; AX = quotient (852 ÷ 100 = 8 ---> AL = 8,(AH ignored for 8-bit print)
                                  ; DX = remainder (852 % 100 = 52)

    ADD AL, 30H           ; Convert to ASCII
    MOV DL, AL
    MOV AH, 02H
    INT 21H               ; Print hundreds

    ; -------- tens --------
    MOV AX, DX            ; Remainder (02)
    MOV DX, 0
    MOV BX, 10
    DIV BX                ; AX ÷ 10
                          ; AL = tens, AH = units (or DX if 16-bit)

    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H               ; Print tens

    ; -------- units --------
    ADD AH, 30H
    MOV DL, AH
    MOV AH, 02H
    INT 21H               ; Print units

    ; exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
; Copywrite 2026 Himel Sarder. Feel free to use and learn, but don’t forget to give credit.
