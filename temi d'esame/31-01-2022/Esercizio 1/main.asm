	.data
msg1:	.asciiz "Inserire un numero intero: "
msg2:	.asciiz "Numero di divisori: "
	.align 2
	.text
	.globl main
main:
	# Print msg1
	li $v0 4
	la $a0 msg1
	syscall
	
	li $v0 5
	syscall
	move $s0 $v0 # $s0 = numero intero
	
	move $a0 $s0
	jal numero_divisori
	move $s1 $v0 # s1 = risultato
	
	# Print msg1
	li $v0 4
	la $a0 msg2
	syscall
	
	# Print 1
	li $v0 1
	move $a0 $s1
	syscall
	
	# exit
	li $v0 10
	syscall