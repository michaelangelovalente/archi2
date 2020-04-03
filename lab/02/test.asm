	#.data
	.text
	.globl main
main:	
	#addi $s1, $zero, 0x10000000
	#addi $s2, $zero, 0x10000004
	
	la $s1,  0x10000000
	la $s2,  0x10000004
	lw $t0, 0($s1)
	lw $t1, 32($s2)
	add $t0, $t1, $t0
	sw $t0, 48($s2)
