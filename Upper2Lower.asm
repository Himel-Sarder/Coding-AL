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
    ADD BL, 20H
    MOV DL, BL
    MOV AH, 2
    INT 21H  
     
    
    ; EXIT
    MOV AH, 4CH
    INT 21H
        
    
MAIN ENDP
END MAIN
; Copywrite 2026 Himel Sarder. Feel free to use and learn, but don’t forget to give credit.
