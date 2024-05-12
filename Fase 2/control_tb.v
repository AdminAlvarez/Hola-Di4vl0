`timescale 1ns / 1ns

module controltb();

reg [5:0] opcode;
wire branch, RegDst, MemRead, MemToWrite, MemToReg, ALUSrc, RegWrite;
wire [2:0] ALUOp;

control instancia_c(
    .opcode(opcode),
    .branch(branch),
    .MemRead(MemRead),
    .MemToWrite(MemToWrite),
    .MemToReg(MemToReg),
    .ALUOp(ALUOp),
    .ALUSrc(ALUSrc),
    .RegDst(RegDst),
    .RegWrite(RegWrite)
);

initial begin 
    opcode = 6'b000000;
    #100;
    $display("Salidas para opcode = 6'b000000: MemToReg = %b, RegWrite = %b, MemToWrite = %b, ALUOp = %b", MemToReg, RegWrite, MemToWrite, ALUOp);

    opcode = 6'b000010;
    #100;
    $display("Salidas para opcode = 6'b000010: MemToReg = %b, RegWrite = %b, MemToWrite = %b, ALUOp = %b", MemToReg, RegWrite, MemToWrite, ALUOp);

    opcode = 6'b001000;
    #100;
    $display("Salidas para opcode = 6'b001000: MemToReg = %b, RegWrite = %b, MemToWrite = %b, ALUOp = %b", MemToReg, RegWrite, MemToWrite, ALUOp);

    opcode = 6'b111111;
    #100;
    $display("Salidas para opcode = 6'b111111: MemToReg = %b, RegWrite = %b, MemToWrite = %b, ALUOp = %b", MemToReg, RegWrite, MemToWrite, ALUOp);

    $finish;
end

endmodule