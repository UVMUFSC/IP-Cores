module ext_signal(
	s_i,
	y_o
);

	input logic [10:0] s_i;
	output logic [15:0] y_o;

	assign y_o = {5'b00000, s_i};

endmodule:ext_signal