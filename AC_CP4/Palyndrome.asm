%include "io.inc"

section .data
; declare variable, and initialize value
addr db "anitalavalatina", 0
len equ ($ - addr) - 1
msg_pal db "Palindromo", 0
msg_nopal db "No Palindromo", 0

section .bss
; uninitialized global and static variable
left resd 1
right resd 1

section .text
global main
main:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    xor ebx, ebx
    ; Inicializamos los indices
    mov dword [left], addr
    mov dword [right], addr + len - 1
loop_start:
    ; sacamos las letras en los registros
    mov eax, [left]
    mov al, byte [eax]
    mov ebx, [right]
    mov bl, byte [ebx]
    cmp al, bl
    jne not_palindrome
    ; Incrementamos y decrementamos
    inc dword [left]
    dec dword [right]
    ; Comparamos si se paso o no el puntero derecho
    mov eax, [left]
    mov ebx, [right]
    cmp eax, ebx
    jge palindrome           ; Si se cruzaron o son iguales, es un palíndromo
    jmp loop_start
palindrome:
    PRINT_STRING msg_pal
    jmp fin
not_palindrome:
    PRINT_STRING msg_nopal
fin:
    ret