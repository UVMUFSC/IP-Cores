# FULL ADDER

## Introdução

O Half-Adder é utilizado para somar apenas dois números. Para superar essa limitação, o Full Adder foi desenvolvido. O Full Adder é usado para somar três números binários de 1 bit: A, B e o carry C. O Full Adder possui três estados de entrada e dois estados de saída: _sum_ e _carry_.

## Diagrama de Bloco

<img src="./imgs/diagrama-bloco.png" alt="Diagrama de Bloco" width="400px">

## Tabela Verdade

<img src="./imgs/tabela-vdd.png" alt="Tabela Verdade" width="400px">

## Criação do Módulo

### Código em SystemVerilog

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

## Visualização RTL

<img src="./imgs/RTL.png" alt="Visualização RTL" width="800px">

## Teste

### Código Testbench em SystemVerilog

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

## Forma de Onda Resultante

<img src="./imgs/onda.png" alt="Forma de onda resultante" width="800px">

## Display no Terminal do ModelSim

<img src="./imgs/terminal.png" alt="Terminal" width="200px">

## Considerações

Nota-se pela simulação que o módulo está em funcionamento, dado que a tabela verdade do Full Adder está de acordo com o resultado obtido nos testes, tanto a forma de onda, quanto o resultado escrito no terminal.
