
	.data

	.text
	.globl main
main:

#t1 = 1, t2 = 2, t3 = 3

	li $s1, 1 
	li $s2, 2 
	li $s3, 3

# s1 == s2 --> s3 = 3 
	beq $s1, $s2, SKIP
	addi $s3, $s3, 1

SKIP:

	li $t1, 1 
	li $t2, 1
	li $t3, 3

#t1 == t2 --> t3 = t3 + 1 = 4
	beq $t1, $t2, SKIP2
	addi $t3, $t3, 1

SKIP2:

	


	



