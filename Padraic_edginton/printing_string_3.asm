	.data
nl:	.asciiz "\n"
	.text
main:
	li $v0, 1
	li $a0, 173
	syscall

	li $v0, 4
	la $a0, nl
	syscall


	li $v0, 1
	li $a0, 71
	syscall

	li $v0, 4
	la $a0, nl
	syscall
