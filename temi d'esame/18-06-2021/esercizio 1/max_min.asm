# INPUT:
#	$a0 indirizzo base primo array
#	$a1 dimensione dell'array
# OUTPUT:
# 	$v0 minimo elemento dell'array
# 	$v1 massimo elemento dell'array
	.text
	.globl max_min
max_min:
	li $t0 0
	lw $t1 0($a0) #max
	lw $t2 0($a0) #min
loop:
	beq $t0 $a1 end
	
	mul $t3 $t0 4
	add $t3 $t3 $a0
	lw $t3 0($t3)
	
	addi $t0 $t0 1 #i++
	bgt $t3 $t1 update_max
	blt $t3 $t2 update_min
	
	j loop
update_max:
	move $t1 $t3
	j loop
update_min:
	move $t2 $t3
	j loop
end:
	move $v0 $t2
	move $v1 $t1
	jr $ra
	
	
	
	
