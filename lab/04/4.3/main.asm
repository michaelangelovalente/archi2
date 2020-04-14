	.data
	
A1Text:	.asciiz"First Address, all integers are equal!"
A2Text: .asciiz"Second Address, none are equal!"
norm:	.asciiz"Nothing happened."
nl:	.asciiz"\n"
	.text
	.globl main
main:
	la $s0, A1	
	la $s1, A2


	#save in sp: fp, &A1[0], &A2[0]
	addi $sp, $sp, -8
#	sw $fp, 8($sp)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	
#	add $fp, $sp, 8

	li $a0, 1 
	li $a1, 2
	li $a2, 2




	jal branch3equal	
	

#everything else (nothing happend)
	la $a0, norm
	li $v0,4
	syscall

	la $a0, nl
	syscall
	j END

A1: # a1=a2=a3

	la $a0, A1Text
	li $v0,4
	syscall

	la $a0, nl
	syscall
	j END
	



A2:# a1 != a2 != a3 


	la $a0, A2Text
	li $v0,4
	syscall

	la $a0, nl
	syscall
	j END


END:
	li $v0, 10
	syscall 
