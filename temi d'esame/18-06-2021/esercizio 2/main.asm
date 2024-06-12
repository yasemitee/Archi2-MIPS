	.data
str:	.asciiz "ciao bello"
str1:	.asciiz "Numero di parole: "
	.text
	.globl main
main:
	la $a0 str
	jal conta_parole
	move $s0 $v0
	
	#print
	li $v0 4
	la $a0 str1
	syscall	
	li $v0 1
	move $a0 $s0
	syscall
	
	li $v0 10
	syscall
