	.data
A:	.word 1 9 5 9 5
B:	.word 4 3 3 8 15
	.text
	.globl main 
main:
	la $a0 A
	la $a1 B
	li $a2 5 
	jal conta_multipli
	
	move $a0 $v0
	li $v0 1
	syscall
	
	li $v0 10
	syscall
