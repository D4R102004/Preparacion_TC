global main
extern printf
section .data
; declare variable, and initialize value
    msg db "Testing %i...", 0x0a, 0x00
section .bss
; uninitialized global and static variable

section .text
main:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    ; Prologue
    ; -----------
    push ebp
    mov ebp, esp
    ; ------------
    push 40
    push msg
    call printf
    mov eax, 0
    ; Epilogue
    ; ------------
    mov esp, ebp
    pop ebp
    ret
    ; -----------