`timescale 1ns/1ns
module OPCcontroller(input [5:0] OPC, input eq, output logic RegWrite, output logic [1:0] ALUsrc, output logic Mem_Read, Mem_Write, MemtoReg, 
                      RegDst,flush, output logic [1:0]  Pcsrc, branch, output logic [1:0] ALUop);
  initial Pcsrc = 2'b0;
  always @(OPC) begin
    {RegWrite, ALUsrc, Mem_Read, Mem_Write, RegDst, MemtoReg} = 6'b0;
    branch = 2'b0;
    ALUop = 2'b0;
    flush = 1'b0;
    Pcsrc = 2'b0;
    case(OPC)
      6'b0: begin 
        RegDst = 1; RegWrite = 1; ALUsrc = 2'b0; Mem_Read = 0; Mem_Write = 0; MemtoReg = 0; branch = 2'b0; ALUop = 2'b10;
      end
      6'b001_000: begin
        RegDst = 0; RegWrite = 1; ALUsrc = 2'b01; Mem_Read = 0; Mem_Write = 0; MemtoReg = 0; branch = 2'b0; ALUop = 2'b00;
      end
      6'b001_100: begin
        RegDst = 0; RegWrite = 1; ALUsrc = 2'b01; Mem_Read = 0; Mem_Write = 0; MemtoReg = 0; branch = 2'b0; ALUop = 2'b11; 
      end
      6'b100_011: begin
        RegDst = 0; RegWrite = 1; ALUsrc = 2'b01; Mem_Read = 1; Mem_Write = 0; MemtoReg = 1; branch = 2'b0; ALUop = 2'b00; 
      end
      6'b101_011: begin
        RegWrite = 0; ALUsrc = 2'b01; Mem_Read = 0; Mem_Write = 1; branch = 2'b0; ALUop = 2'b00; 
      end
      6'b000_100: begin
        RegWrite = 0; ALUsrc = 2'b0; Mem_Read = 0; Mem_Write = 0; branch = 2'b01; ALUop = 2'b01;
        if (eq) begin flush = 1'b1;  Pcsrc = 2'b01; end
      end
      6'b000_101: begin 
        RegWrite = 0; ALUsrc = 2'b0; Mem_Read = 0; Mem_Write = 0; branch = 2'b10; ALUop = 2'b01;
        if (~eq) begin flush = 1'b1;  Pcsrc = 2'b01; end
      end
      6'b000_010: begin
        flush = 1'b1;
        Pcsrc = 2'b10;
      end
      
      
    endcase
  end
endmodule