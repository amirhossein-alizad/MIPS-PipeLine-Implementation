`timescale 1ns/1ns
module hazard_unit(input ID_EX_memRead,input [5:0] OPC, input[4:0] Rs, Rt, ID_EX_Rt, output logic hazard, pcwrite, IF_ID_write);
  initial{hazard, pcwrite, IF_ID_write} = 3'b111;
  always @(ID_EX_memRead, Rs, Rt, ID_EX_Rt) begin
    {hazard, pcwrite, IF_ID_write} = 3'b111;
    if(ID_EX_memRead == 1) begin
      if(ID_EX_Rt == Rs ||( ID_EX_Rt == Rt && OPC == 6'b0)) begin
        {hazard, pcwrite, IF_ID_write} = 3'b0;
      end
    end
  end
endmodule
