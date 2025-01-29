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
    ret
times2:
    ; Prologue
    ; -----------
    push ebp
    mov ebp, esp
    ; ------------
    
    ; Epilogue
    ; ------------
    mov esp, ebp
    pop ebp
    ret
    ; -----------