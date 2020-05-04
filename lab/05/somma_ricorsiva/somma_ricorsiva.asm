#somma_ricorsiva takes an array and adds all the elements of the array.
#Input:
#	a0: base address of the array
#	a1: size of array a0

	.data

	.text
	.globl somma_ricorsiva
somma_ricorsiva:
	addi $sp, $sp, -16
	sw $ra 0($sp)	
	sw $s0 4($sp)	
	sw $s1 8($sp)	
	sw $fp 12($sp)	
	addi $fp, $fp, 12


#	move $t0, $a0
	move $t1, $a1
	li $t9, 0
	
	S:
	mul $t0, $t9, 4
	add $t0, $a0, $t0
	lw $t3 0($t0)
	addi $t9, $t9, 1
	
	addi $sp, $sp, -8
	sw $ra 0($sp)
	sw $t3 4($sp)

	beq $t1, $t9, end_recursion
	jal S

	end_recursion:
	lw $ra 0($sp)
	lw $t3 4($sp)
	addi $sp, $sp, 8

	add $v0, $v0, $t3
	jr $ra
	
	
	
	
	


	
	
