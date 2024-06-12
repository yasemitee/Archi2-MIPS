# INPUT:
#	$a0 Indirizzo di una sequenza di caratteri ascii
# OUTPUT:
# 	$v0 1 se la stringa è palindroma 0 altrimenti
	.text
	.globl palindroma
palindroma: 
	li $t0 0
	li $t2 1 #inizializzo
get_len:
	beq $t2 $zero end_get_len
	add $t2 $t0 $a0
	lb $t2 0($t2)
	add $t0 $t0 1
	j get_len
end_get_len:
	sub $t0 $t0 1 # $t0 = lunghezza della parola
	li $t9 2
	div $t0 $t9
	mflo $t4 #metà della stringa
	li $t1 0
loop:
	beq $t1 $t4 si_palindroma
	
	add $t2 $t1 $a0
	lb $t2 0($t2) #i-esima posizione
	
	sub $t3 $t0 $t1
	sub $t3 $t3 1
	add $t3 $t3 $a0
	lb $t3 0($t3) # len - i-esima posizione
	
	bne $t2 $t3 non_palindroma
	
	add $t1 $t1 1
	j loop
non_palindroma:
	li $v0 0
	jr $ra
si_palindroma:
	li $v0 1
	jr $ra