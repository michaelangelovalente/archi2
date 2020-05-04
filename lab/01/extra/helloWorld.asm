.data
	tagMess: .asciiz "Hello World\n"
.text
	li $v0, 4
	la $a0, tagMess
	syscall

