`timescale 1ns / 1ps
module controller(input  logic [5:0] op, funct,
                  input  logic       zero,
                  output logic       memtoreg, memwrite,
                  output logic       pcsrc, alusrc,
                  output logic       regdst, regwrite,
                  output logic       jump,
                  output logic [3:0] alucontrol,
                  output logic       byte_enable,
                  output logic       res_zeroextimm);

  logic [1:0] aluop;
  logic       branch;

  maindec md(op, memtoreg, memwrite, branch, alusrc, regdst,
             regwrite, jump, aluop, byte_enable, res_zeroextimm);
  aludec  ad(funct, aluop, alucontrol);

  assign pcsrc = branch & zero;
endmodule