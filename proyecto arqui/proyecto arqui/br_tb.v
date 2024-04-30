`timescale 1ns/1ns

module br_tb;

    // Parámetros
    reg [4:0] ra1, ra2, dir;
    reg [31:0] di;
    reg reg_write;
    wire [31:0] dr1, dr2;

    // Instancia del modulo bajo prueba
    banco_registros br(
        .ra1(ra1),
        .ra2(ra2),
        .di(di),
        .dir(dir),
        .reg_write(reg_write),
        .dr1(dr1),
        .dr2(dr2)
    );

    // Simulacion
    initial begin
	$readmemb(".banco.txt", br.registers);

		#100;

        // Operación de lectura
        reg_write = 0;
        dir = 5'b00100;
        di = 32'd2541;
        ra1 = 5'b00001;
        ra2 = 5'b00010;
        #100;
		
		reg_write = 0;
        dir = 5'b11010;
        di = 32'd4541;
        ra1 = 5'b00100;
        ra2 = 5'b01000;
        #100;

        reg_write = 0;
        dir = 5'b10110;
        di = 32'd458;
        ra1 = 5'b10110;
        ra2 = 5'b10101;
        #100;
		
		reg_write = 0;
        dir = 5'b10110;
        di = 32'd12245;
        ra1 = 5'b11000;
        ra2 = 5'b10001;
        #100;
		
		reg_write = 0;
        dir = 5'b0010;
        di = 32'd458;
        ra1 = 5'b11111;
        ra2 = 5'b10100;
        #100;
		
		reg_write = 0;
        dir = 5'b10101;
        di = 32'd2541;
        ra1 = 5'b10011;
        ra2 = 5'b11001;
        #100;

        reg_write = 0;
        dir = 5'b11111;
        di = 32'd5614;
        ra1 = 5'b00110;
        ra2 = 5'b11010;
        #100;
		
		reg_write = 0;
        dir = 5'b01101;
        di = 32'd2541;
        ra1 = 5'b10101;
        ra2 = 5'b11110;
        #100;
		
		reg_write = 0;
        dir = 5'b00001;
        di = 32'd2541;
        ra1 = 5'b10101;
        ra2 = 5'b11101;
        #100;
		
		reg_write = 0;
        dir = 5'b00011;
        di = 32'd2556;
        ra1 = 5'b10010;
        ra2 = 5'b11011;
        #100;

        reg_write = 0;
        dir = 5'b11000;
        di = 32'd2541;
        ra1 = 5'b11110;
        ra2 = 5'b10101;
        #100;
		
		reg_write = 0;
        dir = 5'b1101;
        di = 32'd2541;
        ra1 = 5'b11100;
        ra2 = 5'b01011;
        #100;
		
		reg_write = 0;
        dir = 5'b1010;
        di = 32'd12785;
        ra1 = 5'b11010;
        ra2 = 5'b10010;
        #100;
		
		reg_write = 0;
        dir = 5'b10110;
        di = 32'd4766;
        ra1 = 5'b11100;
        ra2 = 5'b11010;
        #100;

        reg_write = 0;
        dir = 5'b10100;
        di = 32'd45247;
        ra1 = 5'b11010;
        ra2 = 5'b00101;
        #100;
		
		reg_write = 0;
        dir = 5'b10101;
        di = 32'd46525;
        ra1 = 5'b11110;
        ra2 = 5'b11000;
        #100;
		
		reg_write = 0;
        dir = 5'b10100;
        di = 32'd0523;
        ra1 = 5'b10110;
        ra2 = 5'b11100;
        #100;
		
		reg_write = 0;
        dir = 5'b11010;
        di = 32'd45787;
        ra1 = 5'b00111;
        ra2 = 5'b11010;
        #100;

        reg_write = 0;
        dir = 5'b01110;
        di = 32'd2785;
        ra1 = 5'b00110;
        ra2 = 5'b11010;
        #100;
		
		reg_write = 0;
        dir = 5'b0010;
        di = 32'd2541;
        ra1 = 5'b00110;
        ra2 = 5'b11010;
        #100;
        // Operación de escritura
        reg_write = 1;
        dir = 5'b00001;
        di = 32'd1;
        ra1 = 5'b00001;
        ra2 = 5'b00010;
        #100;
		
		reg_write = 1;
        dir = 5'b00010;
        di = 32'd2;
        ra1 = 5'b00010;
        ra2 = 5'b11010;
        #100;
		
        reg_write = 1;
        dir = 5'b00011;
        di = 32'd3;
        ra1 = 5'b00011;
        ra2 = 5'b01010;
        #100;

        // Finalizacion de la simulacion
        $finish;
    end

endmodule

