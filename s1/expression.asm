.text
.globl main
main:
li $s1 1
li $s2 2
li $s3 3
li $s4 4

add $t1 $s3 $s4
add $t2 $s1 $s2
sub $s5 $t2 $t1

