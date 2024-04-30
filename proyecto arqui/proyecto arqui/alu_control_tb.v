`timescale 1ns / 1ns

module testbench_alu_control();

    reg [5:0] func_code;
    reg [2:0] UC_signal;
    wire [2:0] ALU_signal;

    // Instancia el módulo
    alu_control alu_control_inst (
        .func_code(func_code),
        .UC_signal(UC_signal),
        .ALU_signal(ALU_signal)
    );

    // Simulación
    initial begin
		// Caso 1: UC_signal es 3'b000 y func_code es 6'b000000 (AND)
        UC_signal = 3'b000;
        func_code = 6'b000000;
        #100;

        // Caso 2: UC_signal es 3'b000 y func_code es 6'b000001 (OR)
        UC_signal = 3'b000;
        func_code = 6'b000001;
        #100;
		
        // Caso 3: UC_signal es 3'b000 y func_code es 6'b000010 (suma)
        UC_signal = 3'b000;
        func_code = 6'b000010;
        #100;

        // Caso 4: UC_signal es 3'b000 y func_code es 6'b000110 (resta)
        UC_signal = 3'b000;
        func_code = 6'b000110;
        #100;
		
        // Caso 5: UC_signal es 3'b000 y func_code es 6'b000111 (Set on less than)
        UC_signal = 3'b000;
        func_code = 6'b000111;
        #100;
		
        $finish; // Finaliza la simulación
    end

endmodule
