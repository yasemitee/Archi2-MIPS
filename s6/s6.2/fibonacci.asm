	.text
	.globl fibonacci
fibonacci:
	#PREAMBOLO
	move $t0 $fp
	add $fp $sp -4
	sw $t0 0($fp)
	sw $t1 -4($fp)
	sw $t2 -8($fp)
	sw $sp -12($fp)
	sw $ra -16($fp)
	addi $sp $fp -16
	
	beq $a0 1 fib_di_1
	beq $a0 $zero fib_di_0
	
	# Push a0
	addi $sp $sp -4
	sw $a0 0($sp)
	
	#fib(n-1)
	sub $a0 $a0 1
	jal fibonacci
	move $t1 $v0
	
	# Pop a0
	lw $a0 0($sp)
	addi $sp $sp 4
	
	#fib(n-2)
	sub $a0 $a0 2
	jal fibonacci
	move $t2 $v0
	
	add $v0 $t1 $t2 #fib(n-1) + fib(n-2)
	j end 
	
fib_di_1:
	li $v0 1
	j end
fib_di_0:
	li $v0 0
end:
	#EPILOGO
	lw $t0 0($fp)
	lw $t1 -4($fp)
	lw $t2 -8($fp)
	lw $sp -12($fp)
	lw $ra -16($fp)
	move $fp $t0
	jr $ra
