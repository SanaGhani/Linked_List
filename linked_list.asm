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
         address: .word ?
	     prompt:  .asciiz"Do you want to enter more data?\t\n"
       	 prompt1: .asciiz"Enter the data you want to add in the list:\t\n "
         prompt2: .asciiz"Press 1 for exit\n"
         linefeed:.asciiz"\n"
	
    .text

main:    
#head node or sentinel node
     la $s2,address
	 
	 li $v0,1
	 move $a0,$s2
	 syscall
	 
     #add $s4,$s2,$0	 
	 #li $s0,0     #sentinel value
     #move $a0,$s0
	 

     #jal create_node #jump to create a node
	 addi $t4,$0,0
	 addi $t5,$0,4
loop:
     jal add_node	 
     move $t1,$v0   #result of create node in t1
     addi $t4,$t4,1
	 bne $t4,$t5,loop
	 
	 
#print sentinel node	      
     li $v0,1
     lw $a0,0($t1)
	 syscall
	
	 
#exit
     li $v0,10
     syscall
     
#create a node

create_node:
     add $t0,$a0,$0
     
#allocate 8 bytes for memory 
     li $v0,9
     li $a0,8
     syscall
     
     addi $a0,$v0,0
     li $v0,1
     syscall	 
     move $s1,$t0
	 sw $s1, ($s2)
	 addi $s2,$s2,4
	 sw  $0, ($s2)
     move $v0,$s2 
	 #addi $s2,$s2,4
	 jr $ra
	
#end                                                                                                                                                              of create_node 

#add a new node:
     
add_node:
     li $v0,4
     la $a0,prompt1
     syscall

     add $t2,$ra,$0
     li $v0,5
     syscall

     move $a0,$v0
	 jal create_node
	 
     move $t1,$v0
     jr $t2
	 

