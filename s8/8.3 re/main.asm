	.data
A:	.space 9
	.text
	.globl main
main:
	li $a0 3
	la $a1 A
	jal converti
	
	#Stampa
	li $v0 4
	la $a0 A
	syscall
	
	li $v0 10
	syscall