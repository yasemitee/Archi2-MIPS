.text
.globl main
main:
li $t1 100
li $t2 45
# pseudoistruzioni
mul $s1 $t1 $t2
div $s2 $t1 $t2
# pseudocomandi
mult $t1 $t2
mflo $s3
div $t1 $t2
mflo $s4

