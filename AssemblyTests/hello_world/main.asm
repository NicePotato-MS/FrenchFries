section .rodata
    first db "Printing message from library",10,0
    firstSize EQU $ - first
    last db "Done! Exiting.",10,0
    lastSize EQU $ - last

extern _helloworld

section .text
    global _start

_start:
    ; Write "Hello, World!" to stdout (file descriptor 1)
    mov rax, 1                  ; syscall number for sys_write
    mov rdi, 1                  ; file descriptor 1 (stdout)
    mov rsi, first             ; pointer to the message
    mov rdx, firstSize                ; message length
    syscall

    call _helloworld

    mov rax, 1
    mov rsi, last
    mov rdx, lastSize
    syscall

    ; Exit the program with syscall
    mov rax, 60                 ; syscall number for sys_exit
    xor rdi, rdi                ; exit status 0
    syscall
