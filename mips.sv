`timescale 1ns / 1ps
module mips(input  logic        clk, reset,
            output logic [31:0] pc,
            input  logic [31:0] instr,
            output logic        memwrite,
            output logic [31:0] aluout, writedata,
            input  logic [31:0] readdata,
            output logic        byte_enable);

  logic       memtoreg, alusrc, regdst, regwrite,
              jump, pcsrc, zero, res_zeroextimm;
  logic [3:0] alucontrol;

  controller c(instr[31:26], instr[5:0], zero,
               memtoreg, memwrite, pcsrc,
               alusrc, regdst, regwrite, jump,
               alucontrol, byte_enable, res_zeroextimm);
  datapath dp(clk, reset, memtoreg, pcsrc,
              alusrc, regdst, regwrite, jump,
              alucontrol, res_zeroextimm,
              zero, pc, instr,
              aluout, writedata, readdata);
endmodule