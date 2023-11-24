.include "macros.asm"
.global write_to_file
.text
write_to_file:
	##########################################################
	# summary: writes a string to file		#
	#--------------------------------------------------------#
	# input parameters: a0 - file descriptor, 	#
	#	 a1 - string adresss,	#
	#	 a2 - string length	#
	# output parameters: no parameters		#
	##########################################################
	
	start_subprogramm
	
	li s1 -1 
	beq a0 s1 error_writing
		
	#li a3 4
	#mul a2 a2 a3
	#write to file
	
	li a7 64
	ecall 
	
	
	j finish_write
error_writing:
	print_str("Oops! Some error occured while writing to file")
finish_write:
	finish_subprogramm
