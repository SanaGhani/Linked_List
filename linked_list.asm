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
    address: .word 10
	
.text

main:    
#head node or sentinel node
     la $s2,address    
	 li $s0,0     #sentinel value
     move $a0,$s0
	 

     jal create_node #jump to create a node 
     move $t1,$v0    #result of create node in t1

#print sentinel node	      
     li $v0,1
     move $a0,$t1
     syscall

#exit
     li $v0,10
     syscall
     
#create a node

create_node:
     add $t0,$a0,$0
     
#allocate memory 
     li $v0,9
     li $a0,8
     syscall

     move $s1,$t0
     sw $s1,0($s2)
     sw $0,4($s2)
     move $v0,$s2
     jr $ra
#end of create_node 




