module reg16_8
(
  input wire clock,
  input wire enable_write,
  input enable,
  input wire [15:0] data_in,
  input wire enable_read,
  output reg [15:0] O_dataA,
  output reg [15:0] O_dataB,
  input wire [2:0] rd_wr_addrA,
  input wire [2:0] rd_wr_addrB
  );

  reg [15:0] regs [7:0]; //8 16 bit registers. Select which one to read/write to
  //with the rd_wr_addr


  always @ ( posedge clock ) begin
    if(enable==1)
    begin
      if(enable_read)
      begin
        O_dataA <= regs[rd_wr_addrA];
        O_dataB <= regs[rd_wr_addrB];
      end
      else if (enable_write)
        begin
        regs[rd_wr_addrA] <= data_in; //always write to the rd_wr_addrA address
        end
      else
      begin
        O_dataA <= 16'h0000;
        O_dataB <= 16'h0000;
      end
      end
    end

endmodule // 8x16 bit register file.
