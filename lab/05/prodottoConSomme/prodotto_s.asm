#prodotto_s takes two integer input a0 and a1 and returns v0= a0*a1 without using the product operator
	.text
	.globl prodotto_s
prodotto_s:
	addi $sp, $sp, -8
	

	#move $t0, $a0
	move $t1, $a1
	
	sw $ra 0($sp)
	sw $t1 4($sp)
	
	addi $a0, $a0, -1
	beq $a0, $zero, recursion
	

	jal prodotto_s

recursion:	
	move $a0, $v0
	lw $a1 4($sp)
	jal somma
	lw $ra 0($sp)
	addi $sp, $sp, 8
#ends_recursion -->	
	jr $ra		
	






