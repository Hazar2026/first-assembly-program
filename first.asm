section .text
    global _start

_start:
    ; print the message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, msg        ; message address
    mov edx, len        ; message length
    int 0x80            ; call kernel

    ; exit the program
    mov eax, 1          ; sys_exit
    mov ebx, 0          ; exit code 0
    int 0x80            ; call kernel

section .data
msg db 'I came,', 0xA, 'I saw,', 0xA, 'I conquered.', 0xA
len equ $ - msg
