	.data
A:	.space 512
	.text
	.globl main
main:
	la $s0 A 	
	la $s1 A #Head
	li $s2 0
	
	#insert 3
	move $a0 $s0
	move $a1 $s1
	li $a2 3
	jal insert 
	move $s1 $v0
	addi $s2 $s2 1
		
	#insert 6
	move $a0 $s0
	move $a1 $s1
	li $a2 6
	jal insert 
	move $s1 $v0
	addi $s2 $s2 1
	
	#insert 9
	move $a0 $s0
	move $a1 $s1
	li $a2 9
	jal insert 
	move $s1 $v0
	addi $s2 $s2 1
	
	#insert 12
	move $a0 $s0
	move $a1 $s1
	li $a2 12
	jal insert 
	move $s1 $v0 
	addi $s2 $s2 1
	
	#insert 15	
	move $a0 $s0
	move $a1 $s1
	li $a2 15
	jal insert 
	move $s1 $v0 
	addi $s2 $s2 1
	
	#remove posizione 2 (9)
	move $a0 $s0
	move $a1 $s1
	li $a2 2
	move $a3 $s2
	jal delete
	addi $s2 $s2 -1
	move $s1 $v0
	
	#insert 9
	move $a0 $s0
	move $a1 $s1
	li $a2 9
	jal insert 
	move $s1 $v0 
	addi $s2 $s2 1
Exit:
	li $v0 10
	syscall
