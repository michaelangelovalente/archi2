	.data
	
br:	.asciiz "break"
nl: 	.asciiz "\n"
	
	.text
	.globl main
main:
	#sum = s0
	# N = s1
	# V = s2
	#ask user for input
	li $v0, 5
	syscall
	move $s1, $v0
	
	li $v0, 5
	syscall
	move $s2, $v0
	
	
	add $s0, $s0, $s2# sum = sum + v
	
	# i = 0; i< n ;i++
loop:
	addi $t0, $t0, 1# i++
	beq $t0, $s1, END# i == N --> END Loop
	
	mult $t0, $t0# i*i
	mflo $t1# t1 = i*i
	
	
	#check (t1 = (i*i)) % V && 
	div $t1, $s2 
	mfhi $t2 
	beq $t2, $zero, END2 # (i*i) % v == 0 --> END Loop
	
	add $s0, $s0, $t1# sum = sum + (i*i)
	
	j loop
	
END2:
	#print break
	li $v0, 4
	la $a0, br	
	syscall
	la $a0, nl
	syscall
END:	

	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 10
	syscall