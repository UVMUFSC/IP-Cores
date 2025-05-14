module bip #(parameter FILE_NAME = "memory_rom.bin")(
    clk_i,
    rst_i
);

    input logic clk_i, rst_i;
    logic [10:0] ram_addr, rom_addr;
    logic [15:0] ram_data_a, ram_data_b, rom_data;
    logic wrram, enram;

    ram ram0 (.clk_i(clk_i), .enram_i(enram), .wrram_i(wrram), .addr_i(ram_addr), .data_i(ram_data_a), .data_o(ram_data_b));

    rom #(.FILE_NAME(FILE_NAME)) rom0 (.clk_i(clk_i), .addr_i(rom_addr), .data_o(rom_data));
        
    cpu cpu0 (.enrom_o(enrom), .enram_o(enram), .clk_i(clk_i), .rst_i(rst_i), .rom_addr_o(rom_addr), .rom_data_i(rom_data), .ram_addr_o(ram_addr), .ram_data_i(ram_data_b), .ram_data_o(ram_data_a), .wrram_o(wrram));

endmodule:bip