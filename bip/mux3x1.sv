module mux3x1(
	x0_i,
	x1_i,
	x2_i,
	sel_i,
	y_o
);

	input logic [15:0] x0_i, x1_i, x2_i;
	input logic [1:0] sel_i;
	output logic [15:0] y_o;

	always_comb begin:mux3x1_logic

		case(sel_i)

			2'b00 : y_o = x0_i;
			2'b01 : y_o = x1_i;
			2'b10 : y_o = x2_i;
			default: y_o = 1'bx;

		endcase

	end:mux3x1_logic
		
endmodule