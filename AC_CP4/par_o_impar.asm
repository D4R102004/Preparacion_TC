%include "io.inc"

section .data
; declare variable, and initialize value
val db 51
msgpar db "Es par", 0
msgimpar db " Es impar", 0

section .bss
; uninitialized global and static variable

section .text
global main
main:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    xor ebx, ebx
    mov ebx, [val]
    and ebx, 1
    cmp ebx, 0
    jz par    ; Si es igual a 0, es par    je par
es_impar:
    PRINT_STRING msgimpar
    jmp fin
par:
    PRINT_STRING msgpar
fin:
    ret