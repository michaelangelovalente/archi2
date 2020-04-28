#reOrder take an array a0 an reOrders its elements in descending order.
#Input:
# 	a0 --> base address of the array
#	a1 -->dimension of the array
	.text
	.globl reOrder
reOrder:
	
	li $t0, 0 # idx
	li $t9, 9999

	biggest_t9:
	li $t8, 0
	mul $t1, $t0, 4
	addi $t1, $a0, $t1
	lw $t2 0($t1)# a0[idx]
	addi $t0, $t0, 1
	

	
	

