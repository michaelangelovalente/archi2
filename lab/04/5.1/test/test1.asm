	.data
	.text
	.globl main
main:
	li $a0, 10
	li $a1, 20

	jal SOMMA




SOMMA: 
	add $v0, $a0,$a1
	
	jr $ra