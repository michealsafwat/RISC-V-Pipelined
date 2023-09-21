module Main_Decoder(
    input wire [6:0] op,
    output reg [1:0] ALUOp,
    output reg Branch,
    output reg [1:0] ResultSrc,
    output reg MemWrite,
    output reg ALUSrc,
    output reg [1:0] ImmSrc,
    output reg Jump,
    output reg RegWrite
);


always @(*) begin
  case (op)
  7'b0000011 : {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b10010010000;
  7'b0100011 : {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b00111000000;
  7'b0110011 : {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b10000000100;
  7'b1100011 : {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b01000001010;
  7'b0010011 : {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b10010000100;
  7'b1101111 : {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b11100100001;
  default : {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b00000000000;
  endcase
   
end


endmodule