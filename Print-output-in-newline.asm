.MODEL SMALL
.STACK 100H

.DATA
    char DB ?      ; Store input character

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Read character from user (with echo)
    MOV AH, 01H
    INT 21H
    MOV char, AL   ; Save input in variable

    ; Print newline first (so second output appears on new line)
    MOV DL, 0DH    ; Carriage Return   
    ; 0DH = ASCII code for Carriage Return (CR) ---> cursor moves to beginning of the current line
    
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH    ; Line Feed  
    ; OAH = ASCII code for Line Feed (LF) ---> cursor goes to the next line
    
    MOV AH, 02H
    INT 21H

    ; Print the character again
    MOV DL, char
    MOV AH, 02H
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN

; Copywrite 2026 Himel Sarder. Feel free to use and learn, but don’t forget to give credit.
