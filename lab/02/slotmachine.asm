#il programma deve
#	-->chiedere all' utente attraverso una finestra di dialogo l'inserimento di un numero intero NUM
#	-->Estrarre un numero casuale R nel range [-num, num], (il seed del generatore di numeri casuali puo' essere inizializzato con un qualsiasi numero intero)
#	-->Sommi R al numero inserito NUM : RESULT = NUM + R
#	-->Mostri all' utente attraverso una nuova finestra di dialogo il nuovo credito dell' utente dopo la scomessa (RESULT)

	.data

askU:	.asciiz "Enter a integer value please."
#nl:	.ascii "\n"
outM:	.asciiz "Your new Credit is:"


	.text
	.globl main
main:
	#prompt user for integer input
	li $v0, 51
	la $a0, askU #a0 = int_userIn
	syscall

	move $t0, $a0 #t0 = int_userIn
	move $t3, $a0 #t3 = int_userIn .. value will be used later
	
	#use t0*2 + 1 as upper bound for random number
	addi $t1, $zero, 2

	mult $t0, $t1
	mflo $t0 
	addi $t0, $t0, 1 # t0 = (int_userIn * 2) + 1

	#generates value from 0 to t0 and stores it in a0
	li $v0, 42
	#li $a0, 0 # sets seed to 0 # try replacing this later with SystemTime
	move $a1, $t0 
	syscall
	move $t0, $a0

	sub $t0, $t0, $t3 # t0 = random number range: [-int_UserIn, int_UserIn] = R
	add $t0, $t0, $t3 # t0 = NUM + R

	#generates a dialogue box with NUM + R 
	li $v0, 56
	la $a0, outM
	move $a1, $t0
	syscall	

	#terminate program	
	li $v0, 10
	syscall


	

	



	
