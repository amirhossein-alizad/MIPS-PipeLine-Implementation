`timescale 1ns/1ns
module EXMEM(input clk, zero, input[31:0] addout, input[31:0] ALUResult, d2, input[4:0] dstsel, 
              input RegWrite_o, Mem_Read_o, Mem_Write_o, MemtoReg_o,
              output logic [31:0] jumpdst, Address, Write_Data, output logic [4:0] regdst,
              output logic RegWrite_i, Mem_Read, Mem_Write, MemtoReg_i);
  
  
  always @(posedge clk) begin
    jumpdst <= addout;
    Address <= ALUResult;
    
    Write_Data <= d2;
    regdst <= dstsel;
    RegWrite_i <= RegWrite_o;
    Mem_Read <= Mem_Read_o;
    Mem_Write <= Mem_Write_o;
    MemtoReg_i <= MemtoReg_o;
  end
endmodule
    
