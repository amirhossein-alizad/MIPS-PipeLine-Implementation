`timescale 1ns/1ns
module jmp_adr(input[25:0] adr, input[3:0] pc, output [31:0] out);
  assign out = {pc,adr,2'b0};
endmodule
