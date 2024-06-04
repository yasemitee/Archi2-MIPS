#Parametri: $a0 dimensione array, $a1 posizione in memoria dell'array
#Return: il massimo nell'array 
	.text
	.globl Max
Max:
	li $t0 0 # ($t0) indice 
	lw $t1 0($a1) # ($t1) contiene il max
If:
	ble $t0 $a0 For
	j Exit
For:
	mul $t2 $t0 4
	add $t2 $t2 $a1
	lw $t3 0($t2)
	bgt $t3 $t1 NewMax
	addi $t0 $t0 1
	j If
NewMax:
	move $t1 $t3
	addi $t0 $t0 1
	j If
Exit:
	move $v0 $t1
	jr $ra
