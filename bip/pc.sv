module pc (
  clk_i,
  rst_i,
  en_i,
  addr_o
);

  input logic clk_i, rst_i, en_i;
  output logic [10:0] addr_o;

  always_ff @(posedge clk_i or posedge rst_i) begin:pc_logic

    if (rst_i) begin
      addr_o <= 11'b0;      
    end

    else if (en_i) begin;
        addr_o <= addr_o + 1'b1;
    end 
    
  end:pc_logic

endmodule:pc