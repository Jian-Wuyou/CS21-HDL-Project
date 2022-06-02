module alu(input  logic [31:0] a, b,
           input  logic [4:0]  shamt,
           input  logic [3:0]  alucontrol,
           output logic [31:0] result,
           output logic        zero);
  
  logic [31:0] condinvb, sum;

  assign condinvb = alucontrol[2] ? ~b : b;
  assign sum = a + condinvb + alucontrol[2];
 
  always_comb
    if (alucontrol[3])
      case (alucontrol[2:0])
        3'b000: result = b << shamt;
        3'b001: result = a & (32'hFFFFFFFE << b[4:0]);
        3'b111: begin
                result = ~sum + 1;
                result = result[31];
                end
      endcase
    else
      case (alucontrol[1:0])
        2'b00: result = a & b;
        2'b01: result = a | b;
        2'b10: result = sum;
        2'b11: result = sum[31];                // a < b
      endcase

  assign zero = (result == 32'b0);
endmodule