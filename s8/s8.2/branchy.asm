	.data
str1:	.asciiz "Sono in T1"
str2:	.asciiz "Sono in T2"
	.text
	.globl main
main:
	li $s0 2 #a
	li $s1 2 #b
	la $s2 T1
	la $s3 T2
	add $a0 $zero $s0
	add $a1 $zero $s1
	add $a2 $zero $s2
	add $a3 $zero $s3
	jal branchy
	jr $v0
T1:
	li $v0 4
	la $a0 str1
	syscall
	j exit
T2:
	li $v0 4
	la $a0 str2
	syscall
exit:
	li $v0 10
	syscall

#-----------------
#Procedura branchy
#INPUT:
#	$a0 a
#	$a1 b
#	$a2 T1
#	$a3 T2
	.text
	.globl branchy
branchy:
	bgt $a0 $a1 return_T1
	blt $a0 $a1 return_T2
	sub $v0 $ra 4
	j exit_branchy
return_T1:
	add $v0 $zero $a2
	j exit_branchy
return_T2:
	add $v0 $zero $a3
exit_branchy:
	jr $ra		
	
	