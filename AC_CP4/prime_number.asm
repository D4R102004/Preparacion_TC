%include "io.inc"

section .data
; declare variable, and initialize value
val db 4
msg_prime db "Prime number", 0
msg_not_prime db "Not prime number", 0

section .bss
; uninitialized global and static variable

section .text
global main
main:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    xor edx, edx
    movzx eax, byte [val]
    mov ecx, eax
    mov ebx, 2
loop_start:
    cmp ebx, eax
    jge prime
    xor edx, edx
    div ebx
    cmp edx, 0
    je not_prime
    inc ebx
    mov eax, ecx

    jmp loop_start
prime:
    PRINT_STRING msg_prime
    jmp fin
not_prime:
    PRINT_STRING msg_not_prime
fin:
    ret