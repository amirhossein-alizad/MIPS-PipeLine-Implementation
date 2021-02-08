`timescale 1ns/1ns
module PipeLine(input clk, rst, output[31:0] outreg, adr, output[4:0] a, output b, output [31:0] out1, out2);
  logic [5:0] opcode, func;
  logic RegWrite, Mem_Read, Mem_Write, MemtoReg, RegDst;
  logic [2:0]  ALUoperation;
  logic [1:0] ALUsrc, ALUop,branch,Pcsrc;
  logic zero, eq, flush;
  OPCcontroller m1 (opcode, eq,RegWrite, ALUsrc, Mem_Read, Mem_Write, MemtoReg, RegDst, flush,Pcsrc, branch, ALUop);
  ALUcontrol m2 (ALUop, func, ALUoperation);
  Datapath m3 (clk, rst, RegWrite, ALUsrc, Mem_Read, Mem_Write, Pcsrc, MemtoReg, RegDst, flush, ALUoperation,
                opcode, func, zero,eq, outreg, adr, a, b, out1, out2);
endmodule

