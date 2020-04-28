
	.data
ar:	.word 1, 2, 13, 24, 5, 9, 10


	.align 2
array:	.space 400# array[0..99]


	.text
	.globl main
#save reg used s0, s1
main:
	la $a0, ar
	li $a1, 7#dimension of ar

	#jal reOrder
	#jal printArray
	jal somma_ricorsiva
	move $s0, $v0
	
	li $v0, 10
	syscall
		
		

		
		
	
