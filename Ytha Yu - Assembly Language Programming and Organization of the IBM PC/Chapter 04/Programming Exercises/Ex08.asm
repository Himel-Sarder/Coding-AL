; Problem Statement : Write a program to (a) display a "?", (b) read two decimal digits whose sum is less than 10, (c) display them and their sum on the next line, with an appropriate message.
; Sample execution:
; ?27
; THE SUM OF 2 AND 7 IS 9

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 0DH, 0AH, "THE SUM OF "
    VAR1 DB ?
    MSG2 DB " AND "
    VAR2 DB ?
    MSG3 DB " IS "
    SUM  DB ?
    DB '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; (a) "?" প্রদর্শন করা
    MOV AH, 2
    MOV DL, '?'
    INT 21H

    ; (b) প্রথম ডিজিট পড়া
    MOV AH, 1
    INT 21H
    MOV VAR1, AL       ; ASCII '2' সেভ করা
    SUB AL, 30H         ; ASCII থেকে সংখ্যায় রূপান্তর (2)
    MOV BL, AL          ; BL এ রাখা

    ; দ্বিতীয় ডিজিট পড়া
    MOV AH, 1
    INT 21H
    MOV VAR2, AL       ; ASCII '7' সেভ করা
    SUB AL, 30H         ; ASCII থেকে সংখ্যায় রূপান্তর (7)

    ; যোগফল বের করা
    ADD AL, BL          ; AL = 2 + 7 = 9
    ADD AL, 30H         ; সংখ্যা থেকে ASCII তে রূপান্তর ('9')
    MOV SUM, AL         ; SUM ভেরিয়েবলে রাখা

    ; (c) রেজাল্ট মেসেজ প্রদর্শন করা
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    ; প্রোগ্রাম শেষ
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
