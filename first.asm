section .data
    message db "I came,", 10, "I saw,", 10, "I conquered.", 10
    length equ $ - message

section .text
    global _start

_start:
    ; write(1, message, length)
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, length
    syscall

    ; exit(0)
    mov rax, 60
    mov rdi, 0
    syscall
