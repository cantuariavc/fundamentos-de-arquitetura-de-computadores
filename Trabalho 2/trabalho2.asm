# FAC: TRABALHO 01
	.text
main:
	li $v0, 5	# load appropriate system call code into register $v0;
			# code for reading integer is 5
	syscall		# call operating system to perform operation
	move $a0, $v0	# O PRIMEIRO VALOR LIDO DO TECLADO ESTA DISPONIVEL EM $A0
	li $v0, 5	# load appropriate system call code into register $v0;
			# code for reading integer is 5
	syscall		# call operating system to perform operation
	move $a1, $v0	# O SEGUNDO VALOR LIDO DO TECLADO ESTA DISPONIVEL EM $A1
      
# =================== IMPLEMENTE AQUI SUA SOLUCAO: INICIO

	
blt $a0,0,printInvalido
blt $a1,0,printInvalido

move $s0, $a0 # primeiro valor
move $s1, $a1 # segundo valor
li $t0, 1 # resto
	

move $s4, $a0 # primeiro valor
move $s5, $a1 # segundo valor
li $t2, 1 # resto

DO_MMC:

	beq $t0,$zero, end
		div $t0, $s0, $s1
		mfhi $t0
		move $s0, $s1 #a = b
		move $s1, $t0 # b = resto 
		j DO_MMC	
end:
	
	mul $s3, $a0,$a1
	div $s3, $s3,$s0 
	
# =================== IMPLEMENTE AQUI SUA SOLUCAO: FIM      

      jal  print            # call print routine. 
      li   $v0, 10          # system call for exit
      syscall               # we are out of here.
		
#########  routine to print messages
      .data
space:		.asciiz  " "          # space
new_line:	.asciiz  "\n"         # newline
string_MDC:	.asciiz  "MDC: "
string_MMC:	.asciiz  "\nMMC: "
invalido:	.asciiz  "Numero Invalido"
      .text
print:	la   $a0, string_MDC  
      	li   $v0, 4		# specify Print String service
      	syscall               	# print heading
      	
      	move  $a0, $s0      	# 
	li   $v0, 1           	# specify Print Integer service
      	syscall               	# print $t0
	
	la   $a0, string_MMC   	# load address of print heading
      	li   $v0, 4           	# specify Print String service
      	syscall               	# print heading
      	
      	move $a0, $s3      	# 
	li   $v0, 1           	# specify Print Integer service
      	syscall               	# print $t1
    
      	jr   $ra              	# return  	
printInvalido:
	la   $a0, invalido   	# load address of print heading
      	li   $v0, 4           	# specify Print String service
      	syscall               	# print heading
      	
      	li $v0, 10
      	syscall
	
	
