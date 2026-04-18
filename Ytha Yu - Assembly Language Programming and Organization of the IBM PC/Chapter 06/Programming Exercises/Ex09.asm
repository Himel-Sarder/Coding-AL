; Write a program to display the extended ASCII characters (ASCII codes 80h to FFh). Display 10 characters per line, separated by blanks. Stop after the extended characters have been displayed once.

.MODEL SMALL
.STACK 100H

.DATA
    CHAR_COUNT DB 0    ; প্রতি লাইনে কয়টি ক্যারেক্টার প্রিন্ট হলো তা গুনতে

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 80H        ; CX রেজিস্টারে শুরুর ASCII কোড (80h) নিলাম

PRINT_LOOP:
    ; ১. ক্যারেক্টার প্রিন্ট করা
    MOV AH, 2
    MOV DX, CX         ; CX এ থাকা ASCII কোডটি DL এ যাবে (DX এর নিচু অংশ)
    INT 21H

    ; ২. একটি স্পেস (Blank) প্রিন্ট করা
    MOV DL, ' '
    INT 21H

    ; ৩. কাউন্টার বাড়ানো এবং চেক করা (১০টি হয়েছে কি না)
    INC CHAR_COUNT
    CMP CHAR_COUNT, 10
    JNE NEXT_CHAR      ; ১০টি না হলে পরের ক্যারেক্টারে যাও

    ; ৪. ১০টি হয়ে গেলে নতুন লাইনে যাওয়া
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    MOV CHAR_COUNT, 0  ; কাউন্টার রিসেট করা

NEXT_CHAR:
    INC CX             ; পরবর্তী ASCII কোডে যাওয়া
    CMP CX, 0FFH       ; FFh পর্যন্ত চেক করা
    JBE PRINT_LOOP     ; যদি FFh এর সমান বা কম হয়, তবে লুপ চলবে

    ; প্রোগ্রাম শেষ
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
