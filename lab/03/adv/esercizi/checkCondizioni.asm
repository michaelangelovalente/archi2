# a  = <intero inserito dall' utente> 
# b = <intero inserito dall' utente>
# c = <intero inserito dall' utente>

	.data
Text: 	.asciiz "inserisci un valore per "
a:	.asciiz "a: "
b: 	.asciiz "b: "
c:	.asciiz "c: "
nl:	.asciiz "\n"
err:	.asciiz "errore"

	.text
	.globl main
main:
	
	#ask user for input a=s1, b=s2, c=s3

	#a=s1
	li $v0, 4
	la, $a0, Text
	syscall
	la, $a0, a
	syscall
	


	li $v0, 5
	syscall
	move $s1, $v0


	#b=s2
	li $v0, 4
	la, $a0, Text
	syscall
	la, $a0, b
	syscall


	li $v0, 5
	syscall
	move $s2, $v0


	#b=s3
	li $v0, 4
	la, $a0, Text
	syscall
	la, $a0, c
	syscall


	li $v0, 5
	syscall
	move $s3, $v0


#Check conditions 

	# s1 < s2 == !(s1 >= s2) --> if !(s1 >= s2) then ELSE
	slt $t0, $s1, $s2 
	bne $t0, $zero, ELSE
	
	#c = s3
	beq  $s3, $zero, ELSE # c == 0 == !(c!=0); if !(c!=0) then ELSE	

	#calculations
	add $s1, $s1, $s2 # s1 = a + b
	mult $s3, $s1# c * (a+b)
	mflo $s0 # z = s0 = c * (a+b)
	
	
	#end calculations
	#print results
	
	li $v0, 1
	move $a0, $s0
	syscall

	j END


ELSE:	
	
	li $v0, 4
	la $a0, err
	syscall
	
	


END:
	
	li $v0, 10
	syscall










	
	
	

