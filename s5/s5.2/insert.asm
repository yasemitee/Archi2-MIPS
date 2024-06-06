#Input: $a0 <- Array
#	$a1 <- HEAD
#	$a2 <- Valore da inserire
	.text
	.globl insert
insert:
	sw $a2 ($a1)
	addi $v0 $a1 4
	jr $ra 
