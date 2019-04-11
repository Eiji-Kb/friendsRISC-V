module dmem(input         clk, memwrite,
            input  [63:0] address,
            input  [63:0] write_data,
            output [63:0] read_data);

  reg [63:0] RAM[63:0];

  initial
    begin
      $readmemh("dmemfileH_loop.dat",RAM);
    end

  assign read_data = RAM[address];

  always @(posedge clk)
    if (memwrite)
      RAM[address] <= write_data;

endmodule



module imem(input  [63:0] address,
            output [31:0] read_data);

  reg [31:0] RAM[63:0];

  initial
    begin
      $readmemb("imemfileB_loop.dat",RAM);
    end

  assign read_data = RAM[address];
endmodule
