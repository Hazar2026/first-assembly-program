# First Assembly Language Code

## Objective

The objective of this activity is to write my first Assembly language program using NASM in Linux. The program displays a short message on the screen using 32-bit x86 Assembly language.

## Program Output

The program displays:

```text
I came,
I saw,
I conquered.
```

## Flowchart

Start
↓
Store the message in memory
↓
Load the write syscall number into EAX
↓
Load the output location, message address, and message length into registers
↓
Use `int 0x80` to print the message
↓
Load the exit syscall number into EAX
↓
Use `int 0x80` to exit the program
↓
End

## Challenges Encountered

One challenge I encountered was understanding how Assembly language prints text. Unlike high-level languages that use a simple print statement, Assembly language requires using Linux system calls. I had to learn which registers are used for the write syscall, including EAX, EBX, ECX, and EDX. Another challenge was making sure the new lines were included correctly so the output appeared on separate lines.

## Assembly Code

```asm
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
```

## How to Compile and Run

```bash
nasm -f elf32 first.asm -o first.o
ld -m elf_i386 first.o -o first
./first
```

## Expected Output

```text
I came,
I saw,
I conquered.
```

## Conclusion

This program helped me understand the basic structure of an Assembly language program, including the text section, data section, registers, system calls, and how to compile and run Assembly code using NASM in Linux.
