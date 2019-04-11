`include "riscvtop.v"

module testbench();

  reg         clk;
  reg         reset;

  wire [63:0] write_data, address;
  wire memwrite;

  top dut(clk, reset, write_data, address, memwrite);

  initial
    begin
      $dumpfile("riscvtest.vcd");
      $dumpvars(0, dut);

      $monitor("%b, %h, %h", dut.riscv.instruction, dut.dmem.address, dut.dmem.write_data);

      reset <= 1; # 20; reset <= 0;

      # 200 //wait

      $finish;
    end

  // generate clock
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

endmodule



