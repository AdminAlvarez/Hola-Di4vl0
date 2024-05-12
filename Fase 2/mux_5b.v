module mux_5b(
    input [4:0] data_mem,
    input [4:0] data_alu,
    input MemToReg_m,
    output reg [4:0] output_data
);

always @(*)
begin
    if (MemToReg_m == 1)
        output_data = data_mem;
    else
        output_data = data_alu;
end

endmodule

