
	.text
	.globl main
main:
	#A = B+C - (D+E)
	# A = 1,2,3,4

	addi $s1, $zero, 1
	addi $s2, $zero, 2
	addi $s3, $zero, 3
	addi $s4, $zero, 4

	add $t0, $s1,$s2
	add $t1, $s3, $s4
	
	sub $s0, $t0, $t1


	li $v0, 10
	syscall
