//# Google UVM Generated Test
//# Extracted from riscv_compliance_tests/riscv_test.h
extern int print_port;
extern int test_ret_val;
extern int test_results;
extern int test_ret_val;
int test_ret_val = 0x20000000;
int test_results; // Add data type specifier and semicolon
int test_results; // Add data type specifier and semicolon
void quick_fast_exit() {
	asm volatile(
		"lui a0, %0\n"
		"addi a1, zero, 'D'\n"
		"addi a2, zero, 'O'\n"
		"addi a3, zero, 'N'\n"
		"addi a4, zero, 'E'\n"
		"addi a5, zero, '\n'\n"
		"sw a1, 0(a0)\n"
		"sw a2, 0(a0)\n"
		"sw a3, 0(a0)\n"
		"sw a4, 0(a0)\n"
		"sw a5, 0(a0)\n"
		"li a0, %1\n"
		"lw a1, %2\n"
		"sw a1, 0(a0)\n"
		"wfi\n"
	);
}
//#TODO: figure out how to move this to the end of the program
/* #.section .text
#quick_fast_exit: */
//#                  /* print "DONE\n" */
/*#                  lui a0,print_port>>12
#                  addi a1,zero,'D'
#                  addi a2,zero,'O'
#                  addi a3,zero,'N'
#                  addi a4,zero,'E'
#                  addi a5,zero,'\n'
#                  sw a1,0(a0)
#                  sw a2,0(a0)
#                  sw a3,0(a0)
#                  sw a4,0(a0)
#                  sw a5,0(a0)
#
#                  li a0, test_ret_val
#                  lw a1, test_results */ /* report result */
/*#                  sw a1,0(a0)
#
#                  wfi */ /* we are done */
