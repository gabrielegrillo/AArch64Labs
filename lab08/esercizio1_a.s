.section .rodata
fmt_n: .asciz "Insert a non-negative number (negative to terminate): "
fmt_scan: .asciz "%d"
fmt_count: .asciz "The count is: %d.\n"
.align 2

.bss
n: .word 0 //da utilizzare per memorizzare di volta in volta il numero letto

.macro scan fmt var //da utilizzare per leggere un numero
    adr x0, \fmt
    bl printf

    adr x0, fmt_scan
    ldr x1, =\var
    bl scanf
.endm

.macro printcount 
    adr x0, fmt_count
    mov x1, x21
    bl printf
.endm


.text
.type main, %function
.global main
main:
    stp x29, x30, [sp, #-16]!

    loop:
        scan fmt_n, n
        ldr w1, n
        cmp w1, #0
        blt endloop


        add x21, x21, #1

        b loop
    endloop:

    printcount
    


    mov w0, #0
    ldp x29, x30, [sp], #16
    ret
    .size main, (. - main)
