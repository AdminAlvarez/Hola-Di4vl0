module banco_registros(
    input [4:0] read_register_1,
    input [4:0] read_register_2,
    input [31:0] write_data,
    input [4:0] write_register,
    input reg reg_write,
    output reg [31:0] read_data_1,
    output reg [31:0] read_data_2
);

reg [31:0] registers [0:31]; 

always @(*) begin
    if (reg_write == 1) begin
        registers[write_register] <= write_data;
    end
    read_data_1 = registers[read_register_1];
    read_data_2 = registers[read_register_2];
end

endmodule