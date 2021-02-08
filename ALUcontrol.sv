`timescale 1ns/1ns
module ALUcontrol(input [1:0] ALUop, input[5:0] func, output logic[2:0] ALUoperation);
  always @(ALUop, func) begin
    case(ALUop)
      2'b00: ALUoperation = 3'b010;
      2'b01: ALUoperation = 3'b110;
      2'b10: begin
        case(func)
          6'b100_000: ALUoperation = 3'b010;
          6'b100_010: ALUoperation = 3'b110;
          6'b100_100: ALUoperation = 3'b0;
          6'b100_101: ALUoperation = 3'b001;
          6'b101_010: ALUoperation = 3'b111;
        endcase
      end
      2'b11: ALUoperation = 3'b0;
    endcase
  end
endmodule

