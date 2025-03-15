`timescale 10ns/100ps

module full_adder_tb;

	reg a_tb, b_tb, carry_i_tb;
	wire sum_tb, carry_o_tb;
	
	full_adder U0(
		.a_i(a_tb),
		.b_i(b_tb),
		.carry_i(carry_i_tb),
		.sum_o(sum_tb),
		.carry_o(carry_o_tb)
	);
	
	initial 
	begin
  	a_tb = 0;
  	b_tb = 0;
	carry_i_tb = 0;
  	#5;
	a_tb = 0;
  	b_tb = 0;
	carry_i_tb = 0;
  	#5;
  	a_tb = 0;
  	b_tb = 1;
  	carry_i_tb = 0;
	#5;
  	a_tb = 1;
  	b_tb = 0;
	carry_i_tb = 0;
  	#5;
  	a_tb = 1;
  	b_tb = 1;
	carry_i_tb = 0;
  	#5;
	a_tb = 0;
  	b_tb = 0;
	carry_i_tb = 1;
  	#5;
	a_tb = 0;
  	b_tb = 0;
	carry_i_tb = 1;
  	#5;
  	a_tb = 0;
  	b_tb = 1;
	carry_i_tb = 1;
  	#5;
  	a_tb = 1;
  	b_tb = 0;
	carry_i_tb = 1;
  	#5;
  	a_tb = 1;
  	b_tb = 1;
	carry_i_tb = 1;
  	#5;
  	$stop;

	end

	always @(a_tb or b_tb or carry_i_tb) $display("a=%b I b=%b I s=%b I c=%b", a_tb, b_tb, sum_tb, carry_o_tb);

endmodule