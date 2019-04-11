module alucontrolunit (input [1:0] aluop,
                       input [2:0] funct3,
                       input [6:0] funct7,
                       output reg[3:0] alucontrol);

  wire [9:0] funct;
  assign funct = {funct7[6:0],funct3[2:0]};

  always @(*)
    case(aluop)
      2'b00: alucontrol = 4'b0010; //ld sd
      2'b01: alucontrol = 4'b0110; //beq
      default: case(funct)
        10'b0000000000: alucontrol= 4'b0010; //add
        10'b0100000000: alucontrol= 4'b0110; //sub
        10'b0000000111: alucontrol= 4'b0000; //and
        10'b0000000110: alucontrol= 4'b0001; //or
        default: alucontrol = 4'bxxxx;
      endcase
    endcase
endmodule