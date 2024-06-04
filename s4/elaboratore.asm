	.data
str1:	.asciiz "Inserire il primo operando: "
str2: 	.asciiz "Inserire il secondo operando: " 
str3:	.asciiz "Inserire l'operazione: "
str4:	.asciiz "il risultato è "
	.align 2
	.text
	.globl main
main:
	# Leggo operazione $s0
	li $v0, 4	
	la $a0, str3	
	syscall
	li $v0, 5	
	syscall
	move $s0, $v0
	
	# leggo primo operando ($s1)	
	li $v0, 4		
	la $a0, str1
	syscall
	li $v0, 5		
	syscall
	move $s1, $v0

	# leggo secondo operando ($s2)
	li $v0, 4		
	la $a0, str2
	syscall
	li $v0, 5
	syscall
	move $s2, $v0
	
	
	move $a0, $s1	# primo operando in $a0
	move $a1, $s2	# secondo operando in $a1
	move $a2, $s0	# codice operazione in $a2
	
	jal Elaboratore
	
	move $s1 $v0 #Risultato
	
	#Stampa risultato
	li $v0, 4		
	la $a0, str4
	syscall
	li $v0, 1		
	move $a0, $s1
	syscall
	j Exit
# -------------------------------------------
# Procedura elaboratore
Elaboratore:
	beq $a2, 0, Sum
	beq $a2, 1, Diff
	beq $a2, 2, Mul
	beq $a2, 3, Div
Sum:
	add $v0 $a0 $a1
	j EndElaboratore
Diff:
	sub $v0 $a0 $a1
	j EndElaboratore
Mul:
	mul $v0 $a0 $a1
	j EndElaboratore
Div:
	div $v0 $a0 $a1
EndElaboratore:
	jr $ra
	
# -------------------------------------------
# Exit
Exit:
	li $v0 10
	syscall
	
