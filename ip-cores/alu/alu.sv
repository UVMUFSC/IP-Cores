/*
	Produced by: Bruno Binelli, Bruno Carboni, Eduardo Zambotto, Julio Cezar;
	Date created - 26/03/2025;
	Description - Arithmetic Logic Unit (ALU)
*/

typedef enum logic [3:0] {
    INC    = 4'b0000,  // Increment A
    DEC    = 4'b0001,  // Decrement A
    ADD    = 4'b0010,  // Add A to B
    ADD_C  = 4'b0011,  // Add A to B with carry-in
    SUB_B  = 4'b0100,  // Subtraction with borrow
    SUB    = 4'b0101,  // Subtraction
    SHIFT_R= 4'b0110,  // Right shift
    SHIFT_L= 4'b0111,  // Left shift
    AND_OP = 4'b1000,  // A AND B
    NAND   = 4'b1001,  // A NAND B
    OR     = 4'b1010,  // A OR B
    NOR    = 4'b1011,  // A NOR B
    XOR    = 4'b1100,  // A XOR B
    XNOR   = 4'b1101,  // A XNOR B
    NOT    = 4'b1110,  // Bitwise NOT A
    TRF_A  = 4'b1111   // Transfer A
} opcode_t;

module alu #(parameter N = 8)(
    input  logic [N-1:0] A_i, B_i, // Two basic operands
    input  opcode_t      opcode_i, // Selection of opcode
    output logic [N-1:0] alu_o,    // Result of the operation
    output logic         carry_o   // Carry of the operation
);

    logic [N:0] tmp; // tmp will store the operantion result
	 
    always_comb begin
        tmp = 0; 
        case (opcode_i)
            INC:    tmp = {1'b0, A_i} + 1;
            DEC:    tmp = {1'b0, A_i} - 1;
            ADD:    tmp = {1'b0, A_i} + {1'b0, B_i};
            ADD_C:  tmp = {1'b0, A_i} + {1'b0, B_i} + 1;
            SUB_B:  tmp = {1'b0, A_i} - {1'b0, B_i};
            SUB:    tmp = {1'b0, A_i} - {1'b0, B_i} - 1;
            SHIFT_R: tmp = {1'b0, A_i >> B_i};
            SHIFT_L: tmp = {1'b0, A_i << B_i};
            AND_OP: tmp = {1'b0, A_i & B_i};
            NAND:   tmp = {1'b0, ~(A_i & B_i)};
            OR:     tmp = {1'b0, A_i | B_i};
            NOR:    tmp = {1'b0, ~(A_i | B_i)};
            XOR:    tmp = {1'b0, A_i ^ B_i};
            XNOR:   tmp = {1'b0, ~(A_i ^ B_i)};
            NOT:    tmp = {1'b0, ~A_i};       
            TRF_A:  tmp = {1'b0, A_i};
            default: tmp = 0;
        endcase
        alu_o   = tmp[N-1:0]; // store the result
        carry_o = tmp[N]; // store the carry                     
    end 

endmodule

