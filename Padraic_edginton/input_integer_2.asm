main:
	li $v0, 5#reads an integer
	syscall
	
	move $t0, $v0

	li $v0, 10
	syscall
