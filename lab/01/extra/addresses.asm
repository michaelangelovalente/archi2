	.data
A: 	.space 52 # spazio array  di dimensione 12
h:	.space 4 # spazio array di dimensione 1

	.text
	.globl main


main:
	la $s1, h
	la $s2, A
	lw $t0, 0($s1)
	lw $t1, 32($s2)
	add $t0, $t1, $t0
	sw $t0, 48($s2)
	jr $ra
	
	
	
