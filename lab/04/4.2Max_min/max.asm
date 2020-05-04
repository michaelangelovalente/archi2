#Max
#input:
#	-->A = &A[0]= a0
#	--> N = len(A) = a1

	.text
	.globl max
max:
	move $t0, $a0# t0 = &A[0]
	move $t1, $a1# t1 = len(A)
	
	
	loop:
	
	lw $t2 0($t0) #t2 = A[i]
	
	slt $t3, $t2, $v0
	beq $t3, $zero,setNewMax # if v0>t2 set newMAx to v0-->t2
	
	continue:

	addi $t0, $t0, 4
	addi $t1, $t1, -1
	beq $t1, $zero, END	

	j loop


	setNewMax:
	move $v0, $t2
	j continue 

	END:
	
	jr $ra





