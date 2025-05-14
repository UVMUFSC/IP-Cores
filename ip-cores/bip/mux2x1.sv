module mux2x1(
	x0_i,
	x1_i,
	sel_i,
	y_o
);

	input logic [15:0] x0_i, x1_i;
	input logic sel_i;
	output logic [15:0] y_o;

	always_comb begin:mux2x1_logic

		case(sel_i)

			1'b0 : y_o = x0_i;
			1'b1 : y_o = x1_i;
			default: y_o = 1'bx;

		endcase

	end:mux2x1_logic

endmodule:mux2x1