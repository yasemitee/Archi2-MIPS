# INPUT:
#	$a0 Indirizzo primo array
#	$a1 Indirizzo secondo array
#	$a2 L'unghezza array
# OUTPUT:
#	$v0 #vittorie giocatore 1 (array $a0)
#	$v1 #vittorie giocatore 2 (array $a1)
	.text
	.globl numero_vittorie
numero_vittorie:
	#PREAMBOLO
	move $t0 $fp
	addi $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	sw $s0 -12($fp)
	sw $s1 -16($fp)
	sw $s2 -20($fp)
	sw $s3 -24($fp)
	addi $sp $fp -20
	
	move $s0 $a0
	move $s1 $a1
	li $s2 0 #w giocatore 1
	li $s3 0 #w giocatore 2
	
	li $t0 0 #i
loop:
	beq $t0 $a2 end
	mul $t1 $t0 4
	
	add $t2 $t1 $s0
	lw $t3 0($t2) #i-esimo elemento del primo array
	
	add $t2 $t1 $s1
	lw $t4 0($t2) #i-esimo elemento del secondo array
	
	move $a0 $t3
	move $a1 $t4
	jal lancio_singolo
	
	addi $t0 $t0 1 #i++
	
	beq $v0 1 w_giocatore_1
	beq $v0 2 w_giocatore_2
	j loop #else $v0 == 0
w_giocatore_1:
	addi $s2 $s2 1		
	j loop
w_giocatore_2:	
	addi $s3 $s3 1
	j loop	
end:
	move $v0 $s2
	move $v1 $s3
	#EPILOGO
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	lw $s0 -12($fp)
	lw $s1 -16($fp)
	lw $s2 -20($fp)
	lw $s3 -24($fp)
	move $fp $t0
	jr $ra