`timescale 1ns / 1ps
module imem(input  logic [5:0] a,
            output logic [31:0] rd);

  logic [31:0] RAM[63:0];

  initial
//      $readmemh("test1_sll.mem",RAM);
//      $readmemh("test2_sb.mem",RAM);
//      $readmemh("test4_ble.mem",RAM);
//      $readmemh("test3_li.mem",RAM);
      $readmemh("test5_zfr.mem",RAM);

  assign rd = RAM[a]; // word aligned
endmodule
