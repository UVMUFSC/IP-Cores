module rom #(parameter FILE_NAME = "memory_rom.bin")(
	clk_i,
	addr_i,
	data_o
);

	input logic clk_i;
	input logic [10:0] addr_i;
	output logic [15:0] data_o;
	
	logic [15:0] memory [0:2047];
	
	initial begin: reading_file
		$readmemb(FILE_NAME, memory);
	end:reading_file
	 
	 assign data_o = memory[addr_i];
	
endmodule:rom