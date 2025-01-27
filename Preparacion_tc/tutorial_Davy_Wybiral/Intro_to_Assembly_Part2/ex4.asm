global _start
section .data
; declare variable, and initialize value

section .bss
; uninitialized global and static variable

section .text

_start:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    mov ebx, 1 ; start ebx at 1
    mov ecx, 4 ; ecx => exponent
while:
    add ebx, ebx ; ebx += ebx
    dec ecx ; ecx -= 1
    cmp ecx, 0
    jg while
    mov eax, 1
    int 0x80 
    