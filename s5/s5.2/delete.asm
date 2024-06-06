# INPUT:
# $a0 Array
# $a1 Head
# $a2 posizione dell'elemento da eliminare
# $a3 numero di elementi nell'array

	.text
	.globl delete
delete:
	mul $t0 $a2 4
	add $t0 $t0 $a0 # posizione dell'elemento da eliminare in mem
	
	sub $t1 $a3 $a2 #numero di iterazioni da effettuare
	
loop:
	beq $t1 $zero exitLoop
	lw $t2 4($t0)
	sw $t2 0($t0) #metto nella posizione $t0 il successivo
	add $t0 $t0 4
	sub $t1 $t1 1
	j loop
exitLoop:
	add $v0 $a1 -4
	jr $ra
	
