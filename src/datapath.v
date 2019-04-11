`include "immgen.v"
`include "alu.v"
`include "regfile.v"

module datapath(input             clk, reset,
                input             memtoreg, pcsrc,
                input             alusrc, 
                input             regwrite,
                input  [3:0]      alu_operation,
                output            zero,              
                output reg [63:0] pc,
                input  [31:0]     instruction,
                output [63:0]     alu_result, read_data2,
                input  [63:0]     read_data);

  wire [4:0]  writereg;
  wire [63:0] pcnext, pcplus4, pcbranch;
  wire [63:0] read_data1, select_data;
  wire [63:0] result;

  wire [63:0] imm64, imm64_shiftleft1;

  immgen igen (instruction, imm64);

  assign imm64_shiftleft1 = {imm64[62:0], 1'b0};

  assign pcbranch = pc + imm64_shiftleft1;

  assign pcplus4 = pc + 64'b100; 

  assign pcnext = pcsrc ? pcbranch : pcplus4;

  always @(posedge clk, posedge reset)
    if (reset) pc <= 0;
    else       pc <= pcnext;

  regfile rf(clk, 
             regwrite, 
             instruction[19:15], instruction[24:20], instruction[11:7],
             result, 
             read_data1, read_data2);
                
  assign select_data = alusrc ? imm64 : read_data2;

  alu alu(alu_operation, read_data1, select_data,  alu_result, zero);

  assign result = memtoreg ? read_data : alu_result;  

endmodule