	.data
string: .asciiz "Ciao"
	.align 2
A:	.space 4 # A {[] [] [] []}
	
	.text
	.globl main
main:
	la $t0, A
	li $t1, 5
	sw $t1, 0($t0)
	sw $t1, 4($t0)
	sw $t1, 8($t0)
	sw $t1, 12($t0)
	

	la $v0, 10
	syscall
	
