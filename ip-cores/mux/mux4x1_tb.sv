/*
	
	Produced by: Bruno Binelli, Bruno Carboni, Eduardo Zambotto, Julio Cezar;
	Date Created: 23/03/2025;
	Description: Mux 4x1 testbench code.
*/


module mux4x1_tb;

reg x0_tb, x1_tb, x2_tb, x3_tb;
reg [1:0] sel_tb;
wire y_tb;

mux4x1 U0(
	    .y_o(y_tb),
	    .sel_i(sel_tb),
	    .x0_i(x0_tb),
	    .x1_i(x1_tb),
	    .x2_i(x2_tb),
	    .x3_i(x3_tb)
	);

initial begin
  $monitor("sel = %b, x0 = %b, x1 = %0b, x2 = %0b ,x3 = %0b,->  y = %0b", sel_tb,x0_tb, x1_tb,x2_tb,x3_tb,y_tb);
  sel_tb=2'b00; x0_tb=0; x1_tb =0; x2_tb=0; x3_tb=0; #1;
	sel_tb=2'b00; x0_tb=1; x1_tb =1; x2_tb=1; x3_tb=1; #1;
	sel_tb=2'b01; x0_tb=0; x1_tb =0; x2_tb=0; x3_tb=0; #1;
	sel_tb=2'b01; x0_tb=1; x1_tb =1; x2_tb=1; x3_tb=1; #1;
	sel_tb=2'b10; x0_tb=0; x1_tb =0; x2_tb=0; x3_tb=0; #1;
	sel_tb=2'b10; x0_tb=1; x1_tb =1; x2_tb=1; x3_tb=1; #1;
	sel_tb=2'b11; x0_tb=0; x1_tb =0; x2_tb=0; x3_tb=0; #1;
	sel_tb=2'b11; x0_tb=1; x1_tb =1; x2_tb=1; x3_tb=1; #1;
    
  end
endmodule

