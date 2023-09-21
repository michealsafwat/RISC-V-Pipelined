module decode_execute_pipeline(
input wire clk,
input wire reset_n,
input wire RegWriteD,
input wire [1:0] ResultSrcD,
input wire MemWriteD,
input wire JumpD,
input wire BranchD,
input wire [2:0] ALUControlD,
input wire ALUSrcD,
input wire CLR,

input wire [31:0] RD1,
input wire [31:0] RD2,
input wire [31:0] PCD,
input wire [4:0] Rs1D,
input wire [4:0] Rs2D,
input wire [4:0] RdD,
input wire [31:0] ImmExtD,
input wire [31:0] PCPlus4D,

output reg RegWriteE,
output reg [1:0] ResultSrcE,
output reg MemWriteE,
output reg JumpE,
output reg BranchE,
output reg [2:0] ALUControlE,
output reg ALUSrcE,

output reg [31:0] RD1E,
output reg [31:0] RD2E,
output reg [31:0] PCE,
output reg [4:0] Rs1E,
output reg [4:0] Rs2E,
output reg [4:0] RdE,

output reg [31:0] ImmExtE,
output reg [31:0] PCPlus4E

);


always @(posedge clk or negedge reset_n  ) begin
 if (!reset_n) 
begin

RegWriteE <= 1'b0;
ResultSrcE <= 2'b0;
MemWriteE <= 1'b0;
JumpE <= 1'b0;
BranchE <= 1'b0;
ALUControlE <= 3'b0;
ALUSrcE <= 1'b0;

 RD1E <= 32'b0;
 RD2E <= 32'b0;
 PCE <= 32'b0;
 Rs1E <= 5'b0;
 Rs2E <= 5'b0;
 RdE <= 5'b0;

 ImmExtE <= 32'b0;
 PCPlus4E <= 32'b0;
end

else if (CLR)
begin
RegWriteE <= RegWriteD;
ResultSrcE <= ResultSrcD;
MemWriteE <= MemWriteD;
JumpE <= JumpD;
BranchE <= BranchD;
ALUControlE <= ALUControlD;
ALUSrcE <= ALUSrcD;

RD1E <= RD1;
 RD2E <= RD2;
 PCE <= PCD;
 Rs1E <= Rs1D;
 Rs2E <= Rs2D;
 RdE <= RdD;

 //ImmExtE <= 32'b0;
 PCPlus4E <= PCPlus4D;
end

else
begin



RegWriteE <= RegWriteD;
ResultSrcE <= ResultSrcD;
MemWriteE <= MemWriteD;
JumpE <= JumpD;
BranchE <= BranchD;
ALUControlE <= ALUControlD;
ALUSrcE <= ALUSrcD;

 RD1E <= RD1;
 RD2E <= RD2;
 PCE <= PCD;
 Rs1E <= Rs1D;
 Rs2E <= Rs2D;
 RdE <= RdD;

 ImmExtE <= ImmExtD;
 PCPlus4E <= PCPlus4D;



end
end

endmodule