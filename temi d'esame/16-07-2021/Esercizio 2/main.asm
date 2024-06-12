	.data
A:	.word 1 2 4 3
B:	.word 3 1 6 3
str1:	.asciiz "vittorie g1: "
str2:	.asciiz "vittorie g2: "
	.text
	.globl main
main:
	la $a0 A
	la $a1 B
	li $a2 4 
	jal numero_vittorie
	move $s0 $v0
	move $s1 $v1
	
	#print vittorie g1
	li $v0 4
	la $a0 str1
	syscall
	li $v0 1
	move $a0 $s0
	syscall
	
	li $v0 11
	la $a0 10
	syscall
	
	#print vittorie g2
	li $v0 4
	la $a0 str2
	syscall
	li $v0 1
	move $a0 $s1
	syscall
	li $v0 10
	syscall