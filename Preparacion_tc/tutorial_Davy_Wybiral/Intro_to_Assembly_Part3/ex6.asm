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
    sub esp, 4
    mov [esp], byte 'H'
    mov [esp + 1], byte 'e'
    mov [esp + 2], byte 'y'
    mov [esp + 3], byte '!'
    mov eax, 4
    mov ebx, 1
    mov ecx, esp ; pointer to bytes to write
    mov edx, 4 ; number of bytes to write
    int 0x80
    mov eax, 1
    mov ebx, 0
    int 0x80