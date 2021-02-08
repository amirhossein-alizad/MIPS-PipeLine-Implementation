`timescale 1ns/1ns
module PC(input [31:0] Pcin, input clk, rst, pcwrite, output logic[31:0] Pcout);
  //a
  initial Pcout = 32'b0;
  always @(posedge clk, posedge rst) begin
    if (rst) Pcout <= 32'b0;
    else if (pcwrite == 1) Pcout <= Pcin;
  end
endmodule