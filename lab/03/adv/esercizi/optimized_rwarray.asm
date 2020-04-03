#--> inizializzi il segmento dati con un array di 13 interi scelti a piacere;
#--> chieda all' utente di inserire tre interi a, b, c;	
#-->
#--> (scambio) 
#--> se c=0, scambi l' a-esimo elemento dell' array con il valore dell' b-esimo
#-->
#--> (sovrascrittura b con value a)
#--> se c=1, sovrascriva il b-esimo elemento dell' array con il valor del a- esimo
#-->
#-->(sovrascrittura a con value b
#-->se c = -1, sovrascriva l' a-esimo elemento dell' array con il valore del b-esimo elemento;
#-->
#-->(se c != 0,1,-1 )
#-->se c ha un altro valore stampi la stringa << comando non rconosciuto>> e non effettui modifiche all' array.




	.data

A:	.space 52 #A[0]....A[12]

a:	.asciiz "a:"
b:	.asciiz "b:"
c:	.asciiz "c:"

text:	.asciiz "Enter value for "
err:	.asciiz "unrecognized command.\n"



	.text
	.globl main
main:

#LOOP --> A[0] = 0, A[1]=1, A[2]=2, A[3]=3, A[4]=4,..., A[12]
	li $t2, 13
	la $t0, A# t0 = &A[0]
	li $t4, 4# will be used to advance in arrays

loopA:
	sw $t1, 0($t0)# A[i] = i
	add $t1, $t1, 1 # i++
	
	add $t0, $t0,$t4 # &A[i++]

	beq $t1, $t2, EndA
	j loopA
EndA:


#------------------------------------


	#s0=a, s1=b, s2=c ###### CAN BE OPTIMIZED??? YOU COULD DIRECTLY MULTIPLY THE VALUES BY 4 -- maybe divide them just for if else statements

	#prompt user for int
	#a
	li $v0, 4
	la $a0, text
	syscall 

	la $a0, a
	syscall

	li $v0, 5
	syscall

	move $s0, $v0 #s0 = a


	#prompt user for int
	#a
	li $v0, 4
	la $a0, text
	syscall 

	la $a0, b
	
	syscall

	li $v0, 5
	syscall

	move $s1, $v0 #s1 = b



	#prompt user for int
	#a
	li $v0, 4
	la $a0, text
	syscall 

	la $a0, c
	syscall

	li $v0, 5
	syscall
	
	# a*4
	mult $s0, $t4
	mflo $s0 #a = [a]
	
	# b*4
	mult $s1, $t4
	mflo $s1 #b = [b]

	move $s2, $v0 #s2 = c
	beq $s2, $zero, cEq0 #c == 0
	
	li $t0, 1
	beq $s2, $t0, cEq1 # c == 1 		
	
	li $t0, -1
	beq $s2, $t0, cEqN1 # c == -1 		
	
	li $v0, 4
	la $a0 err
	syscall
	
	j END
	
	
	

#------------------------------------------------------------------------------------
# if c == 0 swap: A[a]-->A[b] and A[b] --> A[a]
cEq0:
	


	la $t0, A #t0 = &A[0]########### CAN BE OPTIMIZED????

	add $t0, $s0, $t0# &A[0] + (a*4) --> t0 = &A[a]
	lw $t1, 0($t0)# t1 = A[a]
		
	 

	#sp[n-1] = A[a] -->  push value in A[a] to sp-1
	addi $sp, $sp, -4
	sw $t1, 0($sp)# sp[n-1] = A[a]
	
	
	la $t1, A # t1 = &A[0] ############ CAN BE OPTIMIZED?

	add $t1, $s1, $t1 #t1 = &A[0] + (b*4) ---> t1 = &A[b]
	lw $t2, 0($t1)#t2 = A[b]
	
	
	#swap: A[a] = A[b] == t2 
	sw $t2, 0($t0)
	

	#consume/pop value A[a]
	#A[b] = sp[n-1]
	lw $t2 0($sp) # t2= A[a]
	addi $sp, $sp, 4
	

	#swap: A[b] = A[a] == t2
	sw $t2 0($t1)

	j END

	
	


#------------------------------------------------------------------------------------
# if c == 1 replace: A[b] = A[a]
cEq1:
	
	la $t0, A# t0 = &A[0]
	add $t1, $t0, $s0# t1 = &A[a]	
	lw $t2, 0($t1)# t2 = A[a]


	#find b's position and replace the value inside it with A[a]
	add $t0, $t0, $s1# t0 = &A[b]
	sw $t2, 0($t0)# A[b] = A[a]
	

	
	
j END
	
#------------------------------------------------------------------------------------
# if c == 1 replace: A[b] = A[a]
cEqN1:
	
	la $t0, A# t0 = &A[0]	
	add $t1, $t0, $s1# t1 = &A[b]
	lw $t2, 0($t1)# t2 = A[b]


	#find a's position and replace the value in it with A[a]
	add $t0, $t0, $s0# t0 = &A[b]	
	sw $t2, 0($t0)# A[a] = A[b]

	
	

	


END:
	li $v0, 10
	syscall


	
