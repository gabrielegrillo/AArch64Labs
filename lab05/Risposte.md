# Risposte

## Esercizio 1

### Punto A e B
`mov x20, #2` 
x20 = 2; x21 = ?
`lsr x21, x20, #1`
Logical shift right:
010 >> 001 == 1
x20 = 2; x21 = 1
`sub x20, x20, x21` 
x20 = x20 - 1 (x21)
x20 = 1; x21 = 1
`add x20, x20, x21, lsl #2`
x20 = x20 + (x21 << 2)
x20 = 1 + 4
x20 = 5; x21 = 1

per il punto B: i risultati coincidono! Yuppi!

## Esercizio 2

### Punto A e B

`mov x20, #0b00000001`
`mov x21, #0b00000011` 
Memorizza in x20 = 1 e x21 = 3

`and x21, x21, x20` 
AND a bit a bit. x21 = x21 & x20
0b00000001 & 
0b00000011 =
____________
0b00000001
x20 = 1; x21 = 1

`bic x20, x20, x21` 
x20 = x20 & ¬(x21)

0b00000001 &
0b11111110 =
____________
0b00000000
x20 = 0; x21 = 1

`orr x20, x20, x21, lsl #1` 
x20 = x20 || (x21 << 1 == 2)

0b00000000 ||
0b00000010 =
____________
0b00000010

x20 = 2; x21 = 1

`orn x20, x20, x21` 
x20 = x20 || ¬(x21)

0b00000010 ||
0b11111110 =
____________
0b11111110

Complemento a due  0b11111110
1. faccio il ¬(0b11111110) == 0b00000001
2. Aggiungo 1. 
   0b00000001 +
   0b00000001 =
   ____________
   0b00000010
3. Aggiungi il segno negativo. -2 in binario

x20 = -2; x21 = 1

`eor x20, x20, x21, lsl #2` 

x20 = x20 XOR (x21 << 2)
0b11111110 XOR
0b00000100 =
______________
0b11111010

Complemento a due: (0b00000101) + 1 = 0b00000110

x20 = -6; x21 = 1

`eon x20, x20, x21`
x20 = x20 XOR ¬(x21)

0b11111010 XOR
0b11111110 =
______________
0b00000100

x20 = 4; x21 = 1

per il punto B: i risultati coincidono nuovamente! Doppio Yuppi!

## Esercizio 3

x0 = 0b01001011 = 75
x1 = 0b00001111 = 15

1. `adds x2, x1, x0`
   x2 = x1 + X0
   0b01001011 +
   0b00001111 =
   ____________
   0b01011010
   x2 = 90

   Nessun flag attivato.

2. `subs x2, x1, x0`
   x2 = x1 - x0
   x2 = x1 + (-x0)
   Complemento a 2 di x0: 0b10110101

   0b01001011 +
   0b10110101 =
   ____________
   0b11000100
   
   Complemento a 2 di x20: 0b00111100 = 60
   x2 = -60

per il punto B: i risultati coincidono! Triplo Yuppi oppure (Yuppi)³!



## Esercizio 4

Esercizio risolto e commentato, guardare il file associato.

Punto B: mette 3 come primo elemento. (vedi esercizio4-b.s) 

## Esercizio 5

Esercizio risolto e commentato, guardare il file associato.

## Esercizio 6

Esercizio risolto e commentato, guardare il file associato.

## Esercizio 7

Esercizio risolto e commentato, guardare il file associato.
