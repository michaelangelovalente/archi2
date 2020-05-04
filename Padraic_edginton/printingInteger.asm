main:
	li $v0, 1#im loading 1 into v0 this prints integers
	li $a0, 17
	syscall
	
	li $a0, 71
	
	
	li $a0, 45
	syscall 
	
	
	.data
one:	.asciiz "This is a string"

	.text
	li $v0, 4
	la $a0, one
	syscall	
	
	