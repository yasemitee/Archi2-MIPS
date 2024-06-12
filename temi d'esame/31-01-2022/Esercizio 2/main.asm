	.data
	.globl A
	.globl n
A:	.word 2 3 0 2 7
n:	.word 5
	.text
	.globl main
main:
	li $t0 0 # $t0 = indice
	la $t2 n
	lw $t2 0($t2)
	la $t3 A
	sub $t2 $t2 1 # penultima posizione di A (che deve rimanere invariata)
loop:
	beq $t0 $t2 end
	mul $t1 $t0 4
	add $t1 $t1 $t3
	
	lw $a0 0($t1) #estraggo i-esimo elemento
	lw $a1 4($t1) #estraggo il successivo
	jal pippo
	sw $v0 0($t1) #sostituisco il valore restituito da pippo nell'i-esimo elemento
	
	addi $t0 $t0 1 #i++
	j loop
end:
	# exit
	li $v0 10
	syscall
