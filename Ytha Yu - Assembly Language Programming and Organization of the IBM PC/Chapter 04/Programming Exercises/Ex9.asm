.MODEL SMALL
.STACK 100H

.DATA
    PROMPT DB 'ENTER THREE INITIALS: $'
    CHAR1  DB ?
    CHAR2  DB ?
    CHAR3  DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; (a) Prompt display করা
    LEA DX, PROMPT
    MOV AH, 9
    INT 21H

    ; (b) তিনটি অক্ষর পড়া (Read three initials)
    MOV AH, 1
    INT 21H
    MOV CHAR1, AL  ; ১ম অক্ষর সেভ করা

    INT 21H
    MOV CHAR2, AL  ; ২য় অক্ষর সেভ করা

    INT 21H
    MOV CHAR3, AL  ; ৩য় অক্ষর সেভ করা

    ; (c) Display them down the left margin
    
    ; ১ম অক্ষর প্রিন্ট
    CALL NEWLINE
    MOV DL, CHAR1
    MOV AH, 2
    INT 21H

    ; ২য় অক্ষর প্রিন্ট
    CALL NEWLINE
    MOV DL, CHAR2
    MOV AH, 2
    INT 21H

    ; ৩য় অক্ষর প্রিন্ট
    CALL NEWLINE
    MOV DL, CHAR3
    MOV AH, 2
    INT 21H

    ; Program শেষ করা
    MOV AH, 4CH
    INT 21H
MAIN ENDP

; নতুন লাইনের জন্য একটি ছোট প্রসিডিউর (Procedure)
NEWLINE PROC
    MOV AH, 2
    MOV DL, 13 ; Carriage Return
    INT 21H
    MOV DL, 10 ; Line Feed
    INT 21H
    RET
NEWLINE ENDP

END MAIN
