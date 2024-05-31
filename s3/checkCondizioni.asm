	.data
str1: 	.asciiz "Inserire 3 interi: \n"
str2: 	.asciiz "a: "
str3: 	.asciiz "b: "
str4: 	.asciiz "c: "
str5: 	.asciiz "errore"
str6: 	.asciiz "Il risultato è "
	.align 2
	.text 
	.globl main
main:
	#Print messaggio iniziale
	li $v0 4
	la $a0 str1
	syscall
	#Prendo a b c
	li $v0 4
	la $a0 str2
	syscall
	la $v0 5
	syscall
 	move $s0 $v0 #$s0 = a

	li $v0 4
	la $a0 str3
	syscall
	la $v0 5
	syscall
 	move $s1 $v0 #$s1 = b

	li $v0 4
	la $a0 str4
	syscall
	la $v0 5
	syscall
 	move $s2 $v0 #$s2 = c
if:
	sge $t0 $s0 $s1
	beqz $s2 else
	beq $t0 $zero else
then:
	add $t0 $s0 $s1
	mul $s3 $t0 $s2 #$s3 = z
	#Print z
	li $v0 4
	la $a0 str6
	syscall
	li $v0 1
	move $a0 $s3
	syscall
	j end
else:
	#Print errore
	li $v0 4
	la $a0 str5
	syscall
	j end
end:
	li $v0 10
	syscall







