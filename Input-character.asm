.MODEL SMALL              ; Use small memory model
.STACK 100H               ; Allocate 256 bytes for stack

.DATA                     ; Data segment (empty)

.CODE                     ; Code segment starts  


MAIN PROC                 ; Main procedure

    MOV AH, 1             ; Read a character from keyboard     
    
    ; AH ---> control (function number)
    ; AL ---> data
    ; AX ---> both together (use with caution)  
    
    INT 21H               ; Call dos interrupt (input stored in al)

    MOV DL, AL            ; Move input character to DL for output  
    
    ; 02H	->  Print single character	->  DL
    ; 09H	->  Print string	        ->  DX  
    
    MOV AH, 2             ; Display character function
    INT 21H               ; Print character

    MOV AH, 4CH           ; Terminate program function
    INT 21H               ; Return control to dos

MAIN ENDP                 ; End of main procedure
END MAIN                  ; End of program

; Copywrite 2026 Himel Sarder. Feel free to use and learn, but don’t forget to give credit.
