%include "io.inc"

section .data
; declare variable, and initialize value
x dd 33
i db 5
j db 31
section .bss
; uninitialized global and static variable
ipow resd 1
jpow resd 1
ik resd 1
jk resd 1

section .text
global main
main:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    movzx eax, byte [i]
    push eax
    call exp
    add esp, 4 ; Limpia i
    mov [ipow], eax
    mov [ik], eax
    movzx eax, byte [j]
    push eax
    call exp
    add esp, 4; Limpia j
    mov [jpow], eax
    mov [jk], eax
    ; Zerofy i
    mov eax, [ipow]
    and eax, [x]
    push eax
    call zerofy
    add esp, 4
    mov [ipow], eax
    ; Zerofy j
    mov eax, [jpow]
    and eax, [x]
    push eax
    call zerofy
    add esp, 4
    mov [jpow], eax
    ; Tabla verdad
    mov eax, [ipow]
    mov ebx, [jpow]
    mov ecx, [x]
    cmp eax, ebx
    jl ij
    jg ji
    jmp end
ij:
    add ecx, [ik]
    sub ecx, [jk]
    jmp end
ji:
    add ecx, [jk]
    sub ecx, [ik]
end:
    PRINT_UDEC 4, ecx
    ret
    
    
    
    
 zerofy:
    ; Prologue
    ; ----------
    push ebp
    mov ebp, esp
    ; -----------
    mov eax, [ebp + 8]
    cmp eax, 1
    jl fin
    mov eax, 1
 fin:
    ; Epilogue
    ; -----------
    mov esp, ebp
    pop ebp
    ret
    ; -----------
    

exp:
    ; Prologue
    ; -----------
    push ebp
    mov ebp, esp
    ; -----------
    push ecx
    push ebx
    ; variable esta en ebp + 4
    mov ecx, [ebp + 8]
    mov ebx, 1
while:
    add ebx, ebx
    dec ecx
    cmp ecx, 0
    jg while
    mov eax, ebx
    pop ebx
    pop ecx
    ; Epilogue
    ; ------------
    mov esp, ebp
    pop ebp
    ret
    ; ----------
    