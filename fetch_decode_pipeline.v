module fetch_decode_pipeline(
input wire clk,
input wire reset_n,
input wire [31:0] PCF,
input wire [31:0] PCPlus4F,
input wire EN_n,
input wire CLR,
input wire [31:0] instr_RD,
output reg [31:0] InstD,
output reg [31:0] PCD,
output reg [31:0] PCPlus4D

);

always @(posedge clk or negedge reset_n  )
begin
if (!reset_n)
begin
InstD <= 32'b0;
PCD <= 32'b0;
PCPlus4D <= 32'b0;
end
else if (CLR == 1)
begin
InstD <= 32'b0;
PCD <= 32'b0;
PCPlus4D <= PCPlus4F;
end

else if (!EN_n && !CLR)
begin
InstD <= instr_RD;
PCD <= PCF;
PCPlus4D <= PCPlus4F;
end

else if (EN_n)
begin
InstD <= InstD;
PCD <= PCD;
PCPlus4D <= PCPlus4D;
end
end
endmodule