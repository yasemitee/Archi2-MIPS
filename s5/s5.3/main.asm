	.data
str:	.asciiz "Siuuuu"
	.text
	.globl main
main:
	la $a0 str
	jal converti
	
	li $v0 4
	la $a0 str
	syscall
	
	li $v0 10
	syscall