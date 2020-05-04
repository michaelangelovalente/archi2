	#Max
#input:
#	-->A = &A[0]= a0
#	--> N = len(A) = a1

	.text
	.globl min
min:

	move $t0, $a0 #a0 = &A[0]
	move $t1, $a1 #a1 = len(a)
		
	li $t3, 0

	loop:	

	mul $t4, $t3, 4
	add $t5, $t0, $t4 # &A[0] + 4
	
	lw $t7, 0($t5)# t7= A[i]
	slt $t8, $t7, $v0
	bne $t8, $zero, setMin


	continue:
	addi $t3, $t3, 1
	slt $t6, $t3, $t1
	beq $t6, $zero, END
	
	
	setMin:
	move $v0, $t7
	j continue	


	END:
	jr $ra

