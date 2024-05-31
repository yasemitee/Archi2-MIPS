.data
A:	.word -1 -1 1 4
B:	.word -1 6 -1 -1
c:	.word 2
.text
.globl main
main: 
la $s0 A
la $s1 B
la $s2 c
lw $s2 ($s2)

#numeratore
mul $t1 $s2 4
add $t1 $t1 $s0
lw $t1 ($t1)
mul $t1 $t1 4 
add $t1 $t1 $s1
lw $t1 ($t1) # B[A[c]]
add $t1 $s2 $t1
mul $t1 $t1 $s2 

#denominatore
mul $t2 $s2 2
add $t2 $t2 -1
mul $t2 $t2 4
add $t2 $s0 $t2
lw $t2 ($t2) # A[2*c-1]

div $t3 $t1 $t2

add $t4 $s2 -1
mul $t4 $t4 4
add $t4 $s0 $t4

sw $t3 ($t4)

 