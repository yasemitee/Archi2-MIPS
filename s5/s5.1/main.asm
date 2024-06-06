	.text
	.globl main
main:
	li $s0 4
	li $s1 5
	
	move $a0 $s0
	move $a1 $s1
	jal prodotto_s
	move $s2 $v0
	
	li $v0 1
	move $a0 $s2
	syscall
	
	li $v0 10
	syscall