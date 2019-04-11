`include "alu.v"

module testbench();
  reg [3:0]   alu_operation;
  reg [63:0]  input_data1;
  reg [63:0]  input_data2;
  wire [63:0] alu_result;
  wire zero;

  alu testalu(alu_operation, input_data1, input_data2, alu_result, zero);

  initial
    begin
      $dumpfile("alu_test.vcd");
      $dumpvars(0, testalu);

      $monitor("%b, %b", alu_result, zero);
      
      input_data1 = 3; input_data2 = 4; alu_operation = 4'b0000; #10;//and
      input_data1 = 3; input_data2 = 3; alu_operation = 4'b0010; #10;//add
      input_data1 = 5; input_data2 = 5; alu_operation = 4'b0110; #10;//sub
      input_data1 = 3; input_data2 = 4; alu_operation = 4'b0001; #10;//or
      input_data1 = 3; input_data2 = 3; alu_operation = 4'b1000; #10;//(default)

      $finish;
    end
endmodule
