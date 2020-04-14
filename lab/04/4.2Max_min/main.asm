	.data
A:	.word 123, 23, 89, 0, 214, 98232
len:	.word 6

maxText:	.asciiz "MAX:"
minText:	.asciiz "min:"
nl: 	.asciiz "\n"

	.text
	.globl main
main:
#--------- max--------------------
	la $a0, A
	la $t1, len

	lw $a1 0($t1)
	
	jal max
	
	move $s0, $v0
	
	li $v0, 4
	la $a0, maxText
	syscall

	move $a0, $s0
	
	li $v0,1
	syscall

	li $v0, 4
	la $a0, nl
	syscall


#-------- min -----------------------
	la $a0, A
	la $t1, len
	
	
	
	lw $a1 0($t1)
	
	
	
	jal min
	
	move $s0, $v0
	
	li $v0, 4
	la $a0, minText
	syscall

	move $a0, $s0
	
	li $v0,1
	syscall

	li $v0, 4
	la $a0, nl
	syscall

	li $v0, 10
	syscall

	
