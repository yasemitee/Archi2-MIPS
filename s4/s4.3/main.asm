	.data
str1:	.asciiz "Primo segmento (Tutti uguali)"
str2:	.asciiz "Secondo segmento (Tutti diversi)"
str3:	.asciiz "Segmento PC + 4"
	.align 2
	.text
	.globl main
main:
	#Caricamento dei parametri
	la $t0 S1
	la $t1 S2
	li $a0 1
	li $a1 2
	li $a2 3
	la $a3 0($t0)
	addi $sp $sp -4
	sw $t1 0($sp)
	jal branch3equal
	#PC + 4
	li $v0 4
	la $a0 str3
	syscall
	j Exit
S1:
	li $v0 4
	la $a0 str1
	syscall
	j Exit
S2:
	li $v0 4
	la $a0 str2
	syscall
Exit:
	li $v0 10
	syscall