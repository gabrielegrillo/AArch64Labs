.section .rodata
fmt_read: .asciz "Inserisci un numero positivo: "
fmt_scan: .asciz "%d"
fmt: .asciz "Lunghezza = %d\n"
.align 2

.data
n: .word 0

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
    stp x19, x20, [sp, #-16]!

    scan fmt_read, n

    ldr w0, n
    bl collatz
    mov w1, w0
    adr x0, fmt
    bl printf

    mov w0, #0
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16
    ret
    .size main, (. - main)

.type collatz, %function
collatz:
    stp x29, x30, [sp, #-16]!

    //Funzione ricoriva da implementare

    ldp x29, x30, [sp], #16
    ret
    .size collatz, (. - collatz)   
