`timescale 1ns/1ns
module IDEX (input clk, input [31:0] pc4, Read_Data1, Read_Data2, seout, input[4:0] write1, write2, Rs_in,
            input RegWrite_c, input[1:0] ALUsrc_c, input Mem_Read_c, Mem_Write_c, MemtoReg_c, RegDst_c, 
            input [2:0] ALUoperation_c, input [5:0] OPC, output logic [31:0] jpc, d1, d2, shin, output logic [4:0] dst1, 
            dst2, Rs, output logic [1:0] ALUsrc,output logic RegDst, output logic [2:0] ALUoperation, output logic RegWrite_o, 
            Mem_Read_o, Mem_Write_o, MemtoReg_o, output logic [5:0] opcode);
  always @(posedge clk) begin
    jpc <= pc4;
    d1 <= Read_Data1;
    d2 <= Read_Data2;
    shin <= seout;
    dst1 <= write1;
    dst2 <= write2;
    RegWrite_o <= RegWrite_c;
    ALUsrc <= ALUsrc_c;
    Mem_Read_o <= Mem_Read_c;
    Mem_Write_o <= Mem_Write_c;
    MemtoReg_o <= MemtoReg_c;
    RegDst <= RegDst_c;
    ALUoperation <= ALUoperation_c;
    Rs <= Rs_in;
    opcode <= OPC;    
  end
endmodule 
