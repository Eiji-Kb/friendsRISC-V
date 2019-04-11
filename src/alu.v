module alu(input [3:0]       alu_operation,
           input [63:0]      input_data1,
           input [63:0]      input_data2,
           output reg [63:0] alu_result,
           output zero);

  always @(*) 
    case (alu_operation)
      4'b0000 : alu_result = input_data1 & input_data2; //`ALU_OP_AND
      4'b0001 : alu_result = input_data1 | input_data2; //`ALU_OP_OR
      4'b0010 : alu_result = input_data1 + input_data2; //`ALU_OP_ADD
      4'b0110 : alu_result = input_data1 - input_data2; //`ALU_OP_SUB
      default : alu_result = 0;
    endcase

  assign zero = (alu_result == 64'b0);

endmodule