#INPUT:
#	$a0 numero intero
#OUTPUT:
#	$v0 fattoriale di $a0
	.text
	.globl fattoriale
fattoriale:
	#PREAMBOLO
	move $t0 $fp
	add $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	addi $sp $fp -8
	
	beq $a0 $zero caso_base
	
	# Push a0
	addi $sp $sp -4
	sw $a0 0($sp)
	
	sub $a0 $a0 1
	jal fattoriale
	
	# Pop a0
	lw $a0 0($sp)
	addi $sp $sp 4
	
	mul $v0 $a0 $v0
	j end
	
caso_base:
	li $v0 1
	
end:
	#EPILOGO
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	move $fp $t0
	jr $ra