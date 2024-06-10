#INPUT:
#	$a0 x
#	$a1 y
#	$a2 angle
	.text
	.globl push
push:
	move $t0 $a0
	
	la $t4 stack
	lw $t1 0($t4) # $t1 <- stack
	
	la $t2 stack_len
	lw $t3 0($t2) # $t2 <- lunghezza dello stack
	
	#Allocazione dinamica della memoria per ospitare 16 byte
	li $v0 9
	li $a0 12
	syscall
	
	lw $t0 0($v0)  #carico x
	lw $a1 4($v0)  #carico y
	lw $a2 8($v0)  #carico angle
	lw $t1 12($v0) #carico next (old stack)
	
	addi $t3 $t3 1
	sw $t3 0($t2) #len_stack ++
	
	sw $v0 0($t4) # aggiorna lo stack pointer al nodo appena creato
	
	jr $ra
	