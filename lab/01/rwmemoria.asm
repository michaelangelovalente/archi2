# A[99] = 5 + B[i] + C

# -- I vettori A e B contengono 100 elementi, ogni elemento e' un intero a 32bit
#-- variabili C e i sono interi a 32bit

# inizializzazione dei valori dati in memoria
# i=3, C=2, B[i]=10


	.data

A:	.space 400 # A[0..99]
B:	.space 400 # B[0..99] 

C:	.word 2 #.byte 0 0 0 2# C = 2
i:	.word 3 #.byte 0 0 0 3#  i = 3



	.text
	.globl main
main:

#Initializing register values -----------------------
	la $s0, A # s0 = &A base
	la $s1, B # s1 = &B base

	la $s2, C # s2 = &c
	la $s3, i # s3 = &i



#B[i] = 10 --> B[3] = 10 --------------------------

	li $t0, 4 # 4 will be used to calculate offset
	lw $t1, 0($s3)# t1 = value in $s3 = i /// t1 = 
	mult $t0, $t1# t0 = t1*t2 --> generates off set for B,lo  will be used to know where position B[3] is
	mflo $t0
	add $s1, $s1, $t0 #calculate position B[3] --> Base address of B + offset(i * 4), s1 now contains base address of B[3]
	
	li $t0, 10 # t0 = 10 --> value to be stored in B[3]
	sw $t0, 0($s1)#	B[3] = 10

	li $t1, 5
	lw $t3, 0($s1)#t3 = B[3] = 10
	add $t0, $t3, $t1 # t0 = 5 + 10
	
	lw $t2, 0($s2) 	#t2 = C = 2 --> store value of C in t2
	add $t0, $t0, $t2 # t0 = (t0 = 5 + B[3]) + C


#A[99] = 5 + B[i] + C
	sw $t0, 396($s0)# A[99] = t0
	
	


	









