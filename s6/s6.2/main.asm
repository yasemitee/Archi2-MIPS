	.text
	.globl main
main:
	li $a0 7
	jal fibonacci
	
	move $a0 $v0
	li $v0 1
	syscall
	
	li $v0 10
	syscall
