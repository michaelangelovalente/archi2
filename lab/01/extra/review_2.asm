	.data
nl: .asciiz "\n"
	.text
main:
	li $v0, 1
	li $a0, 173
	syscall

	li $v0, 4
	la $a0, nl
	syscall

	.data
aNum: 1231
	.text
	li $v0, 1
	la $a0, aNum
	syscall
	
	
	
