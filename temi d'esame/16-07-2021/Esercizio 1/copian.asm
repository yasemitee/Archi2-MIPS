# INPUT:
#	$a0 Array
#	$a1 Lunghezza dell'array
#	$a2 N
# OUTPUT:
#	$v0 indirizzo di in nuovo array nell'heap contenente i primi N elementi di $a0 
	.text
	.globl copian
copian:
	li $t0 0 # i
	move $t1 $a0 
	# Allocazione dinamica
	mul $t4 $a2 4
	li $v0 9
	move $a0 $t4
	syscall
loop:
	beq $t0 $a1 end
	mul $t2 $t0 4
	add $t2 $t2 $t1
	lw $t3 0($t2)	#i-esimo elemento di A
	
	beq $t0 $a2 end
	
	sub $t2 $t2 $t1
	add $t2 $t2 $v0
	sw $t3 ($t2) #salvo nel i-esima posizione del nuovo array
	
	addi $t0 $t0 1 #i++
	j loop
end:
	jr $ra