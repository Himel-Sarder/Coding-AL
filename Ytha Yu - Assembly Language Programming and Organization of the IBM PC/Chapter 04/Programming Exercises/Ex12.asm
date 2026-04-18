; Write a program to (a) display "?", (b) read three initials, (c) display them in the middle of an 11 x 11 box of asterisks, and (d) beep the computer.

.MODEL SMALL
.STACK 100H

.DATA
    ; বক্সের উপরের ৫টি সারি (প্রতিটিতে ১১টি স্টার)
    TOP_ROWS    DB 0DH, 0AH, 5 DUP('*************', 0DH, 0AH)
    
    ; মাঝখানের সারি (৪টি স্টার + ৩টি অক্ষর + ৪টি স্টার = ১১টি ক্যারেক্টার)
    MID_START   DB '****'
    INIT1       DB ?
    INIT2       DB ?
    INIT3       DB ?
    MID_END     DB '****', 0DH, 0AH
    
    ; নিচের ৫টি সারি
    BOTTOM_ROWS DB 5 DUP('***********', 0DH, 0AH)
    DB '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; (a) "?" প্রদর্শন করা
    MOV AH, 2
    MOV DL, '?'
    INT 21H

    ; (b) তিনটি ইনিশিয়াল ইনপুট নেওয়া
    MOV AH, 1
    INT 21H
    MOV INIT1, AL

    INT 21H
    MOV INIT2, AL

    INT 21H
    MOV INIT3, AL

    ; (c) ১১ x ১১ বক্সের মাঝখানে প্রদর্শন করা
    LEA DX, TOP_ROWS
    MOV AH, 9
    INT 21H

    ; (d) কম্পিউটার বিপ (Beep) করা
    MOV AH, 2
    MOV DL, 07H    ; ASCII code for Beep/Bell
    INT 21H

    ; প্রোগ্রাম শেষ
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
