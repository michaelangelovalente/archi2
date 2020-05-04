#somma takes two integer inputs a0=a and a1=b and returns an integer v0 = a0+a1
#INPUT:
#	a0 = a
#	a1 = b
# 	v0 = 
	.text
	.globl somma	
somma:
	addi $sp, $sp, -4
	sw $ra, 0($sp)


	add $v0, $a0, $a1


	lw $ra 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
