; Do programming exercise 10, except that if the user fails to enter a hex-digit character in three tries, display a message and terminate the program.

.MODEL SMALL
.STACK 100H

.DATA
    PROMPT   DB 0DH, 0AH, 'ENTER A HEX DIGIT: $'
    MSG_DEC  DB 0DH, 0AH, 'IN DECIMAL IT IS: $'
    ERR_MSG  DB 0DH, 0AH, 'ILLEGAL CHARACTER! TRY AGAIN.$'
    FAIL_MSG DB 0DH, 0AH, 'THREE WRONG TRIES. PROGRAM TERMINATED.$'
    AGAIN_MSG DB 0DH, 0AH, 'DO YOU WANT TO TRY AGAIN? (Y/N): $'
    TRY_COUNT DB 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

START_OVER:
    MOV TRY_COUNT, 0   ; নতুন করে শুরু করলে কাউন্টার ০ হবে

INPUT_LOOP:
    ; প্রম্পট দেখানো
    LEA DX, PROMPT
    MOV AH, 9
    INT 21H

    ; ইনপুট নেওয়া
    MOV AH, 1
    INT 21H
    MOV BL, AL

    ; ভ্যালিডেশন (0-9)
    CMP BL, '0'
    JL INVALID
    CMP BL, '9'
    JBE IS_DIGIT

    ; ভ্যালিডেশন (A-F)
    CMP BL, 'A'
    JL INVALID
    CMP BL, 'F'
    JBE IS_HEX
    
    ; ভ্যালিডেশন (a-f)
    CMP BL, 'a'
    JL INVALID
    CMP BL, 'f'
    JBE IS_HEX_LOWER

INVALID:
    INC TRY_COUNT
    CMP TRY_COUNT, 3
    JE FAILED          ; ৩ বার ভুল হলে সরাসরি টার্মিনেট হবে

    LEA DX, ERR_MSG
    MOV AH, 9
    INT 21H
    JMP INPUT_LOOP     ; আবার ইনপুট নিতে ফেরত যাওয়া

IS_DIGIT:
    LEA DX, MSG_DEC
    MOV AH, 9
    INT 21H
    MOV DL, BL
    MOV AH, 2
    INT 21H
    JMP ASK_USER       ; সঠিক ইনপুটে জিজ্ঞাসা করবে আবার করবে কি না

IS_HEX:
    SUB BL, 11H        ; ASCII অ্যাডজাস্টমেন্ট
    JMP PRINT_HEX

IS_HEX_LOWER:
    SUB BL, 31H        ; ছোট হাতের অক্ষরের জন্য

PRINT_HEX:
    LEA DX, MSG_DEC
    MOV AH, 9
    INT 21H
    MOV DL, '1'        ; প্রথম ডিজিট ১
    MOV AH, 2
    INT 21H
    MOV DL, BL         ; দ্বিতীয় ডিজিট
    INT 21H
    JMP ASK_USER       ; সঠিক ইনপুটে জিজ্ঞাসা করবে আবার করবে কি না

FAILED:
    LEA DX, FAIL_MSG
    MOV AH, 9
    INT 21H
    JMP EXIT           ; ৩ বার ভুল করলে সরাসরি এক্সিট (কোনো প্রশ্ন ছাড়া)

ASK_USER:
    LEA DX, AGAIN_MSG
    MOV AH, 9
    INT 21H

    MOV AH, 1
    INT 21H
    
    CMP AL, 'Y'
    JE START_OVER
    CMP AL, 'y'
    JE START_OVER

EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
