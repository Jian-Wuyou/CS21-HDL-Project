`timescale 1ns / 1ps
module maindec(input  logic [5:0] op,
               output logic       memtoreg, memwrite,
               output logic       branch, alusrc,
               output logic       regdst, regwrite,
               output logic       jump,
               output logic [1:0] aluop,
               output logic       byte_enable,
               output logic       res_zeroextimm);

  logic [10:0] controls;

  assign {regwrite, regdst, alusrc, branch, memwrite,
          memtoreg, jump, aluop, byte_enable, res_zeroextimm} = controls;

  always_comb
    case(op)
      6'b000000: controls <= 11'b11000011000; // RTYPE
      6'b100011: controls <= 11'b10100100000; // LW
      6'b101011: controls <= 11'b00101000000; // SW
      6'b000100: controls <= 11'b00010000100; // BEQ
      6'b001000: controls <= 11'b10100000000; // ADDI
      6'b000010: controls <= 11'b00000010000; // J
      
      6'b010001: controls <= 11'b10000000001; // LI
      6'b101000: controls <= 11'b00101000010; // SB
      6'b011111: controls <= 11'b00010001000; // BLE

      6'b111111: begin  // Custom stop opcode, for testing only
                   controls <= 11'bxxxxxxxxxxx;
                   $display("Simulation stopped");
                   $stop;
                 end
      default:   controls <= 11'bxxxxxxxxxxx; // illegal op
    endcase
endmodule