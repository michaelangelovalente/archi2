#dato un int inserito dall' utente, restituire il numero pari successivo
	.data
text:	.asciiz "Enter an integer value: "
nl:	.asciiz "\n"
text2:	.asciiz "Output: "

	.text
	.globl main
main:
	#request user for int
	li $v0, 4
	la $a0, text
	syscall
	
	li $v0, 5
	syscall

	#t0 = i = userinput
	move $t0, $v0
	
	#enter loop
loop: 	#for i = t0 ; ; i++


	#check if even
	li $t2, 2 
	div $t0, $t2
	mfhi $t1
	beq $t1, $zero, endLoop	# if i % 2 == 0 endLoop
	
	
	addi $t0, $t0, 1
	j loop
endLoop: 
	#t0  = nextNumber
	
	
	
	li $v0, 4
	la $a0, text2
	syscall

	move $a0, $t0
	
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, nl
	syscall

	li $v0, 10
	syscall
	
	
