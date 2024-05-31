.data
msg1:	.asciiz "Inserire un intero: "
msg2:	.asciiz "Il numero e il suo successivo sono: "
msg3:	.asciiz " "
.align 2
A:	.word 0 0
.text
.globl main
main:
la $s0 A

li $v0 4
la $a0 msg1
syscall

li $v0 5
syscall

add $s1 $v0 1
move $s2 $v0

sw $s1 ($s0)
sw $s2 4($s0)

li $v0 4
la $a0 msg2
syscall

li $v0 1
move $a0 $s2
syscall

li $v0 4
la $a0 msg3
syscall

li $v0 1
move $a0 $s1
syscall

li $v0 10
syscall




