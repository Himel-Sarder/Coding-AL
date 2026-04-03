.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ARRAY: $'
    MSG2 DB 0DH, 0AH, 'LENGTH OF ARRAY IS : $'
    ARR DB 1, 8, 3, 9, 6, 4
    LEN EQU ($-ARR)      ; $ ---> current location (current address) WHERE ASSEMBLER IS IN NOW
     
                         ; SUPPOSE:
                         
                         ; ARR starts at 1000
                         ; 1000 --> 1
                         ; 1001 --> 8
                         ; 1002 --> 3
                         ; 1003 --> 9
                         ; 1004 --> 6
                         ; 1005 --> 4
                         
                         ; $ = 1006 current address (after last)
                         ; ($-ARR) = 1006 - 1000 = 6
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    ; PRINT MESSAGE1
    LEA DX, MSG1
    MOV AH, 9
    INT 21H 
    
    ; PRINT ARRAY
    MOV SI, OFFSET ARR     ; SI --> SOURCE INDEX REGISTER, USED AS POINTER TO ACCESS ARRAY
    
    MOV CX, LEN
    
    ; LOOP
    L1:
    MOV DL, [SI]
    ADD DL, 48
    MOV AH, 2
    INT 21H
    
    INC SI
           
    LOOP L1
    
    ; PRINT MESSAGE2
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
     
    MOV DL, LEN
    ADD DL, 48
    MOV AH, 2
    INT 21H
    
    ; EXIT
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN
; Copywrite 2026 Himel Sarder. Feel free to use and learn, but don’t forget to give credit.
