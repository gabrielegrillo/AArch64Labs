.section .rodata
fmt: .asciz "%d\n"
.align 2

.data
A: .word 0, 1, 2, 3

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
    
    //Da completare
    mov w1, #0

    ldr x2, =A 
    
    ldr w1, [x2]        // carica il primo elemento
    ldr w4, [x2, #4]    // carica il secondo elemento
    orr w1, w1, w4      // OR tra il primo e il secondo

    ldr w4, [x2, #8]    // carica il terzo elemento
    orr w1, w1, w4      // OR con il risultato dello scorso OR e con il terzo

    ldr w4, [x2, #12]   // carica il quarto elemento
    orr w1, w1, w4      // OR con il risultato dello scorso OR e con il quarto 

    ldr x2, =A          // ricarico 
    str w1, [x2]

    print 0
    print 1
    print 2
    print 3

    mov w0, #0
    ldp x29, x30, [sp], #16
    ret
    .size main, (. - main)
    