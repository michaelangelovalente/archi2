	.data
	
arr:	.word 1, 2, -5, 3, 7 #result should be 8
dimen:	.word 5 

	.text
	.globl main
main:
	
	la $a0, arr
	la $t1, dimen

	lw $a1, 0($t1)
	
	jal sommaArr

	move $a0, $v0
	

	li $v0, 1
	syscall

	li $v0,10
	syscall




