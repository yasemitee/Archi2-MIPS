	.data
	.text
	.globl main
main:
	li $v0 9
	li $a0 8
	syscall
	
	move $s0 $v0 #array
	li $t0 2
	sw $t0 0($s0)
	sw $t0 4($s0)
	
	#Inserimento
	move $a0 $s0
	li $a1 3
	jal push_back
	move $s0 $v0
	
	move $a0 $s0
	jal print_all
	
	#Inserimento
	move $a0 $s0
	li $a1 4
	jal push_back
	move $s0 $v0
	
	move $a0 $s0
	jal print_all
	
	#Inserimento
	move $a0 $s0
	li $a1 7
	jal push_back
	move $s0 $v0
	
	move $a0 $s0
	jal print_all
	
	li $v0 10
	syscall