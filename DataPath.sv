`timescale 1ns/1ns
module Datapath(input clk, rst, RegWrite_c, input[1:0] ALUsrc_c, input Mem_Read_c, Mem_Write_c, input[1:0] Pcsrc,input MemtoReg_c, RegDst_c, flush, 
                input [2:0] ALUoperation_c, output [5:0] opcode,func, output zero, eq, output [31:0] outreg,
                output [31:0] Adr, output[4:0] a, output b, output [31:0] out1, out2);
                
  logic [31:0] four = {29'b0, 3'b100};
  logic [31:0] Pcin, Pcout, pcadd, instruction, regin, pc4, Write_Data, Read_Data1, Read_Data2, seout,
              jpc, d1, d2, shin, shout, B, addout, A, ALUResult, jumpdst, Address, Write_memData,
              Read_Data, memdata, regdata;
  logic [31:0] jump_address;
  logic [4:0] Write_Reg, write1, write2, dst1, dst2, dstsel, regdst, Rs;
  logic RegWrite_i, MemtoReg_i, forw;
  logic [1:0] ALUsrc, selectA, selectB, sel_src2;
  logic RegWrite_o, Mem_Read_o, Mem_Write_o, MemtoReg_o, hazard, pcwrite, IF_ID_write;
  logic [9:0] ctrl, ctrl_out;
  logic RegWrite, RegDst, Mem_Read, Mem_Write, MemtoReg;
  logic [2:0] ALUoperation;
  logic [5:0] OPC_out;
  PC m1 (Pcin, clk, rst, pcwrite, Pcout);
  adder m2 (four, Pcout, pcadd);
  InstMem m3 (Pcout, instruction);
  IFID m4 (clk, rst, pcadd, instruction,IF_ID_write, flush, regin, pc4);
  RegFile m5 (regin[25:21], regin[20:16] , Write_Reg, Write_Data, clk, RegWrite, Read_Data1, Read_Data2, outreg, eq);
  SignExtend m6 (regin[15:0], seout);
  hazard_unit hu (Mem_Read_o,regin[31:26], regin[25:21], regin[20:16], dst1, hazard, pcwrite, IF_ID_write);
  assign ctrl = {RegWrite_c,ALUsrc_c,Mem_Read_c,Mem_Write_c,MemtoReg_c,RegDst_c,ALUoperation_c};
  jmp_adr jmp_address(regin[25:0], pc4[31:28], jump_address);
  mux_2_10 m210(10'b0, ctrl, hazard, ctrl_out);
  IDEX m7 (clk, pc4, Read_Data1, Read_Data2, seout, regin[20:16], regin[15:11], regin[25:21], ctrl_out[9], ctrl_out[8:7], ctrl_out[6], 
            ctrl_out[5], ctrl_out[4], ctrl_out[3], ctrl_out[2:0], regin[31:26], jpc, d1, d2, shin, dst1, dst2, Rs,
            ALUsrc, RegDst, ALUoperation, RegWrite_o, Mem_Read_o, Mem_Write_o, MemtoReg_o, OPC_out);
  shl2 m8 (seout, shout);
  mux_4_32 m9 (d2, shin, Write_Data, Address,sel_src2, B);
  adder m10 (pc4, shout, addout);
  assign sel_src2 = forw ? selectB : ALUsrc;
  mux_3_32 mx (d1, Write_Data, Address, selectA, A);
  ALU m11 (A, B, ALUoperation, ALUResult, zero);
  mux_2_5 m12 (dst1, dst2, RegDst, dstsel);
  forwarding_unit fu(RegWrite_i, RegWrite, regdst, Write_Reg, Rs, dst1, OPC_out, selectA, selectB, forw);
  EXMEM m13 (clk, zero, addout, ALUResult, d2, dstsel, RegWrite_o, Mem_Read_o, Mem_Write_o, MemtoReg_o,
            jumpdst, Address, Write_memData, regdst, RegWrite_i, Mem_Read, Mem_Write, MemtoReg_i);
  DataMem m14 (Address, Write_memData, clk, Mem_Read, Mem_Write, Read_Data, out1, out2);
  MEMWB m15 (clk, Read_Data, Address, regdst, RegWrite_i, MemtoReg_i,
              memdata, regdata, Write_Reg, RegWrite, MemtoReg);
  mux_2_32 m16 (regdata, memdata, MemtoReg, Write_Data);
  mux_3_32 m17 (pcadd, addout, jump_address, Pcsrc, Pcin);
  assign opcode = regin[31:26];
  assign func = regin[5:0];
  assign Adr = ALUResult;
  assign a = Write_Reg;
  assign b = RegWrite;
endmodule
  
  
  
  
  

