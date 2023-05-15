.global main

.data
x: .short 0, 1, 1, 2, 3, 5, 8, 13, 21
.equ size, (. -x) / 2
s: .asciz "Calcola la lunghezza!"
.equ size, (. -s)
