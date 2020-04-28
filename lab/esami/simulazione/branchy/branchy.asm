	.data
aGreaterb:	.asciiz "T1: a>b"
aLesserb:	.asciiz "T2: a<b"
	
	.text
	.globl main
main:

	la $a0, jump_T1
	la $a1, jump_T2
	
	#this should give "T2:a<b"
	li $a2, 5
	li $a3, 6
	
	jal branchy

	jr $v0

end:
	li $v0, 10
	syscall

jump_T1:
	la $a0, aGreaterb
	li $v0, 4
	syscall
	j end

jump_T2:
	la $a0, aLesserb
	li $v0, 4
	syscall
	j end




#--------------------------------------
#branchy confronts the values a2 and a3 and based on the values it modifies v0 to a0, a1, or $ra;
#	if a2>a3 then v0 = a0
#	if a2<a3 then v0 = a1
#  	else  v0 = ra - 8 
#
#INPUT:
# a0 = baseAddress_T1 = &T1
# a1 = baseAddress_T2 = &T2
# a2 = integerValue_a
# a3 = integerValue_b

branchy:

	#if a2!=a3 then v0 = ra - 8
	bne $a2, $a3, not_equal
	addi $v0, $ra, -8
	j end_branchy
	not_equal:


	#if a2<a3 --> v0 = a1
	slt $t0, $a2, $a3
	

	#if t0 == 0 then  !(a2<a3) then v0 =a0
	beq $t0, $zero, a2Grta3
	#else t0 ==1 --a2<a3 then v0 = a1
	move $v0, $a1
	j end_branchy


	a2Grta3:
	move $v0, $a0

	end_branchy:
	
	jr $ra
	
