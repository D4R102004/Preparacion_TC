%include "io.inc"

section .data
; declare variable, and initialize value
msg_even db "Es par", 0
msg_odd db "Es impar", 0
numbers db 10, 34, 56, 20, 11, 25, 66, 79, 123
count equ $ - numbers

section .bss
; uninitialized global and static variable
idx resb 1 ; index of array

section .text
global main
main:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    mov ebx, 0
loop_start:
    cmp ebx, count
    je end_loop
    movzx eax, byte [numbers + ebx] ; Gets the number in the array
    ; Determine parity
    and eax, 1
    cmp eax, 0
    PRINT_UDEC 1, [numbers + ebx]
    je even
odd:
    PRINT_STRING msg_odd
    jmp loop_continue
even:
    PRINT_STRING msg_even
loop_continue:
    inc ebx
    jmp loop_start
end_loop:
    ret
    