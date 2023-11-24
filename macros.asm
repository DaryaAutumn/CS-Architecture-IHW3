##########################################################
# print string			#
##########################################################
.macro print_str (%string)
   	.data
	str:  	.asciz %string
   	.text
   	li a7 4
   	la a0 str
   	ecall
.end_macro


##########################################################
# print int			#
##########################################################
.macro print_int (%int)
   	li a7 1
   	li a0 %int
   	ecall
.end_macro


##########################################################
# read_int			#
##########################################################
.macro read_int (%register)
   	li a7 5
   	ecall
   	mv %register a0
.end_macro

##########################################################
# read string to string_name 		#
##########################################################
.macro read_str(%string_name, %string_size)
	.text 
	# read text
	la a0 %string_name
	li a1 %string_size
	li a7 8
	ecall
.end_macro	


##########################################################
# read file name (with deleting '\n') in the end 	#
##########################################################

.macro read_file_name(%file_name, %name_size)
	# enter file name
	read_str(%file_name, %name_size)
	
	# delete '\n'
	li a2 '\n'
	la t0 %file_name
	
delete_loop:
	lb a1 (t0)
	beq a1 a2 replace
	addi t0 t0 1
	j delete_loop
replace:
	sb zero (t0)
.end_macro


##########################################################
# read a portion from file	                	#
##########################################################
.macro read_file_buffer(%descriptor_register, %buffer, %size)
	li a7 63
	mv a0 %descriptor_register
	mv a1 %buffer
	li a2 %size
	ecall
.end_macro


##########################################################
# allocate heap memory	                	#
##########################################################
.macro allocate(%size)
   	li a7 9
   	li a0 %size	
    	ecall
.end_macro


##########################################################
# close file 		                	#
##########################################################

.macro close_file(%file_descriptor)
    	li   a7 57       
    	mv   a0 %file_descriptor   
   	ecall             
.end_macro


##########################################################
# open file 			#
#--------------------------------------------------------#
# only supporting options:	             	#
# READ_ONLY - reading existing file		#
# WRITE_ONLY - create file and write or rewrite existing #
# WRITE_APPEND - write to existing file	#
##########################################################

.macro open_file(%input_file_name, %option)
	.eqv READ_ONLY 0
	.eqv WRITE_ONLY 1
	.eqv WRITE_APPEND 9
    	la a0 %input_file_name
	li a7 1024
	li a1 %option # open to read
	ecall             
.end_macro


##########################################################
# print endline		                	#
##########################################################
.macro endl
   	print_str("\n")
.end_macro

##########################################################
# ask Y/N  		                	#
# output: a0 - 1 if YES and 0 if NO		#
##########################################################
.macro ask
ask_YN:
	.data
	ans:  .space 40
	print_str("Enter Y/N (1 capital letter):")
	endl
	read_str(ans, 40)
	
	li a0 'Y'
	li a1 'N'
	la a3 ans
	lb a2 (a3)
	
	beq a2 a0 yes
	beq a2 a1 no
	print_str("Wrong input! Try again")
	endl
	j ask_YN
	
yes:
	li a0 1
	j end
no:
	li a0 0
end:
	
.end_macro


##########################################################
# start subprogramm		#
##########################################################
.macro start_subprogramm
	addi sp sp -4
 	sw ra (sp)
.end_macro


##########################################################
# finish subprogramm		#
##########################################################
.macro finish_subprogramm
	lw ra (sp)
      	addi sp sp 4
 	ret
.end_macro


##########################################################
# finish programm			#
##########################################################
.macro finish_programm
	li a7 10 
	ecall
.end_macro


##########################################################
# checks if string is empty,		#
# if yes, prints a message		#
# if no, prints sequence		#
##########################################################
.macro print_sequence(%string_register, %length_register)
	beq %length_register zero empty_console
	mv a0 %string_register
	li a7 4
	ecall
	
	j end_check
empty_console:
	print_str("No such sequence!")
end_check:

.end_macro


##########################################################
# test cases for a testing programm		#
# opens file by name and prints 		#
# a descenging sequence of N elements 	#
# to console			#
##########################################################

.macro test_case(%file_name, %seq_length)
	open_file(%file_name, READ_ONLY)
	
	jal read_file
	mv a2 a0
	
	endl
	print_str("N = ")
	print_int(%seq_length)
	print_str(":  ")
	
	mv a0 a2
	li a1 %seq_length
	jal search_descending_sequence
	mv a3 a0
	mv a4 a1
	
	print_sequence(a2, a4)
	
.end_macro

.macro print_file_contents(%filename)

	open_file(%filename, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	print_str("FILE CONTENTS:")
	endl
	mv a0 t0
	li a7 4
	ecall

.end_macro

