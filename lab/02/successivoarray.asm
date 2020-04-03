# chiede all utente un int (messaggio su terminale)
# acquisisca un intero da terminale;
#
# calcoli l' intero successivo
# memorizzi l' intero ed il successivo in un array di dimensione 2 in memoria
# mostri all' utente i due numeri (messaggio su terminale)

	 .data 
A:	 .space 8
intMess: .asciiz "Enter an integer value: "
nl: 	 .asciiz "\n"
out1:	 .asciiz "A[0]="
out2:	 .asciiz "A[1]="

	 .text
	 .globl main
main:
	
	#ask user for integer
	#prints message for user 
	li $v0, 4
	la $a0, intMess
	syscall

	#read user integer input 
	li $v0, 5
	syscall
	move $t0, $v0# t0 = userInput = v0

	

	
	

	#user Output message n.1
	li $v0, 4
	#la $a0, nl
	#syscall
	
	la $a0, out1
	syscall


	
	#A[0]=t0 ; A[1] = t0
	la $t1, A # t1 = &A; t1 contains base address of  A
	sw $t0, 0($t1) # A[0] = t1[0] = userInput
	
	li $v0, 1
	move $a0 $t0#moves userinput to a0 
	syscall


	addi $t0, $t0, 1 # t0 = t0 + 1
	sw $t0, 4($t1) # A[1] = t1[0] + 1 = UserInput + 1
	
	
	#user output message n.2
	li $v0, 4
	la $a0, nl
	syscall

	la $a0, out2
	syscall

 
	li $v0, 1
	move $a0 $t0#moves userinput + 1  to a0 
	syscall
	
	
	
	li $v0, 10
	syscall












	
	
