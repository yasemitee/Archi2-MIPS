#INPUT:
#	$a0 posizione in memoria dell'array
#	$a1 Dimensione dell'array
	.text
	.globl s
s:
	#PREAMBOLO
	move $t0 $fp
	add $fp $sp -4
	sw $t0 0($fp)
	sw $t1 -4($fp)
	sw $sp -8($fp)
	sw $ra -12($fp)
	addi $sp $fp -12
	
	beq $a1 $zero caso_base
	
	sub $a1 $a1 1 #a1 <- dim - 1
	mul $t0 $a1 4
	add $t0 $t0 $a0
	lw $t1 0($t0)
	
	jal s
	
	add $v0 $v0 $t1
	j end
caso_base:
	li $v0 0
end:
	#EPILOGO
	lw $t0 0($fp)
	lw $t1 -4($fp)
	lw $sp -8($fp)
	lw $ra -12($fp)
	move $fp $t0
	jr $ra
