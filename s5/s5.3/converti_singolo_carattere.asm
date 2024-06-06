# INPUT:
# $a0 carattere minuscolo da convertire in maiuscolo
	.text
	.globl converti_singolo_carattere
converti_singolo_carattere:
	move $v0 $a0
	blt $a0 97 end
	bgt $a0 122 end
	sub $v0 $v0 32
end:
	jr $ra
