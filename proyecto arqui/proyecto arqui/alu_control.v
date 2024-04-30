module alu_control(
    input [5:0] func_code,
    input [2:0] UC_signal,
    output reg [2:0] ALU_signal
);

always @(*)
begin
    case(UC_signal)
        3'b000: begin
            case(func_code[5:3])
                3'b000: begin 
                    case(func_code[2:0])
                        3'b000: ALU_signal = 3'b000; // AND
                        3'b001: ALU_signal = 3'b001; // OR
                        3'b010: ALU_signal = 3'b010; // suma
                        3'b110: ALU_signal = 3'b110; // resta
                        3'b111: ALU_signal = 3'b111; // Set on less than
                        default: ALU_signal = 3'b011; 
                    endcase
                end
                default: begin 
                    ALU_signal = 3'b011;
                end
            endcase
        end
        default: begin
            ALU_signal = 3'b011;
        end
    endcase
end

endmodule

