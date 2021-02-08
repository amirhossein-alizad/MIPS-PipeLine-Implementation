`timescale 1ns/1ns
module forwarding_unit(input ex_mem_regWrite, mem_WB_regWrite, input[4:0] ex_mem_Rd, mem_WB_Rd, ID_ex_Rs, ID_ex_Rt,input[5:0] OPC, output logic [1:0] selectA, selectB, output logic forw);
  always @ (ex_mem_regWrite, mem_WB_regWrite, ex_mem_Rd, mem_WB_Rd, ID_ex_Rs, ID_ex_Rt) begin
    {selectA, selectB, forw} = 5'b0;
    if (ex_mem_regWrite == 1 && ex_mem_Rd == ID_ex_Rs && ex_mem_Rd != 0) begin
      selectA = 2'b10;
    end
    else if(mem_WB_regWrite == 1 && mem_WB_Rd == ID_ex_Rs && mem_WB_Rd != 0 && !(ex_mem_regWrite == 1 && ex_mem_Rd == ID_ex_Rs && ex_mem_Rd != 0)) begin
      selectA = 2'b01;
    end
    if(ex_mem_regWrite == 1 && ex_mem_Rd == ID_ex_Rt && ex_mem_Rd != 0 && OPC == 6'b0) begin
      selectB = 2'b11;
      forw = 1;
    end
    else if(mem_WB_regWrite == 1 && mem_WB_Rd == ID_ex_Rt && mem_WB_Rd != 0 && OPC == 6'b0 && !(ex_mem_regWrite == 1 && ex_mem_Rd == ID_ex_Rt && ex_mem_Rd != 0 && OPC == 6'b0)) begin
      selectB = 2'b10;
      forw = 1;
    end
  end
endmodule