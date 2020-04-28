	.data
	
	.text
	.globl main	
main:
	li $a0, 1
	li $a1, 1
	
	jal prodotto_s
	move $s0, $v0


	li $v0, 10
	syscall
