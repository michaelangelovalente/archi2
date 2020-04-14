#helps retrieve ascii code 
	.data

text:	.asciiz "Enter a string"
	.align 2
A: 	.space 8
	.text
	.globl main
main:
	#enter character out a string.
		
	
	
	li $v0, 54
	la $a0, text
	la $a1, A
	li $a2, 2
	syscall
	
	la $t0, A
	lw $s0, 0($a1)
