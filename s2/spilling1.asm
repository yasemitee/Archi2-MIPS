.data

.text
.globl main
main:
li $t0 1
mul $t0 $t0 3
mflo $t0
addi $sp $sp -4
sw $t0 0($sp)

li $t0 2
mul $t0 $t0 3
mflo $t0
addi $sp $sp -4
sw $t0 0($sp)

li $t0 3
mul $t0 $t0 3
mflo $t0
addi $sp $sp -4
sw $t0 0($sp)

lw $t0 0($sp)
addi $sp $sp, 4
add $s1 $s1 $t0

lw $t0 0($sp)
addi $sp $sp, 4
add $s1 $s1 $t0

lw $t0 0($sp)
addi $sp $sp, 4
add $s1 $s1 $t0


