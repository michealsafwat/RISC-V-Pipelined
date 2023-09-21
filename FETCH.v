module FETCH(
input wire clk,
input wire reset_n,
input wire EN_PC_n,
input wire EN_pipeline_n,
input wire PCSrcE,
input wire CLR,
input wire [31:0] PC_Target,
output wire [31:0] InstrD,
output wire [31:0] PCD,
output wire [31:0] PCPlus4D

);


wire [31:0] pcout, pc_in,instr_RD,PCPlus4F;

Inst_Mem instr_memF (
.PC_OUT(pcout),
.Instr(instr_RD)

);

PC pcF (

.PC_IN(pc_in),
.clk(clk),
.rst(reset_n),
.EN(EN_PC_n),
.PC_OUT(pcout)

);

PC_ADDER add_pcF (

.PC(pcout),
.PCPlus4(PCPlus4F)

);

MUX_2x1 pc_muxF (

.in1(PCPlus4F),
.in2(PC_Target), 
.select(PCSrcE),
.out(pc_in)

);

fetch_decode_pipeline pipeline_fetch(
.clk(clk),
.reset_n(reset_n),
.PCF(pcout),
.PCPlus4F(PCPlus4F),
.EN_n(EN_pipeline_n),
.CLR(CLR),
.instr_RD(instr_RD),
.InstD(InstrD),
.PCD(PCD),
.PCPlus4D(PCPlus4D)

);
endmodule