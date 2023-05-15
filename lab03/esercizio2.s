.section .rodata
fmt: 
    .asciz "%d\n"

.equ CONSTANT, 1

.macro print n
    adr x0, fmt
    mov w1, \n
    bl printf
.endm

.text
.type main, %function
.global main
main:
    stp x29, x30, [sp, #-16]!

    .ifndef CONSTANT // if the symbol constant is Not Defined
        print 1
    .else
        print 0
    .endif

    // return 0
    mov w0, #0
    ldp x29, x30, [sp], #16
    ret
    .size main, (. - main)

