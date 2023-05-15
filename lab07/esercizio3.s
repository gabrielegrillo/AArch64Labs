.section .rodata
fmt_x: .asciz "Inserisci un numero: "
fmt_scan: .asciz "%d"
fmt_superato: .asciz "SUPERATO\n"
fmt_non_superato: .asciz "NON SUPERATO\n"
fmt_non_valido: .asciz "NON VALIDO\n"
.align 2

.bss
x: .word 0

.macro print fmt
    adr x0, \fmt
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

    scan fmt_x, x
    
    ldr w0, x
    mov w1, #18
    mov w2, #31

    cmp w0, w1
    blt else

    elseif:
        cmp w0, w2
        bgt elseif2
        print fmt_superato
        b endif
    elseif2:
        print fmt_non_valido
        b endif
    else:
        print fmt_non_superato
    endif:

    mov w0, #0
    ldp x29, x30, [sp], #16
    ret
    .size main, (. - main)
