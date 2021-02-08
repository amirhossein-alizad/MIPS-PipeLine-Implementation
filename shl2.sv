`timescale 1ns/1ns
module shl2(input [31:0] shin, output [31:0] shout);
  assign shout = {shin[29:0],2'b00};
endmodule