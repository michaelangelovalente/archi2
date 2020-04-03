	.data
	
	.text
	.globl main
main:
	#false case s3 =-1
	# 2=s1 < 1 =s2
	
	li $s1, 2
	li $s2, 1

	slt $t0, $s1, $s2
	beq $t0, $zero, skip
	addi $s3, $s3, -1

skip:

	#true case t3 = 1
	#2 = s1 < 3 = s2
	li $s2,3

	slt $t1, $s1, $s2
	beq $t1, $zero, skip2
	addi $s3, $s3, 1
	
skip2:
	
