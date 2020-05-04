	.data

A1:	.byte 1,0,0,0, 2,0,0,0, 3,0,0,0, 4,0,0,0
A2:	.byte 7,0,0,0, 5,0,0,0, 2,0,0,0, 12,0,0,0
A3:	.byte 1,0,0,0, 2,0,0,0, 3,0,0,0, 4,0,0,0

	.text
	.globl main
main:
	#store in sp[-4] $ra
	add $sp, $sp, -4
	sw $ra, 0($sp) 

	
	la $a0, A1 # Base address 1
	li $a1, 4 # length of Base address 1
	
	#la $a2, A2 # Base address 2
	#li $a3, 4 #length of Base address 2

	la $a2, A3 
	li $a3, 4

	
	#li $a2, 3
       #jal belongs
	jal subseteq	


	#restore ra and sp
	lw $ra, 0($sp)
	add $sp, $sp, 4



	#move result to ss0
	move $s0 $v0
	
	
	li $v0, 10
	syscall


