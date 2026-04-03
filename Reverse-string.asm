.model small
.stack 100h
.data
    string db 'HIMEL$'
.code
main proc
    mov ax, @data
    mov ds, ax

    lea si, string   ; point to string

    mov cx, 5        ; number of characters to reverse (H I M E L = 5)

push_loop:
    mov al, [si]
    push ax          ; push character (AL + 0)
    inc si
    loop push_loop

    mov cx, 5        ; number of characters to pop

pop_loop:
    pop ax
    mov dl, al
    mov ah, 2
    int 21h
    loop pop_loop

    mov ah, 4ch
    int 21h
main endp
end main
; Copywrite 2026 Himel Sarder. Feel free to use and learn, but don’t forget to give credit.
