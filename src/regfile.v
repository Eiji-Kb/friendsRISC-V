module regfile(input         clk, 
               input         reg_write,
               input  [4:0]  read_register1, read_register2, write_register,
               input  [63:0] write_data,
               output [63:0] read_data1, read_data2);

  reg[63:0] register[31:0];

  always @(posedge clk)
    if (reg_write) register[write_register] <= write_data;

  assign read_data1 = (read_register1 != 0) ? register[read_register1] : 0;
  assign read_data2 = (read_register2 != 0) ? register[read_register2] : 0;

endmodule