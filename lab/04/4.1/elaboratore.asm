#elaboratore.asm esegue somma = 43, differenza = 45, moltiplicazione = 42 e divisione = 47

	.data
val1: .asciiz "Enter first value:" 
val2: .asciiz "Enter second value:"
operaz: .asciiz "select +, -, * or / "

result: .asciiz "result:"
remainder: .asciiz "remainder:"


invalidOp: .asciiz "invalid operator."
invalidN: .asciiz "invalid number."
nl:	.asciiz "\n"
	
	.align 2
opV:	.space 8




	.text
	.globl main
main:
	# s1 , s2, s3=operation

	#ask user for integer 1
	li $v0, 51 # a0 =userIn, a1 = status -1 input cannot be parsed correctly, -2 cancel was chosen, -3 OK was chosen but no data had been input
	la $a0, val1 
	syscall
	add $s1, $zero, $a0 # s1 = val1



	#ask user for integer 2
	li $v0, 51 # a0 =userIn, a1 = status -1 input cannot be parsed correctly, -2 cancel was chosen, -3 OK was chosen but no data had been input
	la $a0, val2 
	syscall
	add $s2, $zero, $a0 # s2 = val2
	
	bne $a1, $zero, errorN

	


	#ask user for operation
	# $a1 = &opV[0] = [operation Symbol]
	#
	# a1 == 0: OK;
	# a1 == -2: Cancel was chosen
	#a1 == -3:OK was chosen but no data had been input into field. No change to buffer
	#a1 == -4: length of input string exceeded the specified maxium.

	li $v0, 54
	la $a0, operaz
	la $a1, opV
	li $a2, 2 # [opSym][\0]
	syscall	
	
	bne $a1, $zero, errorOp
	
	

	la $t0, opV
	lw $s3, 0($t0)# s3 = operation
	



	add $a0, $zero, $s1
	add $a1, $zero, $s2
	add $a3, $zero, $s3
	
	jal ELABORATOR
	
	add $t0, $zero, $v1
	addi $t1, $zero, -99
	beq $t1, $t0, errorOp
	
	add $s0, $v0, $zero
	add $s1, $v1, $zero
	
	
	#success! print result
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	add $a0, $s0, $zero
	syscall
	
	
	li $v0, 4
	la $a0, nl
	syscall
	
	
	
	#if division print remainder
	li $t0, 47
	bne $t0, $s3, ExitP # if s3 != 47(division) skips remainder
	
	
	
	li $v0, 4
	la $a0, remainder
	syscall
	
	li $v0, 1
	add $a0, $zero, $v1
	syscall
	


#skipRem:	
	

	
	

	
ExitP:	
	li $v0, 10
	syscall


#invalid number input
errorN:
	li $v0, 4
	la $a0,invalidN
	syscall
	
	j ExitP	
	
errorOp:
	li $v0, 4
	la $a0,invalidOp
	syscall
	
	j ExitP	
	
	




	#check if input is valid
	#not valid ->error exit
	#repeat 2 times
	


# a0 = operand1; a1 = operand2; v0 = result; v1= remainder(v1 = -1), v1 = -99 if operation symbol is invalid
ELABORATOR:
	
	li $v1,  -1


	#if a3 == 42 --> v0 = a0 * a2
	li $t0, 42
	beq $a3, $t0, multiplication

	#if a3 == 43 ---> v0 = a0 + a1
	li $t0, 43
	beq $a3, $t0, addition


	
	#else if a3 a3 == 45 -->  a0 - a1
	li $t0, 45
	beq $a3, $t0, subtraction


	#if a3 == 42 --> v0 = a0/ a2
	li $t0, 47
	beq $a3, $t0, division


	li $v1, -99
	j END
	
multiplication:	
	mult $a0, $a1
	mflo $v0
	j END


addition:
	add $v0, $a0, $a1
	j END


subtraction:
	sub $v0, $a0, $a1
	j END


division:
	div $a0, $a1
	mflo $v0
	mfhi $v1
	j END




END:
	jr $ra
