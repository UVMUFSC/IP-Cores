module control_path (
    clk_i,
    rst_i,
    rom_addr_o,
    rom_data_i,
    wrram_o,
    sela_o,
	selb_o,
	wracc_o,
	op_o,
	operand_o,
	enram_o, 
	enrom_o
);

    input logic clk_i, rst_i;
    input logic [15:0] rom_data_i;
    output logic [10:0] rom_addr_o;
    output logic wrram_o, wracc_o, op_o, selb_o, enram_o, enrom_o; 
	output logic [1:0] sela_o;
	output logic [10:0] operand_o;

    logic [4:0] opcode;
    logic wrpc;

    assign opcode = rom_data_i [15:11];
    assign operand_o = rom_data_i [10:0];

    decoder decoder0 (.enrom_o(enrom_o), .enram_o(enram_o), .opcode_i(opcode), .wrpc_o(wrpc), .sela_o(sela_o), .selb_o(selb_o), .wracc_o(wracc_o), .op_o(op_o), .wrram_o(wrram_o));
    pc pc0 (.clk_i(clk_i), .rst_i(rst_i), .en_i(wrpc), .addr_o(rom_addr_o));

endmodule:control_path

