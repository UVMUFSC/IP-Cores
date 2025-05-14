module ram ( 
	clk_i,
	wrram_i,
	enram_i,
	addr_i,
	data_i,
	data_o
);


	input logic wrram_i, enram_i, clk_i;
	input logic [15:0] data_i;
	input logic [10:0] addr_i;
	output logic [15:0] data_o;

	logic [15:0] memory [0:2047];
  
  always_ff @(posedge clk_i) begin: memory_logic

    if (enram_i) begin
      if (wrram_i) begin
        memory[addr_i] = data_i;
      end
    end

  end: memory_logic
    
  assign data_o = memory[addr_i];

endmodule:ram