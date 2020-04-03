	.data

	.text
	.global main
main:
	addi $s1, $zero, 100
	addi $s2, $zero, 45


#MULTIPLICATION ------ 100 * 45  ------------------------------------------
	#multiplcation using [Hi,Lo]
	mult $s1, $s2
	 # stores result in lo
	mflo $s0


	#reset value reg s0
	move $s0, $zero
	

	#normal multiplication ( s0 = s1*s2)
	mul $s0, $s1, $s2


#DIVISION ------------- 100 / 45 -----------------------------------------

	#divide value in reg s1 with s2
	div $s1, $s2
	
	#moves value from reg hi(stores remainder)  to s3. moves value from reg lo(stores quotient)  to s4
	mfhi $s3
	mflo $s4

	#normal division example $s5 = $s1/ $s2
	div $s5, $s1, $s2




#End program
	li $v0, 10
	syscall


	
