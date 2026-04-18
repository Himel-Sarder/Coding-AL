; Write a program that will prompt the user to enter a hex digit character ("0"... "9" or "A"... "F"), display it on the next line in decimal, and ask the user if he or she wants to do it again. If the user types "y" or "Y", the program repeats; if the user types anything else, the program terminates. If the user enters an illegal character, prompt the user to try again.

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 0DH, 0AH, 'ENTER A HEX DIGIT: $'
    MSG2 DB 0DH, 0AH, 'IN DECIMAL IT IS: $'
    MSG3 DB 0DH, 0AH, 'DO YOU WANT TO DO IT AGAIN? $'
    ERR  DB 0DH, 0AH, 'ILLEGAL CHARACTER - ENTER 0..9 OR A..F: $'
    CHAR DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

START_PROG:
    ; ১. প্রম্পট দেখানো
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

INPUT_LABEL:
    ; ২. ইনপুট নেওয়া
    MOV AH, 1
    INT 21H
    MOV CHAR, AL

    ; ৩. ভ্যালিডেশন (০-৯ কি না)
    CMP AL, '0'
    JL ILLEGAL
    CMP AL, '9'
    JBE IS_DIGIT

    ; ৪. ভ্যালিডেশন (A-F কি না)
    CMP AL, 'A'
    JL ILLEGAL
    CMP AL, 'F'
    JBE IS_HEX_UPPER

    ; ৫. ছোট হাতের a-f হ্যান্ডেল করা (অপশনাল কিন্তু ভালো)
    CMP AL, 'a'
    JL ILLEGAL
    CMP AL, 'f'
    JBE IS_HEX_LOWER

ILLEGAL:
    LEA DX, ERR
    MOV AH, 9
    INT 21H
    JMP INPUT_LABEL

IS_DIGIT:
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
    MOV DL, CHAR
    MOV AH, 2
    INT 21H
    JMP ASK_AGAIN

IS_HEX_UPPER:
    SUB CHAR, 11H ; ১০-১৫ ডেসিমেল দেখানোর লজিক
    JMP PRINT_HEX

IS_HEX_LOWER:
    SUB CHAR, 31H ; ছোট হাতের a-f এর জন্য

PRINT_HEX:
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
    
    ; প্রথম ডিজিট '1' প্রিন্ট
    MOV AH, 2
    MOV DL, '1'
    INT 21H
    
    ; দ্বিতীয় ডিজিট প্রিন্ট
    MOV DL, CHAR
    INT 21H

ASK_AGAIN:
    LEA DX, MSG3
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    CMP AL, 'y'
    JE START_PROG
    CMP AL, 'Y'
    JE START_PROG

    ; প্রোগ্রাম শেষ
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
