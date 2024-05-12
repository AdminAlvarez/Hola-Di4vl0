`timescale 1ns / 1ns

module testbench_mux_5b();

reg [4:0] data_mem;
reg [4:0] data_alu;
reg MemToReg_m;
wire [4:0] output_data;

mux_5b mux_inst (
    .data_mem(data_mem),
    .data_alu(data_alu),
    .MemToReg_m(MemToReg_m),
    .output_data(output_data)
);

initial begin
    data_mem = 5'd0043;
    data_alu = 5'd0102;
    MemToReg_m = 0;
    #100;

    data_mem = 5'd343;
    data_alu = 5'd344;
    MemToReg_m = 1;
    #100;

    $finish; // Finaliza la simulación
end

endmodule
