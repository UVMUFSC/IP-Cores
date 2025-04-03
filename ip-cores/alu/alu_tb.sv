/*
	Produced by: Bruno Binelli, Bruno Carboni, Eduardo Zambotto, Julio Cezar;
	Date created - 29/03/2025;
	Description - Arithmetic Logic Unit (ALU) Testbench
*/

`include "alu.sv";

module alu_tb;

	logic [7:0] A_i, B_i;
	opcode_t opcode_i;
	logic [7:0] alu_o;
	logic carry_o;

	alu U0 (
		.A_i(A_i), 
		.B_i(B_i), 
		.opcode_i(opcode_i), 
		.alu_o(alu_o), 
		.carry_o(carry_o)
	);

  initial begin	// Monitor outputs to track changes
    $monitor("Time = %0t, A_i = %b, B_i = %b, Opcode = %b, alu_o = %b, carry_o = %b", 
             $time, A_i, B_i, opcode_i, alu_o, carry_o);
  end

  initial begin	// Test each opcode
    A_i = 8'b00001111; 
    B_i = 8'b00000000; 
    opcode_i = INC; 		// Set the opcode to INC (Increment A)
    #10ns;					// Expected: alu_o = A_i + 1 = 00001111 + 1 = 00010000

    A_i = 8'b00001111; 
    B_i = 8'b00000000; 
    opcode_i = DEC; 		// Set the opcode to DEC (Decrement A)
    #10ns;					// Expected: alu_o = A_i - 1 = 00001111 - 1 = 00001110

    A_i = 8'b00001111; 
    B_i = 8'b00000001; 
    opcode_i = ADD; 		// Set the opcode to ADD (Add A to B)
    #10ns;					// Expected: alu_o = A_i + B_i = 00001111 + 00000001 = 00010000

    A_i = 8'b00001111; 
    B_i = 8'b00000001; 
    opcode_i = ADD_C; 	// Set the opcode to ADD_C (Add B to A with carry)
    #10ns;					// Expected: alu_o = A_i + B_i + 1 = 00001111 + 00000001 + 1 = 00010001

    A_i = 8'b00001111; 
    B_i = 8'b00000001; 
    opcode_i = SUB_B; 	// Set the opcode to SUB_B (Subtraction with borrow)
    #10ns;					// Expected: alu_o = A_i - B_i = 00001111 - 00000001 = 00001110

    A_i = 8'b00001111; 
    B_i = 8'b00000001; 
    opcode_i = SUB; 		// Set the opcode to SUB (Subtraction)
    #10ns;					// Expected: alu_o = A_i - B_i - 1 = 00001111 - 00000001 - 1 = 00001101

    A_i = 8'b00001111; 
    B_i = 8'b00000001; 
    opcode_i = SHIFT_R; // Set the opcode to SHIFT_R (Shift right)
    #10ns;					// Expected: alu_o = A_i >> B_i = 00001111 >> 1 = 00000111

    A_i = 8'b00001111; 
    B_i = 8'b00000001; 
    opcode_i = SHIFT_L; // Set the opcode to SHIFT_L (Shift left)
    #10ns;					// Expected: alu_o = A_i << B_i = 00001111 << 1 = 00011110

    A_i = 8'b00001111; 
    B_i = 8'b00000001; 
    opcode_i = AND_OP; 	// Set the opcode to AND_OP (A AND B)
    #10ns;					// Expected: alu_o = A_i & B_i = 00001111 & 00000001 = 00000001

    A_i = 8'b00001111; 
    B_i = 8'b00000001; 
    opcode_i = NAND; 	// Set the opcode to NAND (A NAND B)
    #10ns;					// Expected: alu_o = ~(A_i & B_i) = ~(00001111 & 00000001) = 11111110

    A_i = 8'b00001111; 
    B_i = 8'b00000001; 
    opcode_i = OR; 		// Set the opcode to OR (A OR B)
    #10ns;					// Expected: alu_o = A_i | B_i = 00001111 | 00000001 = 00001111

    A_i = 8'b00001111; 
    B_i = 8'b00000001; 
    opcode_i = NOR; 		// Set the opcode to NOR (A NOR B)
    #10ns;					// Expected: alu_o = ~(A_i | B_i) = ~(00001111 | 00000001) = 11110000

    A_i = 8'b00001111; 
    B_i = 8'b00000001; 
    opcode_i = XOR; 		// Set the opcode to XOR (A XOR B)
    #10ns;					// Expected: alu_o = A_i ^ B_i = 00001111 ^ 00000001 = 00001110

    A_i = 8'b00001111; 
    B_i = 8'b00000001; 
    opcode_i = XNOR; 	// Set the opcode to XNOR (A XNOR B)
    #10ns;					// Expected: alu_o = ~(A_i ^ B_i) = ~(00001111 ^ 00000001) = 11110001

    A_i = 8'b00001111; 
    B_i = 8'b00000000; 
    opcode_i = TRF_A; 	// Set the opcode to TRF_A (Transfer A)
    #10ns;					// Expected: alu_o = A_i = 00001111

    $stop;	// Finish the test
  end

endmodule