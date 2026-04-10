.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 0DH,0AH,'ENTER STRING: $'
    MSG2 DB 0DH,0AH,'LONGEST: $'

    STR DB 100 DUP(?)

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; ---- PRINT MSG1 ----
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H
    
    ; ---- SOURCE INDEX POINTING STARTING OF THE STRING ----
    LEA SI, STR

READ:
    ; ---- INPUT A CHAR ----
    MOV AH, 01H
    INT 21H   
    
    ; ---- COMPARE IF IT IS ENTER KEY OR NOT ----
    CMP AL, 0DH
    JE START_PROCESS    ; IF IT IS THEN START MAIN PROCESS

    MOV [SI], AL        ; IF NOT THEN ---> STORE THE CURRENT INPUTED CHAR IN CURRENT SOURCE INDEX
    INC SI              ; INCREASE SOURCE INDEX TO STORE NEXT CHAR IN NEXT INDEX
    JMP READ            ; JUMP TO READ NEXT CHAR

START_PROCESS:          ; IF MAIN PROCESS START THEN 
    LEA SI, STR         ; START FROM BEGINNING OF STRING AGAIN  /  POINTING STARTING CHAR

    MOV BL, [SI]        ; STORE FIRST CHAR --> PREVIOUS CHAR
    MOV BH, 1           ; ASSUME CURRENT SEQUENCE LENGTH 1

    MOV CL, 1           ; ASSUME MAX LENGTH 1
    LEA DI, STR         ; MAX START --> FROM WHERE SEQUENCE START

    LEA BP, STR         ; CURRENT START --> FROM WHERE CURRENT SEQUENCE START

NEXT:
    INC SI              ; SI POINTING NEXT INDEX
    MOV AL, [SI]        ; AL STORE NEXT CHAR

    CMP AL, 0           ; IF STRING IS END
    JE DONE             ; DONE

    ; check consecutive
    MOV DL, BL          ; PREVIOUS CHAR
    INC DL              ; PREVIOUS CHAR + 1 -> NEXT CHAR OF PREVIOUS CHAR

    CMP AL, DL          ; COMPARE PREVIOUS CHAR AND NEXT CHAR
    JE CONTINUE         ; CONTINUE

    ; reset
    MOV BH, 1           ; RESET CURRENT SEQUENCE LENGTH
    MOV BP, SI          ; CURRENT INDEX STORE IN BP
    JMP CHECK           ; CHECK

CONTINUE:
    INC BH              ; CONTINUE COMPARING BY INCREASING BH

CHECK:                  
    CMP BH, CL          ; COMPARE CURRENT LENGTH WITH MAX LENGTH
    JLE SKIP            ; IF CURRENT LENGTH <= MAX LENGTH THEN SKIP

    MOV CL, BH          ; SET NEW MAX SEQUENCE LENGTH 
    MOV DI, BP          ; STARTING INDEX OF MAX STRING STORE

SKIP:
    MOV BL, AL          ; PREVIOUS CHAR UPDATE
    CMP AL, 0DH         ; ENTER KEY OR NOT
    JE DONE             ; DONE

    JMP NEXT            ; JUMP TO NEXT

DONE:
    ; ---- PRINT ----
    LEA DX, MSG2
    MOV AH, 09H       
    INT 21H

    MOV SI, DI          ; SI SET FOR START POSITION TO PRINT
    MOV CH, 0           ; CH RESET

PRINT:
    CMP CL, 0           ; IF NUMBET OF CHAR TO PRINT IS ZERO 
    JE EXIT             ; THEN EXIT

    MOV DL, [SI]        ; PRINT CHAR
    MOV AH, 02H
    INT 21H

    INC SI              ; INCREASE INDEX TO PRINT NEXT CHAR
    DEC CL              ; DECREASE SEQUENCE LENGTH AFTER PRINTING CHAR
    JMP PRINT

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN

; BH = Current length (length of the current running sequence)
; CL = Maximum length (length of the longest sequence found so far)
; BP = Current start (starting index/address of the current sequence)
; DI = Max start (starting index/address of the longest sequence)
