module ram(
    input [5:0] dir,
    input [31:0] entrada1,
    input sel,
    output reg [31:0] salida
);

reg [31:0] memoria [0:65]; 

always @(*) begin
    if(sel==1)
        memoria[dir] <= entrada1;
    else
        salida = memoria[dir];
end
endmodule

