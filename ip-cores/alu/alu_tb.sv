/*
	Produced by: Bruno Binelli, Bruno Carboni, Eduardo Zambotto, Julio Cezar;
	Date created - 26/03/2025;
	Description - Arithmetic Logic Unit Testbench(ALU)
*/

`include "alu.sv"

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

    initial begin // Monitor outputs to track changes
        $monitor("Time = %0t, A_i = %b, B_i = %b, Opcode = %b, alu_o = %b, carry_o = %b", 
                 $time, A_i, B_i, opcode_i, alu_o, carry_o);
    end

    initial begin // Test each opcode
        // --- Arithmetic ops ---
        A_i = 8'b00001111; B_i = 8'b00000000; opcode_i = INC;
        #10ns;  // Expected: alu_o = 00010000, carry_o = 0

        A_i = 8'b00001111; B_i = 8'b00000000; opcode_i = DEC;
        #10ns;  // Expected: alu_o = 00001110, carry_o = 0

        A_i = 8'b00001111; B_i = 8'b00000001; opcode_i = ADD;
        #10ns;  // Expected: alu_o = 00010000, carry_o = 0

        A_i = 8'b00001111; B_i = 8'b00000001; opcode_i = ADD_C;
        #10ns;  // Expected: alu_o = 00010001, carry_o = 0

        A_i = 8'b00001111; B_i = 8'b00000001; opcode_i = SUB_B;
        #10ns;  // Expected: alu_o = 00001110, carry_o = 0

        A_i = 8'b00001111; B_i = 8'b00000001; opcode_i = SUB;
        #10ns;  // Expected: alu_o = 00001101, carry_o = 0

        // --- Carry test's ---
        A_i = 8'b11111111; B_i = 8'b00000001; opcode_i = ADD;
        #10ns;  // Expected: alu_o = 00000000, carry_o = 1 

        A_i = 8'b11111111; B_i = 8'b00000000; opcode_i = INC;
        #10ns;  // Expected: alu_o = 00000000, carry_o = 1 

        // --- Shifts ---
        A_i = 8'b00001111; B_i = 8'b00000001; opcode_i = SHIFT_R;
        #10ns;  // Expected: alu_o = 00000111

        A_i = 8'b00001111; B_i = 8'b00000001; opcode_i = SHIFT_L;
        #10ns;  // Expected: alu_o = 00011110

        // --- Logics ---
        A_i = 8'b00001111; B_i = 8'b00000001; opcode_i = AND_OP;
        #10ns;  // Expected: alu_o = 00000001

        A_i = 8'b00001111; B_i = 8'b00000001; opcode_i = NAND;
        #10ns;  // Expected: alu_o = 11111110

        A_i = 8'b00001111; B_i = 8'b00000001; opcode_i = OR;
        #10ns;  // Expected: alu_o = 00001111

        A_i = 8'b00001111; B_i = 8'b00000001; opcode_i = NOR;
        #10ns;  // Expected: alu_o = 11110000

        A_i = 8'b00001111; B_i = 8'b00000001; opcode_i = XOR;
        #10ns;  // Expected: alu_o = 00001110

        A_i = 8'b00001111; B_i = 8'b00000001; opcode_i = XNOR;
        #10ns;  // Expected: alu_o = 11110001

        A_i = 8'b00001111; B_i = 8'b00000000; opcode_i = NOT;
        #10ns;  // Expected: alu_o = 11110000  

        A_i = 8'b00001111; B_i = 8'b00000000; opcode_i = TRF_A;
        #10ns;  // Expected: alu_o = 00001111

        $finish;
    end

endmodule
