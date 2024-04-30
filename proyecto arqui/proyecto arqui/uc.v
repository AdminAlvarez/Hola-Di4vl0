
module uc(
    input [5:0] opcode,
    output reg MemToReg,
    output reg RegWrite,
    output reg MemToWrite,
    output reg [2:0] ALUOp
);

always @(*) begin
    case(opcode)
        6'b000000 :
            begin
                MemToReg= 1;
                RegWrite=1;
                MemToWrite=1;
                ALUOp=3'b000;
            end
        6'b000010 :
            begin
                MemToReg= 0;
                RegWrite=0;
                MemToWrite=0;
                ALUOp=3'b010;
            end
        6'b001000 :
            begin
                MemToReg= 0;
                RegWrite=0;
                MemToWrite=0;
                ALUOp=3'b100;
            end
        default:
            begin
                MemToReg= 0;
                RegWrite=0;
                MemToWrite=0;
                ALUOp=3'b100;
            end
    endcase
end

endmodule


