	.data
A:	.word 5 10 15 20
	.text
	.globl main
main:
	la $a0 A
	li $a1 4
	jal s
	move $a0 $v0
	li $v0 1
	syscall
	
	li $v0 10
	syscall
