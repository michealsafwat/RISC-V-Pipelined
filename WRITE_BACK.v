module WRITE_BACK(

input wire RegWrite_M_W,
input wire [1:0] ResultSrcW,
input wire [31:0] ALUResultW,
input wire [31:0] ReadDataW,
input wire [11:7] RdW,
input wire [31:0] PCPlus4W,
output wire RegWriteW,
output wire [31:0] ResultW


);
assign RegWriteW = RegWrite_M_W;
 MUX_3x1 muxW(
.in1(ALUResultW),
.in2(ReadDataW), 
.in3(PCPlus4W), 
.select(ResultSrcW),
.out(ResultW)
);











endmodule