.eqv BUFFER_SIZE 512
.data
buffer: .space BUFFER_SIZE

.include "macros.asm"

.global read_file
.text
read_file:
	##########################################################
	# summary: reads file contents by its name	#
	#--------------------------------------------------------#
	# input parameters: a0 - descriptor		#
	# output parameters: a0 - adress of contents 	#
	#	  a1 - length of the contents	#		#
	##########################################################

	start_subprogramm
	
	
	##########################################################
	# get ready for reading		#
	##########################################################
	
	mv s0 a0
	allocate(BUFFER_SIZE) # allocate memory for starting length
	mv s3 a0
	mv s5 a0 # save changing heap address
	mv s6 zero # starting length
	li s4 BUFFER_SIZE
	
	#---------------------------------------------------------
	# s0 - descriptor
	# s1 - number -1
	# s2 - read length (less or equal to buffer size)
	# s3 - address of starting memory block
	# s4 - buffer length
	# s5 - address of current memory block
	# s6 - current length
	#---------------------------------------------------------
	
	
read_buffer:
	read_file_buffer(s0, s5, BUFFER_SIZE)
  
	# if reading incorrect, go to error
	beq s1 a0 error
	mv s2 a0 # save text length
	add s6 s6 s2
	
	# if read length less than buffer size, end reading
	bne s2 s4 end_read_buffer
	
	# else allocate more memory
    	allocate(BUFFER_SIZE) 
    	add s5 s5 s2 
    	j read_buffer	
	
end_read_buffer:
	##########################################################
	# close file			#
	##########################################################
	
	close_file(s0)
	
	# add \0 to the end of file contents
	mv t0 s3
	add t0 t0 s6 
	addi t0 t0 1
	sb zero (t0)
	
	mv a0 s3
	mv a1 s6

	j end_read
error:
	print_str("Oops! Error reading file occurred!")
	finish_programm
	
end_read:
	finish_subprogramm
