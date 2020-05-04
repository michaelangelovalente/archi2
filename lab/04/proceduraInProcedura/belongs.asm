#belongs takes an array A and an integer x; 
#if x  is contained inside the array A it returns 1 otherwise 0

#Input1: a0 = base adress of Array
#Input2: a1 = number of elements inside the array
#Input2: a2 = integer value = x
	

	.text
	.globl belongs
belongs:
		
		

	add $t0, $a0, $zero # t0 = &A[0]
	add $t1, $a1, $zero # t1 = #elements_Inside_array
	add $t2, $a2, $zero # t2 = integer_to_evaluate = x

	li $v0, 0

	#compare x with every item inside
	loop:
		lw $t3, 0($t0)#t3 = A[0]
		
		#if t3 == t2 -->foundX v0 = 1
		beq $t2, $t3, found
		
		addi $t0, $t0, 4 # &A[0] + 4
		add $t1, $t1, -1
		bne $t1, $zero, loop
		j END
	
	found: 
		li $v0, 1
	END:
		jr $ra
