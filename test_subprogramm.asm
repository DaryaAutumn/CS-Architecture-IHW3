.include "macros.asm"

.data
test1: 	.asciz "tests/test1.txt"
test2: 	.asciz "tests/test2.txt"
test3: 	.asciz "tests/test3.txt"
test4: 	.asciz "tests/test4.txt"
test5: 	.asciz "tests/test5.txt"
test6: 	.asciz "tests/test6.txt"

output1:	.asciz "outputs/output1.txt"
output2:	.asciz "outputs/output2.txt"
output3:	.asciz "outputs/output3.txt"
output4:	.asciz "outputs/output4.txt"
output5:	.asciz "outputs/output5.txt"
output6:	.asciz "outputs/output6.txt"

.global test_subprogramm
.text
test_subprogramm:

	##########################################################
	# test1			#
	##########################################################
	
	print_str("----------------------------------------------")
	endl
	print_str("TEST1:")
	endl
	open_file(test1, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	print_str("FILE CONTENTS:")
	endl
	mv a0 t0
	li a7 4
	ecall
	
	##########################################################
	
	print_str("N = 1:")
	endl
	
	mv a0 t0
	li a1 1
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	##########################################################
	open_file(test1, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	endl
	print_str("N = 2:")
	endl
	
	mv a0 t0
	li a1 2
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	##########################################################
	open_file(test1, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	endl
	print_str("N = 3:")
	endl
	
	mv a0 t0
	li a1 3
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	##########################################################
	open_file(test1, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	endl
	print_str("N = 4:")
	endl
	
	mv a0 t0
	li a1 4
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	#write last valid output to file
	open_file(output1, WRITE_ONLY)
	mv a1 t1
	mv a2 t2
	jal write_to_file
	
	##########################################################
	open_file(test1, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	endl
	print_str("N = 5:")
	endl
	
	mv a0 t0
	li a1 5
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	
	
	
	
	##########################################################
	# test2			#
	##########################################################
	
	endl
	print_str("----------------------------------------------")
	endl
	print_str("TEST2:")
	endl
	open_file(test2, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	print_str("FILE CONTENTS:")
	endl
	mv a0 t0
	li a7 4
	ecall
	
	##########################################################
	
	endl
	print_str("N = 1:")
	endl
	
	mv a0 t0
	li a1 1
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	##########################################################
	open_file(test2, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	endl
	print_str("N = 5:")
	endl
	
	mv a0 t0
	li a1 5
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	##########################################################
	open_file(test2, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	endl
	print_str("N = 26:")
	endl
	
	mv a0 t0
	li a1 26
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	##########################################################
	open_file(test2, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	endl
	print_str("N = 10:")
	endl
	
	mv a0 t0
	li a1 10
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	#write last valid output to file
	open_file(output2, WRITE_ONLY)
	mv a1 t1
	mv a2 t2
	jal write_to_file
	
	##########################################################
	open_file(test2, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	endl
	print_str("N = 30:")
	endl
	
	mv a0 t0
	li a1 30
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	
	##########################################################
	# test3			#
	##########################################################
	
	endl
	print_str("----------------------------------------------")
	endl
	print_str("TEST3:")
	endl
	open_file(test3, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	print_str("FILE CONTENTS:")
	endl
	mv a0 t0
	li a7 4
	ecall
	
	##########################################################
	
	endl
	print_str("N = 0:")
	endl
	
	mv a0 t0
	li a1 0
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	##########################################################
	open_file(test3, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	endl
	print_str("N = 2:")
	endl
	
	mv a0 t0
	li a1 2
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	##########################################################
	open_file(test3, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	endl
	print_str("N = 10:")
	endl
	
	mv a0 t0
	li a1 10
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	##########################################################
	open_file(test3, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	endl
	print_str("N = 9:")
	endl
	
	mv a0 t0
	li a1 9
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	#write last valid output to file
	open_file(output3, WRITE_ONLY)
	mv a1 t1
	mv a2 t2
	jal write_to_file
	
	##########################################################
	open_file(test3, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	endl
	print_str("N = 30:")
	endl
	
	mv a0 t0
	li a1 30
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	
	
	##########################################################
	# test4			#
	##########################################################
	
	endl
	print_str("----------------------------------------------")
	endl
	print_str("TEST4:")
	endl
	open_file(test4, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	print_str("FILE CONTENTS:")
	endl
	mv a0 t0
	li a7 4
	ecall
	
	##########################################################
	
	endl
	print_str("N = 0:")
	endl
	
	mv a0 t0
	li a1 0
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	##########################################################
	open_file(test4, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	endl
	print_str("N = 5:")
	endl
	
	mv a0 t0
	li a1 5
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	##########################################################
	open_file(test4, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	endl
	print_str("N = 10:")
	endl
	
	mv a0 t0
	li a1 10
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	##########################################################
	open_file(test4, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	endl
	print_str("N = 4:")
	endl
	
	mv a0 t0
	li a1 4
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	#write output to file
	open_file(output4, WRITE_ONLY)
	mv a1 t1
	mv a2 t2
	jal write_to_file
	
	##########################################################
	open_file(test4, READ_ONLY)
	
	jal read_file
	mv t0 a0
	
	endl
	print_str("N = 3:")
	endl
	
	mv a0 t0
	li a1 3
	jal search_descending_sequence
	mv t1 a0
	mv t2 a1
	
	print_sequence(t1, t2)
	
	
	finish_programm
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

