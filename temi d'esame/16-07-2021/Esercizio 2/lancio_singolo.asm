# INPUT:
#	$a0 Primo numero intero
#	$a1 Secondo numero intero
# OUTPUT:
#	$v0 1 se $a0 > $a1, 2 se $a0 < $a1, 0 se $a0 == $a1
	.text
	.globl lancio_singolo
lancio_singolo:
	bgt $a0 $a1 return_1 
	bgt $a1 $a0 return_2
	beq $a0 $a1 return_0 
return_1:
	li $v0 1
	jr $ra
return_2:
	li $v0 2
	jr $ra
return_0:
	li $v0 0
	jr $ra