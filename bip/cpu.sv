module cpu (
    clk_i,
    rst_i,
    rom_addr_o,
    rom_data_i,
    ram_addr_o,
    ram_data_i,
    ram_data_o,
    wrram_o,
    enram_o,
    enrom_o
);


    input logic clk_i, rst_i;
    input logic [15:0] ram_data_i, rom_data_i;
    output logic [10:0] ram_addr_o, rom_addr_o;
    output logic [15:0] ram_data_o;
    output logic wrram_o, enram_o, enrom_o;
	 
	logic [1:0] sela;
    logic selb, wracc, op;
    logic [10:0] operand;

    control_path control_path0 (.enrom_o(enrom_o), .enram_o(enram_o), .clk_i(clk_i), .rst_i(rst_i), .rom_addr_o(rom_addr_o),.rom_data_i(rom_data_i), .wrram_o(wrram_o), 
								.sela_o(sela), .selb_o(selb), .wracc_o(wracc), .op_o(op), .operand_o(operand));
    data_path data_path0 (.rst_i(rst_i), .clk_i(clk_i), .ram_data_i(ram_data_i), .ram_data_o(ram_data_o), .ram_addr_o(ram_addr_o), 
						.sela_i(sela), .selb_i(selb), .wracc_i(wracc), .op_i(op), .operand_i(operand));

endmodule:cpu