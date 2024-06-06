# INPUT:
# $a0 Stringa da convertire in maiuscolo
# $a1 Dimensione della stringa
	.text
	.globl converti
converti:
	#PREAMBOLO
	move $t0 $fp
	add $fp $sp -4
	sw $t0 0($fp)
	sw $s0 -4($fp)
	sw $ra -8($fp)
	sw $sp -12($fp)
	add $sp $fp -12
loop:
	lb $t0 0($a0)
	beq $t0 $zero end #controllo se è il carattere di fine 
	
	move $s0 $a0
	
	move $a0 $t0
	jal converti_singolo_carattere
	
	move $a0 $s0
	
	sb $v0 0($a0)
	#vado a valutare il prossimo carattere
	addi $a0 $a0 1
	j loop
	
end:
	lw $t0 0($fp)
	lw $s0 -4($fp)
	lw $ra -8($fp)
	lw $sp -12($fp)
	move $fp $t0
	
	jr $ra