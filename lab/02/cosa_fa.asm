	.data
v:	.byte 2,0,0,0,4,0,0,0
array:	.byte 2,0,0,0,3,0,0,0,5,0,0,0,7,0,0,0,11,0,0,0,13,0,0,0,17,0,0,0,19,0,0,0



	.text
	.globl main
main:
	la $s1, array
	la $s2, v


	lw $t0, 0($s2)
	lw $t0, 4($s2)
	

