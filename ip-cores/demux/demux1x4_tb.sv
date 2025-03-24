/*
	
	Produced by: Bruno Binelli, Bruno Carboni, Eduardo Zambotto, Julio Cezar;
	Date created - 23/03/2025;
	Description - Demultiplexer 1x4 testbench code.


*/


module demux1x4_tb;
	
	reg x_tb;
	reg[1:0] sel_tb;
	wire y0_tb, y1_tb, y2_tb, y3_tb;
	
	demux1x4 U0(
	    .x_i(x_tb),
	    .sel_i(sel_tb),
	    .y0_o(y0_tb),
	    .y1_o(y1_tb),
	    .y2_o(y2_tb),
	    .y3_o(y3_tb)
	);
	
initial begin
    $monitor("sel = %b, x = %b -> y0 = %0b, y1 = %0b ,y2 = %0b, y3 = %0b", sel_tb,x_tb, y0_tb,y1_tb,y2_tb,y3_tb);
    sel_tb=2'b00; x_tb=0; #1;
    sel_tb=2'b00; x_tb=1; #1;
    sel_tb=2'b01; x_tb=0; #1;
    sel_tb=2'b01; x_tb=1; #1;
    sel_tb=2'b10; x_tb=0; #1;
    sel_tb=2'b10; x_tb=1; #1;
    sel_tb=2'b11; x_tb=0; #1;
    sel_tb=2'b11; x_tb=1; #1;
  end
endmodule

