/*
    Produced by: Bruno Binelli, Bruno Carboni, Eduardo Zambotto, Julio Cezar;
    Date created - 29/03/2025;
    Description - Moore Finite State Machine Testbench
*/

module moore_fsm_tb;

logic clk_i, rst_i, next_i, out_o;

moore_fsm U0 (.clk_i(clk_i), .rst_i(rst_i), .next_i(next_i), .out_o(out_o));

initial begin // Setting intial clokc and next state input as 0 and forcing initial reset
	clk_i = 1'b0;
	next_i = 1'b0;
	U0.state_moore = U0.S4_MOORE;
end

initial begin: clock_generator
	forever begin
	#5ns clk_i = ~clk_i;	
	end
end: clock_generator

initial begin: reset_forcing
	rst_i = 1'b1;
	#6ns rst_i = 1'b0;
end: reset_forcing

initial begin: testing_inputs
	$monitor("Time: %0t, rst_i: %b, next_i: %b, out_o: %b, state: %b", $time, rst_i, next_i, out_o, U0.state_moore);
	#12.5ns;
	
	next_i = 1'b1;  // S0 to S1, q_out = 0
   #10ns;
	
   next_i = 1'b0;  // S1 to S2, q_out = 0
	#10ns;
	
   next_i = 1'b1;  // S2 to S3, q_out = 0
   #10ns;
	
	next_i = 1'b1;  // S3 to S4, q_out = 1
   #10ns;
	
	next_i = 1'b0;  // S4 to S2, q_out = 0
   #10ns;
	
	next_i = 1'b1;  // S2 to S3, q_out = 0
   #10ns;
	
   next_i = 1'b1;  // S3 to S4, q_out = 1
   #10ns;
	
   next_i = 1'b1;  // S4 to S1, q_out = 0
   #10ns;
	
	next_i = 1'b1;  // S1 to S1, q_out = 0
   #10ns;
	
	next_i = 1'b0;  // S1 to S2, q_out = 0
   #10ns;
	
	next_i = 1'b0;  // S2 to S0, q_out = 0
   #10ns;
	
	next_i = 1'b0;  // S0 to S0, q_out = 0
   #10ns;

   $stop;
end: testing_inputs

endmodule
	