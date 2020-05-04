#input sp[0] (sp -4) = &A1[0]
#input sp[1] (sp -8)= &A2[0]
#
#input a1 =integer1
#input a2 =integer1
#input a3 =integer1
#
#
	.text
	.globl branch3equal
branch3equal:
	
	move $t0, $a0#t0 = int1
	move $t1, $a1#t0 = int2
	move $t2, $a2#t0 = int3


#pop address values
	lw $t3 0($sp)#t3 = &A1[0]
	lw $t4 4($sp)#t4 = &A2[0]
	addi $sp, $sp, 8

	

##if a1 == a2 == a3 jump to A1
	
	bne $t0, $t1, allDiff
	bne $t1, $t2, allDiff
	#all are equal
	jr $t3




#if none are equal jump to A2	
#check for a1 != a2; a2 != a3; a1 != a3
allDiff:

	#jump to noneOfTheAbove
	beq $t0, $t1, noneOfTheAbove
	beq $t0, $t2, noneOfTheAbove
	beq $t2, $t1, noneOfTheAbove

	jr $t4



noneOfTheAbove:
#otherwise 
#continue normally
	jr $ra

