.section .rodata
fmt: .asciz "%d\n"
.align 2

.data
A: .byte 0b00100011, 0b00011011, 0b00001001, 0b11111111
B: .byte 0b00101011, 0b10010011, 0b00000001, 0b10000001

.macro print i
    adr x0, fmt
    ldr x2, =A
    ldrsb w1, [x2, #\i * 1]
    bl printf
.endm

.text
.type main, %function
.global main
main:
    stp x29, x30, [sp, #-16]!

    //Da completare

    ldr x1, =A      // carico l'array A
    ldr x2, =B      // carico l'array B
    
    ldrsb w3, [x1]  // carico il primo elemento dell'array A
    ldrsb w4, [x2]  // carico il primo elemento dell'array B
    and w3, w3, w4  // AND a[0] + b[0]
    strb w3, [x1]   // carico il risultato come primo elemento di a

    ldrsb w3, [x1, #1]  // carico il secondo elemento dell'array A
    ldrsb w4, [x2, #1]  // carico il secondo elemento dell'array B
    orr w3, w3, w4      // OR a[1] - b[1]
    strb w3, [x1, #1]   // carico il risultato alla seconda posizione di a


    print 0
    print 1
    print 2
    print 3

    mov w0, #0
    ldp x29, x30, [sp], #16
    ret
    .size main, (. - main)
    