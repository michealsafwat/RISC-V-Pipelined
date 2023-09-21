module execute_memory_pipeline(

input wire clk,
input wire reset_n,
input wire [31:0] ALUResultE,
input wire [31:0] WriteDataE,
input wire [31:0] PCPlus4E,
input wire [11:7] RdE,
input wire RegWriteE,
input wire [1:0] ResultSrcE,
input wire MemWriteE,
output reg RegWriteM,
output reg [1:0] ResultSrcM,
output reg MemWriteM,
output reg [31:0] ALUResultM,
output reg [31:0] WriteDataM,
output reg [11:7] RdM,
output reg [31:0] PCPlus4M

);



always @(posedge clk or negedge reset_n)
begin 
if (!reset_n)
begin
RegWriteM <= 1'b0;
ResultSrcM <= 2'b0;
MemWriteM <= 1'b0;
ALUResultM <= 32'b0;
WriteDataM <= 32'b0;
RdM <= 5'b0;
PCPlus4M <= 32'b0;
end

else
begin
RegWriteM <= RegWriteE;
ResultSrcM <= ResultSrcE;
MemWriteM <= MemWriteE;
ALUResultM <= ALUResultE;
WriteDataM <= WriteDataE;
RdM <= RdE;
PCPlus4M <= PCPlus4E;


end




end

endmodule
