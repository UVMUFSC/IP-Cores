# Testbench

To create a testbench in SystemVerilog, you first need to instantiate the module you're testing. You'll define input signals to provide values and observe the outputs of the module. You can also generate a clock if needed, using an always block. The testbench generally runs inside an initial block to apply stimuli and monitor the results.

```systemverilog
module example_and(i1, i2, o1);

input wire i1, i2;
output reg o2

assign o1 = i1 & i2;  // AND operation

endmodule

module tb_example_and;

reg I1, I2;
wire O2

example_and and1 (.i1(I1), .i2(I2), .o1(O1));

initial 
begin

I1 = 1'b0;
I2 = 1'b0;
#10;  // Wait 10 time units
$display("I1=%b, I2=%b, O1=%b", I1, I2, O1);
        
I1 = 1'b0;
I2 = 1'b1;
#10;  // Wait 10 time units
$display("I1=%b, I2=%b, O1=%b", I1, I2, O1);

I1 = 1'b1;
I2 = 1'b0;
#10;  // Wait 10 time units
$display("I1=%b, I2=%b, O1=%b", I1, I2, O1);

I1 = 1'b1;
I2 = 1'b1;
#10;  // Wait 10 time units
$display("I1=%b, I2=%b, O1=%b", I1, I2, O1);

$finish; // End simulation

end

endmodule
```
In this testbench a AND module was created, and right below a testbench module for that AND module. In the testbench, we provided some inputs, with some time between them, with the objective of testing if the inputs will provide the desired outputs.
Also, some system functions were used, like ```$display``` and ```$finish```. The ```$``` symbol represents a system function, and are more functions that can be useful while testbenching, like ```$monitor```, wich works like ```$display``` but it only shows the argument of the function in the console when a variable changes, and ```$time``` wich represents the current time of the simulation in that moment.