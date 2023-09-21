module Data_Mem(

input clk,
input [31:0] A,
input [31:0] WD,
input WE,
output reg [31:0] RD
);

reg [31:0] data_memory [0:100];


localparam addr=32'h0000_0000;
//assign test=data_memory[addr[15:0]];
always @(*) begin
    if(WE==0)
    RD<=data_memory[A];
    
end

always @(posedge clk) begin
    if (WE==1)
    data_memory[A]<=WD;
    
end

endmodule