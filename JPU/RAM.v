module RAM (
  input wire clk,
  input wire write_enable,
  input wire [15:0] addr,
  input wire [15:0] data_in,
  output reg [15:0] data_out
  );

  reg[15:0] mem [31:0]; //32 16 bit registers

  always @(posedge clk) begin
    if (write_enable)
    begin
      mem[addr[5:0]] <= data_in;
    end
    else
    begin
      data_out<=mem[addr[5:0]];
    end
  end
endmodule // RAM
