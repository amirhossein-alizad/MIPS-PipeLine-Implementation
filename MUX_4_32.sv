`timescale 1ns/1ns
module mux_4_32(input[31:0] in1, in2, in3, in4, input[1:0] sel, output [31:0] out);
  assign out = sel[1] ? (sel[0] ? in4 : in3) : (sel[0] ? in2 : in1);
endmodule