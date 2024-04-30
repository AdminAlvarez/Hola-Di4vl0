module alu(
    input [31:0] entrada1,
    input [31:0] entrada2,
    input [2:0] selector,
    output reg [31:0] res,
    output reg zf
);

always @(*)
begin
    case(selector)
        3'b000: res = entrada1 & entrada2;  // AND
        3'b001: res = entrada1 | entrada2;  // OR
        3'b010: res = entrada1 + entrada2;  // suma
        3'b110: res = entrada1 - entrada2;  // Resta
        3'b111: res = (entrada1 < entrada2) ? 1 : 0;  // Set on less than
        default: 
            begin
                res = 32'b0;
                zf = 1;
            end
    endcase
    zf = (res == 32'b0) ? 1 : 0;
end

endmodule

