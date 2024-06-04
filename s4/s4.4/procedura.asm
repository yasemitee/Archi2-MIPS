#Parametri: $a0 posizione in memoria dell'array, $a1 dimArray, $a2 k
#Return: Somma dei valori in posizione dispari o pari in base a k
	.text
	.globl P
P:
	li $t4 2
	beqz $a2 SommaDispari
	beq $a2 1 SommaPari
SommaPari:
	li $v0 0
	li $t0 0 #Indice
If1:
	blt $t0 $a1 For1
	j Exit
For1:
	div $t0 $t4
	mfhi $t2
	mul $t1 $t0 4
	add $t1 $t1 $a0 #offset
	#i++
	addi $t0 $t0 1
	
	bne $t2 0 For1 
	
	lw $t3 0($t1)
	add $v0 $v0 $t3

	j If1
SommaDispari:
	li $v0 0
	li $t0 0 #Indice
If2:
	blt $t0 $a1 For2
	j Exit
For2:
	div $t0 $t4
	mfhi $t2
	mul $t1 $t0 4
	add $t1 $t1 $a0 #offset
	#i++
	addi $t0 $t0 1
	
	beq $t2 0 For2 
	
	lw $t3 0($t1)
	add $v0 $v0 $t3
	j If2
Exit:
	jr $ra
