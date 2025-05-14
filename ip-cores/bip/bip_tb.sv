module bip_tb;

  logic clk = 0;
  logic rst = 1; // Start reseting the bip processor

  bip #(.FILE_NAME("memory_rom.bin")) bip0(.clk_i(clk), .rst_i(rst));

  initial forever begin
    #5ns clk = ~clk;
  end     
    
  initial begin
    #3ns rst = ~rst;
  end
    
  initial forever begin
    #10ns;
    $display("---------------");
    $display("Acumulador: %0d", $signed(bip0.cpu0.data_path0.acc0.y_o));
    $display("---------------");  
    $display("               ");
    $display("---------------");  
    for (int i = 0; i < 6; i++) begin
			$display("Memory[%0d]: %h", i, bip0.ram0.memory[i]);
    end
    $display("---------------");
    $display("               ");
  end
   
endmodule:bip_tb