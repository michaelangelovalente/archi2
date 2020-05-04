	.data
#stack :   .word 0   # Puntatore all'ultimo elemento inserito nello stack
#stack_n : .word 0   # Numero di elementi attualmente nello stack

request:  .asciiz "Welcome to stack simulator!\nChoose between:\n(1)?stackpush: creates a data structure that contains  three integer values  x,y, and theta.\n(2)?stackpop: deletes the head of the the stack.\n(3)stackprint: prints all data inside the stack from the element 0 to the head.\n(0)?terminates the simulator.\n"
stckPush: .asciiz "Enter a value for "
x:	.asciiz "x: "
y:	.asciiz "y: "
theta:	.asciiz "theta: "
ended:	.asciiz "simulator terminated."	
	.text
	
	li $v0, 4
	la $a0, request
	syscall
	
	simulator:
	li $v0,5
	syscall
	
	#if v0 == 0? terminate
	beq $v0, 0, terminate
	
	#if v0 == 1? stackpush
	beq $v0, 1, stackpush
	
	#if v0 == 2? stackpop
	beq $v0, 2, stackpop
	
	#if v0 == 3? stackprint
	beq $v0, 3, stackprint
	
	j simulator
	

stackpush:
	#x value		
	li $v0,4
	la $a0, stckPush
	syscall
	la $a0, x
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0 #s0=x

	#y value		
	li $v0,4
	la $a0, stckPush
	syscall
	la $a0, y
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0 #s1=y	
	
	
	#theta value		
	li $v0,4
	la $a0, stckPush
	syscall
	la $a0, theta
	syscall
	
	li $v0, 5
	syscall
	move $s2, $v0 #s2=theta
	
	
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	
	jal stack_push
	
	j simulator
	
	
stackpop:
	jal stack_pop
	j simulator
	
stackprint:
	jal stack_print
	j simulator



terminate:
	li $v0, 4
	la $a0, ended
	syscall
	li $v0, 10
	syscall
	
	
