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
    prompt:  .asciiz"Do you want to enter more data?\t\n"
	prompt1: .asciiz"Enter the data you want to add in the list:\t\n "
    prompt2: .asciiz"Press 1 for exit\n"
	linefeed:.asciiz"\n"
	
.text

main:    
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
	 

	 addi $t4,$0,0 # initializing counter i=0;
	 addi $t5,$0,4 #size of loop
loop:
     jal add_node	 
     move $t1,$v0   #result of create node in t1
     addi $t4,$t4,1
	 bne $t4,$t5,loop

	
	 
#exit
     li $v0,10
     syscall
     
#create a node

create_node:
     
     add $t0,$a0,$0
#allocate 8 bytes for memory 
     li $v0,9
     li $a0,4
     syscall
	 
	 
     move $s1,$t0
     move $s2,$v0	
     sw $s1, ($t3)
	 sw $0,($s2) 	 
	 move $t3,$s2	 
     move $v0,$s2 

	 jr $ra
	
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
	 

