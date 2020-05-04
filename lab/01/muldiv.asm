	.data

mu:	.asciiz "45 * 100 is "
nl: 	.asciiz "\n"
space: 	.asciiz " "

div: 	.asciiz "45 / 100 is "
rem: 	.asciiz "with a remainder of "


	.text
	.globl main
main:

	addi $s1, $zero, 100
	addi $s2, $zero, 45

#moltiplication 100*45 = 4500
	mult $s1, $s2
	mflo $s0 #product


	#prints  string
	li $v0, 4
	la $a0,  mu
	syscall

	#prints integer 
	li $v0, 1
	add $a0, $zero, $s0
	syscall
	
	#prints  string
	li $v0, 4
	la $a0,  nl
	syscall

#division 100/45 = 2 with 10 remainder

	div $s1, $s2
	mfhi $s3 #remainder
	mflo $s4 #quotient

		
	#prints  string
	li $v0, 4
	la $a0,  div
	syscall
	
	
	#prints integer 
	li $v0, 1
	add $a0, $zero, $s4
	syscall



		
	#prints  string
	li $v0, 4
	la $a0,  space
	syscall


	#prints  string
	li $v0, 4
	la $a0,  rem
	syscall


	#prints integer 
	li $v0, 1
	add $a0, $zero, $s3
	syscall

	#prints  string
	li $v0, 4
	la $a0,  nl
	syscall
	
	
#terminate program
	li, $v0, 10
	syscall
