`timescale 1ns / 1ns

module testbench_uc();

reg [5:0] opcode;
wire MemToReg, RegWrite, MemToWrite;
wire [2:0] ALUOp;

uc uc_inst (
    .opcode(opcode),
    .MemToReg(MemToReg),
    .RegWrite(RegWrite),
    .MemToWrite(MemToWrite),
    .ALUOp(ALUOp)
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

