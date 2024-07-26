section .data
    hello db 'Hello, World!',0x0A ; string to print

section .text
    global _start

_start:
    ; write syscall
    mov eax, 4          ; syscall number (sys_write)
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, hello      ; pointer to message
    mov edx, 14         ; message length
    int 0x80            ; call kernel

    ; exit syscall
    mov eax, 1          ; syscall number (sys_exit)
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel
