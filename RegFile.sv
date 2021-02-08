`timescale 1ns/1ns
module RegFile(input [4:0]Read_Reg1, Read_Reg2, Write_Reg, input[31:0]Write_Data, input clk, RegWrite,
               output logic [31:0] Read_Data1, Read_Data2, output  [31:0] outreg, output eq);
               
  logic [31:0] registers [0:31];
  initial begin registers[0] = 32'b0; registers[1] = {29'b0,3'b111};end
  assign  Read_Data2 = clk ? registers[Read_Reg2] : Read_Data2;
  assign  Read_Data1 = clk ? registers[Read_Reg1] : Read_Data1;
  assign eq = (Read_Data2 == Read_Data1) ? 1 : 0;
  always@(negedge clk) begin
    if (RegWrite) begin
      if (Write_Reg != 0) registers[Write_Reg] <= Write_Data;
    end
  end
  assign outreg = registers[1];
  
endmodule
    
  
  