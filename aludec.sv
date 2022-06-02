////////////
`timescale 1ns / 1ps
module aludec(input  logic [5:0] funct,
              input  logic [1:0] aluop,
              output logic [3:0] alucontrol);

  always_comb
    case(aluop)
      2'b00: alucontrol <= 4'b0010;  // add (for lw/sw/addi)
      2'b01: alucontrol <= 4'b0110;  // sub (for beq)
      2'b10: alucontrol <= 4'b1111;  // sgt (for ble)
      default: case(funct)          // R-type instructions
          6'b100000: alucontrol <= 4'b0010; // add
          6'b100010: alucontrol <= 4'b0110; // sub
          6'b100100: alucontrol <= 4'b0000; // and
          6'b100101: alucontrol <= 4'b0001; // or
          6'b101010: alucontrol <= 4'b0111; // slt
          6'b000000: alucontrol <= 4'b1000; // sll
          6'b110011: alucontrol <= 4'b1001; // zfr
          default:   alucontrol <= 4'bxxxx; // ???
        endcase
    endcase
endmodule
