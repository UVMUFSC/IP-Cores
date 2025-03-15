module adder_4bits_tb;
reg [40*8 : 1] message;
reg [3:0] stim_a_array [0:15];  
reg [3:0] stim_b_array [0:15];
integer i; 
reg  [3:0] a_tb, b_tb;	
wire [3:0] s_tb;
wire       c_tb;
adder_4bits DUT (.a_i(a_tb), .b_i(b_tb), .s_o(s_tb),.c_o(c_tb));
initial begin
  message = "start simulation";
  $readmemb("..\\src\\stimulus_a.txt", stim_a_array);
  $readmemb("..\\src\\stimulus_b.txt", stim_b_array);
  message = "load stimulus"; 
  for(i=0; i<= 15; i=i+1) begin
    a_tb = stim_a_array[i];
    b_tb = stim_b_array[i];#5;
  end 
  message = "stop simulation";#1;
  $stop;
end
always @(a_tb or b_tb) begin
  $display("a=%b -",a_tb," b=%b -", b_tb," s=%b -", s_tb," c=%b", c_tb);
end
always @(message) begin
  $display("%s", message);
end
always @(c_tb) begin
  message = "CARRY 1 - ";
  $display("%s", message ,"a=%b -",a_tb," b=%b -", b_tb," s=%b -", s_tb," c=%b", c_tb);
end
endmodule
