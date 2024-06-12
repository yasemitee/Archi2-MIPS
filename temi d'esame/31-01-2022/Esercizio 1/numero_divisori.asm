# INPUT:
#	$a0 numero intero
# OUTPUT:
#	$v0 numero di divisori
	.text
	.globl numero_divisori
numero_divisori:
	li $v0 0
	li $t1 1
	
	
loop:
	bgt $t1 $a0 end
	div $a0 $t1
	mfhi $t2
	beqz $t2 add_count
	addi $t1 $t1 1
	j loop
add_count:
	addi $v0 $v0 1
	addi $t1 $t1 1
	j loop
end:
	jr $ra