	.data

	.text
	.globl main
main:

	#trueCase 2 >= 1
	li $s1, 2
	li $s2, 1


	#if(s1 >=s2) then s3 =1 else s3 = 0
	slt $t0, $s1, $s2
	bne $t0, $zero, skipA

	addi $s3, $s3, 1


skipA:


	#false case -1 >= 1 
	li $s1 -1

	slt $t0, $s1, $s2
	bne $t0, $zero, skipB
	
	addi $t3, $t3, 1


skipB: 
