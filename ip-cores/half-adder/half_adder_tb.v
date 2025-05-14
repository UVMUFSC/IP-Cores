
module half_adder_tb;

	reg a_tb,b_tb;
	wire c_tb,s_tb;


half_adder U0(
	.a(a_tb),
	.b(b_tb),
	.c(c_tb),
	.s(s_tb)
);

initial
begin
	a_tb=0;
	b_tb=0;
	#5;
	a_tb=0;
	b_tb=1;
	#5;
	a_tb=1;
	b_tb=0;
	#5;
	a_tb=1;
	b_tb=1;
	#5;
	$stop;
end
	
	always @(a_tb or b_tb) $display("Input -> a=%b I b=%b || Output -> c=%b I s=%b", a_tb, b_tb, c_tb, s_tb);
	
endmodule