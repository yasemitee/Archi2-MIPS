	.data
a:	.word 3
s:	.asciiz "Fine"
V:	.word 1 1 1 1 1
	.text
	.globl main
main:
	la $s0 V
	la $s1 a
	lw $s2 0($s1)
	li $t0 0
loop:
	beq $t0 4 end
	mul $t1 $t0 4
	add $t1 $t1 $s0
	lw $t2 ($t1)
	add $t3 $t2 $s2
	sw $t3 ($t1)
	
	addi $t0 $t0 1
	
	j loop
end:
	sw $t1 0($s1)
	li $v0 4
	la $a0 s
	syscall
	
	li $v0 10
	syscall