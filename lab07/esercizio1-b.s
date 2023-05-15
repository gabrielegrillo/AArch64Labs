.section .rodata
fmt_1: .asciz "NO\n"
fmt_2: .asciz "SI\n"
.align 2

.data
x: .word 10
y: .word 10

.text
.type main, %function
.global main
main:
    stp x29, x30, [sp, #-16]!
    
    ldr w0, x
    ldr w1, y
    ldr x2, =fmt_1
    ldr x3, =fmt_2
    cmp w0, w1
    csel x0, x3, x2, eq
    bl printf
    

    mov w0, #0
    ldp x29, x30, [sp], #16
    ret
    .size main, (. - main)
