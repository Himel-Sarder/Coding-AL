; Do programming exercise 10, except that if the user fails to enter a hex-digit character in three tries, display a message and terminate the program.

.MODEL SMALL
.STACK 100H

.DATA
    PROMPT DB 0DH, 0AH, 'ENTER A HEX DIGIT: $'
    MSG_DEC DB 0DH, 0AH, 'IN DECIMAL IT IS: $'
    ERR_MSG DB 0DH, 0AH, 'ILLEGAL CHARACTER! TRY AGAIN.$'
    FAIL_MSG DB 0DH, 0AH, 'THREE WRONG TRIES. PROGRAM TERMINATED.$'
    TRY_COUNT DB 0 ; ভুল ইনপুটের সংখ্যা রাখার জন্য

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

START_INPUT:
    ; প্রম্পট দেখানো
    LEA DX, PROMPT
    MOV AH, 9
    INT 21H

    ; ইনপুট নেওয়া
    MOV AH, 1
    INT 21H
    MOV BL, AL ; ইনপুট BL এ সেভ করা

    ; ভ্যালিডেশন শুরু (0-9 কি না)
    CMP BL, '0'
    JL INVALID
    CMP BL, '9'
    JBE IS_DIGIT

    ; A-F কি না
    CMP BL, 'A'
    JL INVALID
    CMP BL, 'F'
    JBE IS_HEX
    
    ; a-f কি না (ছোট হাতের অক্ষর হ্যান্ডেল করার জন্য)
    CMP BL, 'a'
    JL INVALID
    CMP BL, 'f'
    JBE IS_HEX_LOWER

INVALID:
    INC TRY_COUNT ; ভুলের সংখ্যা ১ বাড়ানো
    CMP TRY_COUNT, 3
    JE FAILED ; ৩ বার ভুল হলে FAILED লেবেলে যাবে

    LEA DX, ERR_MSG ; ভুল ইনপুটের মেসেজ
    MOV AH, 9
    INT 21H
    JMP START_INPUT ; আবার ইনপুট নিতে ফেরত যাওয়া

IS_DIGIT:
    LEA DX, MSG_DEC
    MOV AH, 9
    INT 21H
    MOV DL, BL
    MOV AH, 2
    INT 21H
    JMP EXIT

IS_HEX:
    SUB BL, 11H ; হেক্স টু ডেসিমেল লজিক
    JMP PRINT_HEX

IS_HEX_LOWER:
    SUB BL, 31H ; ছোট হাতের a-f এর জন্য
    JMP PRINT_HEX

PRINT_HEX:
    LEA DX, MSG_DEC
    MOV AH, 9
    INT 21H
    MOV DL, '1' ; প্রথম ডিজিট '1'
    MOV AH, 2
    INT 21H
    MOV DL, BL ; দ্বিতীয় ডিজিট
    INT 21H
    JMP EXIT

FAILED:
    LEA DX, FAIL_MSG ; ৩ বার ভুলের পর শেষ মেসেজ
    MOV AH, 9
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
