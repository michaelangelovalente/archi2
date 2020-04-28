	.data
V:	.word 1,2,3,4,5,6,7,
	
	.text
	.globl main
main:
	li $t1, 1# i = 3
	li $t2, 2#j = 5
	li $t3, 7#k = 7
 



	la $a0, V
	move $a1, $t1	
	move $a2, $t2
	move $a3, $t3


	jal merge2
	
	li $v0, 10
	syscall
#
#Input:
#	a0 = &array[0]
#	a1 = i
#	a2 = j
# 	a3 = dimension = k




#merge2:	
#
#	
#	move $t1, $a1# t1 = i
#	move $t2, $a2# t2 = j
#	move $t3, $a3
#	
#	

#	
#	move $t4, $t3# t4 = idx = k
#	li $t7, 0
#
#	loop:
#
#		addi $t4, $t4, -1
#		mul $t5, $t4, 4 #t5 = idx*4
#		add $t0, $a0, $t5
#		
#
#		
#		
		#if idx == i --> t8 = arr[i]
#		bne $t1, $t4, skip_i
#		#t8 = arr[i]
#		#add $t0, $a0, $t5
#		lw $t8 0($t0)
#		add $t7, $t7, 1
#		j loop
#		skip_i:
#
#		#if idx == i --> t9 = arr[j]
#		bne $t2, $t4, skip_j
#		#t9 = arr[j]
#		#add $t0, $a0, $t5

			#if $t1 == $t2 	
			#$t8 == $t1
			#$t1 = -999
			#$t2 = -999
#			bne $t1,$t2, the_same
#			lw $t8 0($t0)
#			li $t1, -99
#			li $t2, -999
#			j loop
#			the_same:
#		
#		
#		
#		lw $t9 0($t0)
#		add $t7, $t7, 1
#		j loop
#		skip_j:
#		
#		#store in sp -4 * i arr[idx]
#		add $sp, $sp, -4
#		lw $t6 0($t0) #t6=arr[idx]
#		sw $t6 0($sp)
		
#
#		bne $t4, $zero, loop
#

#	
#	move $t0, $a0
#	sw $t8 0($t0)
#	sw $t9 4($t0)
	#add $t0, $t0, 8
#	
#	#li $t4, 2#idx
##	li $t5, 0#sp idx
#	#li $t4, 0
#	spread:
#		mul $t8, $t7,  4
#		add $t8, $a0, $t8
#		
#		#mul $t9, $t4, 4
#		add $sp, $sp, 4
#		
#
#		
#		lw $t9 0($sp)
#		sw $t9 0($t8)
#
#		
#		
#		#add $t4, $t4, 1
#		add $t7, $t7, 1
#		bne $t7, $t3, spread
		
#		#i++
#	
#	
