section .text
global main
main:
    mov ebp, esp; for correct debugging
    xor eax, eax
    xor ebx, ebx
    mov al, -128
    mov bl, -128
    add al, bl
    ret