#Parametri: intero1, intero2, intero3, segmento1, stack(segmento2)
	.text
	.globl branch3equal
branch3equal:
	beq $a0 $a1 CheckEqual
	beq $a0 $a2 Return
	bne $a1 $a2 AllDifferent
CheckEqual:
	beq $a1 $a2 AllEqual
	j Return
AllEqual:
	jr $a3
AllDifferent:
	lw $t0 0($sp)
	addi $sp $sp 4
	jr $t0
Return:
	jr $ra