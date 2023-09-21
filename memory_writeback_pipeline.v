module memory_writeback_pipeline(

input wire clk,
input wire reset_n,
input wire RegWriteM,
input wire [1:0] ResultSrcM,
input wire [31:0] ALUResultM,
input wire [31:0] RD,
input wire [11:7] RdM,
input wire [31:0] PCPlus4M,
output reg RegWriteW,
output reg [1:0] ResultSrcW,
output reg [31:0] ReadDataW,
output reg [11:7] RdW,
output reg [31:0] PCPlus4W,
output reg [31:0] ALUResultW
);


always @(posedge clk or negedge reset_n)
begin
  if (!reset_n)
  begin
  RegWriteW <= 1'b0;
  ResultSrcW <= 2'b0;
  ReadDataW <= 31'b0;
  RdW <= 5'b0;
  PCPlus4W <= 32'b0;
  ALUResultW <= 32'b0;
  end
else
begin
 RegWriteW <= RegWriteM;
  ResultSrcW <= ResultSrcM;
  ReadDataW <= RD;
  RdW <= RdM;
  PCPlus4W <= PCPlus4M;
  ALUResultW <= ALUResultM;


end

end

endmodule