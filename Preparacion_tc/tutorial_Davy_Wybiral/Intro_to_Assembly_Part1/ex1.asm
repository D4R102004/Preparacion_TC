

section .text
global _start
_start:
    ;write your code here
    xor eax, eax
    mov eax, 1
    mov ebx, 42
    sub ebx, 29
    int 0x80 ; Interrupt