`timescale 1ns / 1ns

module union_tb();
reg [31:0] instruccion_r;
wire tr_zf;

reg [31:0] registers [0:31]; // Registros del banco de registros

initial begin
    $readmemb("banco.txt", registers);

    #100;
end

datapath_2 dut2 (
    .instruccion_r(instruccion_r),
    .tr_zf(tr_zf)
);

initial begin
    instruccion_r = 32'b00000000101000010000000000000000;
    #100;
    instruccion_r = 32'b00000000110001000101000000000000;
    #100;
    instruccion_r = 32'b00000001001001110010000000000001;
    #100;
    instruccion_r = 32'b00000001100010100101100000000001;
    #100;
    instruccion_r = 32'b00000001111011010111000000000010;
    #100;
    instruccion_r = 32'b00000010010100001000010000000010;
    #100;
    instruccion_r = 32'b00000010101100111011000000000110;
    #100;
    instruccion_r = 32'b00000011000101101011100000000110;
    #100;
    instruccion_r = 32'b00000011011110011010100000000111;
    #100;
    instruccion_r = 32'b00000011110111100111010000000111;
    #100;

    $finish;
end

endmodule