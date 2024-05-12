`timescale 1ns / 1ns

module Add_tb();

reg [3:0]A;
reg [3:0]B;
wire [3:0]Salida;

add add_inst(
    .A(A),
    .B(B),
    .Salida(Salida)
);

initial begin
    A = 4'd4;
    B = 4'd7;
    #100;
    
    A = 4'd10;
    B = 4'd3;
    #100;
    $finish;
end

endmodule