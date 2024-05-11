`timescale 1ns / 1ns

module pc(
    input [31:0] entrada,
    input clk,
    output reg [31:0] salida
);


always@(clk)
begin
    salida = entrada;
end

endmodule