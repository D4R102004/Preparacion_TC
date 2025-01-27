
section .data
; declare variable, and initialize value

section .bss
; uninitialized global and static variable

section .text
global main
main:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    ret