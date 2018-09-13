.data

	Iqual: .asciiz "========"
	ADD: .asciiz "\nADD: "
	SUB: .asciiz "\nSUB: "
	AND: .asciiz "\nAND: "
	OR: .asciiz "\nOR: "
	XOR: .asciiz "\nXOR: "

.text 


  	li $v0,5
	syscall

	move $t0, $v0
	
	li $v0,5
	syscall

	move $t1, $v0
	
	add $t2, $t0, $t1
	
	sub $t3, $t0, $t1 
	
	and $t4, $t0, $t1 
	
	or $t5 $t0, $t1 
	
	xor $t6, $t0, $t1 
	
	  
	li $v0,4
	la $a0,Iqual
	syscall

	#add
	li $v0,4
	la $a0,ADD
	syscall
	
	li $v0,1
	move $a0,$t2
	syscall
	
	
	#sub
	li $v0,4
	la $a0,SUB
	syscall
	
	li $v0,1
	move $a0,$t3
	syscall
	
	
	#and
	li $v0,4
	la $a0,AND
	syscall
	
	li $v0,1
	move $a0,$t4
	syscall
	
	
	#or
	li $v0,4
	la $a0,OR
	syscall
	
	li $v0,1
	move $a0,$t5
	syscall
	
	
	#xor
	li $v0,4
	la $a0,XOR
	syscall
	
	li $v0,1
	move $a0,$t6
	syscall
