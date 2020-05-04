#stampaContrario take an array a0 and its dimension a1 and print the array from the last element to the first.
#Input:
#	a0 = baseAddressof a0
#	a1 = dimension of a1
	.data
left:	.asciiz "["
right:	.asciiz "]"

	.text
	.globl stampaContrario
stampaContrario:
	
	mul $t1, $t0, 4 #idx*4
	add $t2, $a0, $t1
	lw $t1	0($t2)
	addi $t0, $t0, 1 # t0=idx; idx++

	addi $sp, $sp, -8
	sw $ra 0($sp)
	sw $t1 4($sp)

	beq $t0, $a1, recursive_step
	jal stampaContrario

	recursive_step:
	
	lw $ra 0($sp)
	lw $t0 4($sp)
	addi $sp, $sp, 8
	
	li $v0, 4
	la $a0, left
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	
	li $v0, 4
	la $a0, right
	syscall

	jr $ra
	
	

	

