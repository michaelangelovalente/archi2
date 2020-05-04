
	.text
	.globl quicksort
		
		

	


#swap function
swap:		

addi $sp, $sp, -12	#Makes stack room for 3 elements

sw $a0, 0($sp)	
sw $a1, 4($sp)
sw $a2, 8($sp)
	
sll $t1, $a1, 2		#t1 = 4a
add $t1, $a0, $t1	#t1 = arr + 4a
lw $s3,	0($t1)		#s3 t = array[a]

sll $t2, $a2, 2		#t2 = 4b
add $t2, $a0, $t2	#$t2 = arr + 4b
lw $s4,	0($t2)		#s4 = arr[b]

sw $s4,	0($t1)		#arr[a] = arr[b]
sw $s3,	0($t2)		#arr[b] = t

addi $sp, $sp, 12	#Restoring the stack size
jr $ra			#jum back to caller


#parttion function
partition:	

addi $sp, $sp, -16	#makes room for 4 elements

sw $a0, 0($sp)
sw $a1, 4($sp)
sw $a2, 8($sp)
sw $ra, 12($sp)

move $s1, $a1	#s1 = low
move $s2, $a2	#s2 = high

sll $t1, $s2, 2		#t1 = 4*high
add $t1, $a0, $t1	#t1 =arr + 4*high
lw $t2, 0($t1)		#t2 = arr[high] /pivot

addi $t3, $s1, -1	#t3, i = low -1
move $t4, $s1		#t4, j=low
addi $t5, $s2, -1	#t5 = high - 1


forloop:
	slt $t6, $t5, $t4	#t6=1 if j>high -1, t7 = 0 if j<highi -1
	bne $t6, $zero, endfor	#if $t6=1 then branch to endfor
		
	sll $t1, $t4, 2		#t1 = j*4
	add $t1, $t1, $a0	#t1 = arr +4j
	lw $t7, 0($t1)		#t7 = arr[j]

	slt $t8, $t2, $t7	#t8 = 1 if pivot < arr[j], 0 if arr[j] <=pivot
	bne $t8, $zero, endfif	#if t8=1 then branch to endfif
	addi $t3, $t3, 1	#i=i+1


	move $a1, $t3		#a1 = i
	move $a2, $t4		#a2 = j
	jal swap		#swap(arr, i, j)

	addi $t4, $t4, 1	#j++
	j forloop


	endfif:
	addi $t4, $t4, 1	#j++
	j forloop		#jump back to forloop


endfor:
	addi $a1, $t3, 1	#a1 = i+1
	move $a2, $s2		#a2 = high
	add $v0, $zero, $a1	#v0 = i+1 return(i+1)
	jal swap		#swap(arr, i+1, high)

	lw $ra, 12($sp)	
	addi $sp, $sp, 16
	jr $ra		#jump back to caller


#function quickSort
quicksort:

addi $sp, $sp, -16 	#make room for 4 elements in stack
sw $a0, 0($sp)		#a0
sw $a1, 4($sp)		#low
sw $a2, 8($sp)		#high
sw $ra, 12($sp)		#returnAddr



move $t0, $a2	#t0 = high

slt $t1, $a1, $t0	#t1 = 1 if low < highm else 0
beq $t1, $zero, endif 	#if low >= high, endif

jal partition		#call partition
move $s0, $v0		#pivot, s0 = v0

lw $a1, 4($sp)		#a1 = low
addi $a2, $s0, -1	#a2 = high
jal quicksort		#call quicksort

addi $a1, $s0, 1	#a1 =pi + 1
lw $a2, 8($sp)		#a2 = high
jal quicksort

endif:

lw $a0, 0($sp)
lw $a1, 4($sp)
lw $a2, 8($sp)
lw $ra, 12($sp)
addi $sp, $sp, 16
jr $ra

	
