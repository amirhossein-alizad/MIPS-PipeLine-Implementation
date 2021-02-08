`timescale 1ns/1ns
module mux_2_10(input [9:0] inp1, inp2, input sel, output [9:0] out);
  assign out = sel ? inp2 : inp1;
endmodule