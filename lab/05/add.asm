

	.text
	.globl S
S:	
	addi $sp, $sp, -8
	addi $t0, $a1, -1
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	
	
	bne $a1, $zero, STEP_RICORSIVO
	li $v0, 0
	addi $sp, $sp, 8
	jr $ra

	
	STEP_RICORSIVO:
	move $a1, $t0
	jal S

	
	
	lw $t0, 0($sp)
	mul $t1, $t0, 4
	add $t1, $t1, $a0
	lw $t2, 0($t1)
	add $v0, $v0, $t2


	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra
