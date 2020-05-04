	#asks for input;
	#reads input
	
	
	.data
	prompt: .asciiz "Enter an integer: "	
	respond:.asciiz  "You entered "	
	nl: .asciiz "\n"

	.text
	.global main
main:

	#prints a string
	li $v0, 4 
	la $a0, prompt 
	syscall


	#read an integer
	li $v0, 5
	syscall
	#stores integer read from v0 into t0
	move $t0, $v0


	#prints a string
	li $v0, 4
	la $a0, respond
	syscall

	#moves integer read from t0 to a0 
	#prints integer in a0
	li $v0, 1
	move $a0, $t0
	syscall

	
	#prints a string
	li $v0, 4
	la $a0, nl
	syscall


	#ends the program
	li $v0, 10
	syscall

	


