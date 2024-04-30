
module datapath(
    input [31:0] instruccion_r,
    output tr_zf
);

wire [31:0] cable_br_alu_1, cable_br_alu_2, cable_res_alu;
reg zf;

uc uc1(
    .opcode(instruccion_r[31:26]),
    .MemToReg(MemToReg_m),
    .RegWrite(RegWrite),
    .MemToWrite(sel),
    .ALUOp(UC_signal)
);

banco_registros br1(
    .read_register_1(instruccion_r[25:21]),
    .read_register_2(instruccion_r[20:16]),
    .write_data(output_data),
    .write_register(instruccion_r[15:11]),
    .reg_write(RegWrite),
    .read_data_1(cable_br_alu_1),
    .read_data_2(cable_br_alu_2)
);


alu_control ac1(
    .func_code(instruccion_r[5:0]),
    .UC_signal(ALUOp),
    .ALU_signal(selector)
);

alu alu1(
	.entrada1(cable_br_alu_1),
    .entrada2(cable_br_alu_2),
    .selector(ALU_signal),
    .res(cable_res_alu),
    .zf(tr_zf)
);

ram ram1(
    .dir(instruccion_r[15:11]),
    .entrada1(cable_res_alu),
    .sel(MemToWrite),
    .salida(data_mem)
);

mux_2_1 mux1(
    .data_mem(salida),
    .data_alu(cable_res_alu),
    .MemToReg_m(MemToReg),
    .output_data(write_data)
);

endmodule

	

	



	