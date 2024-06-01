	.data 
A:	.word 0 1 2 3 4 5 6 7 8 9 10 11 12
msg1:	.asciiz "Inserire a: " 
msg2:	.asciiz "Inserire b: " 
msg3:	.asciiz "Inserire c: " 
msg4:	.asciiz "Comando non riconosciuto" 
	.align 2
	.text
	.globl main
main:
	la $s0 A #Array A
	
	li $v0 4
	la $a0 msg1
	syscall #print str
	
	li $v0 5
	syscall
	move $s1 $v0 #a
	
	li $v0 4
	la $a0 msg2
	syscall #print str
	
	li $v0 5
	syscall
	move $s2 $v0 #b
	
	li $v0 4
	la $a0 msg3
	syscall #print str
	
	li $v0 5
	syscall
	move $s3 $v0 #c
	
	mul $t0 $s1 4 
	add $t0 $t0 $s0 #offset a-esima posizione
	lw $t1 0($t0) #a-esimo elemento
	
	mul $t2 $s2 4 
	add $t2 $t2 $s0 #offset b-esima posizione
	lw $t3 0($t2) #b-esimo elemento
	
	beq $s3 $zero then
	beq $s3 1 elsePositive
	beq $s3 -1 elseNegative
	j unknownComand
then:
	#Scambio a-esimo con b-esimo
	sw $t1 0($t2) 
	sw $t3 0($t0)
	j end
elsePositive:
	#Sovrascrive b-esimo con a-esimo
	sw $t3 0($t0)
	j end
elseNegative:
	#Sovrascrive a-esimo con b-esimo
	sw $t1 0($t2)
unknownComand:
	li $v0 4
	la $a0 msg4
	syscall #print str
	j end
end:
	li $v0 10
	syscall
	
	
	