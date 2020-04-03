	.data

	.text
	.globl main
main:
	#if (s1 <= s2) --> True else False

	#false case
	# if true s3 = -1
	#s1 = 2 <= s2 = 1
	li $s1, 2
	li $s2, 1
	
	slt $t0, $s2, $s1
	bne $t0, $zero, skip
	addi $s3, $s3, -1
skip:
	
	
	#true case
	#if true s4 = 1
	#s1 = 2 <= s2 = 2
	li $s2, 2
	
	slt $t1, $s2, $s1
	bne $t1, $zero, skip2
	addi $s4, $s4, 1
skip2:

	#truecase
	#if true s5 = 2
	#s1 = 2 <= s2 = 3
	li $s2, 3

	slt $t2, $s2, $s1
	bne $t2, $zero, skip3
	addi $s5, $s5, 2
skip3:


#end of the program you should have s3 = 0; s4 = 1; s5 = 2
	
	
