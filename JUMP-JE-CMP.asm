.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 0DH, 0AH, 'NUMBERS ARE EQUAL$'
    MSG2 DB 0DH, 0AH, 'NUMBERS ARE NOT EQUAL$'
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 

    MOV DL, '4'     ; ASCII compare

    MOV AH, 1 
    INT 21H

    CMP DL, AL

    JE L1 
    JMP L2
        
L1:
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
    JMP END_IF

L2:
    LEA DX, MSG2
    MOV AH, 9
    INT 21H

END_IF:

    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN

; Copywrite 2026 Himel Sarder. Feel free to use and learn, but don’t forget to give credit.
