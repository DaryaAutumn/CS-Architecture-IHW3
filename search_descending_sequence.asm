.data
empty_string: .asciz ""

.include "macros.asm"
.global search_descending_sequence
.text
search_descending_sequence:
	##########################################################
	# summary: searches first occured N-length sequence of 	#
	# descending elements in string parameter	#
	#--------------------------------------------------------#
	# input parameters: a0 - string, a1 - sequence length	#
	# output parameters: 		#
	#--------------------------------------------------------#
	# There is a sequence       |   There is no sequence	#
	# with length N	         |   with length N 	#
	# a0 - sequence, 	         |   a0 - ""	#
	# a1 - sequence length      |   a1 - 0	#
	##########################################################
	
	start_subprogramm
	
	# save parameters
	mv s0 a0
	mv s1 a1 
	
	# length = 1?
	li a1 1
	beq s1 a1 one_byte_string
	
	# length = 0?
	beq s1 zero zero_string
	
	#--------------------------------------------------------#
	# a0 - string[i]			#
	# a1 - string{i+1], i from 0 to string.length - 1	#
	# a3 - current sequence length		#
	# s1 - sequence length (N)		#
	# s2 - current sequence start		#
	#--------------------------------------------------------#
	
	mv s2 s0 
	li a3 1
	
	lb a0 (s0)
	
read_string_loop:
	addi s0 s0 1
	lb a1 (s0)
	# did we reach the enf of the string?
	beq a1 zero end_read_string
	addi a3 a3 1
	# if sequence breaks
	ble a0 a1 new_sequence
	j continue_sequence
new_sequence:
	# save new sequence start
	mv s2 s0
	li a3 1
	
continue_sequence:
	mv a0 a1
	# is sequence long enough?
	blt a3 s1 read_string_loop
	
end_read_string:
	
	blt a3 s1 zero_string
	
	##########################################################
	# add string end \0		#
	##########################################################
	
	mv a0 s2
	
	add s2 s2 a3
	sb zero (s2)
	
	mv a1 a3
	j finish_string
	
	##########################################################
	# exceptional cases		#
	##########################################################
zero_string:
	la a0 empty_string
	li a1 0
	j finish_string
	
one_byte_string:
	# create string from 1st byte
	mv a0 s0
	mv s2 s0
	addi s2 s2 1
	sb zero (s2)
	li a1 1
	j finish_string
	
finish_string:
	finish_subprogramm







