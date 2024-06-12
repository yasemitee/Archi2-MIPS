# INPUT:
#	$a0 primo numero
#	$a1 secondo  numero
# OUTPUT:
# 	$v0 1 se uno è multiplo dell'altro 0 altrimenti
	.text
	.globl multiplo
multiplo:
	div $a0 $a1
	mfhi $t0
	beq $t0 $zero si
	
	div $a1 $a0
	mfhi $t0
	beq $t0 $zero si	
no:
	li $v0 0
	jr $ra
si:
	li $v0 1
	jr $ra
