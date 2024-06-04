	.data
A:	.space 200
str1:	.asciiz "Inserire la dimensione dell'array: "
str2:	.asciiz "Aggiungi: "
str3:	.asciiz "Il risultato è "
	.text
	.globl main
main:
	la $s0 A
	li $v0 4
	la $a0 str1
	syscall
	li $v0 5
	syscall
	move $s1 $v0
	
	li $t0 0 #Indice
If:
	blt $t0 $s1 For
	j Exit
For:
	#Inserimento dei valori nell'array
	mul $t1 $t0 4
	add $t1 $t1 $s0 #offset
	
	li $v0 4
	la $a0 str2
	syscall
	li $v0 5
	syscall
	sw $v0 0($t1)
	#i++
	addi $t0 $t0 1
	j If

Exit:	
	li $a2 1
	move $a0 $s0
	move $a1 $s1
	jal P
	move $s2 $v0
	li $v0 4
	la $a0 str3
	syscall
	
	li $v0 1
	move $a0 $s2
	syscall
	
	li $v0 10
	syscall
	
