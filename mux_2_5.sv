`timescale 1ns/1ns
module mux_2_5(input [4:0] inp1, inp2,input select, output[4:0] out);
  assign out = select ? inp2 : inp1;
endmodule

