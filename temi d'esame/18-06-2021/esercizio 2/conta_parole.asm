# INPUT:
#	$a0 indirizzo base di una stringa (frase)
# OUTPUT:
# 	$v0 numero di parole della frase
	.text
	.globl conta_parole
conta_parole:
	li $t0 0 #i
	li $t2 -1 #inizializzo $t2 ad un valore qualsiasi
loop:
	beq $t2 $zero end
	add $t1 $t0 $a0
	lb $t2 0($t1)	#codifica del i-esimo carattere ASCII della stringa
	addi $t0 $t0 1
	beq $t2 32 loop
	addi $v0 $v0 1
	j loop
end:
	sub $v0 $v0 1 #tolgo dal conteggio il terminatore di stringa
	jr $ra