/*
	Produced by: Bruno Binelli, Bruno Carboni, Eduardo Zambotto, Julio Cezar;
	Date created - 03/2025;
	Description - Melay Finite State Machine with a 2-bit state register.
*/

module mealy_fsm_tb;

logic clk_i, rst_i, mealy_i, mealy_o;

mealy_fsm U0 (.clk_i(clk_i), .rst_i(rst_i), .mealy_i(mealy_i), .mealy_o(mealy_o));

task run_machine (input logic x_i);
	mealy_i = x_i;
	#10ns;
endtask

initial begin: initializing_inputs
	clk_i = 1'b0;
	mealy_i = 1'b0;
	U0.state = U0.S2; // Initialized in S2 to test the reset
end: initializing_inputs

initial begin: reset_forcing
	rst_i = 1'b1;
	#3ns rst_i = 1'b0;
	#3ns rst_i = 1'b1;
end: reset_forcing

initial begin: clock_generator
	forever begin
		#5ns clk_i = ~clk_i;
	end
end: clock_generator

initial begin: testing_inputs
	$monitor("Time: %0t, rst_i: %b, mealy_i: %b, mealy_o: %b, state: %b", $time, rst_i, mealy_i, mealy_o, U0.state);
	#12.5ns;
	
	run_machine(0); // Remains in S0
	run_machine(1); // S0 to S1
	
	run_machine(1); // Remains in S1
	run_machine(0); // S1 to S2
	
	run_machine(0); // Returns to S0
	
	run_machine(1); // Making the same steps to return to S2
	run_machine(0);
	
	run_machine(1); // S2 to S3
	
	run_machine(0); // Returns to S0
	
	run_machine(1); // Making the same steps to return to S3
	run_machine(0);
	run_machine(1);
	
	run_machine(1); // Returns to S1
	
	$stop;
	
end: testing_inputs

endmodule
	
	
	
	
	
	
	