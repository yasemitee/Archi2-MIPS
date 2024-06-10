#INPUT:
#	$a0 Indirizzo in memoria dell'Array
	.data
str1:	.asciiz "\n"
str2:	.asciiz "---------------------------------"
	.text
	.globl print_all
print_all:
	move $t4 $a0
	lw $t0 0($t4) #$t0 numero di elementi inseriti
	lw $t1 4($t4) #$t1 capacità massima del vettore
	li $t2 0
	li $v0 4
	la $a0 str1
	syscall
loop:
	bge $t2 $t0 end
	mul $t3 $t2 4
	add $t3 $t3 $t4
	lw $t3 ($t3)
	
	li $v0 1
	move $a0 $t3
	syscall
	
	li $v0 4
	la $a0 str1
	syscall
	
	addi $t2 $t2 1 #i++
	j loop
end:
	li $v0 4
	la $a0 str2
	syscall
	jr $ra