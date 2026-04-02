.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC 
    ; READ CHARACTER
    MOV AH, 1
    INT 21H
    
    MOV BL, AL 
    
    ; PRINT -> TO SHOW NICELY
    ; PRINT '-'
    MOV DL, '-'
    MOV AH, 2
    INT 21H
    
    ; PRINT '>'
    MOV DL, '>'
    MOV AH, 2
    INT 21H    
    
    ; CONVERT IT TO LOWER
    SUB BL, 20H
    MOV DL, BL
    MOV AH, 2
    INT 21H  
     
    
    ; EXIT
    MOV AH, 4CH
    INT 21H
        
    
MAIN ENDP
END MAIN
; Copywrite 2026 Himel Sarder. Feel free to use and learn, but don’t forget to give credit.

; -------------------------------------------------------------------------------------------------------------------
; Formal

.MODEL SMALL
.STACK 100H

.DATA
    CR   EQU 0DH                       ; EQU = define constant
    LF   EQU 0AH

    MSG1 DB 'ENTER A LOWER CASE LETTER: $'
    MSG2 DB 0DH,0AH,'IN UPPER CASE IT IS: $'
    CHAR DB ?, '$'

.CODE
MAIN PROC

    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; Print first message
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    ; Input character
    MOV AH, 01H
    INT 21H

    ; Convert to uppercase
    SUB AL, 20H
    MOV CHAR, AL

    ; Print second message
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

    ; Print character
    MOV DL, CHAR
    MOV AH, 02H
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
