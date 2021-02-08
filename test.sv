`timescale 1ns/1ns
module test();
  logic clk = 0, rst, b;
  logic [31:0] res1, adr, mem500, mem501;
  logic [4:0] a;
  PipeLine cut (clk, rst, res1, adr, a, b, mem500, mem501);
  always #5 clk = ~clk;
  initial begin
    //rst = 1;
    //#2 rst = 0;
    #10000 $stop;
  end
endmodule

