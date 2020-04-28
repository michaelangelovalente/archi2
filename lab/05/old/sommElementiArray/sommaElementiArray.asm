
	.text
	.globl sommaArr
sommaArr:

	addi $t0, $a1, -1

	addi $sp, $sp, -8
	
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	

	bne $a1, $zero, STEP_RICORSIVO
	
	j next_step





STEP_RICORSIVO:
	move $a1, $t0
	jal sommaArr

next_step:
	#......
#	value = value + x[dim-1]
	add $sp, $sp, 8

	lw $t0, 0($sp) # dimension-1
	lw $ra, 4($sp)
	
	mul $t2, $t0, 4
	
	add $t1, $a0, $t2 # t1 = &arr[0]+ (t0*4)
	lw $t0 0($t1)# t0 = arr[i] /w i = 0.....dim-1

	add $v0, $v0, $t0
	
	jr $ra
	

	
