`timescale 1ns / 1ns

module testbench_mux_2_1();

reg [31:0] data_mem;
reg [31:0] data_alu;
reg MemToReg_m;
wire [31:0] output_data;

mux_2_1 mux_inst (
    .data_mem(data_mem),
    .data_alu(data_alu),
    .MemToReg_m(MemToReg_m),
    .output_data(output_data)
);

initial begin
    data_mem = 32'd0043;
    data_alu = 32'd0102;
    MemToReg_m = 0;
    #100;

    data_mem = 32'd343;
    data_alu = 32'd344;
    MemToReg_m = 1;
    #100;

    $finish; // Finaliza la simulación
end

endmodule
