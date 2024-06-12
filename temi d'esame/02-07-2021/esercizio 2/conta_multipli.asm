# INPUT:
#	$a0 indirizzo base primo array
#	$a1 indirizzo base secondo array
#	$a2 numero di elementi
# OUTPUT:
# 	$v0 numero di multipli nella medesima posizione
	.text
	.globl conta_multipli
conta_multipli:
	#PREAMBOLO
	move $t0 $fp
	addi $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	sw $s0 -12($fp)
	sw $s1 -16($fp)
	addi $sp $fp -16
	
	move $s0 $a0
	move $s1 $a1
	
	li $t2 0
	li $t7 0
loop:
	beq $t2 $a2 end
	
	mul $t4 $t2 4
	add $t4 $t4 $s0 
	lw $t5 0($t4) # i-esimo elemento del primo array
	
	sub $t4 $t4 $s0
	add $t4 $t4 $s1
	lw $t6 0($t4) # i-esimo elemento del secondo array
	
	move $a0 $t5
	move $a1 $t6
	jal multiplo
	add $t7 $t7 $v0 # aggiungo al risultato finale l'esito di multiplo
	
	addi $t2 $t2 1 #i++
	j loop
end:
	#EPILOGO
	move $v0 $t7
	lw $t0 -0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	lw $s0 -12($fp)
	lw $s1 -16($fp)
	move $fp $t0
	jr $ra
	