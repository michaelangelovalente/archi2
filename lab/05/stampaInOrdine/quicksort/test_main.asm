	.data
array:	.word 12, 25, 13, 24, 5, 9, 10, 23, 9, -99


	.text
	.globl main
main:
	la $a0, array
	li $a1, 0 # low = 0
	li $a2, 9# high = 7 (last index of array

	#jal reOrder
	#jal printArray
	jal quicksort
	
	li $v0, 10
	syscall
		
		
	
