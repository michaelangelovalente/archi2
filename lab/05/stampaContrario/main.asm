	.data
arr:	.word 1, 2, 3, 4, 5, 7
dimArr:	.word 6

	.text
	.globl main
main:
	la $a0, arr
	la $t0, dimArr
	lw $a1 0($t0)
	
	li $t0, 0

	
	jal stampaContrario
	
	li $v0, 10
	syscall

