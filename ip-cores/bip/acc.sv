module acc (
    x0_i,
    wracc_i,
    clk_i,
    rst_i,
    y_o
);

    input logic [15:0] x0_i;
    input logic wracc_i, clk_i, rst_i;
    output logic [15:0] y_o;

    always_ff @(posedge clk_i or posedge rst_i) begin:acc_logic

        if (rst_i) begin:rst_logic
          y_o <= 0;
        end:rst_logic
        
        else if(wracc_i) begin:wracc_logic
            y_o <= x0_i;
        end:wracc_logic

    end:acc_logic

endmodule:acc