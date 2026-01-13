section .data
    msg db "hello world", 10, 0
    len equ $ - msg - 1

section .text
    global _start

_start:
    mov rdi, msg
    call to_uppercase

    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, msg
    mov rdx, len
    syscall

    mov rax, 60         ; sys_exit
    xor rdi, rdi
    syscall

; ===== FUNCTION =====
to_uppercase:
.loop:
    mov al, [rdi]
    cmp al, 0
    je  .done

    cmp al, 'a'
    jb  .skip
    cmp al, 'z'
    ja  .skip

    sub al, 32
    mov [rdi], al

.skip:
    inc rdi
    jmp .loop

.done:
    ret
