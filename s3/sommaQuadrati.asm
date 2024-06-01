	.data
str1: 	.asciiz "Inserire Sum: "
str2: 	.asciiz "Inserire N: "
str3: 	.asciiz "break "
str4: 	.asciiz "la somma è "

	.text
	.globl main
main:
	#lettura Sum
	li $v0 4
	la $a0 str1
	syscall 
	
	li $v0 5
	syscall
	move $s0 $v0
	
	move $t4 $s0 #salvataggio sum iniziale
	#lettura N
	li $v0 4
	la $a0 str2
	syscall 
	
	li $v0 5
	syscall
	move $s1 $v0
	
	#indice 
	li $t1 1
for:
	#Condizione di iterazione i < N
	slt $t0 $t1 $s1
	beq $t0 $zero end
	#Condizione If
	mul $t2 $t1 $t1 # i * i
	div $t2 $t4 
	mfhi $t3
	beq  $t3 $zero Break
	
	add $s0 $s0 $t2
	addi $t1 $t1 1
	j for
Break:
	li $v0 4
	la $a0 str3
	syscall 
end:
	li $v0 4
	la $a0 str4
	syscall 
	
	li $v0 1
	move $a0 $s0
	syscall 
	
	li $v0 10
	syscall
	
