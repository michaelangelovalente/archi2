	.data

	.text
	.globl main
main:
	#CASE s3 = 3
	li $s1, 1
	li $s2, 2
	li $s3, 3	



	#s1 > s2 (falso) --> s3 = 3
	# 1 > 2 
	slt $t0, $s2, $s1 # s2 < s1 --> t0 = 1
			  # 2 < 1  --> t0 = 0
	
	beq $t0, $zero, SKIP
	addi $s3, $s3, 1
	
SKIP:


	#CASE s3 = 4
	li $s1, 2
	li $s2, 1
	li $s3, 3


	slt $t0, $s2, $s1 # s2 < s1 --> t0 = 1
			  # 1 <	2 --> t0 = 1
	beq $t0, $zero, SKIP2
	addi $s3, $s3, 1
	
SKIP2:	
	
