.section .rodata
fmt_divisibili: .asciz "Il numero %d e' divisibile per %d, il resto e' %d\n"
fmt_non_divisibili: .asciz "Il numero %d non e' divisibile per %d, il resto e' %d\n"
.align 2

a: .word 12
b: .word 4

.text
.type main, %function
.global main
main:
    stp x29, x30, [sp, #-16]!

    ldr w1, a
    ldr w2, b

    udiv w4, w1, w2
    msub w3, w4, w2, w1

    cmp w3, #0
    bgt no
    adr x0, fmt_divisibili
    bl printf
    b endif

    no:
    adr x0, fmt_non_divisibili
    bl printf

    endif:

    mov w0, #0
    ldp x29, x30, [sp], #16
    ret
    .size main, (. - main)
