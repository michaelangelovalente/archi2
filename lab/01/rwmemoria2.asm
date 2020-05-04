#Il codice effettua:
# A[c-1] = c*( B[A[c]] + c) / A[2*c-1]

#Inizializzazione registri indirizzi:
#	i vettori A e B contengono 4 elementi, ogni elemento e' un intero a 32bit; A[][][][] and B[][][][]
#	c e un intero a 32 bit; c int
#
#c=2
#A[0]=-1
#A[1]=-1
#A[2]= 1
#A[3]= 4
#B[0]=-1
#B[1]= 6
#B[2]=-1
#B[3]=-1






	.data
A:	.word -1 -1 1 4
B:	.word -1 6 -1 -1
c:	.word 2	


	.text
	.globl main
main:
	

#Initializing registers
	la $s1, A
	la $s2, B
	la $s3, c



	li $t4, 4# will be used to calculate offsets from now on

#A[c]
	#create offset 4 * c
	#add offset to base address of A, obitain A[c]
	lw $t0, 0($s3)
	mult $t0, $t4
	mflo $t0 #t0 = 4*c

	add $s1, $s1, $t0# s1 = &A[2]

	
	
#B[A[c]] --> B[1]	
	lw $t0, 0($s1) # t0 = A[2] = 1
	mult $t4, $t0	
	mflo $t0
	
	add $s2, $s2, $t0# s2 = &B[1]

	lw $t0, 0($s2)# t0 = B[1] = 6
	addi $t0, $t0, 2


	lw $t1, 0($s3)# t1 = c
	mult $t0, $t1

	
	# t0 = c*(b[a[c]] + c)
	mflo $t0


#A[2*c-1]
	addi $t1, $t1, -1 # c - 1
	add $t3, $zero, $t1# t3 = c -1
	addi $t2, $zero, 2
	mult $t1, $t2
	mflo $t1 # 2 * c-1

	mult $t1, $t4 #offset
	mflo $t1

	la $s1, A#reload base address of A
	add $s1, $t1, $s1 #1 = &A[2]
	
	lw $t1, 0($s1)# t1 = A[2]


#A[c-1]
	la $s1, A

	mult $t3, $t4
	mflo $t3 # t3 = c-1 * 4 = offset
	add $s1, $s1, $t3 # s1 = &A[1]
	
	
#t0/t1
	div $t0, $t1
	mflo $t0 # t0 = c*(B[A[c]]+c) / A[2*c-1]
	
	sw $t0, 0($s1)# A[1] = t0 = c*(B[A[c]]+c) / A[2*c-1]

	
	
	
	
	

	





	


