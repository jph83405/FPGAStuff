module Decoder (
  input wire [15:0] instruction,
  input wire clk,
  input wire enable,
  output reg [3:0] alu_Op,
  output reg [7:0] Immediate_data,
  output reg [2:0] regA_sel,
  output reg [2:0] regB_sel,
  output reg [2:0] regD_sel,
  output reg write_enable
  );

always @ (posedge clk) begin
  if(enable == 1)
  begin
    alu_Op <= instruction[15:12];
    regD_sel <= instruction[11:9];
    regA_sel <= instruction[7:5];
    regB_sel <= instruction[4:2];
    Immediate_data <= instruction[7:0] & instruction[8];

    case (instruction[15:12])
      4'b0111: write_enable <= 0;
      4'b1100: write_enable <= 0;
      4'b1101: write_enable <= 0;
      default: write_enable <= 1;
    endcase
    end
    end
endmodule // Decoder
