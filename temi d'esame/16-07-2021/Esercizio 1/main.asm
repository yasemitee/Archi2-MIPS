	.data
A:	.word 1 2 3 4 5
	.text
	.globl main
main:
	la $a0 A
	li $a1 5 #L
	li $a2 2 #N
	jal copian
	
	li $v0 10
	syscall