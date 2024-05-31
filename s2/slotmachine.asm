	.data
msg1: 	.asciiz "Inserire un NUM: "
msg2:	.asciiz "Credito dopo la scommessa: "
	.text
	.globl main
main:
	la $a0 msg1
	li $v0 51
	syscall
	
	move $t0 $a0
	
	mul $t1 $t0 2
	add $t1 $t1 1 
	
	li $a0 0
	move $a1 $t1
	li $v0 42
	syscall
	
	move $t2 $a0
	
	sub $t2 $t2 $t0

	add $t3 $t0 $t2
			
	la $a0 msg2 
	move $a1 $t3 
	li $v0 56 
	syscall	

	li $v0 10 # exit
	syscall	
