; Write a program to display a 10 x 10 solid box of asterisks.
; Hint: declare a string in the data segment that specifies the box, and display it with INT 21h, function 9h.


.MODEL SMALL
.STACK 100H

.DATA
    ; ১০টি স্টার এবং প্রতি লাইনের শেষে Newline (0Dh, 0Ah)
    ; এভাবে ১০ বার ডুপ্লিকেট (DUP) করা হয়েছে
    BOX DB 10 DUP('**********', 0DH, 0AH)
        DB '$' ; স্ট্রিং টার্মিনেটর

.CODE
MAIN PROC
    ; ডাটা সেগমেন্ট ইনিশিয়ালাইজ করা
    MOV AX, @DATA
    MOV DS, AX

    ; বক্সটি ডিসপ্লে করা (Function 9h)
    LEA DX, BOX
    MOV AH, 9
    INT 21H

    ; প্রোগ্রাম শেষ করা
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
