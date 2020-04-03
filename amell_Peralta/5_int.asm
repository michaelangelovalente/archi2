.data
	age: .word 25
.text
	
	li $v0, 1
	lw $a0, age
	syscall

