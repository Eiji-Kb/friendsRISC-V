module immgen(
                input [31:0]        inst,
                output reg [63:0]   imm
                );

  wire [63:0] imm_i,imm_s,imm_b;

  assign imm_i = { {53{inst[31]}}, inst[30:20] };
  assign imm_s = { {53{inst[31]}}, inst[30:25], inst[11:7] };
  assign imm_b = { {53{inst[31]}}, inst[7], inst[30:25], inst[11:8] };
 
  always @(*) 
    case (inst[6:2])
      5'b00000 : imm = imm_i;
      5'b01000 : imm = imm_s;
      5'b11000 : imm = imm_b;
      default : imm = 64'hxxxxxxxxxxxxxxxx;
    endcase

endmodule
