module DECODE(
input wire clk,
input wire reset_n,
input [31:0] InstrD,
input [31:0] ResultW,
input [31:0] PCPlus4F,
input [31:0] PCD,
input [4:0] RdW,
input wire WE3,
input wire [1:0] ImmSrcD,
input wire CLR,
input wire RegWriteD,
input wire [1:0] ResultSrcD,
input wire MemWriteD,
input wire JumpD,
input wire BranchD,
input wire [2:0] ALUControlD,
input wire ALUSrcD,
output wire [31:0] RD1E,
output wire [31:0] RD2E,
output wire [31:0] PCE,
output wire [4:0] Rs1E,
output wire [4:0] Rs2E,
output wire [4:0] RdE,
output wire [31:0] ImmExtE,
output wire [31:0] PCPlus4E,
output wire RegWriteE,
output wire [1:0] ResultSrcE,
output wire MemWriteE,
output wire JumpE,
output wire BranchE,
output wire [2:0] ALUControlE,
output wire ALUSrcE

);

wire [31:0] rd1, rd2, ext;


Reg_File regfileD(
.A1(InstrD[19:15]),
.A2(InstrD[24:20]),
.A3(RdW),
.WD3(ResultW),
.clk(clk),
.rst(reset_n),
.WE3(WE3),
.RD1(rd1),
.RD2(rd2)

);

EXTEND extendD (
.Inst(InstrD[31:7]),
.ImmSrc(ImmSrcD),
.ImmExt(ext)

);

decode_execute_pipeline decode_pipeline (

.clk(clk),
.reset_n(reset_n),
.RegWriteD(RegWriteD),
.ResultSrcD(ResultSrcD),
.MemWriteD(MemWriteD),
.JumpD(JumpD),
.BranchD(BranchD),
.ALUControlD(ALUControlD),
.ALUSrcD(ALUSrcD),
.CLR(CLR),

.RD1(rd1),
.RD2(rd2),
.PCD(PCD),
.Rs1D(InstrD[19:15]),
.Rs2D(InstrD[24:20]),
.RdD(InstrD[11:7]),
.ImmExtD(ext),
.PCPlus4D(PCPlus4F),


.RegWriteE(RegWriteE),
.ResultSrcE(ResultSrcE),
.MemWriteE(MemWriteE),
.JumpE(JumpE),
.BranchE(BranchE),
.ALUControlE(ALUControlE),
.ALUSrcE(ALUSrcE),

.RD1E(RD1E),
.RD2E(RD2E),
.PCE(PCE),
.Rs1E(Rs1E),
.Rs2E(Rs2E),
.RdE(RdE),

.ImmExtE(ImmExtE),
.PCPlus4E(PCPlus4E)

);

endmodule