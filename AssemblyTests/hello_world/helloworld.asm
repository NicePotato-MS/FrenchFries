section .rodata
    hello db "Hello, World!",10,0
    helloSize EQU $ - hello

section .text
    global _helloworld

_helloworld:
    ; Write "Hello, World!" to stdout (file descriptor 1)
    push rax
    push rdi
    push rsi
    push rdx
    push rcx
    push r11

    mov rax, 1                  ; syscall number for sys_write
    mov rdi, 1                  ; file descriptor 1 (stdout)
    mov rsi, hello             ; pointer to the message
    mov rdx, helloSize                ; message length

    syscall

    pop r11
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    pop rax

    ret