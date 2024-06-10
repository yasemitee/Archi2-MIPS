		.data
		.globl stack
		.globl stack_len
stack:		.word 0 #Puntatore all'ultimo elemento inserito
stack_len:	.word 0 #Numero di elementi nello stack
str_options:	.asciiz "\nOpzioni:\n(1) - Push\n(2) - Pop\n(3) - Print\n(4) - Exit\n>"
str_x: 		.asciiz "x ->"
str_y: 		.asciiz "y ->"
str_angle: 	.asciiz "angle ->"
		.text 
		.globl main
main:

loop:
	#scelta opzione
	li $v0 4
	la $a0 str_options
	syscall
	li $v0 5
	syscall
	move $t0 $v0
	
	beq $v0 1 opt_push
	beq $v0 2 opt_pop
	beq $v0 3 opt_print
	beq $v0 4 exit
	
opt_push:
	li $v0 4
	la $a0 str_x
	syscall
	li $v0 5
	syscall
	move $t0 $v0
	
	li $v0 4
	la $a0 str_y
	syscall
	li $v0 5
	syscall
	move $t1 $v0
	
	li $v0 4
	la $a0 str_angle
	syscall
	li $v0 5
	syscall
	move $t2 $v0
	
	move $a0 $t0
	move $a1 $t1
	move $a2 $t2
	jal push
	
	j loop
opt_pop:
	jal pop
	j loop
opt_print:
	jal stack_print
	j loop
exit:
	li $v0 10
	syscall
	
	