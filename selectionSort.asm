selectionSort: #$a0 is the base of the array number and $a1 is n
addi $t0, $t0, 1 #$t0 = 1
addi $sp, $sp, -16
sw $s0, 12($sp) #s0 = c
sw $s1, 8($sp) #$s1 = d
sw $s2, 4($sp) #s2 = position
sw $s3, 0($sp) #s3 = swap
add $s0, $s0, $zero #c = 0
sub $t1, $a1, $t0 #$t1 = n - 1
for1: slt $t2, $s0, $t1
beq $t2, $zero, exit
sub $s2, $s2, $s2 #$s2 = 0
add $s2, $s2, $s0 #position = c
addi $t3, $s0, 1 #$t3 = c + 1
add $s1, $s1, $t3 #d = $t3 = c + 1
for2: slt $t2, $s1, $a1
beq $t2, $zero, if
sll $t4, $s2, 2
add $t4, $t4, $a0
lw $t5, 0($t4) #$t5 = array[position]
sll $t6, $s1, 2
add $t6, $t6, $a0
lw $t7, 0($t6) #$t7 = array[d]
slt $t2, $t7, $t5 #array[d] < array[position]
beq $t2, $zero, iter2
add $s2, $zero, $s1
iter2: addi $s1, $s1, 1
j for2
if: beq $s2, $s0, iter1
sll $t6, $s0, 2
add $t6, $t6, $a0
lw $t7, 0($t6) #$t7 = array[c]
add $s3, $t7, $zero #swap = array[c]
sw $t5, 0($t7) #array[c] = array[position]
sw $s3, 0($t5) #array[position] = swap
iter1: addi $s0, $s0, 1
j for1
exit: lw $s3, 0($sp)
lw $s2, 4($sp)
lw $s1, 8($sp)
lw $s0, 12($sp)
addi $sp, $sp, 16
jr $ra