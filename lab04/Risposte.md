# Risposte

## Esercizio 1

Premessa in x2 e' stato caricato un array di word. Ogni word vale 4 byte (32 bit) 

La macro `print_32`
```assembly
.macro print_32
    adr x0, fmt_32bit
    bl printf
.endm
```
L'istruzione `adr` è usata per calcolare l'indirizzo di una label, in questo caso una format string che stampa solo le prime 8 cifre. 
La stessa cosa vale per la macro `print_64` però cambia la fmt.

### Esempio 1
    
```assembly
ldr w1, [x2] 
print_32
```
   1. Istruzione ldr e' corretta
   2. Indirizzamento: **Register Address [Xn|sp]**
   3. Carica il contenuto di x2 come indirizzo e carica 4 byte di dati in w1 (w1 a 32 bit.)
   4. 0x00000001 (infatti il primo elemento di x2 e' uno.)

### Esempio 2 

```assembly
ldr x1, [x2] 
print_64
```
1. Istruzione ldr e' corretta
2. Indirizzamento: **Register Address [Xn|sp]**
3. Carica il contenuto di x2 come indirizzo e carica 8 byte di dati in x1 (x1 a 64 bit.)
4. 0x0000000200000001 (siccome il registro e' a 64bit carica i primi due elementi)

### Esempio 3
```assembly
ldr w1, [x2, #8]
print_32
```
1. Istruzione ldr e' corretta
2. Indirizzamento: **Signed Immediate Offset: [Xn|sp, <±imm9>]**
3. Carica il contenuto di x2 come indirizzo in w1, aggiunge l'offset di 8 byte. Quindi, partendo dal primo elemento che sta all'indirizzo 1, aggiungendo 4 byte si arriva al secondo e altri 4 si arriva al terzo elemento. Ovviamente stampa solo 3 perche' carica solo 4 byte. 
4. 0x00000003

### Esempio 4
```assembly
mov x3, #4 // memorizza 4 nel registro x3
ldr w1, [x2, x3]
print_32
```
1. Istruzione ldr e' corretta
2. Indirizzamento: **Register Offset: [Xn|sp, Rm, <option>]**
3. Carica in w1 l'indirizzo di x2 incrementato dal valore contenuto nel registro x3 ovvero 4.
4. 0x00000002

### Esempio 5
```assembly 
mov x3, #1 // Il registro X3 contiene il valore 1
ldr w1, [x2, x3, lsl #2]
print_32
```
1. Istruzione ldr e' corretta
2. Indirizzamento: **Register Offset: [Xn|sp, Rm, <option>]**
3. Carica in w1 l'indirizzo di x2, incrementato dal valore contenuto nel registro x3 ovvero 1 e poi viene shiftato verso sinistra di 2.  

   Stato iniziale:   001 
   Left Shift di 2:  100 => 2^2 = 4 

   Il risultato ottenuto e' 4. Facendo cosi' otteniamo il secondo elemento dell'array. 
4. 0x00000002

### Esempio 6
```assembly 
ldr w1, [x2, #0xffff]
print_32
```
1. Istruzione ldr **NON e' corretta**
2. Indirizzamento: **Unsigned Immediate Offset: [Xn|sp, #]**
3. Il valore #0xffff e' troppo grande per questa modalita' di indirizzamento. 
4. Error: immediate offset out of range.

### Esempio 7
```assembly 
ldr w1, [x2, #12]!
print_32
```
1. Istruzione ldr **e' corretta**
2. Indirizzamento: **Pre-indexed Immediate Offset: [Xn|sp, #±<imm9>]!**
3. Carica in w1 l'indirizzo di x2, x2 viene incrementato di 12 byte e alla fine carica il valore 4 come indirizzo.
4. 0x00000004

### Esempio 8
```assembly 
ldr x1, [x2], #4
print_64
```
1. Istruzione ldr **e' corretta**
2. Indirizzamento: **Post-indexed Immediate Offset: [Xn|sp], #±<imm9>**
3. Carica in w1 l'indirizzo di x2 e succesivamente x2 viene incrementato di 4 byte. 
4. 0x0000000200000001


## Esercizio 2

Premessa in x2 e' stato caricato un array di word. Ogni word vale 4 byte (32 bit).
Il registro x3 contiene ffff ffff ffff ffff in esadecimale.

La macro `print i` prende come parametro `i` e stampa il contenuto con inidice `i`.

```assembly
.macro print i
    adr x0, fmt_32bit
    ldr x2, =n
    ldr w1, [x2, #\i * 4]
    bl printf
.endm
```
L'istruzione `adr` è usata per calcolare l'indirizzo di una label, in questo caso una format string che stampa solo le prime 8 cifre. 

L'istruzione `ldr` memorizza nel registro x2, usando come modalità d'indirizzamento una pseudo-load.

La seconda istruzione `ldr` carica nel registro w1, l'indirizzo 

### Esempio 1
```assembly
str x3, [x2]
print_all
```
1. Istruzione `str` è **corretta**
2. Indirizzamento: **Register Address [Xn|sp]**
3. Va a memorizzare nella memoria il valore di x3 nell'indirizzo di x2. Siccome in x3 c'è FFFF FFFF FFFF FFFF va a sovrascrivere i primi due elementi dell'array.


### Esempio 2
```assembly
str w3, [x2]
print_all
```
1. Istruzione `str` è **corretta**
2. Indirizzamento: **Register Address [Xn|sp]**
3. Va a memorizzare nella memoria il valore di w3 nell'indirizzo di x2. Siccome in x3 c'è FFFF FFFF FFFF FFFF, in w3 ci sarà la metà. Quindi va a sovrascrivere il primo elemento dell'array.


### Esempio 3 
```assembly
str w3, [x2, #4]
print_all
```
1. Istruzione `str` è **corretta**
2. Indirizzamento: **Signed Immediate Offset: [Xn|sp, <±imm9>]**
3. Va a memorizzare nella memoria il valore di w3 nell'indirizzo di x2. Siccome in x3 c'è FFFF FFFF FFFF FFFF, in w3 ci sarà la metà. Incrementa di 4 byte, così facendo l'indirizzzo di memoria punterà al secondo elemento dell'array.



### Esempio 4
```assembly
mov x4, #8 // Il registro X4 contiene il valore 8
str x3, [x2, x4]
print_all
```
1. Istruzione `str` è **corretta**
2. Indirizzamento: **Register Offset: [Xn|sp, Rm, <option>]**
3. Memorizza nella memoria il valore di x3 nell'indirizzo di x2. Ma con x2 + 8, così facendo arriva al terzo e quarto elemento dell'array.



### Esempio 5
```assembly
mov x4, #2 // Il registro X4 contiene il valore 2
str w3, [x2, x4, lsl #2]
print_all
```
1. Istruzione `str` è **corretta**
2. Indirizzamento: **Register Offset: [Xn|sp, Rm, <option>]**
3. Memorizza nella memoria il valore di w3 nell'indirizzo di x2. Ma con x2 + x4 e con uno shift a sinistra di 2.
0x00000010 [shift a sinistra di 2] => 0x00001000 ovvero 8 in binario.
Quindi il terzo elemento dell'array.

### Esempio 6
```assembly
str w3, [x2, #16]!
print_all
```
1. Istruzione `str` è **corretta**
2. Indirizzamento: **Pre-indexed Immediate Offset: [Xn|sp, #±<imm9>]!**
3. Memorizza nella memoria il valore di w3 nell'indirizzo di (X2 + 16). Viene aggiunto 16 ad X2. E poi modificato con ffff l'ultimo elemento.


### Esempio 7
```assembly
str w3, [x2], #4
print_all
```
1. Istruzione `str` è **corretta**
2. Indirizzamento: **Post-indexed Immediate Offset: [Xn|sp], #±<imm9>**
3. Memorizza nella memoria il valore di w3 nell'indirizzo di x2. Ovvero solo il primo elemento dell'array e il registro di x2 verrà incrementato di 4. 

### Esempio 8
```assembly
str w3, [x2], #4
print_all
```
1. Istruzione `str` **NON È corretta**
2. Indirizzamento: **Pseudo-load: =<immediate|symbol>**
3. Metodo d'indirizzamento non valido per questa istruzione. 


## Esercizi 3, 4, 5

Vedere i rispettivi file. 

## Esercizio 6

1. Facendo l'AND bit a bit con 1 e 0 con l'istruzione `tst`, andiamo ad alterare i flag PSTATE. Il risultato dell'operazione è zero, quindi si setta a 1 il flag Z (zero).
Nell'istruzione di branch `beq` significa se sono uguali salta ad una label.
Ma come condition ﬂag `beq` ha Z = 1. Quindi salta per questo preciso motivo.
2. Stesso motivo come spiegato prima.
3. Output: `false` perchè il condition flag per `beq` non è stato triggerato.
4. Stesso motivo come spiegato prima. (Vedi risposta 1)