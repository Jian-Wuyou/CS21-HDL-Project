`timescale 1ns / 1ps
module dmem(input  logic        clk, we, byte_enable,
            input  logic [31:0] a, wd,
            output logic [31:0] rd);

  logic [0:3][7:0] RAM[63:0];

  assign rd = RAM[a[31:2]]; // word aligned

  always_ff @(posedge clk)
    if (we) begin
        if(byte_enable)
            RAM[a[31:2]][a[1:0]] <= wd[7:0];
        else
            RAM[a[31:2]] <= wd;
    end
endmodule