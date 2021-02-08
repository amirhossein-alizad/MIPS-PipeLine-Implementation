`timescale 1ns/1ns
module MEMWB(input clk, input[31:0] Read_Data, Address, input [4:0] regdst,
              input RegWrite_i, MemtoReg_i,
            output logic [31:0] memdata, regdata , output logic [4:0] Write_Reg,
            output logic RegWrite, MemtoReg);


  always @(posedge clk) begin
    memdata <= Read_Data;
    regdata <= Address;
    Write_Reg <= regdst;
    RegWrite <= RegWrite_i;
    MemtoReg <= MemtoReg_i;
  end
endmodule
