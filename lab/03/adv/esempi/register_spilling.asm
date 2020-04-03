#utilizza solo i registri $t0 $t1
#calcola il prodotto due due varibili 3 e 4 i che si trovano negli indirizzi identificati dalle label x e y 

	.data
x:	3
y: 	4

	.text
	.globl main
main:
	
	la $t0, x
	lw $t1, 0($t0)

	#store in stack value of x = $t1 /w push
	addi $sp, $sp, -4
	sw $t1, 0($sp) # x = 3 
	
	la $t0, y# t0 = &y
	lw $t1, 0($t0)# t1 = y = 4 

	#consume from stack stored value of x and move it in t0 /w pop
	lw $t0 0($sp)# store value of sp = x = 3 inside t0; t0 = x = 3
	addi $sp, $sp, 4#pop stack
	
	mult $t0, $t1
	mflo $t0

	li $v0, 10
	syscall
	
	

	
