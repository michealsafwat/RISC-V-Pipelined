module MEMORY(
input wire clk,
input wire reset_n,
input wire RegWriteM,
input wire [1:0] ResultSrcM,
input wire MemWriteM,
input wire [31:0] ALUResult_E_M,
input wire [31:0] WriteDataM,
input wire [11:7] RdM,
input wire [31:0] PCPlus4M,
output wire RegWriteW,
output wire [1:0] ResultSrcW,
output wire [31:0] ReadDataW,
output wire [31:0] ALUResult_M_W,
output wire [11:7] RdW,
output wire [31:0] PCPlus4W

);

wire [31:0] RD;
Data_Mem data_memM(

.clk(clk),
.A(ALUResult_E_M),
.WD(WriteDataM),
.WE(MemWriteM),
.RD(RD)

);


memory_writeback_pipeline memory_pipeline(

.clk(clk),
.reset_n(reset_n),
.RegWriteM(RegWriteM),
.ResultSrcM(ResultSrcM),
.ALUResultM(ALUResult_E_M),
.RD(RD),
.RdM(RdM),
.PCPlus4M(PCPlus4M),
.RegWriteW(RegWriteW),
.ResultSrcW(ResultSrcW),
.ReadDataW(ReadDataW),
.RdW(RdW),
.PCPlus4W(PCPlus4W),
.ALUResultW(ALUResult_M_W)
);


endmodule