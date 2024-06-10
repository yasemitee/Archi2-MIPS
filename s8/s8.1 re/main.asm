	.text
	.globl main
main:
	#Array A
	li $v0 9
	li $a0 16
	syscall 
	move $s0 $v0
	li $t0 0
	sw $t0 0($s0)
	li $t0 -2
	sw $t0 4($s0)
	li $t0 3
	sw $t0 8($s0)
	li $t0 4
	sw $t0 12($s0)
		
	#Array B
	li $v0 9
	li $a0 16
	syscall 
	move $s1 $v0
	
	move $a0 $s0
	move $a1 $s1
	li $a2 4
	jal inverti

	li $v0 10
	syscall