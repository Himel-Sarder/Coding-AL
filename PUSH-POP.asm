.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB ' --> IS PUSHED..', 0DH, 0AH, '$'
    MSG2 DB ' --> IS POOPED..', 0DH, 0AH, '$'
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; FIRST PUSH
    MOV AX, 2
    PUSH AX
    
    MOV DX, AX
    ADD DX, 48
    MOV AH, 2
    INT 21H
    
    LEA DX, MSG1
    MOV AH, 9
    INT 21H 
  
    
    ; SECOND PUSH
    MOV AX, 5
    PUSH AX
    
    MOV DX, AX
    ADD DX, 48
    MOV AH, 2
    INT 21H
    
    LEA DX, MSG1
    MOV AH, 9
    INT 21H  
    
    ; FIRST POP
    POP AX
    
    MOV DX, AX
    ADD DX, 48
    MOV AH, 2
    INT 21H
    
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
    
    ; SECOND POP
    POP AX
    
    MOV DX, AX
    ADD DX, 48
    MOV AH, 2
    INT 21H
    
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
    

    ; --- EXIT ---
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
; Copywrite 2026 Himel Sarder. Feel free to use and learn, but don’t forget to give credit.
