module datapath_2(
    input [31:0] instruccion_r,
    output reg tr_zf
);

wire [31:0] c1;
wire c21,c22,c23,c24,c25,c26,c27,c28,c29;
wire c2,c6,c7,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20;
wire [3:0] c3,c4,c5;

pc pc1(
    .entrada(c1),
    .clk(c2),
    .salida(c3)
);

add add1(
    .A(c3),
    .B(c4),
    .Salida(c5)
);

mux_2_1 mux1(
    .data_mem(c5),
    .data_alu(c6),
    .MemToReg_m(c7),
    .output_data(c1)
);

instruccion_mem im(
    .Read_addres(c3),
    .instruccion(c4)
);

control cntrl(
    .opcode(c4[31:26]),
    .branch(c9),
    .MemRead(c10),
    .MemToReg(c11),
    .ALUOp(c12),
    .MemToWrite(c13),
    .ALUSrc(c14),
    .RegDst(c15),
    .RegWrite(c16)
);

mux_5b mux5(
    .data_mem(c4[15:11]),
    .data_alu(c15),
    .MemToReg_m(c17),
    .output_data(c18)
);

banco_registros br(
    .read_register_1(c4[25:21]),
    .read_register_2(c4[20:16]),
    .write_data(c29),
    .write_register(c18),
    .reg_write(c19),
    .read_data_1(c20),
    .read_data_2(c21)
);

mux_2_1 mux2(
    .data_mem(c21),
    .data_alu(c14),
    .MemToReg_m(c22),
    .output_data(c23)
);

alu_control aluc(
    .func_code(c4[5:0]),
    .UC_signal(c12),
    .ALU_signal(c24)
);

alu alu1(
    .entrada1(c20),
    .entrada2(c23),
    .selector(c24),
    .res(c26),
    .zf(c25)
);

_and and1(
    .A(c9),
    .B(c25),
    .C(c27)
);

mux_2_1 mux3(
    .data_mem(c11),
    .data_alu(c27),
    .MemToReg_m(c28),
    .output_data(c29)
);
endmodule