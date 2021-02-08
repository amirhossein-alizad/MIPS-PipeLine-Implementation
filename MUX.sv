`timescale 1ns/1ns
module MUX(input[1:0] in1, in2, sel, output[1:0] out);
  assign out = sel? in2 : in1;
endmodule
