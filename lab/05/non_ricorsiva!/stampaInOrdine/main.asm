	.data

prDim:	.asciiz "Enter array dimension:"
prEl:	.asciiz "Enter "
prEl2:	.asciiz " values for your array:\n"
space:	.asciiz " "

	.align 2
array:	.space 400# array[0..99]


	.text
	#.globl main
#save reg used s0, s1
main:	

	la $s0, array#s0 == &array[0]
	
	#prompt user for array dimension 4 5
	li $v0, 4 # prints string
	la $a0, prDim
	syscall
	
	li $v0, 5 
	syscall	
	move $s1, $v0 # s1 = arraydimension

	

	# "Enter "
	li $v0, 4
	la $a0, prEl
	syscall

	#<arrayDimension>
	li $v0, 1
	move $a0, $s1
	syscall
	
	#" values for your array:"
	li $v0, 4
	la $a0, prEl2
	syscall

	
	
	# i == t0
	filler_loop:

		li $v0, 5
		syscall
		
		
		mul $t1, $t0, 4# i*4
		add $t1, $s0, $t1# t1 = &array[0] + 4 --> &array[i]
		sw $v0 ($t1)


		
		addi $t0, $t0, 1
		bne $t0, $s1, filler_loop





	li $v0, 10
	syscall
		
		

		
		
	
