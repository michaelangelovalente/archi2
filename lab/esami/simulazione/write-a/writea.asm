	.data
a:	.word 10
s:	.asciiz "Fine"
	.align 2
V:	.word 1, 1, 1, 1, 1



	.text
	.globl main
main:
	la  $a0, s
	la  $a1, V
	la  $t5, a
	lw $a2, 0($t5)# t2 = a
	

	jal write_a

	li $v0, 10
	syscall
	
	
	

#write_a takes a value 'a', loads  in array V of dimension 5  the values a+i, where i is the position of the array that goes from 0 to 4, and   prints a string 's' when V is loaded.
#INPUT:
#	a1 = &V[0]
#	a0 = stringAddress &s
#	a2 = integer_value_'a'
write_a:
	
	#lw $t2, 0($a2)# t2 = a
	move $t2, $a2
	li $t9, 5# dimension
	li $t8, 0#t8 = index
	
	loop:
		
		mul $t0, $t8, 4# t0 = idx*4
		add $t0, $t0, $a1# V[i++]
		
		add $t3, $t8,$t2# t3 = index + a
		sw $t3, 0($t0)
		
		add $t8, $t8, 1# i++

		bne $t8, $t9, loop
		
		
	li $v0, 4
	syscall


