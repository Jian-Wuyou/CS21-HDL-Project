////////////
`timescale 1ns / 1ps
module dmem_handler(input  logic [ 5:0] op,
                    input  logic [31:0] a,
                    input  logic [31:0] rd,
                    output logic [31:0] wd,
                    output logic [31:0] aluout);
  always_comb
    case(op)
      6'b101000:
        begin

        end
      default:
        begin
          
        end
    endcase
endmodule