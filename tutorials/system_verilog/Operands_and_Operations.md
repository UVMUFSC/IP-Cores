# Operands and Operations

In System Verilog, the operations can be separated in two ways, wich will be described next.

## Structure Level (Gate Level Modeling)

Here, only the bitwise operations, like AND, NOT and OR can be performed.

```systemverilog
module example (o1, o2, o3, i1, i2);

input wire i1, i2;
output wire o1;

and(o1, i1, i2);  // AND operation
or(o2, i1, i2);   // OR operations
not(o3, i1);     // NOT operation

endmodule
```

## Dataflow level

In dataflow level, arithmetic, comparison and shift operations are allowed.
It is necessary to use the ```systemverilog assign ``` keyword to assign one of the operations quoted above to a variable.

```systemverilog
module example (o1, o2, o3, o4 i1, i2);

input wire i1, i2;
output wire o1, 02, 03, 04;

assign o1 = i1 && i2;  // logic operation
assign o2 = i1 + i2;    // arithmetic operation
assign o3 = i1 << 2;   // shift operation
assign o4 = (i1 == i2); // compariosn operation

endmodule
```

## Behavioral Level

In behavioral level, the keyowrds ```systemverilog always ``` and ```systemverilog intial ``` are commonly used to describe sequencial modeling.
When using ```systemverilog always ```, it describes a continuous behaviour for combinational circuits. Its argument is a sensitive list made with signals that when changed, trigger the execution of the block.
The keyword ```systemverilog intial ``` is used in System Verilog to initialize values at the start of simulation. It runs once at the beginning of simulation to set initial conditions for variables.
These are called procedural blocks.

```systemverilog
module example (clk, d, q);

input wire clk, d,
output reg q;

initial 
begin
    q = 0; 
end

always @(posedge clk) 
begin
    q <= d;
end
endmodule


