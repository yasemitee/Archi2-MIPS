.data
msg1:	.asciiz "Inserire un numero: "
.align 2
.text
.globl main
main:
 #Stampo la richiesta del numero
 la $v0 4
 la $a0 msg1
 syscall 
 #Leggo un intero e lo sommo a 1
 la $v0 5
 syscall
 addi $s0 $v0 1
 #Ricavo il modulo due dell'intero
 li $t0 2
 div $s0 $t0
 mfhi $s1 #resto

 bne $s1 $zero else
  #Stampo l'intero successivo
  la $v0 1
  move $a0 $s0
  syscall 
  j exit
 else:
  #Sommo + 1 al successivo e stampo
  addi $s0 $s0 1
  la $v0 1
  move $a0 $s0
  syscall 
 exit:
  la $v0 10
  syscall


