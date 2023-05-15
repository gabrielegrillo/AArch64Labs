
esercizio3:     file format elf64-littleaarch64
Disassembly:
0000000000400724 <main>:
  400724:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  400728:	10294480 	adr	x0, 452fb8 <fmt>            // vedere esercizio2_dis.s 
  40072c:	52800021 	mov	w1, #0x1                   	// #1
  400730:	94001860 	bl	4068b0 <_IO_printf>         // Branch and link printf
  400734:	10294420 	adr	x0, 452fb8 <fmt>
  400738:	52800041 	mov	w1, #0x2                   	// #2
  40073c:	9400185d 	bl	4068b0 <_IO_printf>
  400740:	102943c0 	adr	x0, 452fb8 <fmt>
  400744:	52800061 	mov	w1, #0x3                   	// #3
  400748:	9400185a 	bl	4068b0 <_IO_printf>
  40074c:	10294360 	adr	x0, 452fb8 <fmt>
  400750:	52800081 	mov	w1, #0x4                   	// #4
  400754:	94001857 	bl	4068b0 <_IO_printf>
  400758:	10294300 	adr	x0, 452fb8 <fmt>
  40075c:	528000a1 	mov	w1, #0x5                   	// #5
  400760:	94001854 	bl	4068b0 <_IO_printf>
  400764:	52800000 	mov	w0, #0x0                   	// #0
  400768:	a8c17bfd 	ldp	x29, x30, [sp], #16
  40076c:	d65f03c0 	ret