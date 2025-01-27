global _start
section .data
; declare variable, and initialize value
addr db "yellow", 0x0a
len equ $ - addr 
section .bss
; uninitialized global and static variable

section .text
_start:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    mov [addr], byte 'H'
    mov [addr + 5], byte '!'
    mov eax, 4 ; sys_write system call
    mov ebx, 1 ; stdout file descriptor
    mov ecx, addr ; bytes to write
    mov edx, len ; number of bytes
    int 0x80
    mov eax, 1 ; sys_exit
    mov ebx, 0 ; exit status 0
    int 0x80