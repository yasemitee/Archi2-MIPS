	.data
str:	.asciiz "anna"
str_si:	.asciiz "la parola è palindroma"
str_no:	.asciiz "la parola non è palindroma"
	.text
	.globl main 
main:
	la $a0 str
	jal palindroma
	move $s0 $v0
	
	beqz $s0 no
si:
	li $v0 4
	la $a0 str_si
	syscall
	j exit
no:
	li $v0 4
	la $a0 str_no
	syscall
exit:
	li $v0 10
	syscall