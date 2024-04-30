module mux_2_1(
    input [31:0] data_mem,
    input [31:0] data_alu,
    input MemToReg_m,
    output reg [31:0] output_data
);

always @(*)
begin
    if (MemToReg_m == 1)
        output_data = data_mem;
    else
        output_data = data_alu;
end

endmodule

