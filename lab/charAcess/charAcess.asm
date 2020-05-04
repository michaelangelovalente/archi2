	 .data

base:	.space 400

	.text
	.globl main
main:

	#la $a0, base
	#li $a1, 400
	

	#li $v0, 8
	#syscall
	sll $t1,$t1, 2
	
	
	