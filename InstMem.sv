`timescale 1ns/1ns
module InstMem(input [31:0] Address, output logic [31:0] instruction);
  logic [31:0] memory[0:199];
  initial begin
    $readmemb("test2.txt", memory);
  end
  always @(Address) begin
    instruction = 32'b0;
    instruction = memory[Address[31:2]];
  end
endmodule