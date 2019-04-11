module controlunit (input [6:0] opcode,
                    output alusrc, memtoreg, regwrite, memread, memwrite, branch, 
                    output [1:0] aluop);

  reg[7:0] controls;

  assign {alusrc, memtoreg, regwrite, memread, memwrite, branch, aluop} = controls;

  always @(*)
    case (opcode)
      7'b0110011 : controls = 8'b00100010; //R type 
      7'b0000011 : controls = 8'b11110000; //I type(ld)
      7'b0100011 : controls = 8'b10001000; //S type(sd)
      7'b1100011 : controls = 8'b00000101; //B type(beq) 
      default :  controls = 8'bxxxxxxxx; 
    endcase
endmodule