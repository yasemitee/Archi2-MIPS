	.text
	.globl prodotto_s
prodotto_s:
	#Preambolo
	move $t0 $fp
	addi $fp $sp -4
	
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	#Corpo
	li $t0 1 #i
	move $t2 $a0 #Primo addendo
	move $t3 $a1 #Secondo addendo
	move $t4 $t3 #somma
Loop:
	slt $t1 $t0 $t2
	beq $t1 $zero End
	
	move $a0 $t4
	move $a1 $t3
	jal somma
	move $t4 $v0
	addi $t0 $t0 1
	j Loop
End:
	#Epilogo
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	move $fp $t0
	jr $ra