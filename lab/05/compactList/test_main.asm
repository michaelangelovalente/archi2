
	.data
ar:	.word 1, 2, 3, 4, 5


	.align 2
array:	.space 20# array[0..4]


	.text
	.globl main
#save reg used s0, s1
main:
	la $a0, ar
	li $a1, 7#dimension of ar
	
	jal 

	move $s0, $v0
	
	li $v0, 10
	syscall
		
		

		
		
	
