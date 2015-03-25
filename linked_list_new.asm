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
##              $t0 - store the int data for node creation
##		$t1 - store the address where the node is created

.data
    	greet: .asciiz "\t\t Implementing Linked List in MIPS Assembly Language\n\n"
	prompt:  .asciiz"\nPress \n1. To add more integers\n2. To print the list of integers\n3. To delete the first integer\n4. Exit\n"
	prompt1: .asciiz"Enter the integer you want to add in the list:\t\n "
    	list: .asciiz "\nList of integers:\t\n"
	linefeed:.asciiz"\n"
	
.text

main:    
        li $s3,1   
        li $s5,2 
	li $s6,4
	li $v0,9
        li $a0,8
        syscall
        move $s4,$v0
        move $t3,$s4     
	move $t6,$s4 # headnode address for print funtion
        li $v0,4
        la $a0,greet
        syscall

	      
loop:
    
 jal add_node	 
main_loop:
move $t6,$s4
li $v0,4
	la $a0,prompt
	syscall
	li $v0,5
	syscall
	move $a0,$v0
	beq $a0,$s3 loop
	beq $a0,$s5 print
	beq $a0,$s6 exit
     

#print all nodes in the list
print:
	    li $v0,4
     	la $a0,list
     	syscall	
		lw $t9,4($s2)
		addi $t6,$t6,4
print_loop:	 
       lw $t7,($t6)
       lw $t8,($t7)
	   li $v0,1
       move $a0,$t8
       syscall
       li $v0,4
       la $a0,linefeed
       syscall
	   lw $t6,($t6)
	   addi $t6,$t6,4
	   lw $t7,($t6)
	   bne $t7,$t9 print_loop
       beq $t7,$t9 main_loop

	 
	 
exit:
        li $v0,10
        syscall
     
#create a node

create_node:
     
        add $t0,$a0,$0
#allocate 8 bytes for node 
        li $v0,9
        li $a0,8
        syscall
        move $s2,$v0
        move $s1,$t0
        sw $s1, ($s2)
	    sw $s2,4($t3) 	
        move $v0,$s2 
	
        jr $ra

#end of create_node                                                                                                                                                           

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
	move $t3,$t1

jr $t2
	 
#end of add_node
