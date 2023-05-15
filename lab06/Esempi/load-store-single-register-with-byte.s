.section .rodata
fmt: .asciz "%x\n"
.align 2

.data
n: .word 0x10203040

.macro print i
    adr x0, fmt
    ldr x2, =n
    ldrb w1, [x2, #\i]
    bl printf
.endm

.text
.type main, %function
.global main
main:
    stp x29, x30, [sp, #-16]!

    print 0
    print 1
    print 2
    print 3

    mov w0, #0
    ldp x29, x30, [sp], #16
    ret
    .size main, (. - main)
