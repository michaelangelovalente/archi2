#alloca memoria array A di dimensione 4
# A[0]=0,
# A[1]=1,
# A[2]=2,
# A[3]=3,


	.data
A: 	.space 16

	.text
	.globl main
main:

##my solution
#	la $s1, A

#	li $t0, 0
#	li $t1, 4
#	li $t2, 9
#	li $t3, 12
#
#	sw $t0 0($s1)
#	sw $t1 4($s1)
#	sw $t2 8($s1)
#	sw $t3 12($s1)
#



###lab version


	la $t0, A
	
	addi $t1, $zero, 0 # t1 = 0
	sw $t1, 0($t0)# A[0] = t1 = 0
	
	addi $t1, $zero, 4 # t1 = 4
	sw $t1, 4($t0) # A[1] = t1 = 4
	
	addi $t1, $zero, 8 # t1 = 8
	sw $t1, 8($t0)# A[2] = t1 = 8
	
	addi $t1, $zero, 12 # t1 = 12
	sw $t1, 12($t0)# A[3] = t1 = 12	
	
	jr $ra
	
	









	
