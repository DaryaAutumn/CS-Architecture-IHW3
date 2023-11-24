# 3 variant

.eqv INPUT_NAME_SIZE 256
.eqv OUTPUT_NAME_SIZE 256

.data
input_file_name:    .space INPUT_NAME_SIZE
output_file_name:    .space OUTPUT_NAME_SIZE

.include "macros.asm"

.global main
.text
main:	##########################################################
	# enter input file name		#
	##########################################################
	
	print_str("Enter input file name:")
	endl
	
	read_file_name(input_file_name, INPUT_NAME_SIZE)
	
	
	
	##########################################################
	# open file			#
	##########################################################
	
	open_file(input_file_name, READ_ONLY)
	
	li s1 -1 
	beq a0 s1 error_opening
	mv s0 a0
	
	
	
	##########################################################
	# read file contents		#
	##########################################################
	
	# load parameter
	mv a0 s0
	jal read_file
	mv t0 a0
	mv t3 a1 
	
	
	
	##########################################################
	# search first sequence of decsending elements	#
	#--------------------------------------------------------#
	# t0 - start of the file contents		#
	# t3 - length of the file contents		#
	##########################################################
	print_str("Enter size of descending sequence to find:")
	
	endl
	read_int(t1)
	
	bgt t1 t3 longer_than_file
	
	mv a0 t0
	mv a1 t1
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	
	
	##########################################################
	# enter output file name		#
	#--------------------------------------------------------#
	# t1 - sequence of length N		#
	# t2 - N or 0 (if no such sequence)		#
	##########################################################
	
	print_str("Enter output file name:")
	endl
	read_file_name(output_file_name, OUTPUT_NAME_SIZE)
	
	
	
	##########################################################
	# write output to file		#
	##########################################################
	
	open_file(output_file_name, WRITE_ONLY)
	mv a1 t1
	mv a2 t2
	jal write_to_file
	
	
	
	##########################################################
	# write output to console		#
	##########################################################
	ask
	
	beq a0 zero exit
	
	# if YES, print sequence
	print_str("Found sequence:")
	endl
	
	beq t2 zero empty_console
	mv a0 t1
	li a7 4
	ecall
	
	j exit
		
	
	##########################################################
	# errors			#
	##########################################################
empty_console:
	print_str("No such sequence! Output file is empty.")
	j exit
	
error_opening:
	print_str("Error opening file!")
	j exit

longer_than_file:

	print_str("Oops, your number is greater than file contents length")
	j exit	
	
	
	##########################################################
	# exit programm			#
	##########################################################
exit:
	finish_programm
