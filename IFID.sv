`timescale 1ns/1ns
module IFID(input clk, rst, input [31:0] pcadd, instruction,input IF_ID_write,flush, output logic [31:0] regin, pc4);
  always @(posedge clk, posedge rst) begin
    if (rst) pc4 <= 32'b0;
    else begin
      if (IF_ID_write == 1) begin
        regin <= instruction;
        pc4 <= pcadd;
      end
      if (flush == 1) regin <=32'b0;
    end
  end
endmodule
