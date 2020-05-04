#trovaMax takes an array a0 and returns the index of the the biggest element in the array
#Input:
#	a0 = base address of array
#	a1 = dimension of array

	.text
	.globl trovaMax
trovaMax:
	addi $sp, $sp, -16
	sw $ra 0($sp)
	sw $s0 4($sp)
	sw $s1 8($sp)
	sw $fp 12($sp)
	addi $fp, $fp, 12
	
	
	
	move $t0, $a0
	move $t1, $a1
	
	lw $t9 0($t0)
	li $t8, 0 #idx 

	loop:
		li $t5, 0
		mul $t3, $t8, 4#idx*4
		add $t3, $t0, $t3# &arr[(idx*4) ++]
		lw $t4 0($t3)# t4 = arr[i]

		
		#if t9 < t4 --> t9 =t4
		slt $t5, $t9, $t4
		beq $t5, $zero, skip
		move $t9, $t4 # arr[i]> t9 --> t9 = i
		move $t6, $t8
		skip:
		addi $t8, $t8, 1 # i++
		bne $t8, $t1, loop
		
	
	
	move $v0, $t9
	
	lw $ra 0($sp)
	lw $s0 4($sp)
	lw $s1 8($sp)
	lw $fp 12($sp)
	addi $sp, $sp, 16
	
	
	jr $ra
