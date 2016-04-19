.global _main

.text

_main:
        movq            $0x2000004, %rax        # write
        movq            $1, %rdi                # stdout
        movabsq         $msg, %rsi
        movabsq         $msglen, %rdx
        syscall

        movq            $0x2000004, %rax        # write
        movq            $1, %rdi                # stdout
        movabsq         $msg, %rsi
        movb            $74, (%rsi)             # Hello => Jolly
        movb            $111, 1(%rsi)
        movb            $121, 4(%rsi)
        movb            $10, 5(%rsi)            # newline
        movabsq         $msglen, %rdx
        sub             $9, %rdx
        syscall

        movq            $0x2000004, %rax        # write
        movq            $1, %rdi                # stdout
        movabsq         $jolly, %rsi
        movabsq         $jollylen, %rdx
        syscall

exit:
        movq            $0x2000001, %rax        # exit
        movq            $0, %rdi
        syscall


.data

msg:
        .asciz          "Hello, world!\n"
        .equ            msglen, . - msg
jolly:
        .asciz          "Jolly\n"
        .equ            jollylen, . - jolly
