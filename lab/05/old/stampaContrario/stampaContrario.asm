	.data

nl:	.asciiz " "	
	.align 2
arr1: 	.word 10, 20, 30, 40
dimen:	.word 4



	.text
	.globl main
main:	
	la $a0, arr1

	la $t0, dimen
	lw $a1, 0($t0)
	
	jal opp_print

	li $v0, 10
	syscall	



	


#a0 = &arr1[0]
#a1 = dimension(arr1)
opp_print:

	
	addi $sp, $sp, -8
	
	sw $ra 0($sp)
	sw $s0 4($sp)
	
	addi $s0, $s0, 1

	bne $s0, $a1, recursion
	jr $ra
recursion: 
	jal opp_print

	lw $ra, 0($sp)
	lw $t0, 4($sp)
	addi $sp, $sp, 8
	 	
	
	mul $t1, $t0, 4
	add $t2, $a0, $t1# t2 = &Arr[dimen - i]
	
	move $t3, $a0 # temporary save for &arr1[0]


	lw $a0, 0($t2)
	
	#print out value
	li $v0, 1
	syscall
	
	la $a0, nl
	li $v0, 4
	syscall
	

	move $a0, $t3
	jr $ra
	
	

	
