# Risposte Esercizi:

## Esercizio 1:
    1.  size x: 9; 
        perche ogni elemento dell'array di short corrisponde a 2. ogni elemento corrisponde
        a 2 byte. 9 (len array) * 2 = 18 
        size s: 16; 
        Len stringa: 21 + 1 byte per il char null. 22 in hex = 22
    2.  non cambia niente
    3.  Memorizza soltanto l'ultimo valore calcolato
    4.  symbol `size' is already defined

## Esercizio 2:
    1. stampa 0
    2.  La valutazione dell'if viene fatta dall'assembler. In questo caso, l'assembler controlla se il simbolo
    NON e' definito. Se non e' definito, include il pezzo di codice che sta dopo l'if altrimenti quello dell'else
    3.  Non cambia niente.
    4.  vedere esercizio2_dis.s

## Esercizio 3:
    1. .macro print n
        adr x0, fmt
        mov w1, \n
        bl printf
        .endm
    2.   print 1
        print 2
        print 3
        print 4
        print 5
    3.  1/n 2/n 3/n 4/n 5/n
    4.  Sostituisce il codice della macro con l'argomento passato. In questo caso passa i numeri. vedere punto b.
    5.  scrivere print 15 e cacciare le altre chiamate alla macro. 

## Esercizio 4:
    1.  0b11001000 == 200
        1x2^3 = 8   +
        1x2^6 = 64  + 
        1x2^7 = 128 =
        -------------
                  200
        dopo l'esecuzione del main:
        
        0b11001001 == 201
        1x2^0 = 1   +
        1x2^3 = 8   +
        1x2^6 = 64  + 
        1x2^7 = 128 =
        -------------
                  201
    
    2.   N = 0; Z = 0; C = 0; V = 0;
    3.   n: 0b11001000 == 200
        dopo l'esecuzione del main:
        n = n - 1 
        0b11000111 == 199
        1x2^0 = 1   + 
        1x2^1 = 2   + 
        1x2^2 = 4   + 
        1x2^6 = 64  + 
        1x2^7 = 128 =
        -------------
                  199
    4.   N = 0; Z = 0; C = 1; V = 0;
    5.   Se al posto di 1 aggiungessimo 5610 ovvero 0011 10002 otterremmo il numero 25610 
        che non è rappresentabile con 8 bit, infatti 25610 corrisponde a 1 0000 00002. Si noti 
        inoltre che aggiungendo 56, n diventa uguale a 0 perché il risultato della somma viene 
        troncato a 8 bit. Inoltre, i flag NZCV valgono tutti 0: 
        - N=0 perché il risultato ottenuto non è un numero negativo 
        - Z=0  perché  il  risultato  ottenuto  non  è  realmente  zero  ma  1  0000  00002 
        troncato a 8 bit quando viene eseguita l’istruzione strb alla fine della macro 
        add_to_n 
        - C=0 perché nel caso di addizione C diventa 1 solo se il risultato ottenuto eccede 
        32  bit  (ovvero,  la dimensione del  registro  w9  di cui  la  macro  fa  uso)  e  non  è 
        questo il caso, poiché 1 0000 00002 è memorizzabile in 9 bit. 
        - per  lo  stesso  motivo,  V=0  perché  non  si  è  verificato  un  overflow  (il  risultato 
        dell’operazione è memorizzabile in meno di 32 bit). 

## Esercizio 5:
    1.  DEBUG ON
    2.   .equ LOG_LEVEL, 20
    3.   .equ LOG_LEVEL, 30
