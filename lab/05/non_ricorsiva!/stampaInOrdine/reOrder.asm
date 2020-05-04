#reOrder takes an array an reOrders them from the largest value to the smallest value
#Input:
#	a0=address of array to reorder
#	a1=dimension of array 	

	.text
	.globl reOrder
reOrder:
	#registerbackups
	addi $sp, $sp, -16
	sw $ra 0($sp)
	sw $s0 4($sp)
	sw $s1 8($sp)
	sw $fp 12($sp)
	add $fp, $fp, 12
	

	#move $t0, $a0 #t0 = baseAddress array
	move $t9, $a1 # t9 Dimension(array)

	
	li $t1, 0#t1 ==idx
	li $t2, 1#t2 ==idx+1
	
	li $t8, 0# exterior loop idx
	loop:
		
		mul $t3, $t1, 4 # idx * 4 
		add $t0, $a0, $t3# &arr[i++]
		lw  $t3, 0($t0)#arr[i]
		addi $t1, $t1, 1
		
		mul $t4, $t2,4#(idx+1) * 4
		add $t6, $a0, $t4#&arr[(i+1)++]
		lw $t4, 0($t6)#arr[i+1]
		addi $t2, $t2, 1
		
		#if !(arr[i] < arr[i+1]) -->skip
		slt $t5, $t3, $t4 
		beq $t5, $zero, skip
		
		#swap
		sw $t3 0($t6) #arr[i] = *(&arr[i+1])
		sw $t4 0($t0) #arr[i+1] = *(&arr[i])
		#move $t5, $t3
				
		skip:
		li $t5, 0
		
		bne $t2, $t9, loop
		
		
		
		
		
		li $t1, 0#t1 ==idx
		li $t2, 1#t2 ==idx+1
		addi $t8, $t8, 1
		bne $t8,$t9 loop
		addi $t9, $t9, -1
		
		
		
	
		
			

	#restore registers
	lw $ra 0($sp)
	lw $s0 4($sp)
	lw $s1 8($sp)
	lw $fp 12($sp)
	addi $sp, $sp, 16
	jr $ra
	#if !(arr[i] <= t3)???
			
		
	
	
