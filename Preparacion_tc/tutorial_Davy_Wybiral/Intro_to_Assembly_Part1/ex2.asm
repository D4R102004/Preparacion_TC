global _start
section .data
; declare variable, and initialize value
msg db "", 0x0a
len equ $ - msg

section .bss
; uninitialized global and static variable

section .text
_start:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    mov eax, 4 ; sys_write system call
    mov ebx, 1 ; stdout file descriptor
    mov ecx, msg ; bytes to write
    mov edx, len ; number of bytes to write
    int 0x80
    mov eax, 1 ; sys_exit system call
    mov ebx, 0 ; exit status is 0
    int 0x80
    ret