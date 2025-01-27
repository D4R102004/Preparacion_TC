%include "io.inc"
global main
section .data
; declare variable, and initialize value

section .bss
; uninitialized global and static variable

section .text
main:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    push 255
    ; sub esp, 4
    ; mov [esp], dword 10
    pop eax
    ; mov eax, dword [esp]
    ; add edp, 4
    PRINT_UDEC 1, eax
    ret