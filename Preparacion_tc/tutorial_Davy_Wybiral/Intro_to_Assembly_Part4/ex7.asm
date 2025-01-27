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
    ; push eip + 4
    ; jmp <name>
    mov eax, 1 ; sys_exit system call
    int 0x80
func:
    mov ebp, esp
    mov ebx, 30
    ret
    ; pop <register> ; cogemos el eip + 4, osea la proxima instruccion
    ; jmp <register> ; saltamos al eip, osea a despues de que se realiza "call"