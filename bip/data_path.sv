module data_path (
    clk_i,
    rst_i,
    ram_data_i,
    ram_data_o,
    ram_addr_o,
    sela_i,
	selb_i,
	wracc_i,
	op_i,
	operand_i
);

    input logic wracc_i, op_i, selb_i, clk_i, rst_i;
	input logic [1:0] sela_i;
	input logic [10:0] operand_i;
    input logic [15:0] ram_data_i;
    output logic [15:0] ram_data_o;
    output logic [10:0] ram_addr_o; 

    logic [15:0] ext_signal_o, mux2x1_o, mux3x1_o, acc_o, alu_o;

    assign ram_addr_o = operand_i;

    ext_signal ext_signal0 (.s_i(operand_i), .y_o(ext_signal_o));
    mux2x1 mux2x10 (.x0_i(ram_data_i), .x1_i(ext_signal_o), .sel_i(selb_i), .y_o(mux2x1_o));
    mux3x1 mux3x10 (.x0_i(ram_data_i), .x1_i(ext_signal_o), .x2_i(alu_o), .sel_i(sela_i), .y_o(mux3x1_o));
    acc acc0 (.rst_i(rst_i), .x0_i(mux3x1_o), .clk_i(clk_i), .wracc_i(wracc_i), .y_o(ram_data_o));
    alu alu0 (.A_i(ram_data_o), .B_i(mux2x1_o), .opcode_i(op_i), .alu_o(alu_o));

endmodule:data_path