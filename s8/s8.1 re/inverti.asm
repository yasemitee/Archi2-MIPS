#INPUT:
#	$a0 A
#	$a1 B
#	$a2 Dimensione array
	.text
	.globl inverti
inverti:
	li $t0 0
loop:
	beq $t0 $a2 end
	sub $t1 $a2 $t0 #B[len-i]
	mul $t2 $t0 4
	add $t2 $t2 $a0
	lw $t3 ($t2) #A[i]
	
	mul $t1 $t1 4
	add $t1 $t1 $a1
	sw $t3 ($t1) #metto A[i] in B[len-i]
	
	addi $t0 $t0 1 #i++
	j loop
end:
	jr $ra
