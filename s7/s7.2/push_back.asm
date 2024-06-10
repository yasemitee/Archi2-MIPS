#INPUT:
#	$a0 Indirizzo in memoria dell'Array
#	$a1 Elemento da aggiungere
	.text
	.globl push_back
push_back:
	move $t3 $a0
	move $t4 $a1
	lw $t0 0($t3) #$t0 numero di elementi inseriti
	lw $t1 4($t3) #$t1 capacità massima del vettore
	beq $t0 $t1 raddoppia
	
	add $t2 $t0 1 #aumento il numero di elementi inseriti
	mul $t0 $t0 4
	add $t0 $t0 $t3
	sw $t4 ($t0) #Aggiungo a0 nel primo posto libero
	sw $t2 ($t3)
	move $v0 $t3
	j exit
	
raddoppia:
	mul $t2 $t1 8
	li $v0 9
	move $a0 $t2
	syscall
	
	li $t5 0
loop:
	bge $t5 $t0 end
	mul $t6 $t5 4
	add $t6 $t6 $t3
	lw $t7 ($t6) #t7 elemento dell'array di partenza
	sub $t6 $t6 $t3
	add $t6 $t6 $v0
	sw $t7 ($t6) #inserimento di t7 nel nuovo array
	
	addi $t5 $t5 1 #i++
	j loop
end:
	add $t6 $t6 4
	sw $t4 ($t6) #aggiunta nuovo elemento
	add $t0 $t0 1 #aumento il numero di elementi inseriti
	sw $t0 0($v0)
	div $t2 $t2 4
	sw $t2 4($v0)
exit:
	jr $ra


