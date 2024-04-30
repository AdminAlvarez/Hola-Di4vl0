module bam(
    input bamwr,
    input [4:0] bamDir,
    input [2:0] bamSel,
    input [4:0] bamRA1,
    input [4:0] bamRA2,
    input [31:0] bamDi,
    input [4:0] bamDirB,
    input bamRegWrite,
    output bamZf,
    output [31:0] bamDoubt
);

wire [31:0] cabledr1, cabledr2,cableRes; 

br br1(
    .ra1(bamRA1),
    .ra2(bamRA2),
    .di(bamDi),
    .dir(bamDirB),
    .reg_write(bamRegWrite),
    .dr1(cabledr1),
    .dr2(cabledr2)
);

alu alu1(
    .entrada1(cabledr1),
    .entrada2(cabledr2),
    .selector(bamSel),
    .res(cableRes),
    .zf(bamZf)
);

ram ram1(
    .dir(bamDir),
    .entrada1(cableRes),
    .sel(bamwr),
    .salida(bamDoubt)
);

endmodule
	
