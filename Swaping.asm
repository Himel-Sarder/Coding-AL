.model small
.stack 100h
.data
    ; No data needed for this program

.code
main proc
    mov ax, '1'      ; Load ASCII '1' into AX
    mov bx, '2'      ; Load ASCII '2' into BX

    push ax           ; Push AX on stack
    push bx           ; Push BX on stack

    pop ax            ; Pop top of stack into AX (BX value)
    pop bx            ; Pop next value into BX (AX value)

    ; Display AX character
    mov dx, ax
    mov ah, 2
    int 21h

    ; Display BX character
    mov dx, bx
    mov ah, 2
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp
end main
; Copywrite 2026 Himel Sarder. Feel free to use and learn, but don’t forget to give credit.
