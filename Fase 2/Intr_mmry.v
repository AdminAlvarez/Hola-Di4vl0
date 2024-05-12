module instruccion_mem(
    input [31:0] Read_addres,
    output reg [31:0] instruccion
);

reg [31:0] memoria [0:31];

always @(Read_addres) begin
    instruccion = memoria[Read_addres];
end

endmodule