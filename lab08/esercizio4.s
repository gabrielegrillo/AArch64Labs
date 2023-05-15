.section .rodata
fmt_read: .asciz "Inserisci un numero positivo: "
fmt_scan: .asciz "%d"
fmt: .asciz "%d\n"
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

    //Main da realizzare

    mov w0, #0
    ldp x29, x30, [sp], #16
    ret
    .size main, (. - main)

.type primo, %function
primo:
    stp x29, x30, [sp, #-16]!

    //Funzione da realizzare

    ldp x29, x30, [sp], #16
    ret
    .size primo, (. - primo)   
