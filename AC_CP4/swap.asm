%include "io.inc"

section .data
; declare variable, and initialize value
x dq 157
i db 2
j db 6
section .bss
; uninitialized global and static variable
ipow resd 1
jpow resd 1

section .text
global main
main:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    mov ebx, 2 ; base
    mov ecx, i ; exponent
    push eax
    push ebx
    push ecx
    push edx
    call exp
    pop edx
    pop ecx
    pop ebx
    pop eax
    mov dword [ipow], edx
    mov ecx, j ; exponent
    push eax
    push ebx
    push ecx
    push edx
    call exp
    pop edx
    pop ecx
    pop ebx
    pop eax
    mov dword [jpow], edx
    PRINT_UDEC 1, [ipow]
    PRINT_UDEC 1, [jpow]
    
    ret
exp:
    push ebp
    mov ebp, esp
    sub esp, 4
    mov dword [ebp - 4], 0 ; exponent
loop_start:
    mov eax, [ebp - 4]
    cmp eax, [ebp + 4]
    je fin
    mov edx, [ebp + 8]
    add edx, edx
    mov eax, [ebp - 4]
    inc eax
    jmp loop_start
fin:
    mov edx, [ebp + 8]
    mov esp, ebp
    pop ebp
    ret
     
    
    