; Write a program to print a Character

.MODEL SMALL    ; Code and data each = 64KB -> One data segment, one code segment
.STACK 100H     ; Reserves 256 bytes of stack
.DATA           ; Section for variables
.CODE           ; Section for actual instructions



MAIN PROC
    MOV DL, 'H'     ; DL -> Character output, input          DH -> Extra/secondary data (like row, count)
    MOV AH, 02H     ; Function to display character    
    
    ; 02H	->  Print single character	->  DL
    ; 09H	->  Print string	        ->  DX
    ; 01H	->  Input + display (echo)	->  AL
    
    ; The interrupt needs one character (1 byte) to print
    ; DX is a 16-bit register that splits into:
    ; DH (high 8-bit)
    ; DL (low 8-bit)

    ; So DOS uses DL to pass the character.

    ; Why DL? -> Because it is the lower 8-bit (byte) of DX. Perfect size for a single ASCII character     
    
    
    INT 21H         ; DOS interrupt 
    

    ; 10H	-> BIOS video services
    ; 16H	-> BIOS keyboard services
    ; 21H	-> DOS system services (I/O, files, programs)

    MOV AH, 4CH     ; Exit program       AH = 4CH is a DOS function number for Terminate Program.
    INT 21H
      
MAIN ENDP
END MAIN            

; 'H' --> DL --> AH=02H --> INT 21H --> H printed --> AH=4CH --> INT 21H --> Exit
