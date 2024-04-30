`timescale 1ns / 1ns

module tb_bam;

    reg bamwr;
    reg [4:0] bamDir;
    reg [2:0] bamSel;
    reg [4:0] bamRA1;
    reg [4:0] bamRA2;
    reg [31:0] bamDi;
    reg [4:0] bamDirB;
    reg bamRegWrite;
    
    wire bamZf;
    wire [31:0] bamDoubt;
	
	reg [31:0] registers [0:31]; // Registros del banco de registros

    initial begin
        $readmemb("banco.txt", registers);

        #100;
    end
  
    // Instancia del modulo bajo prueba
    bam dut (
        .bamwr(bamwr),
        .bamDir(bamDir),
        .bamSel(bamSel),
        .bamRA1(bamRA1),
        .bamRA2(bamRA2),
        .bamDi(bamDi),
        .bamDirB(bamDirB),
        .bamRegWrite(bamRegWrite),
        .bamZf(bamZf),
        .bamDoubt(bamDoubt)
    );
  
    
    initial begin    

        // Simulación de operaciones aritmeticas
        bamwr = 1;
        bamDir = 5'd5;
        bamSel = 4'b0010;
        bamRA1 = 5'd23;
        bamRA2 = 5'd12;
        bamDi = 32'd456; 
        bamDirB = 5'd13;
        bamRegWrite = 1;
        #100;

		// 1. Resta entre registros 15 y 7, resultado en dirección 14
		bamwr = 1;
		bamDir = 5'd6;
		bamSel = 4'b0110; // Resta
		bamRA1 = 5'd15;
		bamRA2 = 5'd7;
		bamDi = 32'd5235; 
		bamDirB = 5'd14;
		bamRegWrite = 1;
		#100;

		// 2. Suma entre registros 18 y 10, resultado en dirección 15
		bamwr = 1;
		bamDir = 5'd7;
		bamSel = 4'b0010; // Suma
		bamRA1 = 5'd18;
		bamRA2 = 5'd10;
		bamDi = 32'd45324; 
		bamDirB = 5'd15;
		bamRegWrite = 1;
		#100;

		// 3. Resta entre registros 20 y 1, resultado en dirección 16
		bamwr = 1;
		bamDir = 5'd8;
		bamSel = 4'b0110; // Resta
		bamRA1 = 5'd20;
		bamRA2 = 5'd1;
		bamDi = 32'd676; 
		bamDirB = 5'd16;
		bamRegWrite = 1;
		#100;

		// 4. Suma entre registros 3 y 19, resultado en dirección 17
		bamwr = 1;
		bamDir = 5'd9;
		bamSel = 4'b0010; // Suma
		bamRA1 = 5'd3;
		bamRA2 = 5'd19;
		bamDi = 32'd8756; 
		bamDirB = 5'd17;
		bamRegWrite = 1;
		#100;

		// 5. Resta entre registros 2 y 6, resultado en dirección 18
		bamwr = 1;
		bamDir = 5'd10;
		bamSel = 4'b0110; // Resta
		bamRA1 = 5'd2;
		bamRA2 = 5'd6;
		bamDi = 32'd45655; 
		bamDirB = 5'd18;
		bamRegWrite = 1;
		#100;

		// 6. Suma entre registros 11 y 22, resultado en dirección 19
		bamwr = 1;
		bamDir = 5'd11;
		bamSel = 4'b0010; // Suma
		bamRA1 = 5'd11;
		bamRA2 = 5'd22;
		bamDi = 32'd56786; 
		bamDirB = 5'd19;
		bamRegWrite = 1;
		#100;

		// 7. Resta entre registros 5 y 9, resultado en dirección 20
		bamwr = 1;
		bamDir = 5'd12;
		bamSel = 4'b0110; // Resta
		bamRA1 = 5'd5;
		bamRA2 = 5'd9;
		bamDi = 32'd3434; 
		bamDirB = 5'd20;
		bamRegWrite = 1;
		#100;

		// 8. Suma entre registros 21 y 4, resultado en dirección 21
		bamwr = 1;
		bamDir = 5'd13;
		bamSel = 4'b0010; // Suma
		bamRA1 = 5'd21;
		bamRA2 = 5'd4;
		bamDi = 32'd434; 
		bamDirB = 5'd21;
		bamRegWrite = 1;
		#100;

		// 9. Resta entre registros 16 y 8, resultado en dirección 22
		bamwr = 1;
		bamDir = 5'd14;
		bamSel = 4'b0110; // Resta
		bamRA1 = 5'd16;
		bamRA2 = 5'd8;
		bamDi = 32'd1234; 
		bamDirB = 5'd22;
		bamRegWrite = 1;
		#100;

		// 10. Suma entre registros 17 y 14, resultado en dirección 23
		bamwr = 1;
		bamDir = 5'd15;
		bamSel = 4'b0010; // Suma
		bamRA1 = 5'd17;
		bamRA2 = 5'd14;
		bamDi = 32'd64543; 
		bamDirB = 5'd23;
		bamRegWrite = 1;
		#100;

		// 11. Resta entre registros 13 y 3, resultado en dirección 24
		bamwr = 1;
		bamDir = 5'd16;
		bamSel = 4'b0110; // Resta
		bamRA1 = 5'd13;
		bamRA2 = 5'd3;
		bamDi = 32'd3453; 
		bamDirB = 5'd24;
		bamRegWrite = 1;
		#100;

		// 12. Suma entre registros 0 y 17, resultado en dirección 25
		bamwr = 1;
		bamDir = 5'd17;
		bamSel = 4'b0010; // Suma
		bamRA1 = 5'd0;
		bamRA2 = 5'd17;
		bamDi = 32'd64567; 
		bamDirB = 5'd25;
		bamRegWrite = 1;
		#100;

		// 13. Resta entre registros 21 y 15, resultado en dirección 26
		bamwr = 1;
		bamDir = 5'd18;
		bamSel = 4'b0110; // Resta
		bamRA1 = 5'd21;
		bamRA2 = 5'd15;
		bamDi = 32'd23543; 
		bamDirB = 5'd26;
		bamRegWrite = 1;
		#100;

		// 14. Suma entre registros 10 y 20, resultado en dirección 27
		bamwr = 1;
		bamDir = 5'd19;
		bamSel = 4'b0010; // Suma
		bamRA1 = 5'd10;
		bamRA2 = 5'd20;
		bamDi = 32'd254543; 
		bamDirB = 5'd27;
		bamRegWrite = 1;
		#100;
		// Operaciones lógicas
		// 1. AND entre registros 1 y 7, resultado en dirección 1
		bamwr = 1;
		bamDir = 5'd1;
		bamSel = 4'b0000; // AND
		bamRA1 = 5'd1;
		bamRA2 = 5'd7;
		bamDi = 32'd342; 
		bamDirB = 5'd28;
		bamRegWrite = 1;
		#100;

		// 2. OR entre registros 2 y 8, resultado en dirección 2
		bamwr = 1;
		bamDir = 5'd2;
		bamSel = 4'b0001; // OR
		bamRA1 = 5'd2;
		bamRA2 = 5'd8;
		bamDi = 32'd3455; 
		bamDirB = 5'd29;
		bamRegWrite = 1;
		#100;

		// 3. AND entre registros 3 y 9, resultado en dirección 3
		bamwr = 1;
		bamDir = 5'd3;
		bamSel = 4'b0000; // AND
		bamRA1 = 5'd3;
		bamRA2 = 5'd9;
		bamDi = 32'd554; 
		bamDirB = 5'd30;
		bamRegWrite = 1;
		#100;

		// 4. OR entre registros 4 y 10, resultado en dirección 4
		bamwr = 1;
		bamDir = 5'd4;
		bamSel = 4'b0001; // OR
		bamRA1 = 5'd4;
		bamRA2 = 5'd10;
		bamDi = 32'd5435; 
		bamDirB = 5'd31;
		bamRegWrite = 1;
		#100;

		// 5. AND entre registros 5 y 11, resultado en dirección 26
		bamwr = 1;
		bamDir = 5'd26;
		bamSel = 4'b0000; // AND
		bamRA1 = 5'd5;
		bamRA2 = 5'd11;
		bamDi = 32'd324; 
		bamDirB = 5'd32;
		bamRegWrite = 1;
		#100;

		// 6. OR entre registros 6 y 12, resultado en dirección 27
		bamwr = 1;
		bamDir = 5'd27;
		bamSel = 4'b0001; // OR
		bamRA1 = 5'd6;
		bamRA2 = 5'd12;
		bamDi = 32'd0; 
		bamDirB = 5'd33;
		bamRegWrite = 1;
		#100;

		// 7. AND entre registros 13 y 19, resultado en dirección 28
		bamwr = 1;
		bamDir = 5'd28;
		bamSel = 4'b0000; // AND
		bamRA1 = 5'd13;
		bamRA2 = 5'd19;
		bamDi = 32'd5437; 
		bamDirB = 5'd34;
		bamRegWrite = 1;
		#100;

		// 8. OR entre registros 14 y 20, resultado en dirección 29
		bamwr = 1;
		bamDir = 5'd29;
		bamSel = 4'b0001; // OR
		bamRA1 = 5'd14;
		bamRA2 = 5'd20;
		bamDi = 32'd2455; 
		bamDirB = 5'd35;
		bamRegWrite = 1;
		#100;

		// 9. AND entre registros 15 y 21, resultado en dirección 30
		bamwr = 1;
		bamDir = 5'd30;
		bamSel = 4'b0000; // AND
		bamRA1 = 5'd15;
		bamRA2 = 5'd21;
		bamDi = 32'd198; 
		bamDirB = 5'd36;
		bamRegWrite = 1;
		#100;

		// 10. OR entre registros 16 y 22, resultado en dirección 31
		bamwr = 1;
		bamDir = 5'd31;
		bamSel = 4'b0001; // OR
		bamRA1 = 5'd16;
		bamRA2 = 5'd22;
		bamDi = 32'd55676; 
		bamDirB = 5'd37;
		bamRegWrite = 1;
		#100;

				

        // Finalizar la simulación
        $finish;
    end

endmodule
