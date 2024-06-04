	.data
A:	.word 11 3 1 111 423 562 2 7 6 9 1000 98 63
dimA:	.word 12
str1:	.asciiz "Il massimo è "
str2:	.asciiz "Il minimo è "
str3:	.asciiz "\n"
	.align 2
	.text
	.globl main
main:
	la $s0 A
	la $s1 dimA
	lw $s1 dimA
	
	move $a0 $s1
	move $a1 $s0
	jal Max
	move $s2 $v0 # Max in ($s2)
	
	move $a0 $s1
	move $a1 $s0
	jal Min
	move $s3 $v0 # Min in ($s3)
	
	#Print massimo
	li $v0 4
	la $a0 str1
	syscall
	li $v0 1
	move $a0 $s2
	syscall
	
	#Print \n
	li $v0 4
	la $a0 str3
	syscall
	
	#Print minimo
	li $v0 4
	la $a0 str2
	syscall
	li $v0 1
	move $a0 $s3
	syscall
Exit:
	li $v0 10
	syscall
