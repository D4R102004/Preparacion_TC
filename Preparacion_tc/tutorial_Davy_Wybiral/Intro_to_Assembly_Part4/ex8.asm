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
    call func
    mov eax, 1
    mov ebx, 0
    int 0x80
func:
    mov ebp, esp
    sub esp, 2
    mov [esp], byte 'H'
    mov [esp + 1], byte 'i'
    mov eax, 4
    mov ebx, 1
    mov ecx, esp
    mov edx, 2
    int 0x80
    mov esp ,ebp
    ret
    
    