#subseteq takes two arrays A1 and A2 as input and returns 1 if every element of  A1 is present in A2; otherwise 0

#Input1: base address of array A1
#Input1.b: len(A1)
#Input2: base address of array A2
#Input2.b: len(A2)

	.text
	.globl subseteq
subseteq:
	

	#store $ra, $fp  values and s registers used
	add $sp, $sp, -24
	sw $s0, 0($sp)# sp[0] = s0
	sw $s1, 4($sp)# sp[1] = s1
	sw $s2, 8($sp)# sp[2] = s2
	sw $s3, 12($sp)# sp[3] = s3
	sw $ra, 16($sp)# sp[4] = ra
	sw $fp, 20($sp)# sp[5] = fp
	add $fp, $sp, 20
	
		



	add $s0, $a0, $zero # s0 = &A1[0]
	add $s1, $a1, $zero # s1 = length(A1)

	add $s2, $a2, $zero# s2 = &A2[0]
	add $s3, $a3, $zero# s3 = length(A2)


	#uses A1 as argument a0 for belongs
	#iterates through A2 and uses it a2 for belongs
	

	#loop through A2
	loop:	
		
		lw $t2, 0($s2) # A2[i]integer value for belongs
		move $a2 $t2 

		jal belongs 

		addi $s2, $s2, 4 # &A[0] + 4
		addi $s3, $s3, -1 # i++
		beq $s3, $zero, END	
		
		#ends loop if A2[i] == t2 is not inside array A1
		#if v == 0 -- > END
		beq $v0, $zero, END

		j loop

END:
	


	#restore $ra, $fp  values and s registers used
	lw $fp 20($sp) 
	lw $ra 16($sp) 
	lw $s3 12($sp) 
	lw $s2 8($sp) 
	lw $s1 4($sp) 
	lw $s0 0($sp) 
	addi $sp, $sp, 24

	jr $ra

	


