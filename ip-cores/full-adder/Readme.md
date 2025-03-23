# FULL ADDER

## Introduction

The Half-Adder is used to add only two numbers. To overcome this limitation, the Full Adder was developed. The Full Adder is used to add three 1-bit binary numbers: A, B, and the carry C. The Full Adder has three input states and two output states: _sum_ and _carry_.

## Block Diagram

<img src="./imgs/diagrama-bloco.png" alt="Block Diagram" width="400px">

## Truth Table

<img src="./imgs/tabela-vdd.png" alt="Truth Table" width="400px">

## Module Creation

### SystemVerilog Code

```systemverilog
module full_adder(
a_i,
b_i,
carry_i,
sum_o,
carry_o
);

input a_i, b_i, carry_i;
output sum_o, carry_o;
wire w_sum, w_carry1, w_carry2;

half_adder U1(
.a_i(a_i),
.b_i(b_i),
.s_o(w_sum),
.c_o(w_carry1)
);

half_adder U2(
.a_i(w_sum),
.b_i(carry_i),
.s_o(sum_o),
.c_o(w_carry2)
);

    or U3(carry_o, w_carry1, w_carry2);

endmodule
```

## RTL Visualization

<img src="./imgs/RTL.png" alt="RTL Visualization" width="800px">

## Testing

### Testbench Code in SystemVerilog

```systemverilog
`timescale 10ns/100ps

module full_adder_tb;

    reg a_tb, b_tb, carry_i_tb;
    wire sum_tb, carry_o_tb;

    full_adder U0(
        .a_i(a_tb),
        .b_i(b_tb),
        .carry_i(carry_i_tb),
        .sum_o(sum_tb),
        .carry_o(carry_o_tb)
    );

    initial
    begin
      a_tb = 0;
      b_tb = 0;
    carry_i_tb = 0;
      #5;
    a_tb = 0;
      b_tb = 0;
    carry_i_tb = 0;
      #5;
      a_tb = 0;
      b_tb = 1;
      carry_i_tb = 0;
    #5;
      a_tb = 1;
      b_tb = 0;
    carry_i_tb = 0;
      #5;
      a_tb = 1;
      b_tb = 1;
    carry_i_tb = 0;
      #5;
    a_tb = 0;
      b_tb = 0;
    carry_i_tb = 1;
      #5;
    a_tb = 0;
      b_tb = 0;
    carry_i_tb = 1;
      #5;
      a_tb = 0;
      b_tb = 1;
    carry_i_tb = 1;
      #5;
      a_tb = 1;
      b_tb = 0;
    carry_i_tb = 1;
      #5;
      a_tb = 1;
      b_tb = 1;
    carry_i_tb = 1;
      #5;
      $stop;

    end

    always @(a_tb or b_tb or carry_i_tb) $display("a=%b I b=%b I s=%b I c=%b", a_tb, b_tb, sum_tb, carry_o_tb);

endmodule
```

## Resulting Waveform

<img src="./imgs/onda.png" alt="Resulting Waveform" width="800px">

## ModelSim Terminal Display

<img src="./imgs/terminal.png" alt="Terminal" width="200px">

## Considerations

It can be observed from the simulation that the module is functioning correctly, as the Full Adder's truth table matches the results obtained in the tests, both in the waveform and in the terminal output.
