module decoder(
	opcode_i,
	wrpc_o,
	sela_o,
	selb_o,
	wracc_o,
	op_o,
	wrram_o,
	enram_o,
	enrom_o
);

	localparam logic [4:0]
	NOP  = 5'b00000,
	STO  = 5'b00001,
	LD   = 5'b00010,
	LDI  = 5'b00011,
	ADD  = 5'b00100,
	ADDI = 5'b00101,
	SUB  = 5'b00110,
	SUBI = 5'b00111;

	input logic [4:0] opcode_i;
	output logic [1:0] sela_o;
	output logic wrram_o, enram_o, enrom_o, wracc_o, op_o, selb_o, wrpc_o;

	always_comb begin : decoder_logic

		case(opcode_i)

			NOP: begin
				wrpc_o = 1'b1;
				sela_o = 2'b00;
				selb_o = 1'b0;
				wracc_o = 1'b0;
				op_o = 1'b0;
				wrram_o = 1'b0;
				enram_o = 1'b0;
				enrom_o = 1'b1;
			end

			STO: begin
				wrpc_o = 1'b1;
				sela_o = 2'b00;
				selb_o = 1'b0;
				wracc_o = 1'b0;
				op_o = 1'b0;
				wrram_o = 1'b1;
				enram_o = 1'b1;
				enrom_o = 1'b1;
			end

			LD: begin
				wrpc_o = 1'b1;
				sela_o = 2'b00;
				selb_o = 1'b0;
				wracc_o = 1'b1;
				op_o = 1'b0;
				wrram_o = 1'b0;
				enram_o = 1'b1;
				enrom_o = 1'b1;
			end

			LDI: begin
				wrpc_o = 1'b1;
				sela_o = 2'b01;
				selb_o = 1'b1;
				wracc_o = 1'b1;
				op_o = 1'b0;
				wrram_o = 1'b0;
				enram_o = 1'b0;
				enrom_o = 1'b1;
			end

			ADD: begin
				wrpc_o = 1'b1;
				sela_o = 2'b10;
				selb_o = 1'b0;
				wracc_o = 1'b1;
				op_o = 1'b1;
				wrram_o = 1'b0;
				enram_o = 1'b1;
				enrom_o = 1'b1;
			end

			ADDI: begin
				wrpc_o = 1'b1;
				sela_o = 2'b10;
				selb_o = 1'b1;
				wracc_o = 1'b1;
				op_o = 1'b1;
				wrram_o = 1'b0;
				enram_o = 1'b0;
				enrom_o = 1'b1;
			end

			SUB: begin
				wrpc_o = 1'b1;
				sela_o = 2'b10;
				selb_o = 1'b0;
				wracc_o = 1'b1;
				op_o = 1'b0;
				wrram_o = 1'b0;
				enram_o = 1'b1;
				enrom_o = 1'b1;
			end

			SUBI: begin
				wrpc_o = 1'b1;
				sela_o = 2'b10;
				selb_o = 1'b1;
				wracc_o = 1'b1;
				op_o = 1'b0;
				wrram_o = 1'b0;
				enram_o = 1'b0;
				enrom_o = 1'b1;
			end

			default: begin
				wrpc_o = 1'b0;
				sela_o = 2'b00;
				selb_o = 1'b0;
				wracc_o = 1'b0;
				op_o = 1'b0;
				wrram_o = 1'b0;
				enram_o = 1'b0;
				enrom_o = 1'b1;
			end

		endcase
		
	end:decoder_logic

endmodule:decoder