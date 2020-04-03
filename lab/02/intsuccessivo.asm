	.data

input:	.asciiz "Enter an integer number: "
nl:	.asciiz "\n"
output: .asciiz "The next number is:"

	.text
	.globl main

main:
	li $v0, 4
	la $a0, input
	syscall

	li $v0, 5
	syscall	
	move $t0, $v0
	
	addi $a0, $t0, 1
	move $t0, $a0
	
	li $v0, 4
	la $a0, nl
	syscall
	
	
	
	la $a0, output
	syscall
	
	move $a0, $t0
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	

