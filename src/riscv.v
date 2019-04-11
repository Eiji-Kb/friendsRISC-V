// 🐾Friends RISC-V

`include "controller.v"
`include "datapath.v"

module riscv(input         clk, reset,
             output [63:0] pc,
             input  [31:0] instruction,
             output        memwrite,
             output [63:0] alu_result,  write_data,
             input  [63:0] read_data);

  wire        memtoreg, pcsrc, zero, alusrc, regwrite;
  wire [3:0]  alu_operation;

  controller c(instruction[6:0],      //opcode
               instruction[14:12],    //funct3
               instruction[31:25],    //funct7
               zero,
               memtoreg, memwrite, memread,
               pcsrc,
               alusrc, regwrite,
               alu_operation);

  datapath dp(clk, reset, 
              memtoreg, pcsrc,
              alusrc,
              regwrite, 
              alu_operation,
              zero,
              pc,
              instruction,
              alu_result,  write_data,
              read_data);

endmodule