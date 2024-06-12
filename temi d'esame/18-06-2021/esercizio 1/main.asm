	.data
A:	.word 1 2 3 4 5
str1:	.asciiz "Minimo: "
str2:	.asciiz "Massimo: "
	.text
	.globl main
main:
	la $a0 A
	la $a1 5
	jal max_min
	move $s0 $v0
	move $s1 $v1
	
	#print minimo
	li $v0 4
	la $a0 str1
	syscall	
	li $v0 1
	move $a0 $s0
	syscall
	
	li $v0 11
	li $a0 10
	syscall
	
	#print massimo
	li $v0 4
	la $a0 str2
	syscall	
	li $v0 1
	move $a0 $s1
	syscall
	
	li $v0 10
	syscall
