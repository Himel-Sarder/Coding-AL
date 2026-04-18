; Write a program to display a "?", read two capital letters, and display them on the next line in alphabetical order.

.MODEL SMALL
.STACK 100H

.DATA
    CHAR1 DB ?
    CHAR2 DB ?

.CODE
MAIN PROC
    ; ডাটা সেগমেন্ট ইনিশিয়ালাইজেশন
    MOV AX, @DATA
    MOV DS, AX

    ; (a) "?" প্রদর্শন করা
    MOV AH, 2
    MOV DL, '?'
    INT 21H

    ; (b) দুটি ক্যাপিটাল লেটার ইনপুট নেওয়া
    MOV AH, 1
    INT 21H
    MOV CHAR1, AL   ; ১ম অক্ষর সেভ

    INT 21H
    MOV CHAR2, AL   ; ২য় অক্ষর সেভ

    ; (c) অ্যালফাবেটিক্যাল অর্ডারের জন্য তুলনা করা
    MOV BL, CHAR1
    MOV CL, CHAR2

    CMP BL, CL      ; BL এবং CL তুলনা করি
    JBE DISPLAY     ; যদি BL <= CL হয়, তবে সরাসরি ডিসপ্লেতে যাও (অর্ডার ঠিক আছে)
    
    ; যদি BL > CL হয়, তবে সোয়াপ (Swap) করি
    XCHG BL, CL

DISPLAY:
    ; নতুন লাইনে যাওয়া
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; ১ম অক্ষর প্রিন্ট (ছোটটি)
    MOV DL, BL
    INT 21H

    ; ২য় অক্ষর প্রিন্ট (বড়টি)
    MOV DL, CL
    INT 21H

    ; প্রোগ্রাম শেষ
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
