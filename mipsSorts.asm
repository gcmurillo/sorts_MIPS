.data
	number: 
		.word 34
		.word 2
		.word 19
		.word 9
		.word 1
		.word 23
		.word 45
		.word 3
		.word 44
		.word 98
		.word 123
		.word 21
		.word 45
		.word 29
		.word 56
		.word 4
		.word 21
		.word 45
		.word 89
		.word 43
		.word 3
		.word 56
		.word 66
		.word 43
		.word 50
		
	size:	.word 25

	spacebar: .asciiz " "

	line:	.asciiz	"\n"		# a newline string.

	colonsp:	.asciiz ": "	# a colon string with space.

.text

	.globl main

main:
	la $a0, number
	lw $a1, size
	# syscall
	jal insertionsort
	li	$v0, 10		# system call code for exit = 10
	syscall

insertionsort: 	# a1 = count | a0 = number
	addi $t2, $t2, 1 
	addi $sp, $sp, -12
	sw $s0, 8($sp) #s0 = i
	sw $s1, 4($sp) #s1 = j
	sw $s2, 0($sp) #s2 = temp
	addi $s0, $s0, 1
for: 		
	slt $t0, $s0, $a1 # i<count  
	beq $t0, $zero, exit # if i>=0 -> exit
	sll $t1, $s0, 2
	add $t1, $t1, $a0
	lw $s2, 0($t1)
	sub $s1, $s0, $t2 #j = i - 1
loop: 	
	sll, $t3, $s1, 2
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

selectionSort: 	#$a0 is the base of the array number and $a1 is n
	addi $t0, $t0, 1 #$t0 = 1
	addi $sp, $sp, -16
	sw $s0, 12($sp) #s0 = c
	sw $s1, 8($sp) #$s1 = d
	sw $s2, 4($sp) #s2 = position
	sw $s3, 0($sp) #s3 = swap
	add $s0, $s0, $zero #c = 0
	sub $t1, $a1, $t0 #$t1 = n - 1
for1: 	slt $t2, $s0, $t1
	beq $t2, $zero, salida
	sub $s2, $s2, $s2 #$s2 = 0
	add $s2, $s2, $s0 #position = c
	addi $t3, $s0, 1 #$t3 = c + 1
	add $s1, $s1, $t3 #d = $t3 = c + 1
for2: 	slt $t2, $s1, $a1
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
iter2: 	addi $s1, $s1, 1
	j for2
if: beq $s2, $s0, iter1
	sll $t6, $s0, 2
	add $t6, $t6, $a0
	lw $t7, 0($t6) #$t7 = array[c]
	add $s3, $t7, $zero #swap = array[c]
	sw $t5, 0($t7) #array[c] = array[position]
	sw $s3, 0($t5) #array[position] = swap
iter1: 	addi $s0, $s0, 1
	j for1
salida: lw $s3, 0($sp)
	lw $s2, 4($sp)
	lw $s1, 8($sp)
	lw $s0, 12($sp)
	addi $sp, $sp, 16
	jr $ra