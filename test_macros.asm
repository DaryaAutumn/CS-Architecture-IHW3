.include "macros.asm"

.data
test1: 	.asciz "tests/test1.txt"
test2: 	.asciz "tests/test2.txt"
test3: 	.asciz "tests/test3.txt"
test4: 	.asciz "tests/test4.txt"
test5: 	.asciz "tests/test5.txt"
test6: 	.asciz "tests/test6.txt"

.global test_macros
.text
test_macros:

	##########################################################
	# test1			#
	##########################################################
	
	
	print_str("----------------------------------------------")
	endl
	print_str("TEST 1:")
	endl
	
	print_file_contents(test1)
	
	test_case(test1, 2)
	test_case(test1, 3)
	test_case(test1, 10)
	test_case(test1, 1)
	test_case(test1, 0)
	
	
	##########################################################
	# test2			#
	##########################################################
	
	endl
	print_str("----------------------------------------------")
	endl
	print_str("TEST 2:")
	endl
	
	print_file_contents(test2)
	
	test_case(test2, 26)
	test_case(test2, 3)
	test_case(test2, 10)
	test_case(test2, 1)
	test_case(test2, 0)
	
	##########################################################
	# test3			#
	##########################################################
	
	endl
	print_str("----------------------------------------------")
	endl
	print_str("TEST 3:")
	endl
	
	print_file_contents(test3)
	
	test_case(test3, 26)
	test_case(test3, 3)
	test_case(test3, 10)
	test_case(test3, 1)
	test_case(test3, 0)
	
	##########################################################
	# test4			#
	##########################################################
	
	endl
	print_str("----------------------------------------------")
	endl
	print_str("TEST 4:")
	endl
	
	print_file_contents(test4)
	
	test_case(test4, 26)
	test_case(test4, 3)
	test_case(test4, 10)
	test_case(test4, 1)
	test_case(test4, 0)
	
	##########################################################
	# test5			#
	##########################################################
	
	endl
	print_str("----------------------------------------------")
	endl
	print_str("TEST 5:")
	endl
	
	print_file_contents(test5)
	
	test_case(test5, 26)
	test_case(test5, 3)
	test_case(test5, 10)
	test_case(test5, 1)
	test_case(test5, 0)
	
	##########################################################
	# test6			#
	##########################################################
	
	endl
	print_str("----------------------------------------------")
	endl
	print_str("TEST 6:")
	endl
	
	print_file_contents(test6)
	
	test_case(test6, 26)
	test_case(test6, 3)
	test_case(test6, 10)
	test_case(test6, 1)
	test_case(test6, 0)
	
	finish_programm
	
	















