module alu (
	A_i, 
	B_i,
	opcode_i,
	alu_o
);

	localparam logic ADD = 1'b1;
	localparam logic SUB = 1'b0;

	input logic signed	[15:0] A_i, B_i; // Inputs need to be signed, so the logic can be right
	input logic opcode_i; 		
	output logic signed [15:0] alu_o;    		 

	always_comb begin:alu_logic

		case (opcode_i)	

			ADD: alu_o = A_i + B_i;
			SUB: alu_o = A_i - B_i;
			default: alu_o = 0;
		
		endcase
	
	end:alu_logic

endmodule:alu
