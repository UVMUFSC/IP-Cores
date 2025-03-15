module full_adder(
	a_i,
	b_i,
	carry_i,
	sum_o,
	carry_o
);
	input a_i, b_i, carry_i;
	output sum_o, carry_o;
	wire w_sum, w_carry1, w_carry2;
	half_adder U1(
		.a_i(a_i),
		.b_i(b_i),
		.s_o(w_sum),
		.c_o(w_carry1)
	);
	
	half_adder U2(
		.a_i(w_sum),
		.b_i(carry_i),
		.s_o(sum_o),
		.c_o(w_carry2)
	);

	or U3(carry_o, w_carry1, w_carry2);

endmodule