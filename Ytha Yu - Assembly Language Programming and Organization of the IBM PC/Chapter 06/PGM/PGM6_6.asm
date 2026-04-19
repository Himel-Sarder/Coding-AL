.MODEL SMALL
.STACK 100H

.DATA
    PROMP DB 'ENTER NUM: $'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, PROMP
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    CMP AL, '1'
    JE PRINT_O
    
    CMP AL, '3'
    JE PRINT_O
    
    CMP AL, '2'
    JE PRINT_E
    
    CMP AL, '4'
    JE PRINT_E
    
    PRINT_O:
    MOV DL, 'o'
    MOV AH, 2
    INT 21H 
    
    JMP DONE
    
    PRINT_E:
    MOV DL, 'e'
    MOV AH, 2
    INT 21H 
    
    JMP DONE
DONE:
    MOV AH, 4CH
    INT 21H      
MAIN ENDP
END MAIN
