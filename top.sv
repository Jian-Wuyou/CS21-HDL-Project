`timescale 1ns / 1ps
module top(input  logic        clk, reset, 
           output logic [31:0] writedata, dataadr, 
           output logic        memwrite);

  logic [31:0] pc, instr, readdata;
  logic        byte_enable;
  
  // instantiate processor and memories
  mips mips(clk, reset, pc, instr, memwrite, dataadr, 
            writedata, readdata, byte_enable);
  imem imem(pc[7:2], instr);
  dmem dmem(clk, memwrite, byte_enable, dataadr, writedata, readdata);
endmodule