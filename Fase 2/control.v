module control(
    input [5:0] opcode,
    output reg branch,
    output reg MemRead,
    output reg MemToWrite,
    output reg MemToReg,
    output reg [2:0] ALUOp,
    output reg ALUSrc,
    output reg RegDst,
    output reg RegWrite
);

always @(*) begin
    case(opcode)
        6'b000000 :
            begin
                branch = 1;
                MemRead = 1;
                MemToReg = 1;
                RegWrite = 1;
                MemToWrite = 1;
                ALUSrc = 1;
                ALUOp = 3'b000;
            end
        6'b000010 :
            begin
                branch = 0;
                MemRead = 0;
                MemToReg = 0;
                RegWrite = 0;
                MemToWrite = 0;
                ALUSrc = 0;
                ALUOp=3'b010;
            end
        6'b001000 :
            begin
                branch = 0;
                MemRead = 0;
                MemToReg = 0;
                RegWrite = 0;
                MemToWrite = 0;
                ALUSrc = 0;
                ALUOp=3'b100;
            end
        default:
            begin
                branch = 0;
                MemRead = 0;
                MemToReg = 0;
                RegWrite = 0;
                MemToWrite = 0;
                ALUSrc = 0;
                ALUOp=3'b100;
            end
    endcase
end

endmodule