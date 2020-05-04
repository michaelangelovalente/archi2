#Il programma:
#	- chiede all' utente di inserire un array di interi di dimensione arbitraria
#	- invoca una procedura P
#	- stampi il valore ritornato da P

#La procedura P:
#	- Input: l' array inserito dall' utente e un parametro k
#	- se k = 0 la procedura calcola la somma di tutti gli interi in posizione (indice nell' array) dispari
#	- se k = 1 sommera' quelli in posizioni pari.

#Suggerimento: allocare l' array staticamente in memoria e passare alla procedura il base address(passaggio per indirizzo)

	.data
A:	.space 200 #A[0..49]



dimK:	.asciiz "choose a value for k:"
array:	.asciiz "enter a desired array size:"

nl: 	.asciiz "\nl"


inV:	.asciiz "enter a number:"
sum:	.asciiz "Sum:"

	.text
	.globl main
main:


	


	#ask user for desired array dimension
	li $v0, 4
	la $a0, array
	syscall

	li $v0, 5
	syscall	
	add $s3, $v0, $zero # s3 = arraydimension
	
	#if s3 <= 0 --> terminate entire program
	blez $s3, terminate

	#ask user for value k
	li $v0, 4
	la $a0, dimK
	syscall

	li $v0, 5
	syscall	
	add $s2, $v0, $zero # s2 = k parameter --> k=0 adds all the # inside array A; k = 1 adds all the even numbers in array A that are in an even position
	#if s2 != 0 or s2 != 1 --> terminate
	beq $s2, $zero, valid_K
	addi $s2, $s2, -1
	beq $s2, $zero, valid_K
	j terminate

valid_K:

	la $a0, A
	add $a1, $zero, $s3
	add $a2, $zero, $s2


	jal P
	
	
	add $s0, $v0, $zero
	
	
terminate:	
	#print P's result
	li $v0, 4
	la $a0, sum
	syscall
	
	li $v0,1
	add $a0, $s0, $zero
	syscall

	li $v0, 10
	syscall






#----------------------------------------------------------------------------
#Procedure p takes 
# $a0 = base address of A
# $a1 = arrayDimension 
# $a2 = k parameter

#if k == 0 --> P adds all integers inside array A
#if k == 1 --> P adds all integers that are in an even position inside array A

# result will be blaced in $v0
P:
	

	add $t0, $zero, $a0 # t0 = &A[0]
	add $t1, $zero, $a1 # t1 = arrayDimension
	add $t2, $zero, $a2 # t2 = k parameter

	
	addi $sp, $sp, -4
	sw $t0 0($sp) # sp[-4] = &A[0]	
	
	addi $sp, $sp, -4
	sw $t1 0($sp) # sp[-8] = arrayDimension	
	

	
#loops for arrayDimension times until i == arrayDimension-1
loop:
	#prompt user for int
	li $v0, 4
	la $a0, inV
	syscall

	li $v0, 5
	syscall


	#t3 = t3 + v0 #add user input
	add $t3, $t3, $v0

	sw $v0, 0($t0) # A[i] = 0
	addi $t0, $t0, 4# A[i+1] = v0 = userInput
	
	addi $t1, $t1, -1
	bne $t1, $zero, loop
#------- End first loop---- k == 0



	
##---------------Second loop k == 1 (will be skipped if k == 0)

	beq $t2, $zero, END
	
	lw $t1, 0($sp)# t1 = arrayDimension 
	addi $sp, $sp, 4
	
	
	lw $t0, 0($sp)# t0 = &A[0]
	addi $sp, $sp, 4		
	
	
	
#removes from t3 all values in odd position
	li $t4, 2
	
addEvenLoop:
	

	# if n%2 == 0 skip subtraction
	div $t6, $t4
	mfhi $t5
	beq $t5, $zero, skipSub #result division == 0 skip
	
	lw $t5, 0($t0)
	sub $t3, $t3, $t5
	
	
	
	
	skipSub:
	
	addi $t0, $t0, 4# A[i+1] = v0 = userInput
	
	addi $t1, $t1, -1
	addi $t6, $t6, 1 # counts as index 0...4
	bne $t1, $zero, addEvenLoop

END:
	add $v0, $zero, $t3	
	
jr $ra
	
	
#Forse sto usando troppi registri???

	

	
	
