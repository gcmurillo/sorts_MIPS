insertionsort: 
addi $t2, $t2, 1 
addi $sp, $sp, -12
sw $s0, 8($sp) #$s0 = i
sw $s1, 4($sp) #s1 = j
sw $s2, 0($sp) #s2 = temp
addi $s1, $s1, 1
for: slt $t0, $s1, $a1
beq $t0, $zero, exit
sll $t1, $s0, 2
add $t1, $t1, $a0
lw $s2, 0($t1)
sub $s1, $s0, $t2 #j = i - 1
loop: sll, $t3, $s1, 2
add $t3, $t3, $a0
lw $t4, 0($t3) #$t4 = number[j]
slt $t5, $s2, $t4 
slt $t6, $s1, $zero
bne $t5, $t1, com
bne $t6, $zero, com
add $t7, $s1, $zero #$t7 = j
addi $t7, $t7, 1 # $t7 = j + 1
sll $t8, $t7, 2
add $t8, $t8, $a0
lw $t9, 0($t8) #$t9 = number[j+1]
sll $t0, $s1, 2
add $t0, $t0, $a0
lw $t1, 0($t0) #$t1 = number[j]
sw $t1, 0($t9) #number[j+1] = number[j]
sub $s1, $s1, $t2 #j = j - 1
j loop
add $t7, $s1, $zero #$t7 = j
addi $t7, $t7, 1 # $t7 = j + 1
sll $t8, $t7, 2
add $t8, $t8, $a0
lw $t9, 0($t8) #$t9 = number[j+1]
sw $s2, 0($t9) #number[j+1] = temp
com: addi $s0, $s0, 1
j for
exit: lw $s2, 0($sp)
lw $s1, 4($sp)
lw $s0, 8($sp)
addi $sp, $sp, 12
jr $ra