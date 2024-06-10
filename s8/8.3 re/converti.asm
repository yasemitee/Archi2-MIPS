#INPUT:
#	$a0 stringa da convertire
#	$a1 array in cui mettere la codifica convertita
	.text
	.globl converti
converti:
	li $t0 8
	li $t1 2
	
	add $a1 $a1 7
loop:
	beq $t0 $zero end
	
	div $a0 $t1 #divido per 2
	
	mflo $a0 
	mfhi $t3
	add $t3 $t3 48 #conversione
	
	sb $t3 0($a1)
	
	addi $a1 $a1 -1
	addi $t0 $t0 -1
	j loop
end:
	sb $t0 0($a1)
	jr $ra