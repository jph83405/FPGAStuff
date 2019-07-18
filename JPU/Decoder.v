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

endmodule // Decoder
