	.data
arr:	.word 3, -7, 7, 4  #final result should be  7

	.text
	.globl main
main:

	la $a0, arr
	li $a1, 4 #arr  dim

	jal S

	
	move $a0, $v0
	li $v0, 1
	syscall
		

	li $v0, 10
	syscall
			
	
