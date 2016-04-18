; /usr/local/bin/nasm -f macho64 main.S && ld -macosx_version_min 10.7.0 -lSystem -o main main.o && ./main

global start


section .text

start:
        mov     rax, 0x2000004 ; write
        mov     rdi, 1 ; stdout
        mov     rsi, msg
        mov     rdx, msg.len
        syscall

        mov     rax, 0x2000004 ; write
        mov     rdi, 1 ; stdout
        mov     rsi, msg
        mov byte     [rsi], 74  ; Overwrite H with J
        mov     rdx, msg.len
        syscall
exit:
        mov     rax, 0x2000001 ; exit
        mov     rdi, 0
        syscall


section .data

msg:    db      "Hello, world!", 10
.len:   equ     $ - msg
over:    db      "Jell", 10
.len:   equ     $ - over
