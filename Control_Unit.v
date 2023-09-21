module Control_Unit (
    input wire funct_7,
    input wire [2:0] funct_3,
    input wire [6:0] op,
    //input wire ZeroE,
    output wire BranchD,
    output wire [1:0] ResultSrcD,
    output wire MemWriteD,
    output wire ALUSrcD,
    output wire [1:0] ImmSrcD,
    output wire JumpD,
    output wire RegWriteD,
    //output wire pcsrcE,
    output wire [2:0] ALUControlD
    );

wire [1:0] aluop;
   Main_Decoder Decoder  (   
    .op(op),
    .ALUOp(aluop),
    .Branch(BranchD),
    .ResultSrc(ResultSrcD),
    .MemWrite(MemWriteD),
    .ALUSrc(ALUSrcD),
    .ImmSrc(ImmSrcD),
    .Jump(JumpD),
    .RegWrite(RegWriteD)
    );

////////////                      
ALU_Decoder ALUCtrl  (  
    .funct_7(funct_7),
    .op_5(op[5]),
    .funct_3(funct_3),
    .ALUOp(aluop),
    .ALUControl(ALUControlD)
    );

    //assign pcsrcE = (BranchD & ZeroE) | JumpD;

endmodule