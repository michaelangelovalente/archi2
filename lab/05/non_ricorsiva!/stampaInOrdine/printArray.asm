#printarray takes an array and prints it
# a0 = Base address of the array
# a1 = dimension of array a0
	.data
space:	.asciiz " "
	.text
	.globl printArray
printArray:
	
	addi $sp, $sp, -16
	sw $ra 0($sp)
	sw $s0 4($sp)
	sw $s1 8($sp)
	sw $fp 12($sp)
	add $fp, $fp, 12
	
	move $s0, $a0
	move $s1, $a1
	
	jal reOrder
	
	
	
	move $t0, $s0
	li $t1, 0 # t1 = idx
	li $t2, 0
	
	#print array

	loop:
		mul $t2, $t1, 4# idx*4
		add $t2, $t2, $s0# t2 = &arr[i++]
		lw  $a0, 0($t2)# t3 = arr[i] -->integer to be printed
		addi $t1, $t1, 1
		
		li $v0, 1
		syscall
		
		li $v0, 4
		la $a0, space
		syscall
		
		bne $t1, $s1 loop
		
	
	lw $ra 0($sp)
	lw $s0 4($sp)
	lw $s1 8($sp)
	lw $fp 12($sp)
	addi $sp, $sp, 16
	jr $ra
		
		
		
	