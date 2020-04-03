#utilizza solo registri $s0 e $t0
#
#calcola la somma dei primi tre numeri interi postivi(1,2 e 3), ciasscuno moltiplicato per 3;
#non si utilizzi la pseudo-istruzione mul

	.data


	.text
	.globl main
main:
	

	#load 1 in $t0
	#load 3 in $t1
	#mult $t0 $t1
	#load result in $t0
	#load result in sp + 1
 
	li $t0, 1 
	li $t1, 3
	mult $t0, $t1 
	mflo $t0 # t0 = 1*3 = 3

	#push sp +1 store value 1*3
	addi $sp, $sp, -4
	sw $t0 0($sp)#sp+1 = (1*3) = 3




	#load 2 in $t0
	#mult $t0 $t1
	#load result in $t0
	#load resul in sp + 2

	li $t0, 2
	mult $t0, $t1
	mflo $t0 ## t0 = 2*3 = 6
	
	#push sp + 2 store value t0 = 2*3
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	

	#load 3 in $t0
	#mult $t0 $t1
	#load result in $t0
	li $t0, 3
	mult $t0, $t1
	mflo $t0 # t0 = 3*3 = 9



	#move sp + 2 in t1
	#to + t1
	# move sp + 1 in t1
	#t0 + t1

	#consume value sp+2 /w pop
	lw $t1, 0($sp) # t1 = sp +2 = 2*3 = 6
	addi $sp, $sp, 4

	add $t0, $t0, $t1 # t0 = 9 + 6
	
	#consume value sp+1 /w pop
	lw $t1, 0($sp)
	addi $sp, $sp, 4

	add $t0, $t0, $t1 # t0 = 18
	

	li $v0, 10
	syscall
