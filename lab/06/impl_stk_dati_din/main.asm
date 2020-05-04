	.data
	
	.text
	.globl main
main:
	li $a0, 111
	li $a1, 222
	li $a2, 8888


	jal stack_push
	
	
	li $a0, 333
	li $a1, 444
	li $a2, 9999


	jal stack_push
	
	li $v0, 10
	syscall

	
