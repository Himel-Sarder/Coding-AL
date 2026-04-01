.MODEL SMALL
.STACK 100H

.DATA
    char DB 'A'     ; Character to print     
    
    ; DB	-> Define Byte	        -> 1 byte	Examples --> 'A', 65
    ; DW	-> Define Word	        -> 2 bytes	Examples --> 1234
    ; DD	-> Define Double Word	-> 4 bytes	Examples --> 12345678

.CODE 

MAIN PROC  
    ; Char is in Data section. To access data, CPU needs to use DS (Data Segment) Register.
    MOV AX, @DATA   ; Address of data segment       Segment register (DS, CS, etc.) ---> 16-bit    Memory address handle ---> 16-bit
    MOV DS, AX      ; Direct the CPU to find data section    
    
    ; Without this two lines --> Garbage value print or Wrong value print

    MOV DL, char    ; Load character into DL
    MOV AH, 02H     ; Function to display character
    INT 21H         ; DOS interrupt

    MOV AH, 4CH     ; Exit program
    INT 21H

MAIN ENDP
END MAIN   


; AX ---> Accumulator Register  ---> Small storage in CPU      


; Copywrite 2026 Himel Sarder. Feel free to use and learn, but don’t forget to give credit.
