module RISC_V(
input wire clk, reset_n

);

wire [31:0] inst, target,PCD, PCE, PCF, ResultW, RD1E, RD2E,ImmExtE,PCPlus4F,PCPlus4D,PCPlus4W,PCPlus4M ;
wire [31:0] PCPlus4E, ALUResultE, ALUResultM,ALUResultW, ImmExtD, WriteDataM, WriteDataE, ReadDataW, rd1e, rd2e;
wire [1:0] resultsrc,ForwardAE, ForwardBE,ImmSrcD, ResultSrcD, ResultSrcM, ResultSrcW, ResultSrcE,ImmSrcD_cont_D;
wire [1:0] resultsrc_M_W, ResultSrc_C_D, ResultSrc_D_E;
wire [4:0]  RdE, RdM,Rs1D,Rs1E, Rs2D,Rs2E, RdD, rs1e, rs2e, rde, rdm, rdw;
wire [2:0] ALUControlD, ALUControlE, alucontrol_D_E;
wire  RegWriteE, RegWriteM, regwriteW, stallf, stalld, flushd,pcsrc,flushe,RegWriteD_cont,regwrite_M_W, MemWrite_C_D, MemWrite_D_E;
wire jump_D_E, branch_D_E,alusrc_D_E, alusrc_cont_D, regwrite_D_E, regwrite_E_M, JumpD_cont, BranchD_cont, MemWrite_E_M;
wire [31:0] alu_result_E_M, alu_result_M_W, res, pce, write_data_m, resultw;
FETCH fetch_stage(
.clk(clk),
.reset_n(reset_n),
.EN_PC_n(stallf),
.EN_pipeline_n(stalld),
.PCSrcE(pcsrc),
.CLR(flushd),
.PC_Target(target),
.InstrD(inst),
.PCD(PCD),
.PCPlus4D(PCPlus4F)

);

DECODE decode_stage(
.clk(clk),
.reset_n(reset_n),
.InstrD(inst),
.ResultW(resultw),
.PCPlus4F(PCPlus4D),
.RdW(rdw),
.PCD(PCD),
.WE3(regwriteW),
.ImmSrcD(ImmSrcD_cont_D),
.CLR(flushe),
.RegWriteD(RegWriteD_cont),
.ResultSrcD(ResultSrc_C_D),
.MemWriteD(MemWrite_C_D),
.JumpD(JumpD_cont),
.BranchD(BranchD_cont),
.ALUControlD(ALUControlD),
.ALUSrcD(alusrc_cont_D),
.RD1E(rd1e),
.RD2E(rd2e),
.PCE(pce),
.Rs1E(rs1e),
.Rs2E(rs2e),
.RdE(rde),
.ImmExtE(ImmExtD),
.PCPlus4E(PCPlus4D),
.RegWriteE(regwrite_D_E),
.ResultSrcE(ResultSrc_D_E),
.MemWriteE(MemWrite_D_E),
.JumpE(jump_D_E),
.BranchE(branch_D_E),
.ALUControlE(alucontrol_D_E),
.ALUSrcE(alusrc_D_E)

);


EXECUTE execute_stage(
.clk(clk),
.reset_n(reset_n),
.RD1E(rd1e),
.RD2E(rd2e),
.PCE(pce),
.Rs1E(rs1e),
.Rs2E(rs2e),
.RdE(rde),
.ImmExtE(ImmExtD),
.PCPlus4E(PCPlus4D),
.RegWriteE(regwrite_D_E),
.ResultSrcE(ResultSrc_D_E),
.JumpE(jump_D_E),
.BranchE(branch_D_E),
.ALUControlE(alucontrol_D_E),
.ALUSrcE(alusrc_D_E),
.MemWriteE(MemWrite_D_E),
.ResultW(resultw),
.ForwardAE(ForwardAE),
.ForwardBE(ForwardBE),
.PCSrcE(pcsrc),
.MemWriteM(MemWrite_E_M),
.ALUResultM(res),
.WriteDataM(write_data_m),
.RdM(rdm),
.PCPlus4M(PCPlus4E),
.PCTargetE(target),
.RegWriteM(regwrite_E_M),
.ResultSrcM(resultsrc)

);

MEMORY memory_stage(
.clk(clk),
.reset_n(reset_n),
.RegWriteM(regwrite_E_M),
.ResultSrcM(resultsrc),
.MemWriteM(MemWrite_E_M),
.ALUResult_E_M(res),
.WriteDataM(write_data_m),
.RdM(rdm),
.PCPlus4M(PCPlus4M),
.RegWriteW(regwrite_M_W),
.ResultSrcW(resultsrc_M_W),
.ReadDataW(ReadDataW),
.ALUResult_M_W(alu_result_M_W),
.RdW(rdw),
.PCPlus4W(PCPlus4W)

);


WRITE_BACK write_back_stage(

.RegWrite_M_W(regwrite_M_W),
.ResultSrcW(resultsrc_M_W),
.ALUResultW(alu_result_M_W),
.ReadDataW(ReadDataW),
.RdW(rdw),
.RegWriteW(regwriteW),
.PCPlus4W(PCPlus4W),
.ResultW(resultw)
);



Control_Unit control_unit (
.funct_7(inst[30]),
.funct_3(inst[14:12]),
.op(inst[6:0]),
.BranchD(BranchD_cont),
.ResultSrcD(ResultSrc_C_D),
.MemWriteD(MemWrite_C_D),
.ALUSrcD(alusrc_cont_D),
.ImmSrcD(ImmSrcD_cont_D),
.JumpD(JumpD_cont),
.RegWriteD(RegWriteD_cont),
.ALUControlD(ALUControlD)
    );


Hazard_Unit hazard_unit(
.Rs1D(inst[19:15]),
.Rs2D(inst[24:20]),
.Rs1E(rs1e),
.Rs2E(rs2e),
.RdE(rde),
.PCSrcE(pcsrc),
.ResultSrcE_0(ResultSrc_D_E[0]),
.RdM(rdm),
.RegWriteM(regwrite_E_M),
.RdW(rdw),
.RegWriteW(regwriteW),
.StallF(stallf),
.StallD(stalld),
.FlushD(flushd),
.FlushE(flushe),
.ForwardAE(ForwardAE),
.ForwardBE(ForwardBE)
);


endmodule    