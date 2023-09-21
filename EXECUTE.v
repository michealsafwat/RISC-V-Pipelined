module EXECUTE(
input wire clk,
input wire reset_n,
input wire [31:0] RD1E,
input wire [31:0] RD2E,
input wire [31:0] PCE,
input wire [19:15] Rs1E,
input wire [24:20] Rs2E,
input wire [11:7] RdE,
input wire [31:0] ImmExtE,
input wire [31:0] PCPlus4E,
input wire RegWriteE,
input wire [1:0] ResultSrcE,
input wire JumpE,
input wire BranchE,
input wire [2:0] ALUControlE,
input wire ALUSrcE,
input wire MemWriteE,
input wire [31:0] ResultW,
input wire [1:0] ForwardAE,
input wire [1:0] ForwardBE,
output wire PCSrcE,
//output wire ZeroE,
output wire [31:0] ALUResultM,
output wire [31:0] WriteDataM,
output wire [11:7] RdM,
output wire [31:0] PCPlus4M,
output wire [31:0] PCTargetE,
output wire RegWriteM,
output wire [1:0] ResultSrcM,
output wire MemWriteM

);

wire [31:0] SrcAE, SrcBE, WriteDataE, Result;
wire ZeroE;
 assign PCSrcE = (BranchE & ZeroE) | JumpE;


MUX_3x1 mux_1E (
.in1(RD1E),
.in2(ResultW), 
.in3(ALUResultM), 
.select(ForwardAE),
.out(SrcAE)
);



MUX_3x1 mux_2E (
.in1(RD2E),
.in2(ResultW), 
.in3(ALUResultM), 
.select(ForwardBE),
.out(WriteDataE)
);


 MUX_2x1 mux2x1E (
.in1(WriteDataE),
.in2(ImmExtE), 
.select(ALUSrcE),
.out(SrcBE)
);


ALU aluE(

    .SrcA(SrcAE),
    .SrcB(SrcBE),
    .ALUControl(ALUControlE),
    .Zero(ZeroE),
    .ALUResult(Result)
);

 ADDER adderE(
.a(PCE),
.b(ImmExtE),
.sum(PCTargetE)
);


execute_memory_pipeline executr_pipeline(

.clk(clk),
.reset_n(reset_n),
.ALUResultE(Result),
.WriteDataE(WriteDataE),
.PCPlus4E(PCPlus4E),
.RdE(RdE),
.RegWriteE(RegWriteE),
.ResultSrcE(ResultSrcE),
.MemWriteE(MemWriteE),
.RegWriteM(RegWriteM),
.ResultSrcM(ResultSrcM),
.MemWriteM(MemWriteM),
.ALUResultM(ALUResultM),
.WriteDataM(WriteDataM),
.RdM(RdM),
.PCPlus4M(PCPlus4M)

);
endmodule