.MODEL SMALL
.STACK 100H

.DATA
    string DB 'Himel Sarder is a Noob Assembly Language Programmer$'    ; DB --> define byte (1 byte per character)     
                                                                        ; $ --> string terminator for DOS AH=09H function

.CODE  

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, string   ; LEA --> Load Effective Address  Load address of memory location to DX
    
    ; Why not MOV?  --> MOV is a 16 bit Register so it can only load first word (2 bytes) but String is a char array / multiple bytes   
    ;               --> LEA loads memory address not value
    
    MOV AH, 09H      ; Function to display string
    INT 21H

    MOV AH, 4CH
    INT 21H 
    
MAIN ENDP
END MAIN 

; Copywrite 2026 Himel Sarder. Feel free to use and learn, but don’t forget to give credit.
