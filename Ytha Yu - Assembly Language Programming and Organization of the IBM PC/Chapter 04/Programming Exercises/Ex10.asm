; Problem Statement : Write a program to read one of the hex digits A–F, and display it on the next line in decimal.
; Sample execution:
; ENTER A HEX DIGIT: C
; IN DECIMAL IT IS 12


.MODEL SMALL
.STACK 100H

.DATA
    PROMPT DB 'ENTER A HEX DIGIT: $'
    MSG    DB 0DH, 0AH, 'IN DECIMAL IT IS: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; ১. প্রম্পট প্রদর্শন
    LEA DX, PROMPT
    MOV AH, 9
    INT 21H

    ; ২. হেক্স ক্যারেক্টার ইনপুট (A-F)
    MOV AH, 1
    INT 21H
    
    ; ৩. ডেসিমেল মান বের করা
    ; ASCII 'A' (65) থেকে 'A' বিয়োগ করলে আমরা ০ পাই, তাই ১০ যোগ করতে হবে।
    SUB AL, 'A'     ; 'A' দিলে হবে 0, 'B' দিলে 1...
    ADD AL, 10      ; এখন AL এ প্রকৃত মান আছে (১০, ১১, ১২, ১৩, ১৪ বা ১৫)
    
    ; ৪. ভাগ করার প্রস্তুতি     DIV ALWASYS USE 16 BIT AX REGISTER
    MOV AH, 0       ; AX রেজিস্টার পরিষ্কার করা (কারণ DIV AX, CL ব্যবহার হবে)
    MOV CL, 10      ; ১০ দিয়ে ভাগ করবো
    DIV CL          ; AL = AX / 10 (ভাগফল), AH = AX % 10 (ভাগশেষ)
    
    MOV BX, AX      ; ভাগফল এবং ভাগশেষকে অন্য রেজিস্টারে নিরাপদ করে রাখা    BL=AL   BH = AH

    ; ৫. রেজাল্ট মেসেজ প্রিন্ট
    LEA DX, MSG
    MOV AH, 9
    INT 21H

    ; ৬. প্রথম ডিজিট প্রিন্ট (ভাগফল যা AL এ ছিল, এখন BL এ আছে)
    MOV AH, 2
    MOV DL, BL
    ADD DL, '0'     ; সংখ্যাকে ASCII তে রূপান্তর
    INT 21H

    ; ৭. দ্বিতীয় ডিজিট প্রিন্ট (ভাগশেষ যা AH এ ছিল, এখন BH এ আছে)
    MOV DL, BH
    ADD DL, '0'     ; সংখ্যাকে ASCII তে রূপান্তর
    INT 21H

    ; প্রোগ্রাম শেষ
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
