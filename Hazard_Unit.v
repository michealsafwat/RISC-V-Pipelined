module Hazard_Unit(
input wire [19:15] Rs1D,
input wire [24:20] Rs2D,
input wire [19:15] Rs1E,
input wire [24:20] Rs2E,
input wire [11:7] RdE,
input wire PCSrcE,
input wire ResultSrcE_0,
input wire [11:7] RdM,
input wire RegWriteM,
input wire [11:7] RdW,
input wire RegWriteW,
output wire StallF,
output wire StallD,
output wire FlushD,
output wire FlushE,
output reg [1:0] ForwardAE,
output reg [1:0] ForwardBE
);


wire lwStall;

assign lwStall = ResultSrcE_0 & ((Rs1D == RdE) | (Rs2D == RdE));
assign StallD = lwStall;
assign StallF = lwStall;
assign FlushD = PCSrcE;
assign FlushE = lwStall | PCSrcE;

always @(*) begin


if (((Rs1E == RdM) & RegWriteM ) & (Rs1E !=0) )
ForwardAE = 2'b10;

else if ( ((Rs1E == RdW) & RegWriteW) & (Rs1E !=0) )
 ForwardAE = 2'b01;
  
else
 ForwardAE = 2'b00;


if (((Rs2E == RdM) & RegWriteM) & (Rs2E !=0) )
ForwardBE = 2'b10;

else if ( ((Rs2E == RdW) & RegWriteW) & (Rs2E !=0) )
 ForwardBE = 2'b01;
  
else
 ForwardBE = 2'b00;


end

endmodule