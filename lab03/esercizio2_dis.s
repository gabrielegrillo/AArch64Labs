esercizio2: file format elf64-littleaarch64
Disassembly of the main:
0000000000400724 <main>:
  400724:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  400728:	1029c280 	adr	x0, 453f78 <fmt>            // MACRO PER STAMPARE N, la stringa n viene passata 
  40072c:	52800001 	mov	w1, #0x0                   	// #0
  400730:	94001850 	bl	406870 <_IO_printf>         // branch and link funzione printf
  400734:	52800000 	mov	w0, #0x0                   	// Codice per fare il return #0
  400738:	a8c17bfd 	ldp	x29, x30, [sp], #16
  40073c:	d65f03c0 	ret


Disassembly after removing the symbol CONSTANT
0000000000400724 <main>:
  400724:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  400728:	1029c280 	adr	x0, 453f78 <fmt>            // MACRO PER STAMPARE N, 
  40072c:	52800021 	mov	w1, #0x1                   	// #1
  400730:	94001850 	bl	406870 <_IO_printf>         // branch and link funzione printf
  400734:	52800000 	mov	w0, #0x0                   	// #0
  400738:	a8c17bfd 	ldp	x29, x30, [sp], #16
  40073c:	d65f03c0 	ret