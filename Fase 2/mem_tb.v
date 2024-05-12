`timescale 1ns/1ns
module mem_tb();

parameter dir = 32;

reg [31:0] Read_addres;
wire [31:0] instruccion;

instruccion_mem mem_tb(
    .Read_addres(Read_addres),
    .instruccion(instruccion)
);

initial begin
    $display("Time=%t, Direccion=%h, Instruccion=%h", $time, Read_addres, instruccion);
        repeat (dir) begin
            Read_addres = $random;
            #10; 
        end
    $finish;
end

endmodule