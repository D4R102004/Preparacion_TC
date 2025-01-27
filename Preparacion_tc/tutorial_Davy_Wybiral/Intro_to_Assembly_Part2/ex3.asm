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
    mov ecx, 101
    mov ebx, 42
    mov eax, 1
    cmp ecx, 100
    jl skip ; jump if less than
    mov ebx, 13
skip:
    int 0x80