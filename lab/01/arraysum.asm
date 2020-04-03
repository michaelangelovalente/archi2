#il codice effettua A[12] = h + A[8]
#supponiamo che h sia memorizzata all' indirizzo contenturo in $s1
#base address di A e' nel registro $s2
	.data
	
	
	.align 2 # align next data item
A:	.space 52 # A {[i=0][][][][][][][][][][][i=11]}
h:	.space 4 # var h declared


	.text
	.globl main
main:
	la $s2, A
	la, $s1, h

	lw $t0 32($s2)# A[8]
	lw $t1 0($s1)#h
	
	add $t3, $t0, $t1 # h + A[8]
	sw $t3, 48($s2)# A[12] = $t3
	



	
