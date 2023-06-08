.section .rodata
fmt: .asciz "%d\n"
.align 2

.data
A: .word 1, 5, 4, 12
B: .word -4, 5, 10, 6

.macro print i
    adr x0, fmt
    ldr x2, =A
    ldr w1, [x2, #\i * 4]
    bl printf
.endm

.text
.type main, %function
.global main
main:
    stp x29, x30, [sp, #-16]!

    ldr x1, =A      // carico l'array A
    ldr x2, =B      // carico l'array B
    
    ldr w3, [x1]    // carico il primo elemento dell'array A
    ldr w4, [x2]    // carico il primo elemento dell'array B
    add w3, w3, w4  // somma a[0] + b[0]
    str w3, [x1]    // carico il risultato come primo elemento

    ldr w3, [x1, #4]    // carico il secondo elemento dell'array A
    ldr w4, [x2, #4]    // carico il secondo elemento dell'array B
    sub w3, w3, w4      // sottrazione a[1] - b[1]
    str w3, [x1, #4]    // carico il risultato alla seconda posizione di a

    print 0
    print 1
    print 2
    print 3

    mov w0, #0
    ldp x29, x30, [sp], #16
    ret
    .size main, (. - main)
    