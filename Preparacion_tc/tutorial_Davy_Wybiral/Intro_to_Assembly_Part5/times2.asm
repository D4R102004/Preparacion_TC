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
    push 21
    call times2
    mov ebx, eax
    mov eax, 1
    int 0x80
    
times2:
    ; Prologue
    ; -----------
    push ebp
    mov ebp, esp
    ; ------------
    mov eax, [ebp + 8]
    add eax, eax
    ; Epilogue
    ; ------------
    mov esp, ebp
    pop ebp
    ret
    ; -----------
    
    