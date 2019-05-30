module reg16_8
(
  input wire clock,
  input wire enable_write,
  input wire [15:0] data_in,
  input wire enable_read,
  output reg [15:0] O_dataA,
  input wire [2:0] rd_wr_addr
  );

  reg [15:0] regs [7:0]; //8 16 bit registers. Select which one to read/write to
  //with the rd_wr_addr


  always @ ( posedge clock ) begin
    if(enable_read)
      O_dataA <= regs[rd_wr_addr];
    else if (enable_write)
      regs[rd_wr_addr] <= data_in;
    else
      O_dataA <= 16'h0000;
    end

endmodule // 8x16 bit register file.
