`timescale 1ns / 1ps

module testbench_datapath();

reg [31:0] instruccion_r;
wire tr_zf;

datapath dut (
    .instruccion_r(instruccion_r),
    .tr_zf(tr_zf)
);

initial begin
    // Ejemplo de instrucciones (puedes modificar según tus necesidades)
    instruccion_r = 32'b000000_00000_00000_00000_00000_001000; // ADD
    #100;

    instruccion_r = 32'b000000_00000_00000_00000_00000_100011; // SUB
    #100;

    instruccion_r = 32'b000000_00000_00000_00000_00000_100101; // AND
    #100;

    instruccion_r = 32'b000000_00000_00000_00000_00000_100110; // OR
    #100;

    instruccion_r = 32'b000000_00000_00000_00000_00000_101010; // SLT
    #100;

    // Añade más instrucciones según sea necesario

    $finish;
end

endmodule

