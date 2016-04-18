.global _main

.text

_main:
        movq            $0x2000004, %rax        # write
        movq            $1, %rdi                # stdout
        movabsq         $msg, %rsi
        movabsq         $msglen, %rdx
        syscall

exit:
        movq            $0x2000001, %rax        # exit
        movq            $0, %rdi
        syscall


.data

msg:
        .asciz          "Hello, world!\n"
        .equ            msglen, . - msg
