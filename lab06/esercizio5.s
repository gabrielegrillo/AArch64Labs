.section .rodata
fmt: .asciz "Risultato: %d\n"
.align 2

.data
A: .word 13, 4, 5, 4, 1, 0, -3, 10
.equ A_size, (. - A) / 4

.macro print
    adr x0, fmt
    bl printf
.endm

.text
.type main, %function
.global main
main:
    stp x29, x30, [sp, #-16]!

    //da completare
    
    //Tramite la macro stampiamo il risultato contenuto nel registro w1
    print 

    mov w0, #0
    ldp x29, x30, [sp], #16
    ret
    .size main, (. - main)
    