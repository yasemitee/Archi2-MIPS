.data
msg1: .asciiz "Inserire un intero: "
msg2: .asciiz "L'intero successivo è: " 
.align 2 
.text
.globl main
main:
li $v0 4
la $a0 msg1
syscall

li $v0 5
syscall

add $s1 $v0 1

li $v0 4
la $a0 msg2
syscall

li $v0 1
move $a0 $s1
syscall

li $v0 10
syscall
