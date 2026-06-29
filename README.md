# First Assembly Language Code

## Objective
The objective of this activity is to write my first Assembly language program using NASM in Linux.

## Program Output
The program displays the following text on the screen:

I came,  
I saw,  
I conquered.

## Flowchart

Start  
↓  
Store the message in memory  
↓  
Use the Linux write system call to display the message  
↓  
Use the Linux exit system call to end the program  
↓  
End  

## Challenges Encountered
One challenge I encountered was understanding how Assembly language prints text using system calls instead of regular print statements. I also had to make sure the new lines were written correctly so each sentence appeared on a separate line. Another challenge was remembering which registers are used for the write and exit system calls.

## Assembly Code

```asm
section .data
    message db "I came,", 10, "I saw,", 10, "I conquered.", 10
    length equ $ - message

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, length
    syscall

    mov rax, 60
    mov rdi, 0
    syscall
