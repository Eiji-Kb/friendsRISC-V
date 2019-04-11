`include "riscv.v"
`include "riscvmem.v"

module top(input         clk, reset, 
           output [63:0] write_data, address, 
           output        memwrite);

  wire [31:0] instruction;
  wire [63:0] pc, read_data;
  
  riscv riscv(clk, reset, pc, instruction, memwrite, address, write_data, read_data);
  imem imem(pc, instruction);
  dmem dmem(clk, memwrite, address, write_data, read_data);

endmodule
