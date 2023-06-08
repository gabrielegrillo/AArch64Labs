.section .rodata
fmt: .asciz "%d\n"
fmt_num: .asciz "Inserisci numero: "
fmt_scan: .asciz "%d"
.align 2

.data
A: .word 7, 0, 3, 1

.bss
x: .word 0
y: .word 0

.macro print i
    adr x0, fmt
    ldr x2, =A
    ldr w1, [x2, #\i * 4]
    bl printf
.endm

.macro scan fmt var
    adr x0, \fmt
    bl printf

    adr x0, fmt_scan
    ldr x1, =\var
    bl scanf
.endm


.text
.type main, %function
.global main
main:
    stp x29, x30, [sp, #-16]!
    
    //Da completare

    scan fmt_num, x

    ldr x0, =A      // carico l'array 
    ldr x1, =x      // carico la label di x, preso in input da prima
    ldr x2, [x1]    // 

    ldr w3, [x0]
    add w4, w3, w2
    str w4, [x0] 

    ldr w3, [x0, #4]
    add w4, w3, w2
    str w4, [x0, #4]

    ldr w3, [x0, #8]
    add w4, w3, w2
    str w4, [x0, #8]

    ldr w3, [x0, #12]
    add w4, w3, w2
    str w4, [x0, #12]

    print 0
    print 1
    print 2
    print 3

    scan fmt_num, y

    ldr x0, =A      // carico l'array 
    ldr x1, =y      // carico la label di y, preso in input da prima
    ldr x2, [x1]    // 

    ldr w3, [x0]
    sub w4, w3, w2
    str w4, [x0] 

    ldr w3, [x0, #4]
    sub w4, w3, w2
    str w4, [x0, #4]

    ldr w3, [x0, #8]
    sub w4, w3, w2
    str w4, [x0, #8]

    ldr w3, [x0, #12]
    sub w4, w3, w2
    str w4, [x0, #12]

    print 0
    print 1
    print 2
    print 3

    ldr x0, =A      // carico l'array 

    ldr w3, [x0]
    lsl w4, w3, #1
    str w4, [x0] 

    ldr w3, [x0, #4]
    lsl w4, w3, #1
    str w4, [x0, #4]

    ldr w3, [x0, #8]
    lsl w4, w3, #1
    str w4, [x0, #8]

    ldr w3, [x0, #12]
    lsl w4, w3, #1
    str w4, [x0, #12]

    print 0
    print 1
    print 2
    print 3



    mov w0, #0
    ldp x29, x30, [sp], #16
    ret
    .size main, (. - main)
    