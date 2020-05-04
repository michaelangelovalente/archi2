
	.text
	.globl FACTORIAL
FACTORIAL:
	addi $sp, $sp, -8
	
	move $t0, $a0	

	sw $t0, 0($sp)
	sw $ra, 4($sp)
	
	addi $a0, $a0, -1

	bne $a0, $zero, STEP_RICORSIVO
	li $v0, 1 #a0 = 0 --> v0 = 1
	j final
	
STEP_RICORSIVO:	
	jal FACTORIAL
	

	final:
	


	lw $t1, 0($sp)
	lw $ra, 4($sp)

	mul $v0, $v0, $t1
	
	add $sp, $sp, 8

	jr $ra
	


