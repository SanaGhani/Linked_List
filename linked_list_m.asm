##############################################   COMPUTER ARCHITECTURE PROJECT    ####################################################
##############################################   *****LINKED LIST*****            ####################################################
##############################################   PROJECT BY:                      ####################################################
##############################################   IBSHAR ISHRAT CS-004             ####################################################
##############################################   SANA GHANI    CS-011             ####################################################
##############################################   SADIA SAMI    CS-036             ####################################################

## Completion Date:  --/--/2015
## Linked_List.asm 
## Description of Project:
## 		This project implements the creation of linked list through MIPS Assembly language.We can add a node
##      at the end of the list, delete the node from the beginning and print the elemnts of the list through
##      traversing.		

## main --

## Register usage:
##		$s0 - integer value(sentinel value 0 for head node)
##		$s1 - integer data for creation of a node
##		$s2 - pointer variable
##      $t0 - store the int data for node creation
##		$t1 - store the address where the node is created

.data
<<<<<<< HEAD
    prompt:  .asciiz"Do you want to enter more data?\t\n"
	prompt1: .asciiz"Enter the data you want to add in the list:\t\n "
    prompt2: .asciiz"Press 1 for exit\n"
=======
    	greet: .asciiz "\t\t Implementing Linked List in MIPS Assembly Language\n\n"
	prompt:  .asciiz"Do you want to enter more data?\t\n"
	prompt1: .asciiz"Enter the data you want to add in the list:\t\n "
    	prompt2: .asciiz"Press 1 for exit\n"
	list: .asciiz "\nList of integers:\t\n"
>>>>>>> 14bd6242d6a1158383040f17006747970127b16e
	linefeed:.asciiz"\n"
	
.text

main:    
<<<<<<< HEAD
#mem allocation for 1st integer
	 li $v0,9
	 li $a0,4
	 syscall
	 move $t3,$v0
	 
	 move $a0,$t3
	 li $v0,1
	 syscall
	 
	 li $v0,4
     la $a0,linefeed
     syscall
	 

=======
li $v0,9
     li $a0,8
     syscall
     move $s4,$v0     	
li $v0,4
     la $a0,greet
     syscall

	
     #jal create_node #jump to create a node
>>>>>>> 14bd6242d6a1158383040f17006747970127b16e
	 addi $t4,$0,0 # initializing counter i=0;
	 addi $t5,$0,4 #size of loop
loop:
     jal add_node	 
     move $t1,$v0   #result of create node in t1
     addi $t4,$t4,1
	 bne $t4,$t5,loop

#print all nodes in the list
	li $v0,4
     	la $a0,list
     	syscall	
	sw $0,4($s2)
print:	 
lw $t2,8($s4)
li $v0,1
move $a0,$t2
syscall
li $v0,4
la $a0,linefeed
syscall
addi $s4,$s4,8
bne $s4,$s2 print

	 
	 
#exit
     li $v0,10
     syscall
     
#create a node

create_node:
     
     add $t0,$a0,$0
#allocate 8 bytes for node 
     li $v0,9
     li $a0,4
     syscall
     move $s2,$v0
	#jal save_headaddress
	 
	 
     move $s1,$t0
<<<<<<< HEAD
     move $s2,$v0	
     sw $s1, ($t3)
	 sw $0,($s2) 	 
	 move $t3,$s2	 
     move $v0,$s2 

=======

 sw $s1, ($s2)
	 #addi $s2,$s2,4
	addi $s3,$s2,4 
	#sw  $0, ($s2)
	sw $s3,4($s2)     	
move $v0,$s2 
	 #addi $s2,$s2,4
>>>>>>> 14bd6242d6a1158383040f17006747970127b16e
	 jr $ra

#save_headaddress
#	move 
#end                                                                                                                                                              of create_node 

#add a new node:
     
add_node:
     li $v0,4
     la $a0,prompt1
     syscall

     add $t2,$ra,$0
     li $v0,5
     syscall #Take Input

     move $a0,$v0
	 jal create_node
	 
     move $t1,$v0
     jr $t2
	 

