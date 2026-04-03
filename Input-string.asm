.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'INPUT A STRING: $'
    MSG2 DB 0DH, 0AH, 'YOUR INPUTED STRING IS: $'
    STR   DB 20 DUP('$')   ; Reserve 20 bytes for input
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; --- PRINT PROMPT ---
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    ; --- READ STRING ---
    MOV SI, 0            ; SET Index for STR
READ_CHAR:
    ; INPUT A CHARACTER AND STORE IT IN AL
    MOV AH, 1            ; DOS: read character
    INT 21H 
    
    ; COMPARE IF ENTER KEY ASCII CODE IN AL OR NOT
    CMP AL, 0DH          ; Enter key?
    
    ; IF IT IS ASCII CODE OF ENTER KEY
    JE DONE_INPUT 
    
    ; IF NOT
    ; INSERT AL CHARACTER IN INDEX 0
    MOV [STR+SI], AL     ; store character in STR  
    
    ; INCREASE INDEX
    INC SI   
    
    ; READ CHARACTER AGAIN
    JMP READ_CHAR 
    
    ; IF IT IS ASCII CODE OF ENTER KEY, JUMP TO HERE.. 
DONE_INPUT:
    ; INSERT TERMINATOR $
    MOV [STR+SI], '$'    ; terminate string

    ; --- PRINT OUTPUT MESSAGE ---
    LEA DX, MSG2
    MOV AH, 9
    INT 21H

    ; --- PRINT THE STRING ---
    LEA DX, STR
    MOV AH, 9
    INT 21H

    ; --- EXIT ---
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
; Copywrite 2026 Himel Sarder. Feel free to use and learn, but don’t forget to give credit.
